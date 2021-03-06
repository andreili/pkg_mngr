#include "PackageDB.h"
#include "PackageManager.h"
#include "Category.h"
#include "PackageMeta.h"
#include "Package.h"
#include "Variables.h"

namespace package_manager
{

#define SQL_MASK_REPLACE(str) \
    size_t ch_pos; \
    while ((ch_pos = str.find('*')) != std::string::npos) \
        str = str.replace(ch_pos, 1, "%"); \

PackageDB::PackageDB()
{
    std::string path = Variables::get_instance()->parse_vars(nullptr, "${PKG_DB}") + "packages";
    //std::string path = "d:/Dev/Projects/pkg_mngr/packages.sql3";
    //printf("%s\n", path.c_str());
    try
    {
        m_db = new SQLite::Database(path + ".sql3", SQLITE_OPEN_READWRITE);
    }
    catch (SQLite::Exception& e)
    {
    }

    try
    {
        m_db_inst = new SQLite::Database(path + "_installed.sql3", SQLITE_OPEN_READWRITE);
    }
    catch (SQLite::Exception& e)
    {
        m_db_inst = new SQLite::Database(path + "_installed.sql3", SQLITE_OPEN_READWRITE|SQLITE_OPEN_CREATE);
        SQLite::Statement(*m_db_inst, "CREATE TABLE installed_pkg_files (id INTEGER PRIMARY KEY AUTOINCREMENT, "
                                      "pkg_id INTEGER, name TEXT);").exec();
        SQLite::Statement(*m_db_inst, "CREATE TABLE installed_pkg_opts (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER"
              ", opt_id INTEGER, selected INTEGER);").exec();
        SQLite::Statement(*m_db_inst, "CREATE TABLE installed_pkgs (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER);").exec();
    }

    m_db_inst->exec("PRAGMA synchronous = OFF;");
    m_db_inst->exec("PRAGMA journal_mode = MEMORY;");
}

PackageDB::~PackageDB()
{
    delete m_db;
}

void PackageDB::fill_aliases()
{
    SQLite::Statement query(*m_db, "SELECT * FROM config_aliases;");
    while (query.executeStep())
        PackageManager::add_alias(new ConfigurationAlias(query));
}

void PackageDB::transaction_start()
{
    m_db_inst->exec("BEGIN TRANSACTION;");
}

void PackageDB::transaction_commit()
{
    try
    {
        m_db_inst->exec("END TRANSACTION;");
    }
    catch (SQLite::Exception& e)
    {
        // Never throw an exception in a destructor
        (void)e; // warning proof
        SQLITECPP_ASSERT(false, e.what());  // See SQLITECPP_ENABLE_ASSERT_HANDLER
    }
}

void PackageDB::transaction_rollback()
{
    m_db_inst->exec("ROLLBACK");
}

void PackageDB::get_category(std::string &name, std::function<void(Category*)>&& on_cat)
{
    SQL_MASK_REPLACE(name);

    SQLite::Statement query(*m_db, "SELECT * FROM category WHERE (name LIKE :name COLLATE NOCASE);");
    query.bind(":name", name);
    while (query.executeStep())
        on_cat(new Category(query));
}

Category* PackageDB::get_category_by_pkg(std::string &name)
{
    SQLite::Statement query(*m_db, "SELECT cat_id FROM package_meta WHERE (name=:name COLLATE NOCASE);");
    query.bind(":name", name);
    if ((query.executeStep()) && (query.getColumnCount()))
    {
        return get_category(query.getColumn("cat_id").getInt());
    }
    else
        return nullptr;
}

Category* PackageDB::get_category_by_meta(PackageMeta *meta)
{
    SQLite::Statement query(*m_db, "SELECT cat_id FROM package_meta WHERE (id=:id);");
    query.bind(":id", meta->get_id());
    if (query.executeStep())
        return get_category(query.getColumn("cat_id").getInt());
    else
        return nullptr;
}

Category* PackageDB::get_category(int cat_id)
{
    Category* cat = PackageManager::get_cat(cat_id);
    if (cat != nullptr)
        return cat;

    SQLite::Statement query(*m_db, "SELECT * FROM category WHERE (id=:id);");
    query.bind(":id", cat_id);
    if (query.executeStep())
        return new Category(query);
    else
        return nullptr;
}

void PackageDB::get_package_meta(Category *cat, std::string name, std::function<void(PackageMeta*)> &&on_meta)
{
    PackageMeta* meta = PackageManager::get_meta(cat->get_id(), name);
    if (meta != nullptr)
    {
        on_meta(meta);
        return;
    }

    SQL_MASK_REPLACE(name);

    SQLite::Statement query(*m_db, "SELECT * FROM package_meta WHERE (name LIKE :name COLLATE NOCASE AND cat_id=:cat);");
    query.bind(":name", name);
    query.bind(":cat", cat->get_id());
    while (query.executeStep())
    {
        meta = PackageManager::get_meta(cat->get_id(), query.getColumn("name").getText());
        if (meta != nullptr)
            on_meta(meta);
        else
            on_meta(new PackageMeta(cat, query));
    }
}

PackageMeta* PackageDB::get_package_meta(int meta_id)
{
    PackageMeta* meta = PackageManager::get_meta(meta_id);
    if (meta != nullptr)
        return meta;

    SQLite::Statement query(*m_db, "SELECT * FROM package_meta WHERE (id=:id);");
    query.bind(":id", meta_id);
    if (query.executeStep())
        return new PackageMeta(nullptr, query);
    else
        return nullptr;
}

void PackageDB::get_pkg(PackageMeta *meta, std::string version, std::function<void(Package*)>&& on_pkg)
{
    Package* pkg = PackageManager::get_pkg_meta(meta->get_id(), version);
    if (pkg != nullptr)
    {
        on_pkg(pkg);
        return;
    }

    SQL_MASK_REPLACE(version);

    std::string statement;
    if (version.length() == 0)
        statement = "SELECT * FROM package WHERE (pkg_meta_id=:meta);";
    else
        statement = "SELECT * FROM package WHERE (version LIKE :version AND pkg_meta_id=:meta);";
    SQLite::Statement query(*m_db, statement);
    if (version.length() > 0)
        query.bind(":version", version);
    query.bind(":meta", meta->get_id());
    while (query.executeStep())
        on_pkg(new Package(meta, query));
}

Package* PackageDB::get_pkg(int pkg_id)
{
    Package* pkg = PackageManager::get_pkg(pkg_id);
    if (pkg != nullptr)
        return pkg;

    SQLite::Statement query(*m_db, "SELECT * FROM package WHERE (id=:id);");
    query.bind(":id", pkg_id);
    if (query.executeStep())
        return new Package(nullptr, query);
    else
        return nullptr;
}

Package* PackageDB::get_last_pkg(int meta_id)
{
    SQLite::Statement query(*m_db, "SELECT * FROM package WHERE (pkg_meta_id=:id);");
    query.bind(":id", meta_id);
    int last_id = 0;
    if (query.executeStep())
    {
        if (last_id < query.getColumn("id").getInt())
            last_id = query.getColumn("id").getInt();
    }
    else
        return nullptr;

    if (last_id > 0)
        return get_pkg(last_id);
    else
        return nullptr;
}

bool PackageDB::get_installed(Package *pkg)
{
    SQLite::Statement query(*m_db_inst, "SELECT * FROM installed_pkgs WHERE (pkg_id=:id);");
    query.bind(":id", pkg->get_id());
    return (query.executeStep());
}

void PackageDB::set_installed(Package *pkg)
{
    if (!get_installed(pkg))
    {
        SQLite::Statement query(*m_db_inst, "INSERT INTO installed_pkgs (pkg_id) VALUES (:id);");
        query.bind(":id", pkg->get_id());
        query.exec();
    }
}

void PackageDB::set_installed_opt(Package *pkg, ConfigurationOption *opt, EOptState state)
{
    SQLite::Statement query(*m_db_inst, "SELECT * FROM installed_pkg_opts WHERE (pkg_id=:pkg AND opt_id=:opt);");
    query.bind(":pkg", pkg->get_meta()->get_id());
    query.bind(":opt", opt->get_id());
    if (query.executeStep())
    {
        SQLite::Statement query_upd(*m_db_inst, "UPDATE installed_pkg_opts SET selected=:sel WHERE (pkg_id=:pkg AND opt_id=:opt);");
        query_upd.bind(":pkg", pkg->get_meta()->get_id());
        query_upd.bind(":opt", opt->get_id());
        query_upd.bind(":sel", (int)state);
        query_upd.exec();
    }
    else
    {
        //insert new state
        SQLite::Statement query_ins(*m_db_inst, "INSERT INTO installed_pkg_opts (pkg_id, opt_id, selected) VALUES (:pkg, :opt, :sel);");
        query_ins.bind(":pkg", pkg->get_meta()->get_id());
        query_ins.bind(":opt", opt->get_id());
        query_ins.bind(":sel", (int)state);
        query_ins.exec();
    }
}

void PackageDB::clear_installed_files(Package *pkg)
{
    SQLite::Statement query_del(*m_db_inst, "DELETE FROM installed_pkg_files WHERE (pkg_id=:pkg);");
    query_del.bind(":pkg", pkg->get_id());
    while (query_del.executeStep());
}

void PackageDB::add_installed_file(Package *pkg, std::string &file)
{
    SQLite::Statement query_ins(*m_db_inst, "INSERT INTO installed_pkg_files (pkg_id, name) VALUES (:pkg, :fn);");
    query_ins.bind(":pkg", pkg->get_id());
    query_ins.bind(":fn", file);
    query_ins.exec();
}

void PackageDB::print_posinst(PackageMeta *meta)
{
    SQLite::Statement query(*m_db, "SELECT * FROM postinst_msg WHERE (pkg_id=:id);");
    query.bind(":id", meta->get_id());
    while (query.executeStep())
        printf("%s\n", query.getColumn("msg").getText());
}

ConfigurationOption* PackageDB::get_config_opt(int opt_id)
{
    ConfigurationOption* opt = PackageManager::get_opt(opt_id);
    if (opt != nullptr)
        return opt;

    SQLite::Statement query(*m_db, "SELECT * FROM config_opts WHERE (id=:id);");
    query.bind(":id", opt_id);
    if (query.executeStep())
        return new ConfigurationOption(query);
    else
        return nullptr;
}

ConfigurationOption* PackageDB::get_config_opt(std::string &name)
{
    ConfigurationOption* opt = PackageManager::get_opt(name);
    if (opt != nullptr)
        return opt;

    SQLite::Statement query(*m_db, "SELECT * FROM config_opts WHERE (name=:name);");
    query.bind(":name", name);
    if (query.executeStep())
        return new ConfigurationOption(query);
    else
        return nullptr;
}

void PackageDB::get_set_pkgs(std::string set_name, std::function<void(std::string pkg_name)>&& on_pkg)
{
    SQLite::Statement query(*m_db, "SELECT cat.name AS cat, pm.name FROM category AS cat"
                            " INNER JOIN package_meta AS pm ON cat.id=pm.cat_id"
                            " INNER JOIN package AS pkg ON pkg.pkg_meta_id=pm.id"
                            " INNER JOIN set_pkgs AS ps ON ps.pkg_id=pkg.id"
                            " INNER JOIN sets ON sets.id=ps.set_id WHERE (sets.name=:set_name);");
    query.bind(":set_name", set_name);
    while (query.executeStep())
        on_pkg(std::string(query.getColumn("cat").getText()) + "/" + query.getColumn("name").getText());
}

void PackageDB::get_pkg_opts(Package *pkg, std::function<void(ConfigurationOption* opt, EOptState def_on)>&& on_opt)
{
    SQLite::Statement query(*m_db, "SELECT * FROM pkg_opts WHERE (pkg_id=:id);");
    query.bind(":id", pkg->get_meta()->get_id());
    while (query.executeStep())
        on_opt(get_config_opt(query.getColumn("opt_id")), (EOptState)query.getColumn("default").getInt());
}

EOptState PackageDB::get_opt_state(Package *pkg, ConfigurationOption* opt)
{
    SQLite::Statement query(*m_db_inst, "SELECT selected FROM installed_pkg_opts WHERE (pkg_id=:pkg AND opt_id=:opt);");
    query.bind(":pkg", pkg->get_meta()->get_id());
    query.bind(":opt", opt->get_id());
    if (query.executeStep())
        return (EOptState)query.getColumn("selected").getInt();
    return EOptState::OPT_UNDEF;
}

void PackageDB::get_package_deps(int pkg_id, std::function<void(int depend_by, int dep_by_opt)> &&on_new_dep)
{
    SQLite::Statement query(*m_db, "SELECT * FROM pkg_deps WHERE (pkg_id=:id);");
    query.bind(":id", pkg_id);
    while (query.executeStep())
        on_new_dep(query.getColumn("dep_by_pkg_id").getInt(), query.getColumn("dep_by_opt").getInt());
}

void PackageDB::get_pkg_urls(Package *pkg, std::function<void(std::string url)>&& on_url)
{
    SQLite::Statement query(*m_db, "SELECT src_url FROM package_sources WHERE (pkg_id=:id);");
    query.bind(":id", pkg->get_id());
    while (query.executeStep())
        on_url(query.getColumn("src_url").getText());
}

void PackageDB::get_url_details(std::string &url, int pkg_id, std::string *md5, int *file_size)
{
    SQLite::Statement query(*m_db, "SELECT * FROM package_sources WHERE (pkg_id=:pkg AND src_url=:src_url);");
    query.bind(":pkg", pkg_id);
    query.bind(":src_url", url);
    if (query.executeStep())
    {
        *md5 = query.getColumn("md5").getText();
        *file_size = query.getColumn("size").getInt();
    }
}

void PackageDB::get_pkg_prepare(Package *pkg, std::function<void(std::string dir, std::string prepare_cmd)>&& on_cmd)
{
    SQLite::Statement query(*m_db, "SELECT cmd, dir, dep_by_opt_id, opt_val_trig FROM prepare_cmds WHERE (pkg_id=:id);");
    query.bind(":id", pkg->get_id());
    while (query.executeStep())
    {
        int opt_id = query.getColumn("dep_by_opt_id").getInt();
        if ((opt_id == 0) || (pkg->check_opt(opt_id) == (EOptState)query.getColumn("opt_val_trig").getInt()))
            on_cmd(query.getColumn("dir").getText(), query.getColumn("cmd").getText());
    }
}

void PackageDB::get_pkg_configure(Package *pkg, std::function<void(std::string dir, std::string config_cmd)>&& on_cmd)
{
    SQLite::Statement query(*m_db, "SELECT cmd, dir, dep_by_opt_id, opt_val_trig FROM config_cmds WHERE (pkg_id=:id);");
    query.bind(":id", pkg->get_id());
    while (query.executeStep())
    {
        int opt_id = query.getColumn("dep_by_opt_id").getInt();
        if ((opt_id == 0) || (pkg->check_opt(opt_id) == (EOptState)query.getColumn("opt_val_trig").getInt()))
            on_cmd(query.getColumn("dir").getText(), query.getColumn("cmd").getText());
    }
}

void PackageDB::get_pkg_compile(Package *pkg, std::function<void(std::string dir, std::string make_cmd)>&& on_cmd)
{
    SQLite::Statement query(*m_db, "SELECT cmd, dir, dep_by_opt_id, opt_val_trig FROM make_cmds WHERE (pkg_id=:id);");
    query.bind(":id", pkg->get_id());
    while (query.executeStep())
    {
        int opt_id = query.getColumn("dep_by_opt_id").getInt();
        if ((opt_id == 0) || (pkg->check_opt(opt_id) == (EOptState)query.getColumn("opt_val_trig").getInt()))
            on_cmd(query.getColumn("dir").getText(), query.getColumn("cmd").getText());
    }
}

void PackageDB::get_pkg_install(Package *pkg, std::function<void(std::string dir, std::string inst_cmd)>&& on_cmd)
{
    SQLite::Statement query(*m_db, "SELECT cmd, dir, dep_by_opt_id, opt_val_trig FROM install_cmds WHERE (pkg_id=:id);");
    query.bind(":id", pkg->get_id());
    while (query.executeStep())
    {
        int opt_id = query.getColumn("dep_by_opt_id").getInt();
        if ((opt_id == 0) || (pkg->check_opt(opt_id) == (EOptState)query.getColumn("opt_val_trig").getInt()))
            on_cmd(query.getColumn("dir").getText(), query.getColumn("cmd").getText());
    }
}

void PackageDB::get_pkg_postinstall(Package *pkg, std::function<void(std::string dir, std::string postinst_cmd)>&& on_cmd)
{
    SQLite::Statement query(*m_db, "SELECT cmd, dir, dep_by_opt_id, opt_val_trig FROM postinstall_cmds WHERE (pkg_id=:id);");
    query.bind(":id", pkg->get_id());
    while (query.executeStep())
    {
        int opt_id = query.getColumn("dep_by_opt_id").getInt();
        if ((opt_id == 0) || (pkg->check_opt(opt_id) == (EOptState)query.getColumn("opt_val_trig").getInt()))
            on_cmd(query.getColumn("dir").getText(), query.getColumn("cmd").getText());
    }
}

}
