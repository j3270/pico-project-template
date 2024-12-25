cmake_minimum_required(VERSION 3.15)
project(UnitTests)

include(CTest)
enable_testing()

if (NOT DEFINED ENV{CPPUTEST_HOME})
	message(FATAL_ERROR "CPPUTEST_HOME environment variable is not defined!")
endif()

# Out of tree builds must provide a build dir
add_subdirectory(
    $ENV{CPPUTEST_HOME}/
    ${CMAKE_CURRENT_SOURCE_DIR}/build/CppUtest
)

add_subdirectory(
    helloworld
    ${CMAKE_CURRENT_SOURCE_DIR}/build/helloworld
)
