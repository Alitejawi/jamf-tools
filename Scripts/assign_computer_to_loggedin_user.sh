#!/bin/bash

# Get the user logged in
loggedInUser=$(logname)
#loggedInUser=$(/usr/bin/stat -f%Su "/dev/console")

# Update Jamf Pro inventory, assign to currently logged-in user
/usr/local/bin/jamf recon -endUsername "$loggedInUser"