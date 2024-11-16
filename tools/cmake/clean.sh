#!/bin/bash

buildType=$1
buildDir=$2

if (( [ -z "$buildType" ] ) || ([ $buildType != "Debug" ] && [ $buildType != "Release" ])); then
    echo Build type $buildType is undefined,
    echo available options are Debug and Release
    exit 1
fi

if (( [ -z "$buildDir" ] ) || ([ $buildDir != "pico-examples" ] && [ $buildDir != "app" ])); then
    echo Build directory, $buildDir is undefined,
    echo available options are pico-examples and app
    exit 1
fi

cd $buildDir

if [ -d './build' ] ; then
    
    echo Cleaning CMake build type $buildType
    # Run cmake clean for given build config
    cmake --build ./build --config $buildType --target clean --
    if [ $? != 0 ]; then
        echo CMake clean of $buildDir with build configuration of $buildType failed!
        exit 1
    fi
else
    echo Build directory does not exist, configure build with config.sh first
fi

cd ..