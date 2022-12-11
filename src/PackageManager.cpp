#include "PackageManager.h"
#include "Category.h"
#include "PackageMeta.h"
#include "Package.h"
#include "Fetch.h"
#include "Variables.h"
#include "Utils.h"
#include <FileSystem.h>
#include <stdio.h>
#include <algorithm>
#include <cstdarg>

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
    , m_verbose_cmds (false)
    , m_without_deps (false)
    , m_pretend (false)
    , m_fetch_only (false)
    , m_debug(false)
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
    m_cmd->add_bool_param(L"verbose-cmds", L"V", &m_verbose_cmds, false, L"print detailed information about running commands");
    m_cmd->add_bool_param(L"without-deps", L"O", &m_without_deps, false, L"proceed packages wothout depedencies");
    m_cmd->add_bool_param(L"pretend", L"p", &m_pretend, false, L"just to show what should be done");
    m_cmd->add_bool_param(L"fetch", L"f", &m_fetch_only, false, L"only files fetch");
    m_cmd->add_bool_param(L"debug", L"D", &m_debug, false, L"output debug messages");
    m_cmd->add_bool_param(L"export", L"E", &m_export, false, L"export database to set of files");
    m_cmd->add_bool_param(L"import", L"I", &m_import, false, L"import database from set of files");

    m_cmd->add_string_param(L"profile", &m_profile_action, "", L"Profile managing. Actions: list, set");

    m_cmd->add_int_param(L"idx", &m_param_idx, 0, L"Parameter index (for profile, etc.");
    m_cmd->add_string_param(L"str", &m_param_string, "", L"Parameter string (for profile, etc.");

    m_cmd->parse();
    if (m_verbose_cmds)
        m_verbose = true;

    for (int i=1 ; i<argc ; i++)
        if (argv[i][0] != '-')
            m_package_names.push_back(argv[i]);

    m_vars->init_env(envp);
    //принудительное обновление состояния флагов для пакетов, прописанных в packages.use
    for (auto package :m_packages_list)
        package->update_opts();
    m_db->fill_aliases();
    parse_locales();
}

bool PackageManager::prepare()
{
    if (m_profile_action.length() != 0)
    {
        profile_managment();
        return false;
    }

    m_params_ok = m_install || m_clean || m_fetch_only;

    if (m_show_help)
    {
        m_cmd->show_desc();
        return false;
    }
    else if (m_export)
    {
        db_export();
        return false;
    }
    else if (m_import)
    {
        db_import();
        return false;
    }
    else if (!m_params_ok)
    {
        m_cmd->show_desc();
        printf("Package name template: [=][category name]/pkg_name[:version]\n");
        return false;
    }
    else
    {
        // check packages
        debug("check packages\n");
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
                debug("Add packages for set %s\n", name.c_str());
                m_db->get_set_pkgs(&name[1], [this](std::string pkg_name)
                {
                    debug("Add package %s\n", pkg_name.c_str());
                    Package::get_pkg_by_name(pkg_name, [this](Package* pkg)
                    {
                        if (pkg != nullptr)
                        {
                            check_depedencies(pkg);
                            add_to_actions(pkg);
                        }
                    });
                });
            }
            else
            {
                Package::get_pkg_by_name(name, [this](Package* pkg)
                {
                    if (pkg == nullptr)
                        return;
                    if (!m_without_deps)
                    {
                        debug("Add dependies for package %s\n", pkg->get_meta()->get_name().c_str());
                        check_depedencies(pkg);
                    }
                    add_to_actions(pkg);
                    m_packages_to_action_world.push_back(pkg->get_id());
                });
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

    if (m_fetch_only)
        printf("Waiting to fetch:\n");
    else if (m_install)
        printf("Waiting to install:\n");

    for(auto pkg=m_packages_to_action_list.begin() ; pkg!=m_packages_to_action_list.end() ; pkg++)
        (*pkg)->print_short_info();

    if (m_pretend)
        return;

    if (m_ask)
    {
        if (!user_yes_no())
            return;
    }

    if (m_fetch_only || m_install)
    {
        for(auto pkg=m_packages_to_action_list.begin() ; pkg!=m_packages_to_action_list.end() ; pkg++)
            m_fetch->add_to_queue(*pkg);
        m_fetch->start_fetch();
    }

    if (m_fetch_only) {}
    else if (m_install)
    {
        int idx = 0;
        int all_c = m_packages_to_action_list.size();
        for(auto pkg=m_packages_to_action_list.begin() ; pkg!=m_packages_to_action_list.end() ; pkg++)
        {
            printf(BOLD_ON "[ " COLOR_GREEN "%03i" COLOR_RESET BOLD_ON "/" COLOR_YELLOW "%03i" COLOR_RESET BOLD_ON " ]:" BOLD_OFF, ++idx, all_c);
            if (!(*pkg)->install())
                break;
        }
    }

    if (m_fetch_only)
    {
        while (m_fetch->is_active())
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
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

bool PackageManager::is_locale_active(std::string locale)
{
    if (m_instance->m_locales.size() == 0)
        return true;
    else return (std::find(m_instance->m_locales.begin(), m_instance->m_locales.end(), locale) != m_instance->m_locales.end());
}

void PackageManager::debug(std::string format, ...)
{
    if (!m_instance->m_debug)
        return;

    char        text[4096];
    va_list		ap;

    if (format.length() != 0)
    {
        va_start(ap, format);
        vsprintf(text, format.c_str(), ap);
        va_end(ap);
    }
    printf("\x1B[31m%s\x1B[0m ", text);
}

void PackageManager::check_depedencies(Package* pkg)
{
    debug(">>>Build depedencies %s\n", pkg->get_meta()->get_name().c_str());
    pkg->build_install_deps([this](Package *new_pkg)
        {
            if (new_pkg != nullptr)
            {
                debug("\tPKG %s: ", new_pkg->get_meta()->get_name().c_str());
                bool contains = false;
                for (auto it=m_packages_to_action_list.begin() ;
                     it != m_packages_to_action_list.end() ; it++)
                     if (*it == new_pkg)
                     {
                         debug("\tskip deps\n");
                         contains = true;
                         break;
                     }
                if (!contains)
                {
                    debug("\tcheck deps\n");
                    // проверим зависимости и для него
                    check_depedencies(new_pkg);
                    // и добавляем в список
                    debug("\tAdd %s to list\n", new_pkg->get_meta()->get_name().c_str());
                    this->m_packages_to_action_list.push_back(new_pkg);
                }
            }
        });
    debug("<<<End build deps for package %s\n", pkg->get_meta()->get_name().c_str());
}

void PackageManager::add_to_actions(Package *pkg)
{
    // если пакет уже есть в списке - пропускаем
    if (std::find(m_packages_to_action_list.begin(), m_packages_to_action_list.end(),
                  pkg) != m_packages_to_action_list.end())
        return;
    m_packages_to_action_list.push_back(pkg);
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

bool PackageManager::user_yes_no()
{
    char reply[100];
    do
    {
        printf(COLOR_GREEN BOLD_ON "Start apply changes (%li packages)? [" "Y" COLOR_RED "/n] " COLOR_RESET, m_packages_to_action_list.size());

        fgets(reply, 100, stdin);

        if ((strcmp(reply, "n\n") == 0) || (strcmp(reply, "N\n") == 0))
        {
            printf("Nothing to work, exiting!\n");
            return false;
        }

        if ((strlen(reply) == 1) || (strcmp(reply, "y\n") == 0) || (strcmp(reply, "Y\n") == 0))
            break;

        printf("Wrong answer, retry...\n");
    } while (1);
    return true;
}

void PackageManager::parse_locales()
{
    Utils::parse_str(m_vars->get_var("LOCALES"), " ", m_locales);
}

void PackageManager::profile_managment()
{
    std::string profiles_root = m_vars->parse_vars(nullptr, "${PROFILE_ROOT}");
    std::deque<std::string> profiles_list;
    FileSystem::list_files(profiles_root, true, [profiles_root, &profiles_list](std::string name, bool is_dir)
           {
               if (is_dir)
                   profiles_list.push_back(name.replace(0, profiles_root.length(), ""));
           });

    if (m_profile_action.compare("list") == 0)
    {
        printf(COLOR_YELLOW "Profiles list:\n" COLOR_RESET);
        int idx = 0;
        for (std::string profile : profiles_list)
            printf("\t" COLOR_GREEN "%s%i] " COLOR_RESET "%s\n", m_vars->get_profile().compare(profile) == 0 ? "*" : " ",
                   ++idx, profile.c_str());
    }
    else if (m_profile_action.compare("set") == 0)
    {
        std::string to_profile = "";
        if (m_param_idx != 0)
            to_profile = profiles_list[m_param_idx - 1];
        else if (m_param_string.length() > 0)
            to_profile = m_param_string;

        if (to_profile.length() == 0)
            printf(COLOR_RED "No profile specified\n" COLOR_RESET);
        else if (!FileSystem::is_exist(profiles_root + to_profile))
            printf(COLOR_RED "The specified profile does not exist\n" COLOR_RESET);
        else
        {
            Utils::run_cmd("", "rm " + m_vars->parse_vars(nullptr, "${PROFILE}"));
            Utils::run_cmd("", "ln -s ../../var/lib/pkg/profiles/" + to_profile + " " +
                               m_vars->parse_vars(nullptr, "${PROFILE}"));
            printf(COLOR_YELLOW "Profile was successfully changed\n" COLOR_RESET);
        }
    }
}

void PackageManager::db_export()
{
    printf(COLOR_GREEN BOLD_ON "Export DB to files.\n" COLOR_RESET);
}

void PackageManager::db_import()
{
    printf(COLOR_GREEN BOLD_ON "Import DB from files.\n" COLOR_RESET);
}


}
