#include "Utils.h"

/**
 * @brief Конвертирование строки UTF-8 -> WideString
 * @param src Исходная строка в UTF-8
 * @return Строка в Wide-Char
 */
std::wstring Utils::utf8toWStr(const std::string& src)
{
    std::wstring dest;
    dest.clear();
    wchar_t w = 0;
    int bytes = 0;
    wchar_t err = L'�';
    for (size_t i = 0; i < src.size(); i++){
        unsigned char c = (unsigned char)src[i];
        if (c <= 0x7f){//first byte
            if (bytes){
                dest.push_back(err);
                bytes = 0;
            }
            dest.push_back((wchar_t)c);
        }
        else if (c <= 0xbf){//second/third/etc byte
            if (bytes){
                w = ((w << 6)|(c & 0x3f));
                bytes--;
                if (bytes == 0)
                    dest.push_back(w);
            }
            else
                dest.push_back(err);
        }
        else if (c <= 0xdf){//2byte sequence start
            bytes = 1;
            w = c & 0x1f;
        }
        else if (c <= 0xef){//3byte sequence start
            bytes = 2;
            w = c & 0x0f;
        }
        else if (c <= 0xf7){//3byte sequence start
            bytes = 3;
            w = c & 0x07;
        }
        else{
            dest.push_back(err);
            bytes = 0;
        }
    }
    if (bytes)
        dest.push_back(err);
    return dest;
}

#define WCHAR_SIZE_4() (sizeof(wchar_t) == 4)
#define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))

/**
 * @brief Конвертирование строки WideString -> UTF-8
 * @param src Исходная строка в Wide-Char
 * @return Строка в UTF-8
 */
std::string Utils::wstrToUtf8(const std::wstring& src)
{
    std::string dest;
    dest.clear();
    for (size_t i = 0; i < src.size(); i++){
        wchar_t w = src[i];
        if (w <= 0x7f)
            dest.push_back((char)w);
        else if (w <= 0x7ff)
        {
            dest.push_back(0xc0 | ((w >> 6)& 0x1f));
            dest.push_back(0x80| (w & 0x3f));
        }
#if __WCHAR_MAX__ > 0xffff
        else if (w <= 0xffff)
#else
        else
#endif
        {
            dest.push_back(0xe0 | ((w >> 12)& 0x0f));
            dest.push_back(0x80| ((w >> 6) & 0x3f));
            dest.push_back(0x80| (w & 0x3f));
        }
#if __WCHAR_MAX__ > 0xffff
        else if (w <= 0x10ffff)
        {
            dest.push_back(0xf0 | ((w >> 18)& 0x07));
            dest.push_back(0x80| ((w >> 12) & 0x3f));
            dest.push_back(0x80| ((w >> 6) & 0x3f));
            dest.push_back(0x80| (w & 0x3f));
        }
        else
            dest.push_back('?');
#endif
    }
    return dest;
}