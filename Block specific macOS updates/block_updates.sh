#!/bin/bash

# Get logged in user
consoleUser=$logname

# Ignore the title of the software update, specify this in parameter $4 in Jamf
softwareupdate --ignore "$4"

# Remove the red notification dot above the System Preferences (must be run as user)
sudo -u "$logname" defaults write com.apple.systempreferences AttentionPrefBundleIDs -int 0