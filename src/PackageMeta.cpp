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
        m_cat =PackageManager::get_db_obj()->get_categoty_by_meta(this);
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

Package* PackageMeta::get_pkg(std::string &version)
{
    Package *pkg = PackageManager::get_pkg(m_id, version);
    if (pkg == nullptr)
        pkg = PackageManager::get_db_obj()->get_pkg(this, version);
    if (pkg == nullptr)
    {
        printf("Unable to find package \"%s/%s:%s\"!\n", m_cat->get_name().c_str(), m_name.c_str(), version.c_str());
        return nullptr;
    }
    return pkg;
}

}
