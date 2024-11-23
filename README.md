# Raspberry Pi Pico-series Project Template

As the title says, this repo is a project template for working with the Raspberry Pi Pico-series of devices. To begin using this project template do the following:

Make a pico workspace directory on your machine 
````
mkdir picoWorkspace && cd picoWorkspace
````
Clone the following repos to your workspace:
pico-sdk
````
git clone git@github.com:raspberrypi/pico-sdk.git --recurse-submodules
````
pico-examples
````
git clone git@github.com:raspberrypi/pico-examples.git
````
picotool
````
git clone git@github.com:raspberrypi/picotool.git
````
If you would like to use freeRTOS in your project, or build the examples with freeRTOS, clone the freeRTOS kernel synchronous multi-processing (SMP) branch to the root of your workspace directory like so,
````
git clone -b smp https://github.com/FreeRTOS/FreeRTOS-Kernel --recurse-submodules
````
This repo is a [GitHub Template Repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository).  Therefore, you can create your project repository by clicking the **Use this template** button next to the **Star** button.  This will allow you to name your new repository appropriately for your project, however, start with the existing directory structure and files that this repo has.  You will probably want to update the README, LICENSE, and CONTRIBUTING md files for your project.

If you would like to contribute to this **Template Repository**, [See Contributing](CONTRIBUTING.md)

This project template was developed using information found in the following documentation:

[Getting started with Raspberry Pi Pico-series](https://datasheets.raspberrypi.com/pico/getting-started-with-pico.pdf)
- Doesn't hurt to read the whole thing, however, the following sections I found most useful
    - Chapter 1. Introduction
    - Appendix B: Picotool
    - Appendix C: Manual toolchain setup

[Raspberry Pi Pico-series C/C++ SDK](https://datasheets.raspberrypi.com/pico/raspberry-pi-pico-c-sdk.pdf)
- Still need to read, looks like there is a wealth of info here

[Connecting to the Internet with Raspberry Pi Pico W](https://datasheets.raspberrypi.com/picow/connecting-to-the-internet-with-pico-w.pdf)
- Brief easy read like the getting started one, but for pico_w and introduces connecting to wifi and basics of Bluetooth

## Workspace Directory structure

### FreeRTOS-Kernel

Synchronous multiprocessing (SMP) branch of the FreeRTOS Kernel.
[See README here](https://github.com/FreeRTOS/FreeRTOS-Kernel)

### pico-examples

Examples for the RaspberryPi Pico-series using the pico-sdk.
[See README here](https://github.com/raspberrypi/pico-examples)

### pico-sdk

Software Development Kit for the RaspberryPi Pico-series.
[See README here](https://github.com/raspberrypi/pico-sdk)

### picotool
picotool is a tool for working with RP2040/RP2350 binaries, and interacting with RP2040/RP2350 devices when they are in BOOTSEL mode. (As of version 1.1 of picotool it is also possible to interact with devices that are not in BOOTSEL mode, but are using USB stdio support from the Raspberry Pi Pico SDK by using the -f argument of picotool).
[See README here](https://github.com/raspberrypi/picotool)

### pico-project-xyz

Your copy of this template repository with your project name.

The following is a description of the directories in this repo.

#### app

This directory is for the documentation, implementation and testing of your project.  This is the directory you would be doing your work in.  The app directory contains the following directories

- docs
    - for project documentation
- src
    - for project src
- tests
    - for project testing/unittests

#### tools
- cmake
    - The cmake shell scripts are a collection of commands for using cmake to configure and build pico series projects using the sdk.  The scripts are a consolidation and customization of the cmake command examples found in the documentation from [https://www.raspberrypi.com/documentation/](https://www.raspberrypi.com/documentation/).
    - The scripts should be run from the root of your project directory, i.e. same location as this README.
    - **Note: All scripts have only been used/tested on WSL2 to date.**  
    - They should work just fine on any Unix based platform.
- ozone
    - This directory holds Ozone project files for the app and a few pico-examples.

## Using the ./tools/cmake scripts

CMake has a two step process; configure then build.  Once you configure, only build needs to be used unless you clean or add new files, etc.

All scripts should be run from the root of your project directory, i.e. same location as this README.

Scripts must be made executable by using
- chmod +x script.sh

### Notes on Configuring
- The config script configures cmake build with given build type, directory and board.
- The build type, directory and board arguments are required.  
- For projects using Bluetooth, the mode can be passed in as the 4th argument and the 5th argument must be - NULL (don't type in NULL, just don't enter a fifth arg).
- Bluetooth stack operating modes are; background, poll, or freertos.
- For projects using wifi, the ssid and pwd can be passed as the 4th and 5th args

### Basic examples 

#### Configure

- ./tools/cmake/config.sh Debug pico-examples pico(_w)
or
- ./tools/cmake/config.sh Debug app pico(_w)

#### Build

- ./tools/cmake/build.sh Debug pico-examples
or
- ./tools/cmake/build.sh Debug app

#### Clean

- ./tools/cmake/clean.sh Debug pico-examples
or
- ./tools/cmake/clean.sh Debug app

