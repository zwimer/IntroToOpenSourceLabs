#Add the file
add_library(MathFunctions mysqrt.cpp)

#Install
install (TARGETS MathFunctions DESTINATION bin)
install (FILES mysqrt.hpp DESTINATION include)

