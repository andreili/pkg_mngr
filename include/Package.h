#ifndef PACKAGE_H
#define PACKAGE_H

#include <functional>
#include <deque>
#include "PackageMeta.h"
#include "ConfigurationOption.h"

class Stream;

namespace package_manager
{
    enum EInstallationState
    {
        INST_STATE_UNK = 0,
        INST_STATE_NOT_INSTALLED,
        INST_STATE_INSTALLED,
        INST_STATE_INSTALLED_ANOTHER_FLAGS,
    };

    enum EPackageVar
    {
        PKG_PATH_SOURCE,
        PKG_PATH_BUILD,
        PKG_PATH_BIN,
        PKG_SOURCE,
        PKG_NAME,
        PKG_VERSION,
    };

    typedef struct
    {
        bool                default_on;
        EOptState           state;
        bool                changed;
        ConfigurationOption *option;
    } config_opt_rec_t;

    class Package
    {
        public:
            Package(PackageMeta *meta, SQLite::Statement &data);
            Package(PackageMeta *meta);
            virtual ~Package();

            void build_install_deps(std::function<void(Package *new_pkg)>&& on_new_pkg);
            bool check_installed();
            void update_opts();
            std::string parse_opts(const std::string &str_raw);

            int get_id() { return m_id; }
            int get_meta_id() { return m_meta->get_id(); }
            PackageMeta* get_meta() { return m_meta; }
            std::string get_version() { return m_version; }

            EOptState check_opt(int opt_id);
            bool not_changed();

            void fetch();
            bool install();
            void print_short_info();

            bool is_fetched() { return m_fetched; }
            inline void set_queue(bool value) { m_fetch_in_queue = value; }

            std::string get_var(EPackageVar var);

            static Package* get_pkg_by_name(std::string &pkg_name);
        protected:
        private:
            PackageMeta     *m_meta;
            EInstallationState  m_state;
            int             m_id;
            std::string     m_version;
            std::string		m_source;

            bool            m_log_enabled;
            Stream          *m_log;

            std::string     m_tmp_dir;

            bool            m_fetched;
            bool            m_fetch_running;
            bool            m_fetch_in_queue;

            std::deque<config_opt_rec_t>    m_options;

            bool stage_unpack();
            bool stage_clean();
            bool stage_prepare();
            bool stage_configure();
            bool stage_compile();
            bool stage_install();
            bool stage_postinstall();
            bool stage_strip();
            bool stage_clean_unneeded();
            bool stage_mkpkg();
            bool stage_list();
            bool stage_merge();

            bool run_cmd(const std::string dir, const std::string cmd);
            void log_start();
            void log_stop();
            void log_str(const std::string line);
            void log_data(char *buf);
            void print_opts();
            void store_installed_files(std::string &root, std::string &dir);
    };

}

#endif // PACKAGE_H
