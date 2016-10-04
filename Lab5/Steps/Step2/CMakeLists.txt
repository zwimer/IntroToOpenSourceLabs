cmake_minimum_required (VERSION 2.6)
project (Tutorial)

# The version number
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

#------------------------Options------------------------

option (USE_MYMATH "Use totorial provided math implementation" ON)

#------------------------Headers------------------------

#Make a header to inlude version and settings in main.cpp
configure_file (
	"${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
	"${PROJECT_BINARY_DIR}/TutorialConfig.h"
	)

#------------------------Includes------------------------

#Add the header to CMake's search path
include_directories("${PROJECT_BINARY_DIR}")

#If using the lib
if (USE_MYMATH)
	#Add the lib
	include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")
	add_subdirectory (MathFunctions)
	set (EXTRA_LIBS ${EXTRALIBS} MathFunctions)
endif (USE_MYMATH)

#----------------------Actually make----------------------

#Make .out
add_executable(Tutorial main.cpp)

#Link
target_link_libraries (Tutorial ${EXTRA_LIBS})
