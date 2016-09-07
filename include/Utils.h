#ifndef UTILS_H
#define UTILS_H

#include <string>

#define COLOR_RESET "\x1B[0m"
#define COLOR_GREEN "\x1B[32m"

class Utils
{
public:
    static std::wstring utf8toWStr(const std::string& src);
    static std::string wstrToUtf8(const std::wstring& src);
};

#endif // UTILS_H
