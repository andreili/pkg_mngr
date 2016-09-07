#ifndef CMDLINEPARSER_H
#define CMDLINEPARSER_H

#include <vector>
#include <string>

/**
 * @brief Перечисление типов параметров командной строки
 */
enum class EParamType
{
    STRING,
    WIDE_STRING,
    BOOLEAN,
    INT,
};

typedef struct
{
    EParamType      type;
    std::wstring    name;
    std::wstring    name_short;
    std::wstring    desc;
    std::string*    val_str;
    std::wstring*   val_wstr;
    bool*           val_bool;
    int*            val_int;
} param_rec_t;

/**
 * @brief Класс для работы с параметрами командной строки
 */
class CmdlineParser
{
public:
    CmdlineParser(int argc, char** argv);
    virtual ~CmdlineParser();
    static CmdlineParser* get_instance() { return m_instance; }

    static void add_string_param(const std::wstring &name, std::string* val, const std::string &val_def, const std::wstring &desc);
    static void add_wstring_param(const std::wstring &name, std::wstring* val, const std::wstring &val_def, const std::wstring &desc);
    static void add_bool_param(const std::wstring &name, const std::wstring &name_short, bool* val, const bool &val_def, const std::wstring &desc);
    static void add_int_param(const std::wstring &name, int* val, const int &val_def, const std::wstring &desc);

    static void set_name(std::wstring name) { m_instance->m_name = name; }
    static void show_desc();
    static void parse();
protected:
private:
    static CmdlineParser*       m_instance;
    int                         m_argc;
    std::wstring                m_name;
    std::vector<std::wstring>   m_argv;
    std::vector<param_rec_t>    m_params;
};

#endif // CMDLINEPARSER_H
