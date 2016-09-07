#ifndef UTILS_H
#define UTILS_H

#include <string>

#define COLOR_RESET "\x1B[0m"
#define BOLD_ON "\x1b[1m"
#define BOLD_OFF "\x1b[21m"
#define COLOR_GREEN "\x1B[32m"
#define COLOR_RED "\x1B[31m"

class Utils
{
public:
    static std::wstring utf8toWStr(const std::string& src);
    static std::string wstrToUtf8(const std::wstring& src);
};

#endif // UTILS_H
