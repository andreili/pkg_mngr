cmake_minimum_required(VERSION 2.8)

project(pkg_mngr)

find_package(CURL REQUIRED)
find_package(OpenSSL REQUIRED)

include_directories("./include")
include_directories("./include/SQLiteCpp")

set(SOURCE_ALL main.cpp
    src/Category.cpp
    src/CmdlineParser.cpp
    src/ConfigurationAlias.cpp
    src/ConfigurationOption.cpp
    src/Fetch.cpp
    src/FileSystem.cpp
    src/Package.cpp
    src/PackageDB.cpp
    src/PackageManager.cpp
    src/PackageMeta.cpp
    src/Utils.cpp
    src/Variables.cpp
    src/stream.cpp
    src/SQLiteCpp/Column.cpp
    src/SQLiteCpp/Database.cpp
    src/SQLiteCpp/Statement.cpp)

set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -s -pthread")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -s -pthread")

add_executable(pkg_mngr ${SOURCE_ALL})

target_link_libraries(pkg_mngr curl)
target_link_libraries(pkg_mngr ${OPENSSL_LIBRARIES})
target_link_libraries(pkg_mngr sqlite3)
target_link_libraries(pkg_mngr pthread)
