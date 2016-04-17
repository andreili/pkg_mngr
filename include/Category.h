#ifndef CATEGORY_H
#define CATEGORY_H

#include <SQLiteCpp.h>
#include <cstring>
#include <string>

namespace package_manager
{
    class Package;

    class Category
    {
        public:
            Category();
            Category(SQLite::Statement &data);
            Category(std::wstring m_name);
            virtual ~Category();

            int get_id() { return m_id; }
            std::string get_name() { return m_name; }

            Package* get_pkg(std::string &pkg_name, std::string &pkg_ver);

            static Category* get_by_name(std::string &cat_name);
            static Category* get_by_pkg(std::string &pkg_name);
        protected:
        private:
            int             m_id;
            std::string     m_name;
    };
}

#endif // CATEGORY_H
