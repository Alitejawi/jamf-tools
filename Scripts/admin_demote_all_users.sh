#!/bin/bash

accountskips="GroupMembership: "

for arg in "${@:4}"; do
	accountskips="accountskips | $arg "
done

# Get a list of admins excluding accounts
adminusers=$(dscl . read /Groups/admin GroupMembership)
filteredlist=$(echo "$adminusers "|sed -E "s/$accountskips//g")

# for each admin
if [ "$filteredlist" != "" ]; then
	echo "Removing admins"

	for admin in $filteredlist; do
		echo ">> $admin"
			echo "Removing $admin"
			dscl . delete /Groups/admin GroupMembership "$admin"
			[ $? -ne 0 ] && syslog -s -l notice "Jamf: User \"$admin\" demoted from to Admin" || syslog -s -l notice "Jamf: User \"$admin\" not admin or could not be removed"
	done
else
	echo "No admins on computer"
fi

exit 0