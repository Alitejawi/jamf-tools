#!/bin/bash

# Prevent Time Machine from Prompting to Use New Hard Drives as Backup Volume
defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
