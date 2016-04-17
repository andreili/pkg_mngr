#include "Category.h"
#include "PackageManager.h"
#include "PackageMeta.h"
#include "PackageDB.h"
#include "Package.h"

namespace package_manager
{

Category::Category()
{
    //ctor
}

Category::Category(SQLite::Statement &data)
{
    m_id = data.getColumn("id");
    m_name = data.getColumn("name").getText();
    PackageManager::add_cat(this);
}

Category::~Category()
{
    //dtor
}

Package* Category::get_pkg(std::string &pkg_name, std::string &pkg_ver)
{
    PackageMeta *meta = PackageManager::get_db_obj()->get_package_meta(this, pkg_name);
    if (meta == nullptr)
    {
        printf("Unable to find package \"%s/%s\"!\n", m_name.c_str(), pkg_name.c_str());
        return nullptr;
    }
    Package *ret = meta->get_pkg(pkg_ver);
    return ret;
}

Category* Category::get_by_name(std::string &cat_name)
{
    Category *cat = PackageManager::get_cat(cat_name);
    if (cat == nullptr)
        cat = PackageManager::get_db_obj()->get_categoty(cat_name);
    return cat;
}

Category* Category::get_by_pkg(std::string &pkg_name)
{
    return PackageManager::get_db_obj()->get_categoty_by_pkg(pkg_name);
}

}
