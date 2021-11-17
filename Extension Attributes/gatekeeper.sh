#!/bin/bash

GKVersion=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" /private/var/db/gkopaque.bundle/Contents/Info.plist)

echo "<result>$GKVersion</result>"