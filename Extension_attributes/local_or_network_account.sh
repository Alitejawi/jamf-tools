#!/bin/bash

#loggedinuser=$logname
loggedInUser=$(/usr/bin/stat -f%Su "/dev/console")

# Check OriginalNodeName attribute to determine domain user status.
if /usr/bin/dscl . -read "/Users/$loggedInUser" OriginalNodeName 2>&1 | /usr/bin/grep -q "No such key"; then
  accountType="Local User"
else
  accountType="Domain User"
fi

# Report result.
echo "<result>$accountType</result>"

exit 0