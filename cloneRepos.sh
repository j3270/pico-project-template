#!/bin/bash

git clone https://github.com/RaspberryPi/pico-examples --recurse-submodules
git clone https://github.com/RaspberryPi/pico-sdk --recurse-submodules
git clone -b smp https://github.com/FreeRTOS/FreeRTOS-Kernel --recurse-submodules