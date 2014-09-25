TEMPLATE = lib

DRISHTI_DEFINES = RENDERER NETCDF
include( ../../../drishti.pri )

RESOURCES = mesh.qrc

QT += opengl xml network

CONFIG += release plugin

TARGET = meshplugin


FORMS += ../../propertyeditor.ui

win32 {
  DESTDIR = ../../../bin/renderplugins

  LIBS += common.lib \
	  QGLViewer2.lib \
	  glew32.lib \
	  glmedia.lib

 contains(Windows_Setup, Win32) {
  INCLUDEPATH += ../../ ..\..\..\glmedia
  QMAKE_LIBDIR += ..\common ..\..\..\glmedia
  LIBS += netcdf.lib
 }

 contains(Windows_Setup, Win64) {
  INCLUDEPATH += ../../ ..\..\..\glmedia-64
  QMAKE_LIBDIR += ..\common ..\..\..\glmedia-64
  LIBS += netcdfcpp-x64.lib \
	  glut64.lib
 }
}

unix {
!macx {

DESTDIR = ../../../bin/renderplugins

INCLUDEPATH += ../../

QMAKE_LIBDIR += ../common

LIBS += -lcommon \
	-lQGLViewer \
        -lGLEW \
 	-lglut \
	-lGLU

  }
}


macx {
  DESTDIR = ../../../bin/drishti.app/renderplugins

  INCLUDEPATH += ../../

  LIBS += -L../common 

  LIBS += -lcommon \
	-lGLEW \
	-lnetcdf \
	-lnetcdf_c++ \
        -framework QGLViewer \
        -framework GLUT
}

HEADERS = meshplugin.h \
 	meshgenerator.h \
	marchingcubes.h \
	ply.h \
	lookuptable.h
	

SOURCES = meshplugin.cpp \
	meshgenerator.cpp \
	marchingcubes.cpp \
	ply.c
