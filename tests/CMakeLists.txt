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
    ../src/j3core/tests/components
    ${CMAKE_CURRENT_SOURCE_DIR}/build/j3core/components
)

add_subdirectory(
    ../src/j3core/tests/devices
    ${CMAKE_CURRENT_SOURCE_DIR}/build/j3core/devices
)

add_subdirectory(
    ../src/j3core/tests/utilities
    ${CMAKE_CURRENT_SOURCE_DIR}/build/j3core/utilities
)

add_subdirectory(
    helloworld
    ${CMAKE_CURRENT_SOURCE_DIR}/build/helloworld
)
