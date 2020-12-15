#!/bin/bash

echo "<result>$(/usr/sbin/system_profiler SPiBridgeDataType | /usr/bin/awk -F ': ' '/Model Name/ {print $NF}')</result>"