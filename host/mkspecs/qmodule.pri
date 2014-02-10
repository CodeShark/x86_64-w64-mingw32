CONFIG +=  cross_compile qpa sse2 sse3 ssse3 sse4_1 sse4_2 avx avx2 pcre
QT_BUILD_PARTS += libs
QT_SKIP_MODULES +=  qtactiveqt qtdeclarative qtdoc qtgraphicaleffects qtmultimedia qtquick1 qtquickcontrols qtscript qtsensors qtserialport qtsvg qtwebkit qtwebkit-examples qtx11extras qtxmlpatterns
QT_NO_DEFINES =  ALSA CUPS DBUS EGL EGLFS EVENTFD FONTCONFIG FREETYPE GETIFADDRS GLIB HARFBUZZ ICONV INOTIFY IPV6IFNAME MREMAP NIS OPENGL OPENSSL OPENVG POSIX_FALLOCATE PULSEAUDIO SESSIONMANAGER SSL STYLE_CDE STYLE_CLEANLOOKS STYLE_GTK STYLE_MOTIF STYLE_PLASTIQUE STYLE_S60 STYLE_WINDOWSCE STYLE_WINDOWSMOBILE
QT_QCONFIG_PATH = 
host_build {
    QT_CPU_FEATURES.x86_64 =  mmx sse sse2
} else {
    QT_CPU_FEATURES.x86_64 =  mmx sse sse2
}
QT_COORD_TYPE = double
QT_LFLAGS_ODBC   = -lodbc
styles += mac fusion windows
styles += windowsxp windowsvista
DEFINES += QT_NO_MTDEV
DEFINES += QT_NO_LIBUDEV
DEFINES += QT_NO_EVDEV
DEFINES += QT_NO_XCB
DEFINES += QT_NO_XKBCOMMON
JAVASCRIPTCORE_JIT = no
sql-drivers = 
sql-plugins = 
