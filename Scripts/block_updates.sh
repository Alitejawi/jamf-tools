#!/bin/bash

# Ignore the title of the software update, specify this in parameter $4 in Jamf
/usr/sbin/softwareupdate --ignore "$4"

# Remove the red notification dot above the System Preferences (must be run as user)
sudo -u logname /usr/bin/defaults write com.apple.systempreferences AttentionPrefBundleIDs -int 0