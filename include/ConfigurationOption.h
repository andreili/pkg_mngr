#ifndef CONFIGURATIONOPTION_H
#define CONFIGURATIONOPTION_H

/**
    Record in DB:
        * id
        * name
        * descr
        * opt - option with aliases (samples: --$endis$-nptl {--enable-ntpl,--disable-ntlp}
                                              --$witho$-nss  {--within-nss,--without-nss})
**/

#include "ConfigurationAlias.h"

namespace package_manager
{
    enum class EOptState
    {
        OPT_UNDEF = 0,
        OPT_SET = 1,
        OPT_CLEAR = 2,
    };

    class ConfigurationOption
    {
        public:
            ConfigurationOption(int id, std::string name, std::string descr);
            virtual ~ConfigurationOption();

            int get_id() { return m_id; }
            std::string get_name() { return m_name; }
        protected:
        private:
            int                 m_id;
            std::string         m_name;
            std::string         m_descr;
            ConfigurationAlias  *m_alias;

    };

}

#endif // CONFIGURATIONOPTION_H
