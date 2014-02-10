#configuration
CONFIG +=  cross_compile static qpa rtti no_mocdepend release qt_no_framework
host_build {
    QT_ARCH = x86_64
    QT_TARGET_ARCH = x86_64
} else {
    QT_ARCH = x86_64
    QMAKE_DEFAULT_LIBDIRS = /usr/lib/gcc/x86_64-w64-mingw32/4.8 /usr/lib/gcc/x86_64-w64-mingw32/lib
    QMAKE_DEFAULT_INCDIRS = /usr/include/c++/4.8 /usr/include/c++/4.8/x86_64-w64-mingw32 /usr/include/c++/4.8/backward /usr/lib/gcc/x86_64-w64-mingw32/4.8/include /usr/lib/gcc/x86_64-w64-mingw32/4.8/include-fixed /usr/lib/gcc/x86_64-w64-mingw32/include
}
QT_EDITION = OpenSource
QT_CONFIG +=  minimal-config small-config medium-config large-config full-config no-pkg-config c++11 accessibility static qpa reduce_relocations clock-gettime clock-monotonic getaddrinfo jpeg png gif no-freetype no-harfbuzz zlib concurrent release

#versioning
QT_VERSION = 5.2.1
QT_MAJOR_VERSION = 5
QT_MINOR_VERSION = 2
QT_PATCH_VERSION = 1

#namespaces
QT_LIBINFIX = 
QT_NAMESPACE = 

QT_DEFAULT_QPA_PLUGIN = qwindows

# pkgconfig
PKG_CONFIG_SYSROOT_DIR = /usr/x86_64-w64-mingw32
PKG_CONFIG_LIBDIR = 

# sysroot
!host_build {
    QMAKE_CFLAGS    += --sysroot=$$[QT_SYSROOT]
    QMAKE_CXXFLAGS  += --sysroot=$$[QT_SYSROOT]
    QMAKE_LFLAGS    += --sysroot=$$[QT_SYSROOT]
}

QT_GCC_MAJOR_VERSION = 4
QT_GCC_MINOR_VERSION = 8
QT_GCC_PATCH_VERSION = 0
