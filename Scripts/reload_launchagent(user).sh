#!/bin/zsh

# LaunchAgent label
launch_agent="com.example.test"

# Get the username of the currently logged in user
username=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ && ! /loginwindow/ { print $3 }')
# Get the username ID
uid=$(id -u "${username}")

# Reload the LaunchAgent

# Unload the LauchAgent
launchctl bootout gui/"${uid}" "/Library/LaunchAgents/${launch_agent}.plist" &> /dev/null

# Load the LaunchAgent
launchctl bootstrap gui/"${uid}" "/Library/LaunchAgents/${launch_agent}.plist"