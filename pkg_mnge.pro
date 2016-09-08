#-------------------------------------------------
#
# Project created by QtCreator 2016-09-08T08:19:55
#
#-------------------------------------------------

QT       += core gui sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = pkg_mnge
TEMPLATE = app

QTPLUGIN.platforms = qwindows
QTPLUGIN.sqldrivers = qsqlite
QTPLUGIN.imageformats = -

SOURCES += editor/main.cpp\
        editor/mainwindow.cpp

HEADERS  += editor/mainwindow.h

FORMS    += editor/mainwindow.ui
