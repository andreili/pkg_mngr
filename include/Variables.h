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
    };

    class Package;
    class ConfigurationOption;
    enum class EOptState;

    typedef struct
    {
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

        std::string parse_vars(Package *pkg, const std::string str_raw);

        void init_env(char **envp);

        EOptState get_pkg_opt(Package *pkg, ConfigurationOption *opt);
    protected:
    private:
        static Variables    *m_instance;
        std::map<std::string,std::string>   m_vars;
        std::deque<option_config_t>         m_opts;

        void set_defaults();
        void read_opts();
    };

}

#endif // VARIABLES_H
