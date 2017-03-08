QT -= core
QT -= gui

CONFIG += c++11

TARGET = pkg_mngr
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

INCLUDEPATH += ./include/ ./include/SQLiteCpp/

LIBS += -lcrypto -lcurl -lsqlite3

WIN32:SOURCES += sqlite3/sqlite3.c

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
    src/CmdlineParser.cpp \
    src/Utils.cpp

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
    sqlite3/sqlite3.h \
    include/CmdlineParser.h \
    include/Utils.h

unix { 
    # VARIABLES
    isEmpty(PREFIX):PREFIX = /usr #PREFIX - это путь установки
    BINDIR = $$PREFIX/bin # путь к бинарникам
    DATADIR = $$PREFIX/share # путь к различным компонентам приложения, от которых можно отказаться
    DEFINES += DATADIR=\"$$DATADIR\" \
        PKGDATADIR=\"$$PKGDATADIR\"
    
    # MAKE INSTALL
    INSTALLS += target mkdb etc_dir pkg_dir src_dir

    target.path = $$BINDIR

    mkdb.path = /var/lib/pkg
    mkdb.commands = cat $$PWD/packages.sql | sqlite3 $(INSTALL_ROOT)$$mkdb.path/packages.sql3
    
    etc_dir.path = /etc/packages
    etc_dir.commands = touch $(INSTALL_ROOT)$$etc_dir.path/packages.conf
    
    pkg_dir.path = /var/lib/pkg/pkgs
    pkg_dir.commands = touch .nil
    
    src_dir.path = /var/lib/pkg/srcs
    src_dir.commands = touch .nil
}
