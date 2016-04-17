#include "PackageManager.h"
#include "Category.h"
#include "PackageMeta.h"
#include "Package.h"
#include "Fetch.h"
#include "Variables.h"
#include <stdio.h>
#include <algorithm>

namespace package_manager
{

PackageManager* PackageManager::m_instance = nullptr;

PackageManager::PackageManager()
    : m_show_help (false)
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
    if (argc == 1)
        m_show_help = true;
    else for (int i=1 ; i<argc ; i++)
    {
        std::string arg = argv[i];
        size_t len = arg.length();

        if ((len > 2) && (arg[0] == '-') && (arg[1] == '-'))
        {
            //check long commands
            if (arg.compare("--help") == 0)
                m_show_help = true;
            else if (arg.compare("--install") == 0)
                m_install = true;
            else if (arg.compare("--clean") == 0)
                m_clean = true;
            else if (arg.compare("--empty") == 0)
                m_empty = true;
            else if (arg.compare("--binary") == 0)
                m_binary = true;
            else if (arg.compare("--from-pkg") == 0)
                m_from_pkg = true;
            else if (arg.compare("--ask") == 0)
                m_ask = true;
            else if (arg.compare("--verbose") == 0)
                m_verbose = true;
        }
        else if ((len > 1) && (arg[0] == '-'))
        {
            //check short commands
            for (size_t j=1 ; j<len ; j++)
            switch (arg[j])
            {
            case 'i':
                m_install = true;
                break;
            case 'c':
                m_clean = true;
                break;
            case 'e':
                m_empty = true;
                break;
            case 'b':
                m_binary = true;
                break;
            case 'k':
                m_from_pkg = true;
                break;
            case 'a':
                m_ask = true;
                break;
            case 'v':
                m_verbose = true;
                break;
            default:
                m_params_ok = false;
                break;
            }
        }
        else
        {
            m_package_names.push_back(arg);
        }
    }

    m_vars->init_env(envp);
}

bool PackageManager::prepare()
{
    if (m_show_help || (!m_params_ok))
    {
        printf("Usage: pkg_mngr [options] [packages]\n");
        printf("Options:\n");
        printf("\t--help\t\t- show this help and exit\n");
        printf("\t--install (-i)\t- install selected packages\n");
        printf("\t--clean (-c)\t- uninstall selected packages\n");
        printf("\t--empty (-e)\t- install all dependies, ignore installed status\n");
        printf("\t--binary (-b)\t- create binary packages\n");
        printf("\t--from-pkg (k)\t- usage binary packages\n");
        printf("\t--ask (-a)\t- ask before apply actions\n");
        printf("\t--verbose (-v)\t- rint detailed information about actions\n");
        //printf("\t\n");
        //printf("\t\n");
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

        for (std::string &name : m_package_names)
        {
            Package* pkg = Package::get_pkg_by_name(name);
            if (pkg == nullptr)
            {
                printf("Unable to find package \"%s\"!\n", name.c_str());
                return false;
            }
            m_packages_to_action_list.push_back(pkg);
        }

        if (m_install)
        {
            for (Package *pkg : m_packages_to_action_list)
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
                            this->m_packages_to_action_list.push_back(new_pkg);
                    });
            // delete installed packages
            auto pkg_it = m_packages_to_action_list.begin();
            size_t idx = 0;
            while (idx < m_packages_to_action_list.size())
            {
                if (((*pkg_it)->check_installed()) && ((*pkg_it)->not_changed()))
                    m_packages_to_action_list.erase(pkg_it);
                pkg_it++;
                idx++;
            }
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
        for(auto pkg=m_packages_to_action_list.rbegin() ; pkg!=m_packages_to_action_list.rend() ; pkg++)
            (*pkg)->print_short_info();

        for(auto pkg=m_packages_to_action_list.rbegin() ; pkg!=m_packages_to_action_list.rend() ; pkg++)
            m_fetch->add_to_queue(*pkg);
        m_fetch->start_fetch();

        for(auto pkg=m_packages_to_action_list.rbegin() ; pkg!=m_packages_to_action_list.rend() ; pkg++)
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

Package* PackageManager::get_pkg(int meta_id)
{
    //get last package for meta-package
    int last_id = 0;
    Package *res = nullptr;
    for (Package *pkg : m_instance->m_packages_list)
        if ((pkg->get_meta()->get_id() == meta_id) &&
            (pkg->get_id() > last_id))
        {
            last_id = pkg->get_id();
            res = pkg;
        }
    return res;
}

Package* PackageManager::get_pkg(int meta_id, std::string pkg_version)
{
    if (pkg_version.size() == 0)
        return get_pkg(meta_id);
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


}