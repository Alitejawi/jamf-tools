#!/bin/bash

# Convert the logged in user to admin user

# You can use either of these 2 options below, as $logname should always returns the correct value
#loggedInUser=$logname
loggedInUser=$(/usr/bin/stat -f%Su "/dev/console")

/usr/sbin/dseditgroup -o edit -a "$loggedInUser" -t user admin
echo "Granted admin privileges to $loggedInUser."




# Grant admin privileges to $loggedInUser.
#if /usr/bin/dscl . -read "/groups/admin" GroupMembership | /usr/bin/grep -q "$loggedInUser"; then
#  echo "$loggedInUser already has admin privileges, no action required."
#else
#  /usr/bin/dscl . -append "/groups/admin" GroupMembership "$loggedInUser"
#  echo "Granted admin privileges to $loggedInUser."
#fi

#exit 0