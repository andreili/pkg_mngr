#include "Variables.h"
#include "Package.h"
#include "stream.h"
#include "FileSystem.h"
#include "PackageManager.h"
#include "Utils.h"
#include <regex>

namespace package_manager
{

//#define DEBUG_OPTS

Variables* Variables::m_instance = nullptr;

#define OPTS_COUNT 11
std::string variable_names[] = {"PKG_SOURCES", "PKG_DB", "PKG_TMP", "PKG_DIR", "MAKEOPTS",
                                "CFLAGS", "CPPFLAGS", "LDFLAGS", "OPTS_LOC", "PROFILE", "PROFILE_ROOT"};

std::string variable_defs[] = {"${ROOT}/var/lib/pkg/srcs/", "${ROOT}/var/lib/pkg/", "${ROOT}/var/tmp/packages/", "${ROOT}/var/lib/pkg/pkgs/", "-j1",
                                "-O2 -pipe -march=native", "${CFLAGS}", "-s", "${ROOT}/etc/packages/", "${OPTS_LOC}/profile", "${PKG_DB}/profiles/"};

Variables::Variables()
{
    m_instance = this;

    set_defaults();

    m_profile = Utils::run_cmd("", parse_vars(nullptr, "readlink ${PROFILE}"));
    m_profile = Utils::replace_str(m_profile, "../../var/lib/pkg/profiles/", "");
    m_profile = Utils::replace_str(m_profile, "\n", "");

    read_profile(parse_vars(nullptr, "${PROFILE}"));

    read_user_set();
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

EOptState Variables::get_pkg_opt(Category *cat, Package *pkg, ConfigurationOption *opt)
{
    for (option_config_t &opt_sets : m_opts)
    {
        if ((opt_sets.pkg != nullptr) && (opt_sets.opt->get_id() == opt->get_id()) && (opt_sets.pkg->get_id() == pkg->get_id()))
        {
            #ifdef DEBUG_OPTS
            printf("by_pkg: %s %s %i\n", pkg->get_meta()->get_name().c_str(), opt_sets.opt->get_name().c_str(), (int)opt_sets.opt_state);
            #endif
            return opt_sets.opt_state;
        }
    }
    for (option_config_t &opt_sets : m_opts)
    {
        if ((opt_sets.cat != nullptr) && (opt_sets.opt->get_id() == opt->get_id()) && (opt_sets.cat->get_id() == cat->get_id()))
        {
            #ifdef DEBUG_OPTS
            printf("by_cat: %s %s %i\n", cat->get_name().c_str(), opt_sets.opt->get_name().c_str(), (int)opt_sets.opt_state);
            #endif
            return opt_sets.opt_state;
        }
    }
    for (option_config_t &opt_sets : m_opts)
    {
        if ((opt_sets.opt->get_id() == opt->get_id()) && (opt_sets.pkg == nullptr) && (opt_sets.cat == nullptr))
        {
            #ifdef DEBUG_OPTS
            printf("all: %s %i\n", opt_sets.opt->get_name().c_str(), (int)opt_sets.opt_state);
            #endif
            return opt_sets.opt_state;
        }
    }
    return EOptState::OPT_UNDEF;
}

std::string Variables::parse_vars(Package *pkg, EPKGVariable var)
{
    return parse_vars(pkg, m_vars[variable_names[var]]);
}

std::string Variables::parse_vars(Package *pkg, const std::string &str_raw)
{
    std::string str = str_raw;

    size_t str_len;
    do
    {
        str_len = str.length();
        std::smatch sm;
        std::string name = "";
        size_t name_pos = std::string::npos;
        if (std::regex_match(str, sm, std::regex(".*\\$\\{(\\w+)\\}.*")))
        {
            name = sm[1];
            name_pos = str.find("${" + name + "}");
        }

        if (pkg != nullptr)
        {
            str = std::regex_replace(str, std::regex("\\$\\{(SRC_DIR)\\}"), pkg->get_var(PKG_PATH_SOURCE));
            str = std::regex_replace(str, std::regex("\\$\\{(BUILD_DIR)\\}"), pkg->get_var(PKG_PATH_BUILD));
            str = std::regex_replace(str, std::regex("\\$\\{(BIN_DIR)\\}"), pkg->get_var(PKG_PATH_BIN));
            str = std::regex_replace(str, std::regex("\\$\\{(PS)\\}"), pkg->get_var(PKG_SOURCE));
            str = std::regex_replace(str, std::regex("\\$\\{(PN)\\}"), pkg->get_var(PKG_NAME));
            str = std::regex_replace(str, std::regex("\\$\\{(PV)\\}"), pkg->get_var(PKG_VERSION));
        }

        for (std::string &var_name : variable_names)
            str = std::regex_replace(str, std::regex("\\$\\{(" + var_name + ")\\}"), m_vars[var_name]);
        
        //str = std::regex_replace(str, std::regex("\\$\\{(ROOT)\\}"), m_vars["ROOT"]);

        char* env = getenv(name.c_str());
        if ((name_pos != std::string::npos) && (str[name_pos] == '$') && (env != nullptr))
            str = std::regex_replace(str, std::regex("\\$\\{(" + name + ")\\}"), env);
        else if (m_vars.count(name))
        {
            str = std::regex_replace(str, std::regex("\\$\\{(" + name + ")\\}"), m_vars[name]);
        }
        else
        {
            if (name.compare("ROOT") == 0)
                str = std::regex_replace(str, std::regex("\\$\\{(ROOT)\\}"), "");
        }
    } while (str_len != str.length());

    if (pkg != nullptr)
        return pkg->parse_opts(str);
    else
        return str;
}

void Variables::read_profile(std::string dir)
{
    /*FileSystem::list_files(dir, [this](const std::string &name, bool is_dir)
       {
           if (!is_dir)
           {
               //
           }
       });*/
}

void Variables::read_user_set()
{
    Stream *str = new Stream(parse_vars(nullptr, PKG_VAR_OPTS_LOC) + "packages.conf", FILE_OPEN_READ_ST);
    if (str->opened())
        while (!str->atEnd())
        {
            std::string line = str->readLine();
            size_t pos = line.find_first_of(" =\t");
            std::string name = line.substr(0, pos);
            std::string val = line.substr(line.find_first_not_of("= \t", pos));

            if (val[0] == '"')
                val.erase(0, 1);
            if (val[val.size() - 1] == '"')
                val.erase(val.size() - 1, 1);

            m_vars[name] = val;
        }
    delete str;

    #ifndef _WIN32
    setenv(variable_names[(int)PKG_VAR_MAKEOPTS].c_str(), parse_vars(nullptr, m_vars[variable_names[(int)PKG_VAR_MAKEOPTS]]).c_str(), 1);
    setenv(variable_names[(int)PKG_VAR_CFLAGS].c_str(), parse_vars(nullptr, m_vars[variable_names[(int)PKG_VAR_CFLAGS]]).c_str(), 1);
    setenv(variable_names[(int)PKG_VAR_CPPFLAGS].c_str(), parse_vars(nullptr, m_vars[variable_names[(int)PKG_VAR_CPPFLAGS]]).c_str(), 1);
    setenv("CXXFLAGS", parse_vars(nullptr, m_vars[variable_names[(int)PKG_VAR_CPPFLAGS]]).c_str(), 1);
    setenv(variable_names[(int)PKG_VAR_LDFLAGS].c_str(), parse_vars(nullptr, m_vars[variable_names[(int)PKG_VAR_LDFLAGS]]).c_str(), 1);
    #endif
}

void Variables::set_defaults()
{
    m_vars.clear();
    for (int i=0 ; i<OPTS_COUNT ; ++i)
	{
        m_vars[variable_names[i]] = variable_defs[i];
    }
}

void Variables::read_opts()
{
    std::string dir = parse_vars(nullptr, PKG_VAR_OPTS_LOC) + "packages.use/";
    FileSystem::list_files(dir, false, [this](const std::string &name, bool is_dir)
       {
           if (!is_dir)
               read_opts_from_file(name);
       });

    std::deque<std::string> opts;
    Utils::parse_str(m_vars["OPTS"], " \t\n\r", opts);
    if (opts.size())
        for (std::string opt_str : opts)
        {
            option_config_t opt;
            if (parse_opt(opt_str, nullptr, nullptr, opt))
                m_opts.push_back(opt);
        }
}

void Variables::read_opts_from_file(std::string file_name)
{
    Stream *str = new Stream(file_name, FILE_OPEN_READ_ST);
    #ifdef DEBUG_OPTS
    printf("start read opts from file: %s\n", file_name.c_str());
    #endif
    while (!str->atEnd())
    {
        std::string line = str->readLine();
        if ((line[0] == '#') || (line.length() == 0))
            continue;

        #ifdef DEBUG_OPTS
        printf("OPT line: %s\n", line.c_str());
        #endif
        size_t pos = line.find_first_of(" \t");
        std::string pkg_name = line.substr(0, pos);
        std::string pkg_opts = line.substr(pos + 1);

        Category *cat = nullptr;
        Package *pkg = nullptr;
        size_t del_pos = pkg_name.find_first_of('/');
        if (pkg_name.compare("*/*") == 0)
        {}
        else if (del_pos != std::string::npos)
        {
            std::string cat_name = pkg_name.substr(0, del_pos);
            if (pkg_name[pkg_name.length() - 1] == '*')
            {
                 Category::get_by_name(cat_name, [&cat](Category*c)
                 {
                     cat = c;
                 });
            }
            else
            {
                pkg_name = pkg_name.substr(del_pos);
                Package::get_pkg_by_name(pkg_name, [this, &pkg](Package* obj)
                {
                    pkg = obj;
                });
            }
        }

        while (pkg_opts.size())
        {
            pos = pkg_opts.find(' ');
            std::string opt_str = pkg_opts.substr(0, pos);
            pkg_opts.erase(0, (pos==std::string::npos) ? pos : (pos + 1));
            option_config_t opt;
            if (parse_opt(opt_str, cat, pkg, opt))
                 m_opts.push_back(opt);
        }

        if (pkg != nullptr)
             pkg->update_opts();
    }
    delete str;
}

bool Variables::parse_opt(std::string opt_str, Category *cat, Package *pkg, option_config_t& opt_rec)
{
    opt_rec.opt_state = EOptState::OPT_UNDEF;
    if (opt_str[0] == '-')
    {
        opt_rec.opt_state = EOptState::OPT_CLEAR;
        opt_str = opt_str.erase(0, 1);
    }
    else if (opt_str[0] == '+')
    {
        opt_rec.opt_state = EOptState::OPT_SET;
        opt_str = opt_str.erase(0, 1);
    }
    else
    {
        return false;
    }

    opt_rec.opt = PackageManager::get_db_obj()->get_config_opt(opt_str);
    if (opt_rec.opt == nullptr)
        return false;

    #ifdef DEBUG_OPTS
    printf("%p %p %s %i\n", cat, pkg, opt_rec.opt->get_name().c_str(), (int)opt_rec.opt_state);
    #endif

    opt_rec.cat = cat;
    opt_rec.pkg = pkg;
    return true;
}

}
