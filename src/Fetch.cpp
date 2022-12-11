#include <curl/curl.h>
#include <openssl/md5.h>
#include "Fetch.h"
#include "Package.h"
#include "Variables.h"
#include "PackageManager.h"
#include "stream.h"

namespace package_manager
{

Fetch* Fetch::m_instance = nullptr;

void thread_proc(Fetch *obj)
{
    obj->fetch_proc();
}

Fetch::Fetch()
    : m_fetch_active (false)
    , m_fetch_break (false)
{
    m_instance = this;

    m_thread = new std::thread(thread_proc, this);
    m_thread->detach();
}

Fetch::~Fetch()
{
    m_lock.lock();
    m_list.clear();;
    m_lock.unlock();

    m_fetch_break = true;
    while (m_fetch_active && m_fetch_break)
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
}

void Fetch::add_to_queue(Package *pkg)
{
    m_lock.lock();
    m_list.push_back(pkg);
    pkg->set_queue(true);
    m_lock.unlock();
}

void Fetch::start_fetch()
{
    m_fetch_active = true;
}

typedef void(*CURL_WRITEFUNCTION_PTR)(char*, size_t, size_t, Stream*);

bool Fetch::load_source(std::string &url, Package *pkg)
{
    if (check_source(url, pkg))
        return true;

    std::string file_name = Variables::get_instance()->parse_vars(pkg, "${PKG_SOURCES}/" +
                            url.substr(url.find_last_of('/') + 1));
    Stream *str = new Stream(file_name, FILE_OPEN_WRITE_ST);

    CURL *curl;
    CURLcode result;
    curl = curl_easy_init();
    if (curl)
    {
        std::string url_p = Variables::get_instance()->parse_vars(pkg, url);
        //printf("%s\n", url_p.c_str());
        PackageManager::debug("Start downloading URL '%s'\n", url_p.c_str());
        curl_easy_setopt(curl, CURLOPT_URL, url_p.c_str());
        auto curl_callback = [](char *data, size_t size, size_t nmemb, Stream *str)
                             {
                                 str->write(data, size * nmemb);
                             };
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, static_cast<CURL_WRITEFUNCTION_PTR>(curl_callback));
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, str);
        curl_easy_setopt(curl, CURLOPT_USERAGENT, "CURL lib");
        result = curl_easy_perform(curl);
        curl_easy_cleanup(curl);

        if (result == CURLE_OK)
        {
            if (!check_source(url, pkg))
            {
                std::string fn = Variables::get_instance()->parse_vars(pkg, "${PKG_SOURCES}/" +
                            url.substr(url.find_last_of('/') + 1));
                std::remove(fn.c_str());
                return false;
            }
            else
                return true;
        }
        else
            return false;
    }
    else
        return false;
}

void Fetch::fetch_proc()
{
    while (true)
    {
        //wait for fetch items
        while ((!m_fetch_active) || (m_list.size() == 0))
        {
            if (m_fetch_break)
            {
                m_fetch_active = false;
                return;
            }
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
        }

        size_t idx = 0;
        while (idx < m_list.size())
        {
            m_list[idx]->fetch();
            idx++;

            // exit, if fetch aborted
            if (m_fetch_break)
            {
                m_fetch_active = false;
                return;
            }
        }

        m_lock.lock();
        bool all_loaded = true;
        for (Package *pkg : m_list)
            if (!pkg->is_fetched())
                all_loaded = false;
        // clear fetch queue, if all packages loaded
        if (all_loaded)
        {
            m_fetch_active = false;
            m_list.clear();
        }
        m_lock.unlock();
    }

}

#define MD5_CHAIN_SIZE 10 * 1024 * 1024

bool Fetch::check_source(std::string &url, Package *pkg)
{
    unsigned char md5[MD5_DIGEST_LENGTH];
    MD5_CTX md5_ctx;
    int64_t original_size;
    std::string original_md5;
    std::string file_name = Variables::get_instance()->parse_vars(pkg, "${PKG_SOURCES}/" +
                            url.substr(url.find_last_of('/') + 1));

    PackageManager::get_db_obj()->get_url_details(url, pkg->get_id(), &original_md5, &original_size);

    //printf("Check package to %s\n", file_name.c_str());
    Stream *str = new Stream(file_name, FILE_OPEN_READ_ST);
    if (!str->opened())
    {
        delete str;
        printf("File don't exist\n");
        return false;
    }

    if (str->getSize() != original_size)
    {
        printf("Size don't matched (expected: %li != %li) [%s]\n", original_size, str->getSize(), file_name.c_str());
        delete str;
        return false;
    }

    MD5_Init(&md5_ctx);
    uint8_t *buf = new uint8_t[MD5_CHAIN_SIZE];
    while (!str->atEnd())
    {
        StreamSize readed = str->read(buf, MD5_CHAIN_SIZE);
        MD5_Update(&md5_ctx, buf, readed);
    }
    delete buf;
    delete str;
    MD5_Final(md5, &md5_ctx);

    char md5_ch[36];
    for(int i = 0; i < 16; ++i)
        sprintf(md5_ch+i*2, "%02x", md5[i]);
    if (original_md5.compare(md5_ch) != 0)
    {
        printf("MD5 don't matched (expected: %s != %s) [%s]\n", original_md5.c_str(), md5_ch, file_name.c_str());
        return false;
    }
    return true;
}

}
