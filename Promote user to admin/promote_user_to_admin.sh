#!/bin/bash

# Convert the logged in user to admin user

# You can use either of these 2 options below, as $logname should always returns the correct value
#loggedInUser=$logname
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

/usr/sbin/dseditgroup -o edit -a $loggedInUser -t user admin