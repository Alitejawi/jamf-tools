#!/bin/bash

# Script to unbind machine from Active Directory, using the leave option
# This will preserve the computer record in AD
/usr/sbin/dsconfigad -leave

echo "Restarting Directory Services..."
/usr/bin/killall DirectoryService