
add_library(Qt5::AccessibleFactory MODULE IMPORTED)

_populate_Widgets_plugin_properties(AccessibleFactory RELEASE "accessible/libqtaccessiblewidgets.a")

list(APPEND Qt5Widgets_PLUGINS Qt5::AccessibleFactory)
