#!/bin/bash

kextList=$(/usr/sbin/kextstat -l | grep -v 'com.apple' | awk '{print $6}' | sort)

echo "<result>$kextList</result>"