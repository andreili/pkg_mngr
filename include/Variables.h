#ifndef VARIABLES_H
#define VARIABLES_H

#include <map>
#include <deque>

namespace package_manager
{
    enum EPKGVariable
    {
        PKG_VAR_PATH_SOURCES = 0,
        PKG_VAR_PATH_DB = 1,
        PKG_VAR_PATH_TMP = 2,
        PKG_VAR_PATH_PKGS = 3,
        PKG_VAR_MAKEOPTS = 4,
        PKG_VAR_CFLAGS = 5,
        PKG_VAR_CPPFLAGS = 6,
        PKG_VAR_LDFLAGS = 7,
        PKG_VAR_OPTS_LOC = 8,
    };

    class Category;
    class Package;
    class ConfigurationOption;
    enum class EOptState;

    typedef struct
    {
        Category *cat;
        Package *pkg;
        ConfigurationOption *opt;
        EOptState   opt_state;
    } option_config_t;

    class Variables
    {
    public:
        Variables();
        virtual ~Variables();
        static Variables* get_instance() { return m_instance; }

        std::string get_var(const std::string &name);
        std::string get_var(EPKGVariable var);

        std::string parse_vars(Package *pkg, EPKGVariable var);
        std::string parse_vars(Package *pkg, const std::string &str_raw);

        void init_env(char **envp);

        std::string get_profile() { return m_profile; }

        EOptState get_pkg_opt(Category *cat, Package *pkg, ConfigurationOption *opt);
    protected:
    private:
        static Variables    *m_instance;
        std::string         m_profile;
        std::map<std::string,std::string>   m_vars;
        std::deque<option_config_t>         m_opts;

        void read_profile(std::string dir);
        void read_user_set();
        void set_defaults();
        void read_opts();
        void read_opts_from_file(std::string file_name);
        bool parse_opt(std::string opt_str, Category *cat, Package *pkg, option_config_t &opt_rec);
    };

}

#endif // VARIABLES_H
