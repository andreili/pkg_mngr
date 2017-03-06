#ifndef FETCH_H
#define FETCH_H

#include <thread>
#include <deque>
#include <mutex>

namespace package_manager
{

    class Package;

    class Fetch
    {
    public:
        Fetch();
        virtual ~Fetch();

        static Fetch* get_instance() { return m_instance; }

        bool is_active() { return m_fetch_active; }

        void add_to_queue(Package *pkg);
        void start_fetch();

        bool load_source(std::string &url);

        void fetch_proc();
    protected:
    private:
        static Fetch            *m_instance;

        bool                    m_fetch_active;
        bool                    m_fetch_break;
        std::deque<Package*>    m_list;
        std::thread             *m_thread;
        std::mutex              m_lock;

        bool check_source(std::string &url);
    };

}

#endif // FETCH_H
