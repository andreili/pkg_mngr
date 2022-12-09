#include "ConfigurationAlias.h"
#include "PackageManager.h"

namespace package_manager
{

ConfigurationAlias::ConfigurationAlias(int id, std::string alias, std::string on, std::string off)
{
    m_id = id;
    m_alias = alias;
    m_on = on;
    m_off = off;
}

ConfigurationAlias::~ConfigurationAlias()
{
    //dtor
}

}
