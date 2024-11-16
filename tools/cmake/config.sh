#!/bin/bash
# Configures cmake build with given type, directory and board.  
# The type, directory and board arguments are required.
# For projects using Bluetooth, the mode can be passed in as the 4th argument and the 5th argument must be NULL (don't type in NULL, just don't enter a fifth arg).
# Bluetooth stack operating modes are; background, poll, or freertos.
# For projects using wifi, the ssid and pwd can be passed as the 4th and 5th args.

buildType=$1
buildDir=$2
board=$3
bt_mode_or_ssid=$4
pwd=$5

if (( [ -z "$buildType" ] ) || ([ $buildType != "Debug" ] && [ $buildType != "Release" ])); then
    echo Build config $buildType is undefined,
    echo available options are Debug and Release
    exit 1
fi

if (( [ -z "$buildDir" ] ) || ([ $buildDir != "pico-examples" ] && [ $buildDir != "app" ])); then
    echo Build directory, $buildDir is undefined,
    echo available options are pico-examples and app
    exit 1
fi

if (( [ -z "$board" ] ) || ([ $board != "pico" ] && [ $board != "pico_w" ] && [ $board != "custom" ])); then
    echo board, $board is undefined,
    echo available options are pico, pico_w, and custom
    exit 1
fi

cd $buildDir
echo Current working directory
pwd
if [ -d './build' ] ; then
    echo Removing build dir
    rm -rf ./build
fi
echo Making build directory $buildDir/build
mkdir build
cd build

#Check if we have ninja available. To get is run apt-get install ninja-build
if ! [ -x "$(command -v ninja)" ]; then
   cmakeGenerator="Unix Makefiles"
   echo "Ninja could not be found"
   echo "To get Ninja run apt install ninja-build"
   echo Using Unix Makefiles as generator
else
   cmakeGenerator=Ninja
   echo "Ninja found"
   echo Using Ninja as generator
fi

echo Configuring $buildDir for 
echo Build Type: $buildType
echo Board: $board
echo Bluetooth Mode/SSID: $bt_mode_or_ssid
echo PWD: $pwd

export PICO_SDK_PATH=../../pico-sdk
export FREERTOS_KERNEL_PATH=../../FreeRTOS-Kernel

if (( [ -z "$bt_mode_or_ssid" ] ) && ( [ -z "$pwd" ] )); then
    echo CMake configuration without Wifi or Bluetooth
    cmake -DCMAKE_BUILD_TYPE:STRING=$buildType -DPICO_BOARD=$board -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -S .. -B . -G "$cmakeGenerator"
elif ( [ -z "$pwd" ] ); then
    echo CMake configuration with Bluetooth mode $bt_mode_or_ssid
    cmake -DCMAKE_BUILD_TYPE:STRING=$buildType -DPICO_BOARD=$board -DBTSTACK_EXAMPLE_TYPE=$bt_mode_or_ssid -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -S .. -B . -G "$cmakeGenerator"
else
    echo CMake configuration with Wifi ssid $bt_mode_or_ssid and pwd $pwd
    cmake -DCMAKE_BUILD_TYPE:STRING=$buildType -DPICO_BOARD=$board -DWIFI_SSID=$bt_mode_or_ssid -DWIFI_PASSWORD=$pwd -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -S .. -B . -G "$cmakeGenerator"
fi

if [ $? != 0 ]; then
    echo CMake configuration failed!
    exit 1
fi
cd ../..
