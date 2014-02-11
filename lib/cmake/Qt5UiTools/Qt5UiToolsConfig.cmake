
if (CMAKE_VERSION VERSION_LESS 2.8.3)
    message(FATAL_ERROR "Qt 5 requires at least CMake version 2.8.3")
endif()

get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
# Use original install prefix when loaded through a
# cross-prefix symbolic link such as /lib -> /usr/lib.
get_filename_component(_realCurr "${_IMPORT_PREFIX}" REALPATH)
get_filename_component(_realOrig "/lib/cmake/Qt5UiTools" REALPATH)
if(_realCurr STREQUAL _realOrig)
    get_filename_component(_qt5UiTools_install_prefix "/lib/../" ABSOLUTE)
else()
    get_filename_component(_qt5UiTools_install_prefix "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)
endif()
unset(_realOrig)
unset(_realCurr)
unset(_IMPORT_PREFIX)

# For backwards compatibility only. Use Qt5UiTools_VERSION instead.
set(Qt5UiTools_VERSION_STRING 5.2.1)

set(Qt5UiTools_LIBRARIES Qt5::UiTools)

macro(_qt5_UiTools_check_file_exists file)
    if(NOT EXISTS "${file}" )
        message(FATAL_ERROR "The imported target \"Qt5::UiTools\" references the file
   \"${file}\"
but this file does not exist.  Possible reasons include:
* The file was deleted, renamed, or moved to another location.
* An install or uninstall procedure did not complete successfully.
* The installation package was faulty and contained
   \"${CMAKE_CURRENT_LIST_FILE}\"
but not all the files it references.
")
    endif()
endmacro()


macro(_populate_UiTools_target_properties Configuration LIB_LOCATION IMPLIB_LOCATION)
    set_property(TARGET Qt5::UiTools APPEND PROPERTY IMPORTED_CONFIGURATIONS ${Configuration})

    set(imported_location "${_qt5UiTools_install_prefix}/lib/${LIB_LOCATION}")
    _qt5_UiTools_check_file_exists(${imported_location})
    set_target_properties(Qt5::UiTools PROPERTIES
        "INTERFACE_LINK_LIBRARIES" "${_Qt5UiTools_LIB_DEPENDENCIES}"
        "IMPORTED_LOCATION_${Configuration}" ${imported_location}
        # For backward compatibility with CMake < 2.8.12
        "IMPORTED_LINK_INTERFACE_LIBRARIES_${Configuration}" "${_Qt5UiTools_LIB_DEPENDENCIES}"
    )

    set(imported_implib "${_qt5UiTools_install_prefix}/lib/${IMPLIB_LOCATION}")
    _qt5_UiTools_check_file_exists(${imported_implib})
    if(NOT "${IMPLIB_LOCATION}" STREQUAL "")
        set_target_properties(Qt5::UiTools PROPERTIES
        "IMPORTED_IMPLIB_${Configuration}" ${imported_implib}
        )
    endif()
endmacro()

if (NOT TARGET Qt5::UiTools)

    set(_Qt5UiTools_OWN_INCLUDE_DIRS "${_qt5UiTools_install_prefix}/include/" "${_qt5UiTools_install_prefix}/include/QtUiTools")
    set(Qt5UiTools_PRIVATE_INCLUDE_DIRS "")
    include("${CMAKE_CURRENT_LIST_DIR}/ExtraSourceIncludes.cmake" OPTIONAL)

    foreach(_dir ${_Qt5UiTools_OWN_INCLUDE_DIRS})
        _qt5_UiTools_check_file_exists(${_dir})
    endforeach()

    # Only check existence of private includes if the Private component is
    # specified.
    list(FIND Qt5UiTools_FIND_COMPONENTS Private _check_private)
    if (NOT _check_private STREQUAL -1)
        foreach(_dir ${Qt5UiTools_PRIVATE_INCLUDE_DIRS})
            _qt5_UiTools_check_file_exists(${_dir})
        endforeach()
    endif()

    set(Qt5UiTools_INCLUDE_DIRS ${_Qt5UiTools_OWN_INCLUDE_DIRS})

    set(Qt5UiTools_DEFINITIONS -DQT_UITOOLS_LIB)
    set(Qt5UiTools_COMPILE_DEFINITIONS QT_UITOOLS_LIB)

    set(_Qt5UiTools_MODULE_DEPENDENCIES "Core")

    set(_Qt5UiTools_FIND_DEPENDENCIES_REQUIRED)
    if (Qt5UiTools_FIND_REQUIRED)
        set(_Qt5UiTools_FIND_DEPENDENCIES_REQUIRED REQUIRED)
    endif()
    set(_Qt5UiTools_FIND_DEPENDENCIES_QUIET)
    if (Qt5UiTools_FIND_QUIETLY)
        set(_Qt5UiTools_DEPENDENCIES_FIND_QUIET QUIET)
    endif()
    set(_Qt5UiTools_FIND_VERSION_EXACT)
    if (Qt5UiTools_FIND_VERSION_EXACT)
        set(_Qt5UiTools_FIND_VERSION_EXACT EXACT)
    endif()

    set(Qt5UiTools_EXECUTABLE_COMPILE_FLAGS "")

    foreach(_module_dep ${_Qt5UiTools_MODULE_DEPENDENCIES})
        if (NOT Qt5${_module_dep}_FOUND)
            find_package(Qt5${_module_dep}
                5.2.1 ${_Qt5UiTools_FIND_VERSION_EXACT}
                ${_Qt5UiTools_DEPENDENCIES_FIND_QUIET}
                ${_Qt5UiTools_FIND_DEPENDENCIES_REQUIRED}
                PATHS "${CMAKE_CURRENT_LIST_DIR}/.." NO_DEFAULT_PATH
            )
        endif()

        if (NOT Qt5${_module_dep}_FOUND)
            set(Qt5UiTools_FOUND False)
            return()
        endif()

        list(APPEND Qt5UiTools_INCLUDE_DIRS "${Qt5${_module_dep}_INCLUDE_DIRS}")
        list(APPEND Qt5UiTools_PRIVATE_INCLUDE_DIRS "${Qt5${_module_dep}_PRIVATE_INCLUDE_DIRS}")
        list(APPEND Qt5UiTools_DEFINITIONS ${Qt5${_module_dep}_DEFINITIONS})
        list(APPEND Qt5UiTools_COMPILE_DEFINITIONS ${Qt5${_module_dep}_COMPILE_DEFINITIONS})
        list(APPEND Qt5UiTools_EXECUTABLE_COMPILE_FLAGS ${Qt5${_module_dep}_EXECUTABLE_COMPILE_FLAGS})
    endforeach()
    list(REMOVE_DUPLICATES Qt5UiTools_INCLUDE_DIRS)
    list(REMOVE_DUPLICATES Qt5UiTools_PRIVATE_INCLUDE_DIRS)
    list(REMOVE_DUPLICATES Qt5UiTools_DEFINITIONS)
    list(REMOVE_DUPLICATES Qt5UiTools_COMPILE_DEFINITIONS)
    list(REMOVE_DUPLICATES Qt5UiTools_EXECUTABLE_COMPILE_FLAGS)

    set(_Qt5UiTools_LIB_DEPENDENCIES "Qt5::Core")

    add_library(Qt5::UiTools STATIC IMPORTED)
    set_property(TARGET Qt5::UiTools PROPERTY IMPORTED_LINK_INTERFACE_LANGUAGES CXX)

    set_property(TARGET Qt5::UiTools PROPERTY
      INTERFACE_INCLUDE_DIRECTORIES ${_Qt5UiTools_OWN_INCLUDE_DIRS})
    set_property(TARGET Qt5::UiTools PROPERTY
      INTERFACE_COMPILE_DEFINITIONS QT_UITOOLS_LIB)

    _populate_UiTools_target_properties(RELEASE "libQt5UiTools.a" "" )

    if (EXISTS "${_qt5UiTools_install_prefix}/lib/libQt5UiToolsd.a" )
        _populate_UiTools_target_properties(DEBUG "libQt5UiToolsd.a" "" )
    endif()






_qt5_UiTools_check_file_exists("${CMAKE_CURRENT_LIST_DIR}/Qt5UiToolsConfigVersion.cmake")

endif()
