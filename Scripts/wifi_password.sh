#!/bin/bash

airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

# get current ssid
ssid="`$airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'`"

# get keychain access
pwd="`security find-generic-password -D 'AirPort network password' -ga \"$ssid\" 2>&1 >/dev/null`"

# password cleanup
pwd=$(echo "$pwd" | sed -e "s/^.*\"\(.*\)\".*$/\1/")

# copy the password
echo $pwd | pbcopy

# print
echo "Password $pwd is copied!"
