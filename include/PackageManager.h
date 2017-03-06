#ifndef PACKAGEMANAGER_H
#define PACKAGEMANAGER_H

#include <deque>
#include "PackageDB.h"
#include "CmdlineParser.h"
#include "ConfigurationAlias.h"

namespace package_manager
{
    class Category;
    class PackageMeta;
    class Package;
    class ConfigurationOption;
    class Fetch;
    class Variables;

    class PackageManager
    {
        public:
            PackageManager();
            virtual ~PackageManager();
            ///static PackageManager* get_instance() { return m_instance; }

            void init(int argc, char *argv[], char **envp);
            bool prepare();
            void proc();

            static PackageDB* get_db_obj() { return m_instance->m_db; }

            static void add_cat(Category* cat);
            static Category* get_cat(std::string cat_name);
            static Category* get_cat(int cat_id);

            static void add_meta(PackageMeta* meta);
            static PackageMeta* get_meta(int meta_id);
            static PackageMeta* get_meta(int cat_id, std::string pkg_name);

            static void add_pkg(Package* pkg);
            static Package* get_pkg(int pkg_id);
            static Package* get_pkg_meta(int meta_id);
            static Package* get_pkg_meta(int meta_id, std::string pkg_version);

            static void add_opt(ConfigurationOption *opt);
            static ConfigurationOption* get_opt(int opt_id);
            static ConfigurationOption* get_opt(std::string &name);

            static void add_alias(ConfigurationAlias *alias);
            static ConfigurationAlias* get_alias(int alias_id);
            static ConfigurationAlias* get_alias(std::string &name);

            static bool is_verbose() { return m_instance->m_verbose; }
        protected:
        private:
            PackageDB   *m_db;
            Fetch       *m_fetch;
            Variables   *m_vars;
            static PackageManager*  m_instance;
            CmdlineParser           *m_cmd;
            std::deque<std::string> m_package_names;
            std::deque<Package*>        m_packages_to_action_list;
            std::deque<int>             m_packages_to_action_world;
            std::deque<Package*>        m_packages_list;
            std::deque<PackageMeta*>    m_package_metas;
            std::deque<Category*>       m_category_list;
            std::deque<ConfigurationOption*>    m_options_list;
            std::deque<ConfigurationAlias*>     m_alias_list;

            bool        m_show_help;
            bool        m_params_ok;
            bool        m_install;
            bool        m_clean;
            bool        m_empty;
            bool        m_binary;
            bool        m_from_pkg;
            bool        m_ask;
            bool        m_verbose;
            bool        m_without_deps;
            bool        m_pretend;
            bool        m_to_fetch;

            void check_depedencies(Package* pkg);
            void add_to_actions(Package *pkg);
            void clear_unchanged_pkgs();

            bool user_yes_no();
    };
}

#endif // PACKAGEMANAGER_H
