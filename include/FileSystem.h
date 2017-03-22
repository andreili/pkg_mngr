#ifndef FILESYSTEM_H
#define FILESYSTEM_H

#include <functional>

namespace package_manager
{

class FileSystem
{
public:
    FileSystem();
    virtual ~FileSystem();

    static int mkpath(const std::string path, mode_t mode);
    static void list_files(std::string path, bool recursion, std::function<void(std::string, bool)>&& on_entry);
    static bool is_exist(std::string path);
protected:
private:
};

}

#endif // FILESYSTEM_H
