#include "Package.h"
#include "PackageDB.h"
#include "PackageManager.h"
#include "Fetch.h"
#include "Variables.h"
#include "FileSystem.h"
#include "stream.h"
#include "Utils.h"
#include "ConfigurationAlias.h"
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <regex>

#define MAX_LOG_STRING 1024

namespace package_manager
{

Package::Package(PackageMeta *meta, int meta_id, int id, std::string version, std::string source_name)
    : m_state (INST_STATE_UNK)
    , m_log_enabled (false)
    , m_fetched (false)
    , m_fetch_running (false)
    , m_fetch_in_queue (false)
{
    if (meta == nullptr)
        m_meta = PackageManager::get_db_obj()->get_package_meta(meta_id);
    else
        m_meta = meta;
    m_id = id;
    m_version = version;
    m_source = source_name;
    m_tmp_dir = Variables::get_instance()->parse_vars(this, PKG_VAR_PATH_TMP) + m_meta->get_name() + '-' + m_version + '/';

    PackageManager::debug("Allocate new package object: %s\n", m_meta->get_name().c_str());

    update_opts();

    PackageManager::add_pkg(this);
    //parse_opts("--enable-languages=c${OPT cxx FLAGON ,c++}${OPT go FLAGON ,go}");
}

Package::Package(PackageMeta *meta)
    : m_meta (meta)
{
    //ctor
}

Package::~Package()
{
    //dtor
}

void Package::build_install_deps(std::function<void(Package *new_pkg)>&& on_new_pkg)
{
    PackageManager::get_db_obj()->get_package_deps(m_meta->get_id(), [this, on_new_pkg](int depend_by, int dep_by_opt)
        {
            if ((this->check_opt(dep_by_opt) == EOptState::OPT_SET) || (dep_by_opt == 0))
                on_new_pkg(PackageManager::get_db_obj()->get_last_pkg(depend_by));
        });
}

bool Package::check_installed()
{
   return PackageManager::get_db_obj()->get_installed(this);
}

void Package::update_opts()
{
    m_options.clear();
    PackageManager::debug("Update opts %s\n", m_meta->get_name().c_str());
    PackageManager::get_db_obj()->get_pkg_opts(this, [this](ConfigurationOption *opt, EOptState def_on)
        {
            PackageManager::debug("Update opts %s: ", opt->get_name().c_str());
            EOptState old_state = PackageManager::get_db_obj()->get_opt_state(this, opt);
            EOptState new_state = Variables::get_instance()->get_pkg_opt(this->get_meta()->get_cat(), this, opt);
            PackageManager::debug("%i->%i\n", (int)old_state, (int)new_state);
            this->m_options.push_back({def: def_on,
                                       state: new_state,
                                       changed: (new_state != old_state),
                                       option: opt});
        });
}

std::string Package::parse_opts(const std::string &str_raw)
{
    std::string str = str_raw;

    std::regex opt_reg("\\$\\{OPT (\\S+) (\\S+) (\\S+)\\}");
    std::smatch sm;

    while (std::regex_search(str, sm, opt_reg))
    {
        PackageManager::debug("Package opts: %s\n", str.c_str());
        std::string opt_name = sm[1];
        std::string alias_name = sm[2];
        std::string conf_name = sm[3];

        ConfigurationOption *opt_obj = PackageManager::get_db_obj()->get_config_opt(opt_name);
        if (opt_obj == nullptr)
        {
            printf(COLOR_RED "Error in aliases (opt [%s])!\n" COLOR_RESET, opt_name.c_str());
            log_stop();
            return "";
        }

        bool opt_ok = false;
        for (config_opt_rec_t &opt : m_options)
            if (opt.option->get_id() == opt_obj->get_id())
            {
                ConfigurationAlias *alias = PackageManager::get_alias(alias_name);
                if (alias == nullptr)
                {
                    printf(COLOR_RED "Error in aliases (alias [%s])!\n" COLOR_RESET, alias_name.c_str());
                    log_stop();
                    return "";
                }
                else
                {
                    std::string val;
                    std::string ex = std::regex_replace("${OPT " + opt_name + " " +
                                                        alias_name + " " + conf_name + "}", std::regex("[+?.\\${}]"), "\\$&");
                    switch (check_opt(opt.option->get_id()))
                    {
                    case EOptState::OPT_SET:
                        val = alias->get_on();
                        break;
                    case EOptState::OPT_CLEAR:
                        val = alias->get_off();
                        break;
                    case EOptState::OPT_UNDEF:
                        str = std::regex_replace(str, std::regex(ex),
                                                 val);
                        opt_ok = true;
                        continue;
                        break;
                    }

                    val = std::regex_replace(val, std::regex("\\$\\{OPT\\}"), conf_name);
                    str = std::regex_replace(str, std::regex(ex), val);
                    opt_ok = true;
                    break;
                }
            }
        //option not found
        if (!opt_ok)
        {
            printf(COLOR_RED "Error: option not found! ([%s])!\n" COLOR_RESET, opt_name.c_str());
            log_stop();
            return "";
        }
    }

    return str;
}

EOptState Package::check_opt(int opt_id)
{
    for (config_opt_rec_t &opt : m_options)
        if (opt.option->get_id() == opt_id)
        {
            PackageManager::debug("Check opt %s\n", opt.option->get_name().c_str());
            if (opt.state == EOptState::OPT_CLEAR)
                return EOptState::OPT_CLEAR;
            else if (opt.state == EOptState::OPT_SET)
                return EOptState::OPT_SET;
            else if (opt.state == EOptState::OPT_UNDEF)
                return opt.def;
        }
    return EOptState::OPT_CLEAR;
}

bool Package::not_changed()
{
    bool config_changed = false;
    for (config_opt_rec_t &opt : m_options)
        if (opt.changed)
        {
            config_changed = true;
            break;
        }
    Package *latest_ver = PackageManager::get_db_obj()->get_last_pkg(m_meta->get_id());

    return (!config_changed) && (latest_ver->m_id == m_id);
}

void Package::fetch()
{
    m_fetch_running = true;
    std::deque<std::string> urls;
    PackageManager::get_db_obj()->get_pkg_urls(this, [&urls](std::string url)
                                               {
                                                   urls.push_back(url);

                                               });
    bool all_ok = true;
    for (std::string &url : urls)
    {
        if (!Fetch::get_instance()->load_source(url, this))
            all_ok = false;
    }
    m_fetched = all_ok;
    m_fetch_in_queue = false;
    m_fetch_running = false;
}

bool Package::install()
{
    printf("Installing package ");
    print_short_info();

    if (!stage_clean())
    {
        printf(COLOR_RED "Error on clean stage!\n" COLOR_RESET);
        log_stop();
        log_tail();
        return false;
    }

    log_start();

    ///printf("%i %i %i\n", m_fetched, m_fetch_in_queue, m_fetch_running);
    // wait, if sources not loaded
    while (!m_fetched && (m_fetch_in_queue || m_fetch_running))
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
        ///printf("%i %i %i\n", m_fetched, m_fetch_in_queue, m_fetch_running);
    }

    if (!m_fetched
        || !stage_unpack()
        || !stage_prepare()
        || !stage_configure()
        || !stage_compile()
        || !stage_install()
        || !stage_postinstall()
        || !stage_clean_unneeded()
        || !stage_strip()
        || !stage_mkpkg()
        || !stage_list()
        || !stage_merge()
        || !stage_clean()
        )
    {
        printf(COLOR_RED "Error!\n" COLOR_RESET);
        log_stop();
        log_tail();
        return false;
    }

    PackageManager::get_db_obj()->set_installed(this);
    for (config_opt_rec_t &opt : m_options)
        PackageManager::get_db_obj()->set_installed_opt(this, opt.option, opt.state);

    PackageManager::get_db_obj()->print_posinst(m_meta);
    printf("Installation suscessful.\n");

    log_stop();
    return true;
}

void Package::print_short_info()
{
    printf("\t[%s] =%s/%s-%s ( ",
           (check_installed() ? COLOR_YELLOW "R" COLOR_RESET : COLOR_GREEN "N" COLOR_RESET),
           m_meta->get_cat()->get_name().c_str(),
           m_meta->get_name().c_str(),
           m_version.c_str());
    print_opts();
    printf(")\n");
}

std::string Package::get_var(EPackageVar var)
{
    switch (var)
    {
    case PKG_PATH_SOURCE:
        return m_tmp_dir + "source/";
    case PKG_PATH_BUILD:
        return m_tmp_dir + "build/";
    case PKG_PATH_BIN:
        return m_tmp_dir + "bin/";
    case PKG_SOURCE:
	return m_source;
    case PKG_NAME:
        return m_meta->get_name();
    case PKG_VERSION:
        return m_version;
    }
    return "";
}

void Package::get_pkg_by_name(std::string &pkg_name, std::function<void(Package*)>&& on_pkg)
{
    std::string category_name = "";
    std::string package_name = "";
    std::string package_version = "";
    size_t ver_start = 0;
    size_t pkg_start = std::string::npos;

    pkg_start = pkg_name.find_last_of('/');
    if (pkg_start != std::string::npos)
    {
        int offset = (pkg_name[0] == '=' ? 1 : 0);
        category_name = pkg_name.substr(offset, pkg_start - offset);
        ver_start = pkg_start + 1;
    }
    else if (pkg_name[0] == '=')
    {
        pkg_start = 0;
        ++ver_start;
    }

    ver_start = pkg_name.find_last_of(ver_start, '-');
    if (ver_start != std::string::npos)
        package_version = pkg_name.substr(ver_start + 1);

    package_name = pkg_name.substr((pkg_start == std::string::npos ? 0 : pkg_start + 1), ver_start);

    if (category_name.length() == 0)
    {
        Category *cat = Category::get_by_pkg(package_name);
        if (cat == nullptr)
            return;
        else
            cat->get_pkg(package_name, package_version, [&on_pkg](Package* pkg)
            {
                on_pkg(pkg);
            });
    }
    else
    {
        Category::get_by_name(category_name, [&on_pkg, &package_name, &package_version](Category* cat)
        {
            if (cat != nullptr)
                cat->get_pkg(package_name, package_version, [&on_pkg](Package* pkg)
                {
                   on_pkg(pkg);
                });
        });
    }
}

bool Package::stage_unpack()
{
    if (PackageManager::is_verbose())
        printf("\tUnpacking source\n");
    std::deque<std::string> urls;
    PackageManager::get_db_obj()->get_pkg_urls(this, [&urls](std::string url)
                                               {
                                                   urls.push_back(url);
                                               });
    for (std::string &url : urls)
    {
        url = Variables::get_instance()->parse_vars(this, url);
        std::string file_name = url.substr(url.find_last_of('/') + 1);
        if ((file_name.find(".tar.") != std::string::npos) || (file_name.find(".tgz") != std::string::npos))
        {
            std::string cmd = "tar -xf " + Variables::get_instance()->parse_vars(this, PKG_VAR_PATH_SOURCES) + file_name +
                              " -C " + m_tmp_dir + "source/";
            FileSystem::mkpath(m_tmp_dir + "source/", 0700);
            run_cmd("", cmd);
        }
        else if (file_name.find(".zip") != std::string::npos)
        {
            std::string cmd = "unzip " + Variables::get_instance()->parse_vars(this, PKG_VAR_PATH_SOURCES) + file_name;
            FileSystem::mkpath(m_tmp_dir + "source/", 0700);
            run_cmd(m_tmp_dir + "source/", cmd);
        }
    }
    return true;
}

bool Package::stage_clean()
{
    if (PackageManager::is_verbose())
        printf("\tClean\n");
    std::string cmd = "rm -rf " + m_tmp_dir;
    return run_cmd("", cmd);
}

bool Package::stage_prepare()
{
    if (PackageManager::is_verbose())
        printf("\tPreparing source\n");
    bool ret = true;
    PackageManager::get_db_obj()->get_pkg_prepare(this, [this, &ret](std::string dir, std::string cmd)
                                                  {
                                                      if (!run_cmd(Variables::get_instance()->parse_vars(this, dir),
                                                                   Variables::get_instance()->parse_vars(this, cmd)))
                                                        ret = false;
                                                  });
    return ret;
}

bool Package::stage_configure()
{
    if (PackageManager::is_verbose())
        printf("\tConfiguring\n");
    bool ret = true;
    PackageManager::get_db_obj()->get_pkg_configure(this, [this, &ret](std::string dir, std::string cmd)
                                                  {
                                                      FileSystem::mkpath(Variables::get_instance()->parse_vars(this, dir), 0700);
                                                      if (!run_cmd(Variables::get_instance()->parse_vars(this, dir),
                                                                   Variables::get_instance()->parse_vars(this, cmd)))
                                                        ret = false;
                                                  });
    return ret;
}

bool Package::stage_compile()
{
    if (PackageManager::is_verbose())
        printf("\tCompiling\n");
    bool ret = true;
    PackageManager::get_db_obj()->get_pkg_compile(this, [this, &ret](std::string dir, std::string cmd)
                                                  {
                                                      if (!run_cmd(Variables::get_instance()->parse_vars(this, dir),
                                                                   Variables::get_instance()->parse_vars(this, cmd)))
                                                        ret = false;
                                                  });
    return ret;
}

bool Package::stage_install()
{
    if (PackageManager::is_verbose())
        printf("\tInstall to temporary directory\n");
    bool ret = true;
    PackageManager::get_db_obj()->get_pkg_install(this, [this, &ret](std::string dir, std::string cmd)
                                                  {
                                                      std::string dir_ex = Variables::get_instance()->parse_vars(this, dir);
                                                      FileSystem::mkpath(dir_ex, 0700);
                                                      if (!run_cmd(dir_ex, Variables::get_instance()->parse_vars(this, cmd)))
                                                        ret = false;
                                                  });
    return ret;
}

bool Package::stage_postinstall()
{
    if (PackageManager::is_verbose())
        printf("\tPost-installation preparation\n");
    bool ret = true;
    PackageManager::get_db_obj()->get_pkg_postinstall(this, [this, &ret](std::string dir, std::string cmd)
                                                  {
                                                      std::string dir_ex = Variables::get_instance()->parse_vars(this, dir);
                                                      FileSystem::mkpath(dir_ex, 0700);
                                                      if (!run_cmd(dir_ex, Variables::get_instance()->parse_vars(this, cmd)))
                                                        ret = false;
                                                  });
    return true;
}

bool Package::stage_strip()
{
    if (PackageManager::is_verbose())
        printf("\tStrip binaries\n");
    return run_cmd(Variables::get_instance()->parse_vars(this, "${BIN_DIR}"),
                   "find . -type f -exec ${CROSS_COMPILE}strip --strip-unneeded -R .comment -R .GCC.command.line -R .note.gnu.gold-version '{}' \\;");
}

#define ARRAY_SIZE(array) (sizeof((array))/sizeof((array[0])))
std::string locale_dirs[] = {"/usr/share/locale/",
                           "/opt/X11/share/locale/",
                           "/opt/kf5/share/locale/"};
std::string doc_dirs[] = {"/usr/share/info",
                          "/usr/share/doc",
                          "/opt/X11/share/doc",
                          "/opt/kf5/share/doc",
                          "/usr/share/gtk-docs"};

bool Package::stage_clean_unneeded()
{
    std::string root = Variables::get_instance()->parse_vars(this, "${BIN_DIR}");
    for (size_t i=0 ; i<ARRAY_SIZE(locale_dirs) ; i++)
    {
        std::string dir = root + locale_dirs[i];
        FileSystem::list_files(dir, false, [this, dir](const std::string &name, bool is_dir)
                               {
                                   if (is_dir)
                                   {
                                       //check locales
                                       if (!PackageManager::is_locale_active(name))
                                            run_cmd(dir, "rm -rf " + dir + name);
                                   }
                               });
    }

    for (size_t i=0 ; i<ARRAY_SIZE(doc_dirs) ; i++)
        run_cmd(root, "rm -rf " + root + doc_dirs[i]);

    return true;
}

bool Package::stage_mkpkg()
{
    if (PackageManager::is_verbose())
        printf("\tMake binary package\n");
    return run_cmd(get_var(PKG_PATH_BIN),
        Variables::get_instance()->parse_vars(this, "XZ_OPT=--threads=0 tar cJpf ${PKG_DIR}/${PN}-${PV}.tar.xz ."));
}

bool Package::stage_list()
{
    PackageManager::get_db_obj()->clear_installed_files(this);
    std::string root = Variables::get_instance()->parse_vars(this, "${BIN_DIR}");
    std::string dir = "";
    PackageManager::get_db_obj()->transaction_start();
    store_installed_files(root, dir);
    PackageManager::get_db_obj()->transaction_commit();
    return true;
}

bool Package::stage_merge()
{
    if (PackageManager::is_verbose())
        printf("\tMerge to /\n");
    return run_cmd("", Variables::get_instance()->parse_vars(this, "tar --keep-directory-symlink -xf ${PKG_DIR}/${PN}-${PV}.tar.xz -C ${ROOT}/"));
}

bool Package::run_cmd(const std::string dir, const std::string cmd)
{
    if (cmd.size() == 0)
        return false;

    log_str("[" + dir + "]" + cmd + '\n');

    chdir(dir.c_str());
    FILE *in;
    std::string cmd_ex = cmd;
    if (cmd.substr(0, 3).compare("cat") != 0)
        cmd_ex += " 2>&1";
    if(!(in = popen(cmd_ex.c_str(), "r")))
        return false;
    char *buf = new char[MAX_LOG_STRING];
    while(fgets(buf, MAX_LOG_STRING, in))
        log_data(buf);
    int exit_code = pclose(in);
    chdir("/");
    if (exit_code)
        return false;
    return true;
}

void Package::log_start()
{
    FileSystem::mkpath(m_tmp_dir, 0700);

    m_log = new Stream(m_tmp_dir + "/pkg.log", FILE_OPEN_WRITE_ST | FILE_CREATE_ALWAYS);
    m_log_enabled = true;
}

void Package::log_stop()
{
    if (m_log_enabled)
    {
        m_log_enabled = false;
        delete m_log;
    }
}

void Package::log_str(const std::string line)
{
    if (m_log_enabled)
    {
        m_log->writeStr(line);
        m_log->write("\n", 1);
        if (PackageManager::is_verbose_cmds())
            printf("%s\n", line.c_str());
    }
}

void Package::log_data(char *buf)
{
    if (m_log_enabled)
    {
        m_log->writeStr(buf);
        if (PackageManager::is_verbose_cmds())
            printf("%s", buf);
    }
}

void Package::log_tail()
{
    std::string cmd = "tail -n 20 " + m_tmp_dir + "/pkg.log";
    FILE *in;
    if(!(in = popen(cmd.c_str(), "r")))
        return;
    char *buf = new char[MAX_LOG_STRING];
    while(fgets(buf, MAX_LOG_STRING, in))
        printf("%s", buf);
    pclose(in);
    delete buf;
}

void Package::print_opts()
{
    for (config_opt_rec_t &opt : m_options)
    {
        EOptState state = (opt.state != EOptState::OPT_UNDEF) ? opt.state : opt.def;
        const char* color = (state == EOptState::OPT_UNDEF ?
                             (opt.def == EOptState::OPT_SET ? COLOR_YELLOW : COLOR_RED) :
                             (state == EOptState::OPT_SET) ? COLOR_GREEN : COLOR_RED);
        std::string def;
        switch (check_opt(opt.option->get_id()))
        {
        case EOptState::OPT_SET:
            def = "+";
            break;
        case EOptState::OPT_CLEAR:
            def = "-";
            break;
        case EOptState::OPT_UNDEF:
            def = "%";
            break;
        }

        printf("%s%s%s%s%s%s ", color, opt.changed ? BOLD_ON : "", def.c_str(), opt.option->get_name().c_str(), opt.changed ? BOLD_OFF : "", COLOR_RESET);
    }
}

void Package::store_installed_files(std::string &root, std::string &dir)
{
    FileSystem::list_files(root + dir, false, [this, &root, &dir](const std::string &name, bool is_dir)
                           {
                               std::string fn = dir + '/' + name;
                               if (is_dir)
                                    store_installed_files(root, fn);
                               else
                                   PackageManager::get_db_obj()->add_installed_file(this, fn);
                           });
}

}
