# CMake generated Testfile for 
# Source directory: /Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5
# Build directory: /Users/zwimer/School/Intro to Open Source/Labs/Lab5/Steps/Step5
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(TutorialRuns "Tutorial" "25")
add_test(TutorialUsage "Tutorial")
set_tests_properties(TutorialUsage PROPERTIES  PASS_REGULAR_EXPRESSION "Usage:.*number")
add_test(TutorialComp25 "Tutorial" "25")
set_tests_properties(TutorialComp25 PROPERTIES  PASS_REGULAR_EXPRESSION "25 is 5")
add_test(TutorialComp-25 "Tutorial" "-25")
set_tests_properties(TutorialComp-25 PROPERTIES  PASS_REGULAR_EXPRESSION "-25 is 0")
subdirs(MathFunctions)
