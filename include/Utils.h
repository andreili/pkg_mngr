#ifndef UTILS_H
#define UTILS_H

#include <string>
#include <deque>

#define COLOR_RESET "\x1B[0m"
#define BOLD_ON "\x1b[1m"
#define BOLD_OFF "\x1b[21m"
#define COLOR_YELLOW "\x1B[33m"
#define COLOR_GREEN "\x1B[32m"
#define COLOR_RED "\x1B[31m"

class Utils
{
public:
    static std::wstring utf8toWStr(const std::string& src);
    static std::string wstrToUtf8(const std::wstring& src);
    static void parse_str(const std::string &str, std::string delimiters, std::deque<std::string> &lst);
    static std::string run_cmd(const std::string dir, const std::string cmd);
    static std::string replace_str(std::string str, std::string from, std::string to);
};

#endif // UTILS_H
