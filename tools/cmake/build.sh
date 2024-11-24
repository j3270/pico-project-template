#!/bin/bash

buildType=$1
buildDir=$2
buildTarget=$3

if (( [ -z "$buildType" ] ) || ([ $buildType != "Debug" ] && [ $buildType != "Release" ])); then
    echo Build type $buildType is undefined,
    echo available options are Debug and Release
    exit 1
fi

if ([ -z "$buildTarget" ]); then
    buildTarget=all
fi

if (( [ -z "$buildDir" ] ) || ([ $buildDir != "pico-examples" ] && [ $buildDir != "src" ] && [ $buildDir != "tests" ])); then
    echo Build directory, $buildDir is undefined,
    echo available options are pico-examples, src, and tests
    exit 1
fi

if ( [ $buildDir == "pico-examples" ] ); then
    cd ../pico-examples
elif ( [ $buildDir == "tests" ] ); then
    cd tests
else
    cd src
fi
echo Current working directory is && pwd

if ! [ -d './build' ]; then
    echo Build directory does not exist, configure build with configcmake.sh first
else
    echo Building CMake build type $buildType $'\r\n'
    cmake --build ./build --config $buildType --target $buildTarget --
    if [ $? != 0 ]; then
        echo CMake build failed!
        exit 1
    fi
fi
