#!/bin/bash

# Use this in an extension attribute
serial_number=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

echo "<result>serial_number</result>"