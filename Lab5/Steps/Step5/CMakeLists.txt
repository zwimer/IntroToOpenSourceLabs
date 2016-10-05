cmake_minimum_required (VERSION 2.6)
project (Tutorial)

# The version number
set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

#------------------------Options------------------------

option (USE_MYMATH "Use totorial provided math implementation" ON)

#-------------------Check function exists-------------------

#Includes needed
include (CheckFunctionExists)

#Check if the functions exist
check_function_exists(log HAVE_LOG)
check_function_exists(exp HAVE_EXP)

#----------------------Include testing----------------------

#CTest
include(CTest)

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

#-------------------------Install-------------------------

#Add targets
install (TARGETS Tutorial DESTINATION bin)
install (FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"
		 DESTINATION include)

 #-------------------------CTest-------------------------

 #Does the app run?
 add_test (TutorialRuns Tutorial 25)

 #Does usage print?
 add_test (TutorialUsage Tutorial)
 set_tests_properties (TutorialUsage
	 PROPERTIES
	 PASS_REGULAR_EXPRESSION "Usage:.*number"
	 )


#define a macro to simplify adding tests, then use it
macro (do_test arg result)
	add_test (TutorialComp${arg} Tutorial ${arg})
	set_tests_properties (TutorialComp${arg}
		PROPERTIES PASS_REGULAR_EXPRESSION ${result})
endmacro (do_test)

# do a bunch of result based tests
do_test (25 "25 is 5")
do_test (-25 "-25 is 0")

