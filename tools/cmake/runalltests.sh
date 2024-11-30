#!/bin/bash

set -x

./tests/build/helloworld/helloworld_tests -c
./tests/build/j3core/components/components_tests -c
./tests/build/j3core/devices/devices_tests -c 
./tests/build/j3core/utilities/utilities_tests -c 