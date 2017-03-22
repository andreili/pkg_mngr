#ifndef PKG_DB_H_INCLUDED
#define PKG_DB_H_INCLUDED

#include <SQLiteCpp.h>
#include <functional>
#include <cstring>
#include <string>

namespace package_manager
{
    class Category;
    class PackageMeta;
    class Package;
    class ConfigurationOption;
    enum class EOptState;

    class PackageDB
    {
        public:
            PackageDB();
            virtual ~PackageDB();

            void fill_aliases();

            void transaction_start();
            void transaction_commit();
            void transaction_rollback();

            Category* get_categoty(std::string &name);
            Category* get_category_by_pkg(std::string &name);
            Category* get_category_by_meta(PackageMeta *meta);
            Category* get_category(int cat_id);

            PackageMeta* get_package_meta(Category *cat, std::string &name);
            PackageMeta* get_package_meta(int meta_id);

            Package* get_pkg(PackageMeta *meta, std::string &version);
            Package* get_pkg(int pkg_id);
            Package* get_last_pkg(int meta_id);
            bool get_installed(Package *pkg);
            void set_installed(Package *pkg);
            void set_installed_opt(Package *pkg, ConfigurationOption *opt, EOptState state);
            void clear_installed_files(Package *pkg);
            void add_installed_file(Package *pkg, std::string &file);
            void print_posinst(PackageMeta *meta);

            ConfigurationOption* get_config_opt(int opt_id);
            ConfigurationOption* get_config_opt(std::string &name);

            void get_set_pkgs(std::string set_name, std::function<void(std::string pkg_name)>&& on_pkg);

            void get_pkg_opts(Package *pkg, std::function<void(ConfigurationOption* opt, EOptState def_on)>&& on_opt);
            EOptState get_opt_state(Package *pkg, ConfigurationOption* opt);

            void get_package_deps(int pkg_id, std::function<void(int depend_by, int dep_by_opt)>&& on_new_dep);

            void get_pkg_urls(Package *pkg, std::function<void(std::string url)>&& on_url);
            void get_url_details(std::string &url, int pkg_id, std::string *md5, int *file_size);

            void get_pkg_prepare(Package *pkg, std::function<void(std::string dir, std::string prepare_cmd)>&& on_cmd);
            void get_pkg_configure(Package *pkg, std::function<void(std::string dir, std::string config_cmd)>&& on_cmd);
            void get_pkg_compile(Package *pkg, std::function<void(std::string dir, std::string make_cmd)>&& on_cmd);
            void get_pkg_install(Package *pkg, std::function<void(std::string dir, std::string inst_cmd)>&& on_cmd);
            void get_pkg_postinstall(Package *pkg, std::function<void(std::string dir, std::string postinst_cmd)>&& on_cmd);
        private:
            SQLite::Database    *m_db;
            SQLite::Database    *m_db_inst;
    };
}

#endif // PKG_DB_H_INCLUDED
