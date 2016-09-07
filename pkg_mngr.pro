QT += core
QT -= gui

CONFIG += c++11

TARGET = pkg_mngr
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

INCLUDEPATH += ./include/
INCLUDEPATH += ./include/SQLiteCpp/

SOURCES += main.cpp \
    src/Category.cpp \
    src/ConfigurationAlias.cpp \
    src/ConfigurationOption.cpp \
    src/Fetch.cpp \
    src/FileSystem.cpp \
    src/Package.cpp \
    src/PackageDB.cpp \
    src/PackageManager.cpp \
    src/PackageMeta.cpp \
    src/stream.cpp \
    src/Variables.cpp \
    src/SQLiteCpp/Backup.cpp \
    src/SQLiteCpp/Column.cpp \
    src/SQLiteCpp/Database.cpp \
    src/SQLiteCpp/Statement.cpp \
    src/SQLiteCpp/Transaction.cpp \
    sqlite3/sqlite3.c

HEADERS += \
    include/Category.h \
    include/ConfigurationAlias.h \
    include/ConfigurationOption.h \
    include/Fetch.h \
    include/FileSystem.h \
    include/Package.h \
    include/PackageDB.h \
    include/PackageManager.h \
    include/PackageMeta.h \
    include/stream.h \
    include/Variables.h \
    include/SQLiteCpp/Assertion.h \
    include/SQLiteCpp/Backup.h \
    include/SQLiteCpp/Column.h \
    include/SQLiteCpp/Database.h \
    include/SQLiteCpp/Exception.h \
    include/SQLiteCpp/SQLiteCpp.h \
    include/SQLiteCpp/Statement.h \
    include/SQLiteCpp/Transaction.h \
    sqlite3/sqlite3.h
