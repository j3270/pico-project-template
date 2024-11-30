
cmake_minimum_required(VERSION 3.15)
project(helloworld_tests)

set(SOURCES 
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/helloworld.cpp
)
set(INCLUDE_DIRS 
    $ENV{CPPUTEST_HOME}/include
)

add_definitions(-DCPPUTEST)

add_compile_options(--coverage)

include_directories(${INCLUDE_DIRS})

set(EXECUTABLE ${PROJECT_NAME})

add_executable(${EXECUTABLE} ${SOURCES})

target_link_libraries(${EXECUTABLE} 
    gcov 
    $<TARGET_FILE:CppUTest>
    $<TARGET_FILE:CppUTestExt>
)

add_test(
    NAME "${PROJECT_NAME}" 
    COMMAND $<TARGET_FILE:${PROJECT_NAME}> "-v"
)