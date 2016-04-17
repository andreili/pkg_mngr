#ifndef CONFIGURATIONALIAS_H
#define CONFIGURATIONALIAS_H

/**
    Record in DB:
        * id
        * alias
        * on_value
        * off_value
**/

#include <SQLiteCpp.h>
#include <string>

namespace package_manager
{

    class ConfigurationAlias
    {
        public:
            ConfigurationAlias(SQLite::Statement &data);
            virtual ~ConfigurationAlias();
        protected:
        private:
            int         m_id;
            std::string m_alias;
            std::string m_on;
            std::string m_off;
    };

}

#endif // CONFIGURATIONALIAS_H
