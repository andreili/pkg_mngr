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
                                "-O2 -pipe -march=native", "${CFLAGS}", "-s", "${ROOT}/etc/packages/", "${OPTS_LOC}profile", "${PKG_DB}profiles/"};

Variables::Variables()
{
    m_instance = this;

    set_defaults();

    m_profile = Utils::run_cmd("", parse_vars(nullptr, "readlink ${PROFILE}"));
    m_profile = Utils::replace_str(m_profile, "../../var/lib/pkg/profiles/", "");
    m_profile = Utils::replace_str(m_profile, "\n", "");
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

    read_profile(parse_vars(nullptr, "${PROFILE_ROOT}" + m_profile));

    read_user_set();

    #ifdef DEBUG_OPTS
    printf("OPTS>>>\n");
    for (option_config_t &opt : m_opts)
        printf("%p %p %s %i\n", opt.cat,
               opt.pkg, opt.opt->get_name().c_str(),
               (int)opt.opt_state);
    printf("<<<OPTS\n");
    #endif

    read_opts();

    #ifdef DEBUG_OPTS
    printf("OPTS>>>\n");
    for (option_config_t &opt : m_opts)
        printf("%p %p %s %i\n", opt.cat,
               opt.pkg, opt.opt->get_name().c_str(),
               (int)opt.opt_state);
    printf("<<<OPTS\n");
    #endif
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

std::string vars_res[] =
{
    "d"
};

std::string Variables::parse_vars(Package *pkg, const std::string &str_raw)
{
    std::string str = str_raw;

    std::regex reg("\\$\\{(\\w+)\\}");
    size_t name_pos = std::string::npos;
    bool replaced;
    std::string str_new;
    do
    {
        std::smatch sm;
        std::string name = "";
        replaced = false;
        str_new = str;
        if (std::regex_search(str_new, sm, reg))
        {
            for (size_t idx=1 ; idx<sm.size() ; ++idx)
            {
                name = sm[idx];
                bool is_reserved = false;
                for (std::string &s : vars_res)
                {
                    if (s.compare(name) == 0)
                    {
                        is_reserved = true;
                        break;
                    }
                }
                if (is_reserved)
                {
                    continue;
                }
                name_pos = str.find("${" + name + "}");
                
                char* env = getenv(name.c_str());
            
                if (m_vars.count(name))
                {
                    str_new = std::regex_replace(str_new, std::regex("\\$\\{(" + name + ")\\}"), m_vars[name]);
                    str = str_new;
                    replaced = true;
                }
                else if ((name_pos != std::string::npos) && (str_new[name_pos] == '$') && (env != nullptr))
                {
                    str_new = std::regex_replace(str_new, std::regex("\\$\\{(" + name + ")\\}"), env);
                }
                else
                {
                    for (std::string &var_name : variable_names)
                    {
                        if (name.compare(var_name) == 0)
                        {
                            str_new = std::regex_replace(str_new, std::regex("\\$\\{(" + var_name + ")\\}"), m_vars[var_name]);
                        }
                    }
                }
                if (pkg != nullptr)
                {
                    str_new = std::regex_replace(str_new, std::regex("\\$\\{(SRC_DIR)\\}"), pkg->get_var(PKG_PATH_SOURCE));
                    str_new = std::regex_replace(str_new, std::regex("\\$\\{(BUILD_DIR)\\}"), pkg->get_var(PKG_PATH_BUILD));
                    str_new = std::regex_replace(str_new, std::regex("\\$\\{(BIN_DIR)\\}"), pkg->get_var(PKG_PATH_BIN));
                    str_new = std::regex_replace(str_new, std::regex("\\$\\{(PS)\\}"), pkg->get_var(PKG_SOURCE));
                    str_new = std::regex_replace(str_new, std::regex("\\$\\{(PN)\\}"), pkg->get_var(PKG_NAME));
                    str_new = std::regex_replace(str_new, std::regex("\\$\\{(PV)\\}"), pkg->get_var(PKG_VERSION));
                    str_new = std::regex_replace(str_new, std::regex("\\$\\{(CONFIG_DEF)\\}"), ""); // TODO
                }
            }
        }

        if (str_new.compare(str) != 0)
        {
            replaced = true;
            str = str_new;
        }
    } while (replaced);

    if (pkg != nullptr)
        return pkg->parse_opts(str);
    else
        return str;
}

void Variables::read_profile(std::string dir)
{
    Utils::read_text_file(dir + "/parent", [this, &dir](std::string line)
    {
        read_profile(dir + "/" + line);
    });
    read_conf_from_file(dir + "/packages.conf");
    read_opts_from_file(dir + "/packages.use");
}

void Variables::read_user_set()
{
    read_conf_from_file(parse_vars(nullptr, PKG_VAR_OPTS_LOC) + "packages.conf");
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
    read_opts_from_file(parse_vars(nullptr, PKG_VAR_OPTS_LOC) + "packages.use");

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

void Variables::read_conf_from_file(std::string file_name)
{
    Utils::read_text_file(file_name, [this](std::string line)
    {
        size_t pos = line.find_first_of(" =\t");
        std::string name = line.substr(0, pos);
        std::string val = line.substr(line.find_first_not_of("= \t", pos));

        if (val[0] == '"')
            val.erase(0, 1);
        if (val[val.size() - 1] == '"')
            val.erase(val.size() - 1, 1);

        //printf("Variable '%s'='%s'\n", name.c_str(), val.c_str());
        m_vars[name] = val;

    });
}

void Variables::read_opts_from_file(std::string file_name)
{
    #ifdef DEBUG_OPTS
    printf("start read opts from file: %s\n", file_name.c_str());
    #endif
    Utils::read_text_file(file_name, [this](std::string line)
    {
        #ifdef DEBUG_OPTS
        printf("OPT line: %s\n", line.c_str());
        #endif
        size_t pos = line.find_first_of(" \t");
        std::string pkg_name = line.substr(0, pos);
        std::string pkg_opts = line.substr(pos + 1);

        Category *cat = nullptr;
        Package *pkg = nullptr;
        if (!parse_pkg(pkg_name, cat, pkg))
            return;

        while (pkg_opts.size())
        {
            pos = pkg_opts.find(' ');
            std::string opt_str = pkg_opts.substr(0, pos);
            pkg_opts.erase(0, (pos==std::string::npos) ? pos : (pos + 1));
            option_config_t opt;
            if (parse_opt(opt_str, cat, pkg, opt))
            {
                 m_opts.push_back(opt);
            }
        }

        if (pkg != nullptr)
             pkg->update_opts();
    });
}

bool Variables::parse_pkg(std::string pkg_name, Category* &cat, Package* &pkg)
{
    if (pkg_name.compare("*/*") == 0)
        return true;

    size_t del_pos = pkg_name.find_first_of('/');

    bool ret_val = false;
    if (del_pos != std::string::npos)
    {
        std::string cat_name = pkg_name.substr(0, del_pos);
        if (pkg_name.compare("*") == 0)
        {
            Category::get_by_name(cat_name, [&ret_val, &cat](Category*c)
            {
                cat = c;
                ret_val = true;
            });
        }
        else
        {
            pkg_name = pkg_name.substr(del_pos);
            Package::get_pkg_by_name(pkg_name, [&ret_val, &pkg](Package* obj)
            {
                pkg = obj;
                ret_val = true;
            });
        }
    }
    return ret_val;
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

    //check on opts list
    for (option_config_t &opt_list : m_opts)
    {
        if ((opt_list.cat == cat) && (opt_list.pkg == pkg) && (opt_list.opt == opt_rec.opt))
        {
            opt_list.opt_state = opt_rec.opt_state;
            return false;
        }
    }

    opt_rec.cat = cat;
    opt_rec.pkg = pkg;
    return true;
}

}
