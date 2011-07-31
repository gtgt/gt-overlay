#
# Buildfile for the coremoid Plasma applet.
#
# Author: Joerg Hundertmarck <joerg@hirnfrei.org>, (C) 2007
#
# Copyright: See COPYING file that comes with this distribution
#
#

project(coremoid)

find_package(KDE4 REQUIRED)
include(KDE4Defaults)
find_package(Plasma REQUIRED)

add_definitions (${QT_DEFINITIONS} ${KDE4_DEFINITIONS})
include_directories(
   ${CMAKE_SOURCE_DIR}
   ${CMAKE_BINARY_DIR}
   ${KDE4_INCLUDES}
   )

# We add our source code here
set(coremoid_SRCS coremoidapplet.cpp cpustat.cpp)

# Now make sure all files get to the right place
kde4_add_ui_files(coremoid_SRCS coremoidConfig.ui)
kde4_add_plugin(plasma_applet_coremoid ${coremoid_SRCS})
target_link_libraries(plasma_applet_coremoid 
                      ${PLASMA_LIBS} ${KDE4_KDEUI_LIBS})

install(TARGETS plasma_applet_coremoid
        DESTINATION ${PLUGIN_INSTALL_DIR})

install(FILES plasma-applet-coremoid.desktop
        DESTINATION ${SERVICES_INSTALL_DIR})

install(FILES 8x8/coremoid.png
	DESTINATION ${DATA_INSTALL_DIR}/icons/oxygen/8x8/devices)

install(FILES 16x16/coremoid.png
	DESTINATION ${DATA_INSTALL_DIR}/icons/oxygen/16x16/devices)

install(FILES 22x22/coremoid.png
	DESTINATION ${DATA_INSTALL_DIR}/icons/oxygen/22x22/devices)

install(FILES 32x32/coremoid.png
	DESTINATION ${DATA_INSTALL_DIR}/icons/oxygen/32x32/devices)

install(FILES 48x48/coremoid.png
	DESTINATION ${DATA_INSTALL_DIR}/icons/oxygen/48x48/devices)

install(FILES 64x64/coremoid.png
	DESTINATION ${DATA_INSTALL_DIR}/icons/oxygen/64x64/devices)

install(FILES 128x128/coremoid.png
	DESTINATION ${DATA_INSTALL_DIR}/icons/oxygen/128x128/devices)


