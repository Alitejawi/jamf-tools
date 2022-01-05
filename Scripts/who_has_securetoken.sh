#!/bin/bash

AllUsers=$(dscl . list /Users | grep -v _)

for EachUser in $AllUsers; do

TokenValue=$(sysadminctl -secureTokenStatus "$EachUser" 2>&1)
    echo "Checking $EachUser"

	if [[ $TokenValue = *"ENABLED"* ]]; then
        SecureTokenUsers+=("$EachUser")
	fi
done

    if [[ -z "${SecureTokenUsers[@]}" ]]; then
        echo "<result>No Users</result>"
	        else
                printf '%s,' '<result>'"${SecureTokenUsers[@]}"'</result>'
    fi

exit