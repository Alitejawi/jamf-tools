#!/bin/bash

# Delete Wi-Fi credentials stored in login.keychain for the logged in user
# Work in progress

####################
# Variables        #
####################

wifi_name=$(security dump-keychain /Users/$user/Library/Keychains/login.keychain | grep "name_of_the_wifi_network" | awk -F'["|"]' '/blob/{print $2}' | grep -E ^name_of_the_wifi_network)

if [[ $wifi_name == "name_of_the_wifi_network" ]]; then
	echo "Wi-Fi entry found in login.keychain, deleting to avoid conflict"
	security delete-generic-password -l $wifi_name /Users/$user/Library/Keychains/login.keychain > /dev/null 2>&1
else
	echo "entry not found in login.keychain, proceeding..."
fi


# Use the part below to delete Wi-Fi entries from the system.keychain
if [[ $wifi_name == "name_of_your_wifi_network" ]]; then
	echo "Wi-Fi entry found in system.keychain, deleting to avoid conflict."
	security delete-generic-password -l $wifi_name /Library/Keychains/system.keychain > /dev/null 2>&1
else
	echo "Entry not found in system.keychain, proceeding..."
fi