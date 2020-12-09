#!/bin/bash

# Unloading GlobalProtect LaunchAgents
launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangpa.plist
launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangps.plist

# Loading GlobalProtect LaunchAgents
launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangpa.plist
launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangps.plist

# You can also use the method below, because it just kills the process, but as the LaunchAgent has LaunchAtLoad, it will respawn the process
#killall GlobalProtect