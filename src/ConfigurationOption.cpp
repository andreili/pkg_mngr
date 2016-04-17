#include "ConfigurationOption.h"
#include "PackageManager.h"

namespace package_manager
{

ConfigurationOption::ConfigurationOption(SQLite::Statement &data)
{
    m_id = data.getColumn("id");
    m_name = data.getColumn("name").getText();
    m_name = data.getColumn("name").getText();
    m_descr = data.getColumn("descr").getText();
    m_opt = data.getColumn("opt").getText();
    PackageManager::add_opt(this);
}

ConfigurationOption::~ConfigurationOption()
{
    //dtor
}

}
