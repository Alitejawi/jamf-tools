#!/bin/bash

# Kill xagt processes
if pgrep -f xagt; then
    echo "Killing xagt processes"
    pkill -9 xagt
else
    echo "No xagt processes running"
fi

# Unload LaunchDaemon
if [[ -e /Library/LaunchDaemons/com.fireeye.xagt.plist ]]; then
    echo "Unloading launchdaemon"
    launchctl unload /Library/LaunchDaemons/com.fireeye.xagt.plist
else
    echo "No launchdaemon loaded"
fi

# Manual removal of related files, loop through the paths set below in xagt_paths
xagt_paths=( "/Library/FireEye" "/Library/LaunchDaemons/com.fireeye.xagt.plist" "/Library/LaunchAgents/com.fireeye.xagtnotif.plist" "/Library/Application Support/FireEye" "/Library/Extensions/FireEye.kext")
for xagt_path in "${xagt_paths[@]}"; do
    if [ -e "$xagt_path" ]; then
        echo "Deleting $xagt_path"
        rm -rf "$xagt_path"
    else
    	echo "$xagt_path does not exist"
    fi
done

echo "Done"
exit