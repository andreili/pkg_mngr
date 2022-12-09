#ifndef PACKAGEMETA_H
#define PACKAGEMETA_H

#include "Category.h"

namespace package_manager
{
    class Package;

    class PackageMeta
    {
        public:
            PackageMeta(Category *cat, int id, std::string name);
            PackageMeta(Category *cat);
            virtual ~PackageMeta();

            int get_id() { return m_id; }
            int get_cat_id() { return m_cat->get_id(); }
            std::string get_name() { return m_name; }
            Category* get_cat() { return m_cat; }

            void get_pkg(std::string &version, std::function<void(Package*)>&& on_pkg);
        protected:
        private:
            Category        *m_cat;
            int             m_id;
            std::string     m_name;
    };

}

#endif // PACKAGEMETA_H
