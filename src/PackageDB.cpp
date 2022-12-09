#include "PackageDB.h"
#include <sqlite/execute.hpp>
#include <sqlite/query.hpp>
#include <sqlite/result.hpp>
#include <sqlite/database_exception.hpp>
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
        m_db = new sqlite::connection(path + ".sql3", sqlite::open_mode::open_existing);
    }
    catch (sqlite::database_exception& e)
    {
    }

    try
    {
        m_db_inst = new sqlite::connection(path + "_installed.sql3", sqlite::open_mode::open_existing);
    }
    catch (sqlite::database_exception& e)
    {
        m_db_inst = new sqlite::connection(path + "_installed.sql3", sqlite::open_mode::open_or_create);
        sqlite::execute(*m_db_inst, "CREATE TABLE installed_pkg_files (id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "pkg_id INTEGER, name TEXT);")();
        sqlite::execute(*m_db_inst, "CREATE TABLE installed_pkg_opts (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER"
            ", opt_id INTEGER, selected INTEGER);")();
        sqlite::execute(*m_db_inst, "CREATE TABLE installed_pkgs (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER);")();
    }

    sqlite::execute(*m_db_inst, "PRAGMA synchronous = OFF;")();
    sqlite::execute(*m_db_inst, "PRAGMA journal_mode = MEMORY;")();
}

PackageDB::~PackageDB()
{
    delete m_db;
}

void PackageDB::fill_aliases()
{
    sqlite::query query(*m_db, "SELECT id,alias,on_value,off_value FROM config_aliases;");
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    while (res->get_int(0) > 0)
    {
        PackageManager::add_alias(new ConfigurationAlias(res->get_int(0), res->get_string(1),
            res->get_string(2), res->get_string(3)));
        res->next_row();
    }
}

void PackageDB::transaction_start()
{
    sqlite::execute(*m_db_inst, "BEGIN TRANSACTION;")();
}

void PackageDB::transaction_commit()
{
    try
    {
        sqlite::execute(*m_db_inst, "END TRANSACTION;")();
    }
    catch (sqlite::database_exception& e)
    {
        // Never throw an exception in a destructor
        (void)e; // warning proof
        //SQLITECPP_ASSERT(false, e.what());  // See SQLITECPP_ENABLE_ASSERT_HANDLER
    }
}

void PackageDB::transaction_rollback()
{
    sqlite::execute(*m_db_inst, "ROLLBACK;")();
}

void PackageDB::get_category(std::string &name, std::function<void(Category*)>&& on_cat)
{
    SQL_MASK_REPLACE(name);
    sqlite::query query(*m_db, "SELECT id,name FROM category WHERE (name LIKE :name COLLATE NOCASE);");
    query % name;
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    while (res->get_int(0) > 0)
    {
        on_cat(new Category(res->get_int(0), res->get_string(1)));
        res->next_row();
    }
}

Category* PackageDB::get_category_by_pkg(std::string &name)
{
    SQL_MASK_REPLACE(name);
    sqlite::query query(*m_db, "SELECT cat_id FROM package_meta WHERE (name=:name COLLATE NOCASE);");
    query % name;
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    if (res->get_int(0) > 0)
    {
        return get_category(res->get_int(0));
    }
    else
        return nullptr;
}

Category* PackageDB::get_category_by_meta(PackageMeta *meta)
{
    sqlite::query query(*m_db, "SELECT cat_id FROM package_meta WHERE (id=:id);");
    query % meta->get_id();
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    if (res->get_int(0) > 0)
        return get_category(res->get_int(0));
    else
        return nullptr;
}

Category* PackageDB::get_category(int cat_id)
{
    Category* cat = PackageManager::get_cat(cat_id);
    if (cat != nullptr)
        return cat;

    sqlite::query query(*m_db, "SELECT id,name FROM category WHERE (id=:id);");
    query % cat_id;
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    if (res->get_int(0) > 0)
        return new Category(res->get_int(0), res->get_string(1));
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

    sqlite::query query(*m_db, "SELECT id,name FROM package_meta WHERE (name LIKE :name COLLATE NOCASE AND cat_id=:cat);");
    query % name % cat->get_id();
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    while (res->get_int(0))
    {
        meta = PackageManager::get_meta(cat->get_id(), res->get_string(1));
        if (meta != nullptr)
            on_meta(meta);
        else
            on_meta(new PackageMeta(cat, res->get_int(0), res->get_string(1)));
        res->next_row();
    }
}

PackageMeta* PackageDB::get_package_meta(int meta_id)
{
    PackageMeta* meta = PackageManager::get_meta(meta_id);
    if (meta != nullptr)
        return meta;

    try
    {
        sqlite::query query(*m_db, "SELECT id,name FROM package_meta WHERE (id=:id);");
        query % meta_id;
        query.emit();
        boost::shared_ptr<sqlite::result> res = query.get_result();
        if (res->get_int(0) > 0)
            return new PackageMeta(nullptr, res->get_int(0), res->get_string(1));
        else
            return nullptr;
    }
    catch (sqlite::database_exception& e)
    {
        printf("Exception at #%i: %s\n", __LINE__, e.what());
        return nullptr;
    }
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
        statement = "SELECT pkg_meta_id,id,version,source_name FROM package WHERE (pkg_meta_id=:meta);";
    else
        statement = "SELECT pkg_meta_id,id,version,source_name FROM package WHERE (version LIKE :version AND pkg_meta_id=:meta);";
    try
    {
        sqlite::query query(*m_db, statement);
        if (version.length() > 0)
            query % version % meta->get_id();
        else
            query % meta->get_id();
        query.emit();
        boost::shared_ptr<sqlite::result> res = query.get_result();
        if (res->get_int(0) > 0)
        {
            do
            {
                on_pkg(new Package(meta, res->get_int(0), res->get_int(1), res->get_string(2), res->get_string(3)));
            } while (res->next_row());
        }
    }
    catch (sqlite::database_exception& e)
    {
        printf("Exception at #%i: %s <%s>\n", __LINE__, e.what(), version.c_str());
    }
}

Package* PackageDB::get_pkg(int pkg_id)
{
    Package* pkg = PackageManager::get_pkg(pkg_id);
    if (pkg != nullptr)
        return pkg;

    try
    {
        sqlite::query query(*m_db, "SELECT pkg_meta_id,id,version,source_name FROM package WHERE (id=:id);");
        query % pkg_id;
        query.emit();
        boost::shared_ptr<sqlite::result> res = query.get_result();
        if (res->get_int(0) > 0)
            return new Package(nullptr, res->get_int(0), res->get_int(1), res->get_string(2), res->get_string(3));
        else
            return nullptr;
    }
    catch (sqlite::database_exception& e)
    {
        printf("Exception at #%i: %s\n", __LINE__, e.what());
        return nullptr;
    }
}

Package* PackageDB::get_last_pkg(int meta_id)
{
    int last_id = 0;

    try
    {
        sqlite::query query(*m_db, "SELECT pkg_meta_id,id,version,source_name FROM package WHERE (pkg_meta_id=:id);");
        query % meta_id;
        query.emit();
        boost::shared_ptr<sqlite::result> res = query.get_result();
        if (res->get_int(0) > 0)
        {
            if (last_id < res->get_int(1))
                last_id = res->get_int(1);
        }
        else
            return nullptr;
    }
    catch (sqlite::database_exception& e)
    {
        printf("Exception at #%i: %s\n", __LINE__, e.what());
    }

    if (last_id > 0)
        return get_pkg(last_id);
    else
        return nullptr;
}

bool PackageDB::get_installed(Package *pkg)
{
    sqlite::query query(*m_db_inst, "SELECT id FROM installed_pkgs WHERE (pkg_id=:id);");
    query % pkg->get_id();
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    return (res->get_int(0) > 0);
}

void PackageDB::set_installed(Package *pkg)
{
    if (!get_installed(pkg))
    {
        sqlite::query query(*m_db_inst, "INSERT INTO installed_pkgs (pkg_id) VALUES (:id);");
        query % pkg->get_id();
        query();
    }
}

void PackageDB::set_installed_opt(Package *pkg, ConfigurationOption *opt, EOptState state)
{
    sqlite::query query(*m_db_inst, "SELECT id FROM installed_pkg_opts WHERE (pkg_id=:pkg AND opt_id=:opt);");
    query % pkg->get_meta()->get_id() % opt->get_id();
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    if (res->get_int(0) > 0)
    {
        sqlite::query query_upd(*m_db_inst, "UPDATE installed_pkg_opts SET selected=:sel WHERE (pkg_id=:pkg AND opt_id=:opt);");
        query_upd % pkg->get_meta()->get_id() % opt->get_id() % (int)state;
        query_upd();
    }
    else
    {
        //insert new state
        sqlite::query query_ins(*m_db_inst, "INSERT INTO installed_pkg_opts (pkg_id, opt_id, selected) VALUES (:pkg, :opt, :sel);");
        query_ins % pkg->get_meta()->get_id() % opt->get_id() % (int)state;
        query_ins();
    }
}

void PackageDB::clear_installed_files(Package *pkg)
{
    sqlite::query query(*m_db_inst, "DELETE FROM installed_pkg_files WHERE (pkg_id=:pkg);");
    query % pkg->get_id();
    query();
}

void PackageDB::add_installed_file(Package *pkg, std::string &file)
{
    sqlite::query query(*m_db_inst, "INSERT INTO installed_pkg_files (pkg_id, name) VALUES (:pkg, :fn);");
    query % pkg->get_id() % file;
    query();
}

void PackageDB::print_posinst(PackageMeta *meta)
{
    sqlite::query query(*m_db, "SELECT msg FROM postinst_msg WHERE (pkg_id=:id);");
    query % meta->get_id();
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    if (res->get_int(0) > 0)
    {
        do
        {
            printf("%s\n", res->get_string(0).c_str());
        } while (res->next_row());
    }
}

ConfigurationOption* PackageDB::get_config_opt(int opt_id)
{
    try
    {
        ConfigurationOption* opt = PackageManager::get_opt(opt_id);
        if (opt != nullptr)
            return opt;

        sqlite::query query(*m_db, "SELECT id,name,descr FROM config_opts WHERE (id=:id);");
        query % opt_id;
        query.emit();
        boost::shared_ptr<sqlite::result> res = query.get_result();
        if (res->get_int(0) > 0)
            return new ConfigurationOption(res->get_int(0), res->get_string(1), res->get_string(2));
        else
            return nullptr;
    }
    catch (sqlite::database_exception& e)
    {
        printf("Exception at #%i: %s\n", __LINE__, e.what());
        return nullptr;
    }
}

ConfigurationOption* PackageDB::get_config_opt(std::string &name)
{
    try
    {
        ConfigurationOption* opt = PackageManager::get_opt(name);
        if (opt != nullptr)
            return opt;

        sqlite::query query(*m_db, "SELECT id,name,descr FROM config_opts WHERE (name=:name);");
        query % name;
        query.emit();
        boost::shared_ptr<sqlite::result> res = query.get_result();
        if (res->get_int(0) > 0)
            return new ConfigurationOption(res->get_int(0), res->get_string(1), res->get_string(2));
        else
            return nullptr;
    }
    catch (sqlite::database_exception& e)
    {
        printf("Exception at #%i: %s\n", __LINE__, e.what());
        return nullptr;
    }
}

void PackageDB::get_set_pkgs(std::string set_name, std::function<void(std::string pkg_name)>&& on_pkg)
{
    sqlite::query query(*m_db, "SELECT cat.name AS cat, pm.name FROM category AS cat"
                            " INNER JOIN package_meta AS pm ON cat.id=pm.cat_id"
                            " INNER JOIN package AS pkg ON pkg.pkg_meta_id=pm.id"
                            " INNER JOIN set_pkgs AS ps ON ps.pkg_id=pkg.id"
                            " INNER JOIN sets ON sets.id=ps.set_id WHERE (sets.name=:set_name);");
    query % set_name;
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    if (res->get_int(0) > 0)
    {
        do
        {
            on_pkg(res->get_string(0) + "/" + res->get_string(1));
        } while (res->next_row());
    }
}

void PackageDB::get_pkg_opts(Package *pkg, std::function<void(ConfigurationOption* opt, EOptState def_on)>&& on_opt)
{
    try
    {
        sqlite::query query(*m_db, "SELECT id,opt_id,default_value FROM pkg_opts WHERE (pkg_id=:id);");
        query % pkg->get_meta()->get_id();
        query.emit();
        boost::shared_ptr<sqlite::result> res = query.get_result();
        if (res->get_int(0) > 0)
        {
            do
            {
                on_opt(get_config_opt(res->get_int(1)), (EOptState)res->get_int(2));
            } while (res->next_row());
        }
    }
    catch (sqlite::database_exception& e)
    {
        printf("Exception at #%i: %s\n", __LINE__, e.what());
    }
}

EOptState PackageDB::get_opt_state(Package *pkg, ConfigurationOption* opt)
{
    try
    {
        sqlite::query query(*m_db_inst, "SELECT selected FROM installed_pkg_opts WHERE (pkg_id=:pkg AND opt_id=:opt);");
        query % pkg->get_meta()->get_id() % opt->get_id();
        query.emit();
        boost::shared_ptr<sqlite::result> res = query.get_result();
        if (res->get_int(0) > 0)
            return (EOptState)res->get_int(0);
        return EOptState::OPT_UNDEF;
    }
    catch (sqlite::database_exception& e)
    {
        printf("Exception at #%i: %s\n", __LINE__, e.what());
    }
}

void PackageDB::get_package_deps(int pkg_id, std::function<void(int depend_by, int dep_by_opt)> &&on_new_dep)
{
    try
    {
        sqlite::query query(*m_db, "SELECT dep_by_pkg_id,dep_by_opt FROM pkg_deps WHERE (pkg_id=:id);");
        query % pkg_id;
        query.emit();
        boost::shared_ptr<sqlite::result> res = query.get_result();
        if (res->get_int(0) > 0)
        {
            do
            {
                on_new_dep(res->get_int(0), res->get_int(1));
            } while (res->next_row());
        }
    }
    catch (sqlite::database_exception& e)
    {
        printf("Exception at #%i: %s\n", __LINE__, e.what());
    }
}

void PackageDB::get_pkg_urls(Package *pkg, std::function<void(std::string url)>&& on_url)
{
    try
    {
        sqlite::query query(*m_db, "SELECT src_url FROM package_sources WHERE (pkg_id=:id);");
        query % pkg->get_id();
        query.emit();
        boost::shared_ptr<sqlite::result> res = query.get_result();
        if (res->get_int(0) > 0)
        {
            do
            {
                on_url(res->get_string(0));
            } while (res->next_row());
        }
    }
    catch (sqlite::database_exception& e)
    {
        printf("Exception at #%i: %s\n", __LINE__, e.what());
    }
}

void PackageDB::get_url_details(std::string &url, int pkg_id, std::string *md5, int64_t *file_size)
{
    try
    {
        sqlite::query query(*m_db, "SELECT md5,size FROM package_sources WHERE (pkg_id=:pkg AND src_url=:src_url);");
        query % pkg_id % url;
        query.emit();
        boost::shared_ptr<sqlite::result> res = query.get_result();
        if (res->get_int(0) > 0)
        {
            *md5 = res->get_string(0);
            *file_size = res->get_int64(1);
        }
    }
    catch (sqlite::database_exception& e)
    {
        printf("Exception at #%i: %s\n", __LINE__, e.what());
    }
}

void PackageDB::get_pkg_prepare(Package *pkg, std::function<void(std::string dir, std::string prepare_cmd)>&& on_cmd)
{
    sqlite::query query(*m_db, "SELECT cmd,dir,dep_by_opt_id,opt_val_trig FROM prepare_cmds WHERE (pkg_id=:id);");
    query % pkg->get_id();
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    if (res->get_int(0) > 0)
    {
        do
        {
            int opt_id = res->get_int(2);
            if ((opt_id == 0) || (pkg->check_opt(opt_id) == (EOptState)res->get_int(3)))
                on_cmd(res->get_string(1), res->get_string(0));
        } while (res->next_row());
    }
}

void PackageDB::get_pkg_configure(Package *pkg, std::function<void(std::string dir, std::string config_cmd)>&& on_cmd)
{
    sqlite::query query(*m_db, "SELECT cmd,dir,dep_by_opt_id,opt_val_trig FROM config_cmds WHERE (pkg_id=:id);");
    query % pkg->get_id();
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    if (res->get_int(0) > 0)
    {
        do
        {
            int opt_id = res->get_int(2);
            if ((opt_id == 0) || (pkg->check_opt(opt_id) == (EOptState)res->get_int(3)))
                on_cmd(res->get_string(1), res->get_string(0));
        } while (res->next_row());
    }
}

void PackageDB::get_pkg_compile(Package *pkg, std::function<void(std::string dir, std::string make_cmd)>&& on_cmd)
{
    sqlite::query query(*m_db, "SELECT cmd,dir,dep_by_opt_id,opt_val_trig FROM make_cmds WHERE (pkg_id=:id);");
    query % pkg->get_id();
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    if (res->get_int(0) > 0)
    {
        do
        {
            int opt_id = res->get_int(2);
            if ((opt_id == 0) || (pkg->check_opt(opt_id) == (EOptState)res->get_int(3)))
                on_cmd(res->get_string(1), res->get_string(0));
        } while (res->next_row());
    }
}

void PackageDB::get_pkg_install(Package *pkg, std::function<void(std::string dir, std::string inst_cmd)>&& on_cmd)
{
    sqlite::query query(*m_db, "SELECT cmd,dir,dep_by_opt_id,opt_val_trig FROM install_cmds WHERE (pkg_id=:id);");
    query % pkg->get_id();
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    if (res->get_int(0) > 0)
    {
        do
        {
            int opt_id = res->get_int(2);
            if ((opt_id == 0) || (pkg->check_opt(opt_id) == (EOptState)res->get_int(3)))
                on_cmd(res->get_string(1), res->get_string(0));
        } while (res->next_row());
    }
}

void PackageDB::get_pkg_postinstall(Package *pkg, std::function<void(std::string dir, std::string postinst_cmd)>&& on_cmd)
{
    sqlite::query query(*m_db, "SELECT cmd,dir,dep_by_opt_id,opt_val_trig FROM postinstall_cmds WHERE (pkg_id=:id);");
    query % pkg->get_id();
    query.emit();
    boost::shared_ptr<sqlite::result> res = query.get_result();
    if (res->get_int(0) > 0)
    {
        do
        {
            int opt_id = res->get_int(2);
            if ((opt_id == 0) || (pkg->check_opt(opt_id) == (EOptState)res->get_int(3)))
                on_cmd(res->get_string(1), res->get_string(0));
        } while (res->next_row());
    }
}

}
