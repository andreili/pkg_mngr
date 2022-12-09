cmake_minimum_required(VERSION 2.8)

project(pkg_mngr)

find_package(SQLite3 REQUIRED)
find_package(CURL REQUIRED)
find_package(OpenSSL REQUIRED)
find_package(Qt5 COMPONENTS Widgets Sql REQUIRED)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

include_directories("./include")
include_directories("./include/SQLiteCpp")

set(SOURCE_ALL
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
    src/stream.cpp)
set(SOURCE_MNGR main.cpp
    ${SOURCE_ALL})
set(SOURCE_EDIT editor/mainwindow.ui
    editor/main.cpp
    editor/mainwindow.cpp)

set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -s -pthread")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -s -pthread")

add_executable(pkg_mngr ${SOURCE_MNGR})
add_executable(pkg_mnge ${SOURCE_EDIT})

target_link_libraries(pkg_mngr curl ${OPENSSL_LIBRARIES} sqlite3 pthread vsqlitepp)
target_link_libraries(pkg_mnge Qt5::Widgets Qt5::Sql)

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD COMMAND mkdir -p ./var/{tmp/packages,lib/pkg/{pkgs,srcs}})
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD COMMAND chmod -R 0664 ./var/lib/pkg)
#add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD COMMAND cat ${CMAKE_SOURCE_DIR}/packages.sql | sqlite3 ./var/lib/pkg/packages.sql3)

install(TARGETS pkg_mngr pkg_mnge DESTINATION bin)
install(DIRECTORY ${CMAKE_BINARY_DIR}/var DESTINATION / PATTERN ${CMAKE_BINARY_DIR}/var PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ GROUP_EXECUTE GROUP_READ GROUP_WRITE)


