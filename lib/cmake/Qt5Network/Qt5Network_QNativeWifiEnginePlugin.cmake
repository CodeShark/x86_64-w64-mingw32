
add_library(Qt5::QNativeWifiEnginePlugin MODULE IMPORTED)

_populate_Network_plugin_properties(QNativeWifiEnginePlugin RELEASE "bearer/libqnativewifibearer.a")

list(APPEND Qt5Network_PLUGINS Qt5::QNativeWifiEnginePlugin)
