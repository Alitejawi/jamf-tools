#!/bin/bash

# Check if the firmware password has been set
if [[ $(/usr/sbin/firmwarepasswd -check | cut -f2- -d':' | tr -d ' ') == "No" ]]; then
  echo "Firmware password has already been set, unset first to create a new one"
  exit 1
else
  echo "Password set"
fi