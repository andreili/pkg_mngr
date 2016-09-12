#include "PackageManager.h"
#include "Category.h"
#include "PackageMeta.h"
#include "Package.h"
#include "Fetch.h"
#include "Variables.h"
#include "Utils.h"
#include <stdio.h>
#include <algorithm>

namespace package_manager
{

PackageManager* PackageManager::m_instance = nullptr;

PackageManager::PackageManager()
    : m_cmd (nullptr)
    , m_show_help (false)
    , m_params_ok (true)
    , m_install (false)
    , m_clean (false)
    , m_empty (false)
    , m_binary (false)
    , m_from_pkg (false)
    , m_ask (false)
    , m_verbose (false)
{
    m_instance = this;
    m_vars = new Variables();

    m_db = new PackageDB();

    m_fetch = new Fetch();
}

PackageManager::~PackageManager()
{
    delete m_fetch;
    delete m_db;
}

void PackageManager::init(int argc, char *argv[], char **envp)
{
    m_cmd = new CmdlineParser(argc, argv);
    m_cmd->set_name(L"pkg_mngr");
    m_cmd->add_bool_param(L"help", L"h", &m_show_help, false, L"show this help and exit");
    m_cmd->add_bool_param(L"install", L"i", &m_install, false, L"install selected packages");
    m_cmd->add_bool_param(L"clean", L"c", &m_clean, false, L"uninstall selected packages");
    m_cmd->add_bool_param(L"empty", L"e", &m_empty, false, L"install all dependies, ignore installed status");
    m_cmd->add_bool_param(L"binary", L"b", &m_binary, false, L"create binary packages");
    m_cmd->add_bool_param(L"from-pkg", L"p", &m_from_pkg, false, L"usage binary packages");
    m_cmd->add_bool_param(L"ask", L"a", &m_ask, false, L"ask before apply actions");
    m_cmd->add_bool_param(L"verbose", L"v", &m_verbose, false, L"print detailed information about actions");
    m_cmd->parse();

    if (argc == 1)
        m_show_help = true;
    else for (int i=1 ; i<argc ; i++)
        if (argv[i][0] != '-')
            m_package_names.push_front(argv[i]);

    m_vars->init_env(envp);
    m_db->fill_aliases();
}

bool PackageManager::prepare()
{
    if (m_show_help || (!m_params_ok))
    {
        m_cmd->show_desc();
        printf("Package name template: [=][category name]/pkg_name[:version]\n");
        return false;
    }
    else
    {
        // check packages
        if ((m_install || m_clean) && (m_package_names.size() == 0))
        {
            printf("No packets selected!\n");
            return false;
        }

        m_packages_to_action_list.clear();
        m_packages_to_action_world.clear();

        for (std::string &name : m_package_names)
        {
            if (name[0] == '@')
            {
                // добавляем список пакетов указанного набора
                m_db->get_set_pkgs(&name[1], [this](std::string pkg_name)
                {
                    check_depedencies(Package::get_pkg_by_name(pkg_name), false);
                });
            }
            else
            {
                Package* pkg = Package::get_pkg_by_name(name);
                if (pkg == nullptr)
                {
                    printf("Unable to find package \"%s\"!\n", name.c_str());
                    return false;
                }
                check_depedencies(pkg, true);
            }
        }

        if (m_install)
        {
            clear_unchanged_pkgs();
        }
    }

    return true;
}

void PackageManager::proc()
{
    if (m_packages_to_action_list.size() == 0)
    {
        printf("Nothing to work, exiting!\n");
        return;
    }

    if (m_install)
    {
        printf("Waiting to install:\n");
        for(auto pkg=m_packages_to_action_list.begin() ; pkg!=m_packages_to_action_list.end() ; pkg++)
            (*pkg)->print_short_info();

        if (m_ask)
        {
            char reply[100];
            do
            {
                printf(COLOR_GREEN BOLD_ON "Start apply changes? [" "Y" COLOR_RED "/n] " COLOR_RESET);

                fgets(reply, 100, stdin);

                if ((strcmp(reply, "n\n") == 0) || (strcmp(reply, "N\n") == 0))
                {
                    printf("Nothing to work, exiting!\n");
                    return;
                }

                if ((strlen(reply) == 1) || (strcmp(reply, "y\n") == 0) || (strcmp(reply, "Y\n") == 0))
                    break;

                printf("Wrong answer, retry...\n");
            } while (1);
        }

        for(auto pkg=m_packages_to_action_list.begin() ; pkg!=m_packages_to_action_list.end() ; pkg++)
            m_fetch->add_to_queue(*pkg);
        m_fetch->start_fetch();

        for(auto pkg=m_packages_to_action_list.begin() ; pkg!=m_packages_to_action_list.end() ; pkg++)
        {
            if (!(*pkg)->install())
                break;
        }
    }
}

void PackageManager::add_cat(Category* cat)
{
    m_instance->m_category_list.push_back(cat);
}

Category* PackageManager::get_cat(std::string cat_name)
{
    for (Category *cat : m_instance->m_category_list)
        if (cat->get_name().compare(cat_name) == 0)
            return cat;
    return nullptr;
}

Category* PackageManager::get_cat(int cat_id)
{
    for (Category *cat : m_instance->m_category_list)
        if (cat->get_id() == cat_id)
            return cat;
    return nullptr;
}

void PackageManager::add_meta(PackageMeta* meta)
{
    m_instance->m_package_metas.push_back(meta);
}

PackageMeta* PackageManager::get_meta(int meta_id)
{
    for (PackageMeta *meta : m_instance->m_package_metas)
        if (meta->get_id() == meta_id)
            return meta;
    return nullptr;
}

PackageMeta* PackageManager::get_meta(int cat_id, std::string pkg_name)
{
    for (PackageMeta *meta : m_instance->m_package_metas)
        if ((cat_id == meta->get_cat_id()) && (meta->get_name().compare(pkg_name) == 0))
            return meta;
    return nullptr;
}

void PackageManager::add_pkg(Package* pkg)
{
    m_instance->m_packages_list.push_back(pkg);
}

Package* PackageManager::get_pkg(int pkg_id)
{
    //get last package for meta-package
    int last_id = 0;
    Package *res = nullptr;
    for (Package *pkg : m_instance->m_packages_list)
        if ((pkg->get_id() == pkg_id) && (pkg->get_id() > last_id))
        {
            last_id = pkg->get_id();
            res = pkg;
        }
    return res;
}

Package* PackageManager::get_pkg_meta(int meta_id)
{
    //get last package for meta-package
    int last_id = 0;
    Package *res = nullptr;
    for (Package *pkg : m_instance->m_packages_list)
        if ((pkg->get_meta()->get_id() == meta_id) && (pkg->get_id() > last_id))
        {
            last_id = pkg->get_id();
            res = pkg;
        }
    return res;
}

Package* PackageManager::get_pkg_meta(int meta_id, std::string pkg_version)
{
    if (pkg_version.size() == 0)
        return get_pkg_meta(meta_id);
    for (Package *pkg : m_instance->m_packages_list)
        if ((meta_id == pkg->get_meta_id()) && (pkg->get_version().compare(pkg_version) == 0))
            return pkg;
    return nullptr;
}

void PackageManager::add_opt(ConfigurationOption *opt)
{
    m_instance->m_options_list.push_back(opt);
}

ConfigurationOption* PackageManager::get_opt(int opt_id)
{
    for (ConfigurationOption *opt : m_instance->m_options_list)
        if (opt->get_id() == opt_id)
            return opt;
    return nullptr;
}

ConfigurationOption* PackageManager::get_opt(std::string &name)
{
    for (ConfigurationOption *opt : m_instance->m_options_list)
        if (opt->get_name().compare(name) == 0)
            return opt;
    return nullptr;
}

void PackageManager::add_alias(ConfigurationAlias *alias)
{
    m_instance->m_alias_list.push_back(alias);
}

ConfigurationAlias* PackageManager::get_alias(int alias_id)
{
    for (ConfigurationAlias *alias : m_instance->m_alias_list)
        if (alias->get_id() == alias_id)
            return alias;
    return nullptr;
}

ConfigurationAlias* PackageManager::get_alias(std::string &name)
{
    for (ConfigurationAlias *alias : m_instance->m_alias_list)
        if (alias->get_alias().compare(name) == 0)
            return alias;
    return nullptr;
}

void PackageManager::check_depedencies(Package* pkg, bool add_to_world)
{
    pkg->build_install_deps([this](Package *new_pkg)
        {
            bool contains = false;
            for (auto it=m_packages_to_action_list.begin() ;
                 it != m_packages_to_action_list.end() ; it++)
                 if (*it == new_pkg)
                 {
                     contains = true;
                     break;
                 }
            if (!contains)
                // если пакета еще нет в списке - добавляем
                this->m_packages_to_action_list.push_back(new_pkg);
        });

    m_packages_to_action_list.push_back(pkg);
    if (add_to_world)
        m_packages_to_action_world.push_back(pkg->get_id());
}

void PackageManager::clear_unchanged_pkgs()
{
    // удаление из списка установленных неизмененных пакетов
    if (!m_empty)
    {
        auto pkg_it = m_packages_to_action_list.begin();
        size_t idx = 0;
        while (idx < m_packages_to_action_list.size())
        {
            // если пакет указан пользователем в параметрах - пропускаем
            if (std::find(m_packages_to_action_world.begin(), m_packages_to_action_world.end(),
                          (*pkg_it)->get_id()) != m_packages_to_action_world.end())
            {
                idx++;
                pkg_it++;
                continue;
            }

            if (((*pkg_it)->check_installed()) && ((*pkg_it)->not_changed()))
                m_packages_to_action_list.erase(pkg_it);
            else
                idx++;
            pkg_it++;
        }
    }
}


}
