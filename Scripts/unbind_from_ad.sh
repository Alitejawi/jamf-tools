#!/bin/bash

# Script to unbind machine from Active Directory, using the leave option
# This will preserve the computer record in AD
/usr/sbin/dsconfigad -leave

echo "Restarting Directory Services..."
/usr/bin/killall DirectoryService

# You can use the -force flag to not require a working connection to AD to be needed to complete the unbind.
# Note that real AD credentials are not required for a force-unbind. Uncomment the line below to destroy the computer record in Active Directory
# /usr/sbin/dsconfigad -remove -username "username" -password "password" -force