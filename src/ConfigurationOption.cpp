#include "ConfigurationOption.h"
#include "PackageManager.h"

namespace package_manager
{

ConfigurationOption::ConfigurationOption(int id, std::string name, std::string descr)
{
    m_id = id;
    m_name = name;
    m_descr = descr;
    PackageManager::add_opt(this);
}

ConfigurationOption::~ConfigurationOption()
{
    //dtor
}

}
