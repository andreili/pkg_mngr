#include "CmdlineParser.h"
#include "Utils.h"
//#include "../types.h"
#include <string>

CmdlineParser* CmdlineParser::m_instance = nullptr;

/**
 * @brief CmdlineParser::CmdlineParser
 * @param argc Количество параметров командной строки
 * @param argv Массив параметров командной строки
 */
CmdlineParser::CmdlineParser(int argc, char** argv)
{
    m_instance = this;

    m_argc = argc;
    m_argv.resize(m_argc);
    for (int i=0 ; i<m_argc ; i++)
        m_argv[i] = Utils::utf8toWStr(argv[i]);
}

CmdlineParser::~CmdlineParser()
{
    //dtor
}

/**
 * @brief Добавление строкового параметра
 * @param name Имя параметра (его идентификатор)
 * @param val Указатель на значение параметра
 * @param val_def Значение по умолчанию
 * @param desc Описание параметра
 */
void CmdlineParser::add_string_param(const std::wstring &name, std::string* val, const std::string &val_def, const std::wstring &desc)
{
    *val = val_def;
    m_instance->m_params.push_back({type: EParamType::STRING,
                                    name: name,
                                    name_short: L"",
                                    desc: desc,
                                    val_str: val,
                                    val_wstr: nullptr,
                                    val_bool: nullptr,
                                    val_int: nullptr});
}

/**
 * @brief Добавление Unicode-строкового параметра
 * @param name Имя параметра (его идентификатор)
 * @param val Указатель на значение параметра
 * @param val_def Значение по умолчанию
 * @param desc Описание параметра
 */
void CmdlineParser::add_wstring_param(const std::wstring &name, std::wstring* val, const std::wstring &val_def, const std::wstring &desc)
{
    *val = val_def;
    m_instance->m_params.push_back({type: EParamType::WIDE_STRING,
                                    name: name,
                                    name_short: L"",
                                    desc: desc,
                                    val_str: nullptr,
                                    val_wstr: val,
                                    val_bool: nullptr,
                                    val_int: nullptr});
}

/**
 * @brief Добавление булевого параметра
 * @param name Имя параметра (его идентификатор)
 * @param val Указатель на значение параметра
 * @param val_def Значение по умолчанию
 * @param desc Описание параметра
 */
void CmdlineParser::add_bool_param(const std::wstring &name, const std::wstring &name_short, bool* val, const bool &val_def, const std::wstring &desc)
{
    *val = val_def;
    m_instance->m_params.push_back({type: EParamType::BOOLEAN,
                                    name: name,
                                    name_short: name_short,
                                    desc: desc,
                                    val_str: nullptr,
                                    val_wstr: nullptr,
                                    val_bool: val,
                                    val_int: nullptr});
}

/**
 * @brief Добавление целочисленного параметра
 * @param name Имя параметра (его идентификатор)
 * @param val Указатель на значение параметра
 * @param val_def Значение по умолчанию
 * @param desc Описание параметра
 */
void CmdlineParser::add_int_param(const std::wstring &name, int* val, const int &val_def, const std::wstring &desc)
{
    *val = val_def;
    m_instance->m_params.push_back({type: EParamType::INT,
                                    name: name,
                                    name_short: L"",
                                    desc: desc,
                                    val_str: nullptr,
                                    val_wstr: nullptr,
                                    val_bool: nullptr,
                                    val_int: val});
}

/**
 * @brief Вывести описание параметров
 */
void CmdlineParser::show_desc()
{
    wprintf(L"Usage:\n\t%S ", m_instance->m_name.c_str());
    for (param_rec_t &param : m_instance->m_params)
    {
        switch (param.type)
        {
        case EParamType::STRING:
            wprintf(L"--%S [val str](%S) ", param.name.c_str(), param.val_str->c_str());
            break;
        case EParamType::WIDE_STRING:
            wprintf(L"--%S [val str](%S) ", param.name.c_str(), param.val_wstr->c_str());
            break;
        case EParamType::BOOLEAN:
            wprintf(L"--%S ", param.name.c_str());
            break;
        case EParamType::INT:
            wprintf(L"--%S [val int](%i) ", param.name.c_str(), *param.val_int);
            break;
        }
    }

    wprintf(L"\n\nParameters description:\n");
    for (param_rec_t &param : m_instance->m_params)
        if (param.type == EParamType::BOOLEAN)
            wprintf(L"\t--%S, -%S - %S\n", param.name.c_str(), param.name_short.c_str(), param.desc.c_str());
        else
            wprintf(L"\t--%S - %S\n", param.name.c_str(), param.desc.c_str());
}

/**
 * @brief Разбор аргументов командной строки
 */
void CmdlineParser::parse()
{
    for (param_rec_t &param : m_instance->m_params)
    {
        std::wstring s_name = L"--" + param.name;
        for (int i=0 ; i<m_instance->m_argc ; ++i)
            if (s_name.compare(m_instance->m_argv[i]) == 0)
                switch (param.type)
                {
                case EParamType::STRING:
                    *param.val_str = Utils::wstrToUtf8(m_instance->m_argv[i + 1]);
                    break;
                case EParamType::WIDE_STRING:
                    *param.val_wstr = m_instance->m_argv[i + 1];
                    break;
                case EParamType::BOOLEAN:
                    *param.val_bool = true;
                    break;
                case EParamType::INT:
                    *param.val_int = std::stoi(Utils::wstrToUtf8(m_instance->m_argv[i + 1]));
                    break;
                }
    }
    // разбор булевых параметров
    for (int i=0 ; i<m_instance->m_argc ; ++i)
    {
        int len = m_instance->m_argv[i].size();
        std::wstring argv = m_instance->m_argv[i];
        if ((len > 1) && (argv[0] == L'-') && (argv[1] != L'-'))
        {
            for (int j=1 ; j<len ; ++j)
                for (param_rec_t &param : m_instance->m_params)
                    if ((param.type == EParamType::BOOLEAN) && (param.name_short[0] == argv[j]))
                        *param.val_bool = true;
        }
    }
}
