
add_library(Qt5::QMngPlugin MODULE IMPORTED)

_populate_Gui_plugin_properties(QMngPlugin RELEASE "imageformats/libqmng.a")

list(APPEND Qt5Gui_PLUGINS Qt5::QMngPlugin)
