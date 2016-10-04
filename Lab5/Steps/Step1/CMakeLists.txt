cmake_minimum_required (VERSION 2.6)
project (Tutorial)

# The version number
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

#Make a header to inlude version and settings in main.cpp
configure_file (
	"${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
	"${PROJECT_BINARY_DIR}/TutorialConfig.h"
	)

#Add it to CMake's search path
include_directories("${PROJECT_BINARY_DIR}")

#Make .out
add_executable(Tutorial main.cpp)

