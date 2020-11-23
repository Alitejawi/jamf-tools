#!/bin/bash

# Get the ID of the logged in user
UUID=$(id -u $(logname))
echo "User $(logname): $UUID"

# Loop through parameters set in Jamf (4 - 11)
for Command in "${@:4}"; do
    # Skip empty commands
    [ -z "$Command" ] && continue

    echo "Running: $Command as $(logname)"
    sudo -u $(logname) $Command
done