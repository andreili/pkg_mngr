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

            int get_id() { return m_id; }
            std::string get_alias() { return m_alias; }
            std::string get_on() { return m_on; }
            std::string get_off() { return m_off; }
        protected:
        private:
            int         m_id;
            std::string m_alias;
            std::string m_on;
            std::string m_off;
    };

}

#endif // CONFIGURATIONALIAS_H
