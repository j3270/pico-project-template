# RaspberryPi Pico-series project template

As the title says, this repo is a project template for working with the RaspberryPi Pico-series of devices. This project template was developed using information found in the following documentation;

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

Run the script **cloneRepos.sh**, which adds pico-sdk, examples and the FreeRTOS kernel.

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
    - This directory holds Ozone project files for the pico-examples that I have built and stepped through.  They can be used as examples for app debugging with Ozone.
