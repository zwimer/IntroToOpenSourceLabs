# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.6.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.6.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5"

# Include any dependencies generated for this target.
include MathFunctions/CMakeFiles/MathFunctions.dir/depend.make

# Include the progress variables for this target.
include MathFunctions/CMakeFiles/MathFunctions.dir/progress.make

# Include the compile flags for this target's objects.
include MathFunctions/CMakeFiles/MathFunctions.dir/flags.make

MathFunctions/Table.h: MathFunctions/MakeTable
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Generating Table.h"
	cd "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions" && ./MakeTable /Users/zwimer/School/Intro\ to\ Open\ Source/Labs/Lab5/Steps/Step5/MathFunctions/Table.h

MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o: MathFunctions/CMakeFiles/MathFunctions.dir/flags.make
MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o: MathFunctions/mysqrt.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o"
	cd "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MathFunctions.dir/mysqrt.cpp.o -c "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions/mysqrt.cpp"

MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MathFunctions.dir/mysqrt.cpp.i"
	cd "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions/mysqrt.cpp" > CMakeFiles/MathFunctions.dir/mysqrt.cpp.i

MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MathFunctions.dir/mysqrt.cpp.s"
	cd "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions/mysqrt.cpp" -o CMakeFiles/MathFunctions.dir/mysqrt.cpp.s

MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o.requires:

.PHONY : MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o.requires

MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o.provides: MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o.requires
	$(MAKE) -f MathFunctions/CMakeFiles/MathFunctions.dir/build.make MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o.provides.build
.PHONY : MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o.provides

MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o.provides.build: MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o


# Object files for target MathFunctions
MathFunctions_OBJECTS = \
"CMakeFiles/MathFunctions.dir/mysqrt.cpp.o"

# External object files for target MathFunctions
MathFunctions_EXTERNAL_OBJECTS =

MathFunctions/libMathFunctions.a: MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o
MathFunctions/libMathFunctions.a: MathFunctions/CMakeFiles/MathFunctions.dir/build.make
MathFunctions/libMathFunctions.a: MathFunctions/CMakeFiles/MathFunctions.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libMathFunctions.a"
	cd "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions" && $(CMAKE_COMMAND) -P CMakeFiles/MathFunctions.dir/cmake_clean_target.cmake
	cd "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MathFunctions.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
MathFunctions/CMakeFiles/MathFunctions.dir/build: MathFunctions/libMathFunctions.a

.PHONY : MathFunctions/CMakeFiles/MathFunctions.dir/build

MathFunctions/CMakeFiles/MathFunctions.dir/requires: MathFunctions/CMakeFiles/MathFunctions.dir/mysqrt.cpp.o.requires

.PHONY : MathFunctions/CMakeFiles/MathFunctions.dir/requires

MathFunctions/CMakeFiles/MathFunctions.dir/clean:
	cd "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions" && $(CMAKE_COMMAND) -P CMakeFiles/MathFunctions.dir/cmake_clean.cmake
.PHONY : MathFunctions/CMakeFiles/MathFunctions.dir/clean

MathFunctions/CMakeFiles/MathFunctions.dir/depend: MathFunctions/Table.h
	cd "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5" "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions" "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5" "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions" "/Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5/MathFunctions/CMakeFiles/MathFunctions.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : MathFunctions/CMakeFiles/MathFunctions.dir/depend

