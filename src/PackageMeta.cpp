#include "PackageMeta.h"
#include "PackageManager.h"

namespace package_manager
{

PackageMeta::PackageMeta(Category *cat, SQLite::Statement &data)
{
    m_cat = cat;
    m_id = data.getColumn("id");
    m_name = data.getColumn("name").getText();
    if (m_cat == nullptr)
        m_cat =PackageManager::get_db_obj()->get_category_by_meta(this);
    PackageManager::add_meta(this);
}

PackageMeta::PackageMeta(Category *cat)
    : m_cat (cat)
{
    //ctor
}

PackageMeta::~PackageMeta()
{
    //dtor
}

void PackageMeta::get_pkg(std::string &version, std::function<void(Package*)> &&on_pkg)
{
    on_pkg(PackageManager::get_pkg_meta(m_id, version));
    PackageManager::get_db_obj()->get_pkg(this, version, [&on_pkg](Package* pkg)
    {
        on_pkg(pkg);
    });
}

}
