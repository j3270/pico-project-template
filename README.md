# RaspberryPi Pico-series project template

As the title says, this repo is a project template for working with the RaspberryPi Pico-series of devices. 

The repo is a work in progress and I am still working on directory structure, so it is volatile.  Use with digression.

Currently, this repo includes the pico-sdk and pico-examples as submodules.  That was probably a mistake and any project that uses this template should probably just be added to a "workspace" directory that already has the sdk and examples cloned to its root to keep from duplicating them with each new project.  I will be updating the cmake scripts to support that next, so this is going to change.

Also, to use this repo I wouldn't clone it directly.  Thoughts are to either
- fork and change name of fork to project name, then clone the fork
    - Maybe to pull in changes to tools folder from upstream, IDK?
- or to just download as a zip and unzip in the "workspace" directory mentioned above

FreeRTOS would also go in the root of the "workspace" directory.

If you would like to use freeRTOS in your project, or build the examples with freeRTOS, clone the freeRTOS kernel synchronous multi-processing (SMP) branch to the root of your workspace directory like so,
````
git clone -b smp https://github.com/FreeRTOS/FreeRTOS-Kernel --recurse-submodules
````

This project template was developed using information found in the following documentation;

[Getting started with Raspberry Pi Pico-series](https://datasheets.raspberrypi.com/pico/getting-started-with-pico.pdf)
- Doesn't hurt to read the whole thing, however, the following sections I found most useful
    - Chapter 1. Introduction
    - Appendix B: Picotool
    - Appendix C: Manual toolchain setup

[Raspberry Pi Pico-series C/C++ SDK](https://datasheets.raspberrypi.com/pico/raspberry-pi-pico-c-sdk.pdf)
- Still need to read, looks like there is a wealth of info here
- Really need to look at the CMake sections to see what I can learn and improve in my scripts and project template.

[Connecting to the Internet with Raspberry Pi Pico W](https://datasheets.raspberrypi.com/picow/connecting-to-the-internet-with-pico-w.pdf)
- Brief easy read like the getting started one, but for pico_w and introduces connecting to wifi and basics of Bluetooth

**Note: All scripts have only been used/tested on WSL2 to date.**  They should work just fine on any Unix based platform.

The directory structure is as follows,

## app

This directory is for an embedded application based on the RaspberryPi Pico-series of devices.  The app directory contains the following directories

- docs
    - for project documentation
- src
    - for project src
- tests
    - for project testing/unittests

This is the directory you would be doing your work in.

## FreeRTOS-Kernel

Synchronous multiprocessing (SMP) branch of the FreeRTOS Kernel.
[See README here](https://github.com/FreeRTOS/FreeRTOS-Kernel)

## pico-examples

Examples for the RaspberryPi Pico-series using the pico-sdk.
[See README here](https://github.com/raspberrypi/pico-examples)

## pico-sdk

Software Development Kit for the RaspberryPi Pico-series.
[See README here](https://github.com/raspberrypi/pico-sdk)

## tools

- cmake
    - The cmake shell scripts are a collection of commands for using cmake to configure and build pico series projects using the sdk.  The scripts are a consoledation and customization of the cmake command examples found in the documentation from [https://www.raspberrypi.com/documentation/](https://www.raspberrypi.com/documentation/).
    - The scripts should be run from the root of this repo, i.e. same location as this README.
- ozone
    - This directory holds Ozone project files for the app and a few pico-examples.
