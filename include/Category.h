#ifndef CATEGORY_H
#define CATEGORY_H

#include <cstring>
#include <string>
#include <functional>

namespace package_manager
{
    class Package;

    class Category
    {
        public:
            Category();
            Category(int id, std::string name);
            Category(std::wstring m_name);
            virtual ~Category();

            int get_id() { return m_id; }
            std::string get_name() { return m_name; }

            void get_pkg(std::string &pkg_name, std::string &pkg_ver, std::function<void(Package*)> &&on_pkg);

            static void get_by_name(std::string &cat_name, std::function<void(Category*)>&& on_cat);
            static Category* get_by_pkg(std::string &pkg_name);
        protected:
        private:
            int             m_id;
            std::string     m_name;
    };
}

#endif // CATEGORY_H
