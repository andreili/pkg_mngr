#ifndef CONFIGURATIONALIAS_H
#define CONFIGURATIONALIAS_H

/**
    Record in DB:
        * id
        * alias
        * on_value
        * off_value
**/

#include <string>

namespace package_manager
{

    class ConfigurationAlias
    {
        public:
            ConfigurationAlias(int id, std::string alias, std::string on, std::string off);
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
