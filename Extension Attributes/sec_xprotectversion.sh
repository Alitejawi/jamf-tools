#!/bin/bash

# Authenticated Root MUST be enabled
xprotectstatus=$(/usr/bin/defaults read /Library/Apple/System/Library/CoreServices/XProtect.bundle/Contents/Info.plist CFBundleShortVersionString)

# Report result, use "<result>$defaulttype</result>" to have Jamf report only the result
echo "<result>$xprotectstatus</result>"