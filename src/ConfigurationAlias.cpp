#include "ConfigurationAlias.h"
#include "PackageManager.h"

namespace package_manager
{

ConfigurationAlias::ConfigurationAlias(SQLite::Statement &data)
{
    m_id = data.getColumn("id");
    m_alias = data.getColumn("alias").getText();
    m_on = data.getColumn("on_value").getText();
    m_off = data.getColumn("off_value").getText();
}

ConfigurationAlias::~ConfigurationAlias()
{
    //dtor
}

}
