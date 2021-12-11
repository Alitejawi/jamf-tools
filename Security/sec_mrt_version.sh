#!/bin/bash

# Authenticated Root MUST be enabled
mrtstatus=$(/usr/bin/defaults read /Library/Apple/System/Library/CoreServices/MRT.app/Contents/Info.plist CFBundleShortVersionString)

# Report result, use "<result>$defaulttype</result>" to have Jamf report only the result
echo "<result>$mrtstatus</result>"