#include "Package.h"
#include "PackageDB.h"
#include "PackageManager.h"
#include "Fetch.h"
#include "Variables.h"
#include "FileSystem.h"
#include "stream.h"
#include "Utils.h"
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>

namespace package_manager
{

Package::Package(PackageMeta *meta, SQLite::Statement &data)
    : m_state (INST_STATE_UNK)
    , m_log_enabled (false)
    , m_fetched (false)
    , m_fetch_running (false)
    , m_fetch_in_queue (false)
{
    if (meta == nullptr)
        m_meta = PackageManager::get_db_obj()->get_package_meta(data.getColumn("pkg_meta_id"));
    else
        m_meta = meta;
    m_id = data.getColumn("id");
    m_version = data.getColumn("version").getText();
    m_source = data.getColumn("source_name").getText();

    PackageManager::get_db_obj()->get_pkg_opts(this, [this](ConfigurationOption *opt, bool def_on)
        {
            EOptState old_state = PackageManager::get_db_obj()->get_opt_state(this, opt);
            EOptState new_state = Variables::get_instance()->get_pkg_opt(this, opt);
            this->m_options.push_back({default_on: def_on,
                                       state: EOptState::OPT_SET,
                                       changed: (new_state != old_state),
                                       option: opt});
        });

    m_tmp_dir = Variables::get_instance()->get_var(PKG_VAR_PATH_TMP) + m_meta->get_name() + '-' + m_version + '/';
    PackageManager::add_pkg(this);
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
    PackageManager::get_db_obj()->get_package_deps(m_meta->get_id(), [this, on_new_pkg](int depend_by)
        {
            on_new_pkg(PackageManager::get_db_obj()->get_last_pkg(depend_by));
        });
}

bool Package::check_installed()
{
   return PackageManager::get_db_obj()->get_installed(this);
}

bool Package::check_opt(int opt_id)
{
    for (config_opt_rec_t &opt : m_options)
        if ((opt.option->get_id() == opt_id) &&
            (opt.state == EOptState::OPT_SET))
            return true;
    return false;
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
        if (!Fetch::get_instance()->load_source(url))
            all_ok = false;
    }
    m_fetched = all_ok;
    m_fetch_in_queue = false;
    m_fetch_running = false;
}

bool Package::install()
{
    log_start();

    printf("Installing package ");
    print_short_info();

    ///printf("%i %i %i\n", m_fetched, m_fetch_in_queue, m_fetch_running);
    // wait, if sources not loaded
    while (!m_fetched && (m_fetch_in_queue || m_fetch_running))
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
        ///printf("%i %i %i\n", m_fetched, m_fetch_in_queue, m_fetch_running);
    }

    if (!m_fetched
        //|| !stage_clean()
        || !stage_unpack()
        || !stage_prepare()
        || !stage_configure()
        || !stage_compile()
        || !stage_install()
        || !stage_postinstall()
        || !stage_clean_unneeded()
        || !stage_strip()
        || !stage_mkpkg()
        //|| !stage_merge()
        //|| !stage_clean()
        )
    {
        printf(COLOR_RED "Error!\n" COLOR_RESET);
        log_stop();
        return false;
    }

    PackageManager::get_db_obj()->set_installed(this);
    for (config_opt_rec_t &opt : m_options)
        PackageManager::get_db_obj()->set_installed_opt(this, opt.option, opt.state);

    PackageManager::get_db_obj()->clear_installed_files(this);
    std::string root = Variables::get_instance()->parse_vars(this, "${BIN_DIR}");
    std::string dir = "";
    store_installed_files(root, dir);

    PackageManager::get_db_obj()->print_posinst(m_meta);
    printf("Installation suscessful.\n");

    log_stop();
    return true;
}

void Package::print_short_info()
{
    printf("\t[%s] =%s/%s-%s ( ",
           (check_installed() ? "\x1B[33mR\x1B[0m" : "\x1B[1;32mN\x1B[0m"),
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

Package* Package::get_pkg_by_name(std::string &pkg_name)
{
    std::string category_name = "";
    std::string package_name = "";
    std::string package_version = "";
    size_t ver_start = std::string::npos;
    size_t pkg_start = std::string::npos;

    if (pkg_name[0] == '=')
    {
        // get version
        ver_start = pkg_name.find_last_of(':');
        if (ver_start != std::string::npos)
            package_version = pkg_name.substr(ver_start + 1);
    }

    pkg_start = pkg_name.find_last_of('/');
    if (pkg_start != std::string::npos)
    {
        int offset = (pkg_name[0] == '=' ? 1 : 0);
        category_name = pkg_name.substr(offset, pkg_start - offset);
        ver_start -= pkg_start + 1;
    }

    package_name = pkg_name.substr((pkg_start == std::string::npos ? 0 : pkg_start + 1), ver_start);

    Category *cat;
    if (category_name.length() == 0)
    {
        cat = Category::get_by_pkg(package_name);
        if (cat == nullptr)
        {
            printf("Unable to find category for package \"%s\"!\n", package_name.c_str());
            return nullptr;
        }
    }
    else
    {
        cat = Category::get_by_name(category_name);
        if (cat == nullptr)
        {
            printf("Unable to find category \"%s\"!\n", category_name.c_str());
            return nullptr;
        }
    }

    Package* ret = cat->get_pkg(package_name, package_version);
    if (ret == nullptr)
        delete cat;
    return ret;

    return nullptr;
}

bool Package::stage_unpack()
{
    printf("\tUnpacking source\n");
    std::deque<std::string> urls;
    PackageManager::get_db_obj()->get_pkg_urls(this, [&urls](std::string url)
                                               {
                                                   urls.push_back(url);
                                               });
    for (std::string &url : urls)
    {
        std::string file_name = url.substr(url.find_last_of('/') + 1);
        if (file_name.find(".tar.") == std::string::npos)
            continue;
        std::string cmd = "tar -xf " + Variables::get_instance()->get_var(PKG_VAR_PATH_SOURCES) + file_name +
                          " -C " + m_tmp_dir + "source/";
        FileSystem::mkpath(m_tmp_dir + "source/", 0700);
        run_cmd("", cmd);
    }
    return true;
}

void Package::stage_clean()
{
    printf("\tClean\n");
    std::string cmd = "rm -rf " + m_tmp_dir;
    run_cmd("", cmd);
}

bool Package::stage_prepare()
{
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
    printf("\tStrip binaries\n");
    return run_cmd(Variables::get_instance()->parse_vars(this, "${BIN_DIR}"),
                   "find . -type f -exec strip --strip-debug '{}' \\;");
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
    printf("\tClean unneeded\n");

    std::string root = Variables::get_instance()->parse_vars(this, "${BIN_DIR}");
    for (size_t i=0 ; i<ARRAY_SIZE(locale_dirs) ; i++)
    {
        FileSystem::list_files(root + locale_dirs[i], [this, root](const std::string &name, bool is_dir)
                               {
                                   if (is_dir)
                                   {
                                       //check locales
                                       #warning
                                       ///if (true)    ///TODO
                                       ///     run_cmd(root, "rm -rf " + root + name);
                                   }
                               });
    }

    for (size_t i=0 ; i<ARRAY_SIZE(doc_dirs) ; i++)
        run_cmd(root, "rm -rf " + root + doc_dirs[i]);

    return true;
}

bool Package::stage_mkpkg()
{
    printf("\tMake binary package\n");
    return run_cmd(get_var(PKG_PATH_BIN),
        Variables::get_instance()->parse_vars(this, "tar cJpf ${PKG_DIR}/${PN}-${PV}.tar.xz ."));
}

bool Package::stage_merge()
{
    printf("\tMerge to /\n");
    return run_cmd("", Variables::get_instance()->parse_vars(this, "tar xf ${PKG_DIR}/${PN}-${PV}.tar.xz -C /"));
}

bool Package::run_cmd(const std::string dir, const std::string cmd)
{
    //printf("%s %s\n", dir.c_str(), cmd.c_str());
    log_str(cmd + '\n');

    chdir(dir.c_str());
    FILE *in;
    std::string cmd_ex = cmd + " 2>&1";
    if(!(in = popen(cmd_ex.c_str(), "r")))
        return false;
    const int BUFSIZE = 1000;
    uint8_t buf[BUFSIZE];
    while(fgets((char*)buf, BUFSIZE, in))
        log_data(buf, BUFSIZE);
    int exit_code = pclose(in);
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
        if (PackageManager::is_verbose())
            printf("%s\n", line.c_str());
    }
}

void Package::log_data(uint8_t *buf, int buf_size)
{
    if (m_log_enabled)
    {
        m_log->writeStr((char*)buf);
        if (PackageManager::is_verbose())
            printf("%s", (char*)buf);
    }
}

void Package::print_opts()
{
    for (config_opt_rec_t &opt : m_options)
    {
        std::string color = (opt.default_on ? "\x1B[33m" :
                             (opt.changed ? COLOR_GREEN :
                              ((opt.state == EOptState::OPT_SET) ? "\x1B[32m" : COLOR_RED)));
        printf("%s%s%s\x1B[0m ", color.c_str(), (opt.state == EOptState::OPT_SET) ? "+" : "-", opt.option->get_name().c_str());
    }
}

void Package::store_installed_files(std::string &root, std::string &dir)
{
    FileSystem::list_files(root + dir, [this, &root, &dir](const std::string &name, bool is_dir)
                           {
                               std::string fn = dir + '/' + name;
                               if (is_dir)
                                    store_installed_files(root, fn);
                               else
                                   PackageManager::get_db_obj()->add_installed_file(this, fn);
                           });
}

}
