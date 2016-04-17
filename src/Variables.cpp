#include "Variables.h"
#include "Package.h"
#include "stream.h"
#include "FileSystem.h"
#include "PackageManager.h"
#include <regex>

namespace package_manager
{

Variables* Variables::m_instance = nullptr;

std::string variable_names[] = {"PKG_SOURCES", "PKG_DB", "PKG_TMP", "PKG_DIR", "MAKEOPTS",
                                "CFLAGS", "CPPFLAGS", "LDFLAGS"};

Variables::Variables()
{
    m_instance = this;
    set_defaults();
}

Variables::~Variables()
{
    //dtor
}

std::string Variables::get_var(const std::string &name)
{
    return m_vars[name];
}

std::string Variables::get_var(EPKGVariable var)
{
    if (m_vars.count(variable_names[var]) != 0)
        return m_vars[variable_names[var]];
    else
        return "";
}

void Variables::init_env(char **envp)
{
    char** env;
    for (env = envp; *env != 0; env++)
    {
        std::string env_str = *env;
        size_t pos = env_str.find_first_of('=');
        m_vars[env_str.substr(0, pos)] = env_str.substr(pos + 1);
    }

    read_opts();
}

EOptState Variables::get_pkg_opt(Package *pkg, ConfigurationOption *opt)
{
    for (option_config_t &opt_sets : m_opts)
        if ((opt_sets.pkg->get_id() == pkg->get_id()) &&
            (opt_sets.opt->get_id() == opt->get_id()))
            return opt_sets.opt_state;
    return EOptState::OPT_SET;
}

std::string Variables::parse_vars(Package *pkg, const std::string str_raw)
{
    std::string str = str_raw;

    str = std::regex_replace(str, std::regex("\\$\\{(SRC_DIR)\\}"), pkg->get_var(PKG_PATH_SOURCE));
    str = std::regex_replace(str, std::regex("\\$\\{(BUILD_DIR)\\}"), pkg->get_var(PKG_PATH_BUILD));
    str = std::regex_replace(str, std::regex("\\$\\{(BIN_DIR)\\}"), pkg->get_var(PKG_PATH_BIN));
    str = std::regex_replace(str, std::regex("\\$\\{(PS)\\}"), pkg->get_var(PKG_SOURCE));
    str = std::regex_replace(str, std::regex("\\$\\{(PN)\\}"), pkg->get_var(PKG_NAME));
    str = std::regex_replace(str, std::regex("\\$\\{(PV)\\}"), pkg->get_var(PKG_VERSION));

    str = std::regex_replace(str, std::regex("\\$\\{(PKG_SOURCES)\\}"), get_var(variable_names[(int)PKG_VAR_PATH_SOURCES]));
    str = std::regex_replace(str, std::regex("\\$\\{(PKG_TMP)\\}"), get_var(variable_names[(int)PKG_VAR_PATH_TMP]));
    str = std::regex_replace(str, std::regex("\\$\\{(PKG_DIR)\\}"), get_var(variable_names[(int)PKG_VAR_PATH_PKGS]));

    str = std::regex_replace(str, std::regex("\\$\\{(MAKEOPTS)\\}"), get_var("MAKEOPTS"));

    return str;
}

void Variables::set_defaults()
{
    Stream *str = new Stream("/etc/packages/packages.conf", FILE_OPEN_READ_ST);
    if (str->opened())
        while (!str->atEnd())
        {
            std::string line = str->readLine();
            size_t pos = line.find_first_of('=');
            std::string name = line.substr(0, pos);
            std::string val = line.substr(pos + 1);

            if (val[0] == '"')
                val.erase(0, 1);
            if (val[val.size() - 1] == '"')
                val.erase(val.size() - 1, 1);

            m_vars[name] = val;
        }
    delete str;

    putenv(const_cast<char *>((variable_names[(int)PKG_VAR_MAKEOPTS] + "\"" + m_vars[variable_names[(int)PKG_VAR_MAKEOPTS]]).c_str()));
    putenv(const_cast<char *>((variable_names[(int)PKG_VAR_CFLAGS] + "\"" + m_vars[variable_names[(int)PKG_VAR_CFLAGS]]).c_str()));
    putenv(const_cast<char *>((variable_names[(int)PKG_VAR_CPPFLAGS] + "\"" + m_vars[variable_names[(int)PKG_VAR_CPPFLAGS]]).c_str()));
    putenv(const_cast<char *>((variable_names[(int)PKG_VAR_LDFLAGS] + "\"" + m_vars[variable_names[(int)PKG_VAR_LDFLAGS]]).c_str()));
}

void Variables::read_opts()
{
    std::string dir = "/etc/packages/packages.use";
    FileSystem::list_files(dir, [this, &dir](const std::string &name, bool is_dir)
                           {
                               if (!is_dir)
                               {
                                   Stream *str = new Stream(dir + '/' + name, FILE_OPEN_READ_ST);
                                   while (!str->atEnd())
                                   {
                                       std::string line = str->readLine();
                                       if (line[0] == '#')
                                           continue;

                                       size_t pos = line.find_first_of(" \t");
                                       std::string pkg_name = line.substr(0, pos);
                                       std::string pkg_opts = line.substr(pos + 1);

                                       Package *pkg = Package::get_pkg_by_name(pkg_name);

                                       while (pkg_opts.size())
                                       {
                                           pos = pkg_opts.find(' ');
                                           std::string opt_str = pkg_opts.substr(0, pos);
                                           EOptState state = EOptState::OPT_UNDEF;
                                           if (opt_str[0] == '-')
                                           {
                                               state = EOptState::OPT_CLEAR;
                                               opt_str.erase(0, 1);
                                           }
                                           else
                                               state = EOptState::OPT_SET;

                                           ConfigurationOption *opt = PackageManager::get_db_obj()->get_config_opt(opt_str);
                                           pkg_opts.erase(0, (pos==std::string::npos) ? pos : (pos + 1));

                                           m_opts.push_back({pkg: pkg,
                                                             opt: opt,
                                                             opt_state: state});
                                       }
                                   }
                                   delete str;
                               }
                           });
}

}
