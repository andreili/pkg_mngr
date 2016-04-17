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
    static void list_files(std::string path, std::function<void(const std::string &name, bool is_dir)>&& on_entry);
protected:
private:
};

}

#endif // FILESYSTEM_H
