#include "FileSystem.h"
#include <sys/stat.h>
#include <dirent.h>

namespace package_manager
{

FileSystem::FileSystem()
{
    //ctor
}

FileSystem::~FileSystem()
{
    //dtor
}

static int do_mkdir(const std::string path, mode_t mode)
{
    struct stat st;
    int status = 0;

    if (stat(path.c_str(), &st) != 0)
    {
        /* Directory does not exist. EEXIST for race condition */
#ifdef _WIN32
        if (mkdir(path.c_str()) != 0 && errno != EEXIST)
#else
        if (mkdir(path.c_str(), mode) != 0 && errno != EEXIST)
#endif
            status = 0;
    }
    else if (!S_ISDIR(st.st_mode))
    {
        errno = ENOTDIR;
        status = -1;
    }

    return(status);
}

/**
** mkpath - ensure all directories in path exist
** Algorithm takes the pessimistic view and works top-down to ensure
** each directory in path exists, rather than optimistically creating
** the last element and working backwards.
*/
int FileSystem::mkpath(const std::string path, mode_t mode)
{
    int status = 0;
    size_t pos = 0, newPos;

    while (status == 0 && (newPos = path.find_first_of('/', pos)) != std::wstring::npos)
    {
        status = do_mkdir(path.substr(0, newPos), mode);
        pos = newPos + 1;
    }
    if (status == 0)
        status = do_mkdir(path, mode);
    return status;
}

void FileSystem::list_files(std::string path, bool recursion, std::function<void(std::string, bool)>&& on_entry)
{
    DIR *dir;
    struct dirent *ent;
    struct stat st;
    if ((dir = opendir (path.c_str())) != NULL)
    {
        while ((ent = readdir(dir)) != NULL)
        {
            std::string full_file_name = path + "/" + ent->d_name;
            if (stat(full_file_name.c_str(), &st) == -1)
                continue;
            if (ent->d_name[0] != '.')
            {
                on_entry(full_file_name, (st.st_mode & S_IFDIR));
                if ((st.st_mode & S_IFDIR) && recursion)
                    list_files(full_file_name, true, [&on_entry](std::string name, bool is_dir)
                    {
                        on_entry(name, is_dir);
                    });
            }
        }
        closedir (dir);
    }
}

bool FileSystem::is_exist(std::string path)
{
    struct stat st;
    return (stat(path.c_str(), &st) != -1);
}

}
