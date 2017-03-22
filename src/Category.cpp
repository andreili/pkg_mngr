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

void Category::get_pkg(std::string &pkg_name, std::string &pkg_ver, std::function<void(Package*)>&& on_pkg)
{
    PackageManager::get_db_obj()->get_package_meta(this, pkg_name, [&on_pkg, &pkg_ver](PackageMeta* meta)
    {
        if (meta != nullptr)
            meta->get_pkg(pkg_ver, [&on_pkg](Package* pkg)
            {
                on_pkg(pkg);
            });
    });
}

void Category::get_by_name(std::string &cat_name, std::function<void(Category*)>&& on_cat)
{
    on_cat(PackageManager::get_cat(cat_name));
    PackageManager::get_db_obj()->get_category(cat_name, [&on_cat](Category* cat)
    {
        on_cat(cat);
    });
}

Category* Category::get_by_pkg(std::string &pkg_name)
{
    return PackageManager::get_db_obj()->get_category_by_pkg(pkg_name);
}

}
