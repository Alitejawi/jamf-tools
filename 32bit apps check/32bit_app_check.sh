#!/bin/bash

# Displays all apps installed using the 32-bit architecture
system_profiler SPApplicationsDataType | grep -A2 -i "64-Bit.*No"|sed -n "s:^.*Location\:\(.*\):\1:p"|sort -n