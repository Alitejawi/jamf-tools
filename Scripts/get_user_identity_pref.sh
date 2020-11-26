#!/bin/bash

#set -x

wifi=$name_of_wifi_network
identpref="com.apple.network.eap.user.identity.wlan.ssid.$wifi"
loguser=$logname
	printf "The current user is $loguser\n"

getident_result="$(sudo -u $loguser -i /usr/bin/security get-identity-preference -s $identpref -c 2>&1)"
	#printf "The result of get-pref-identity is $getident_result\n"

getident_success=$?
	printf "Successcode is $getident_success\n"
identcn=$(printf "%s" "$getident_result" | grep -i "common name:" | awk -F '[""]' '{print $2}') #sed 's:.*"\(.*\)":\1:')"
	printf  "The common name is $identcn\n"
cnextract_success=$?
	printf "Errorcode is $cnextract_success\n";


if [ $getident_success -eq 0 ]; then
	if [ $cnextract_success -ne 0 ]; then
	    result="$getident_result"
    else
    	result=$identcn
    fi
elif [ $getident_success -eq 44 ]; then
  	result='<None found>'
else
   	result="<None set> getidenterr = $getident_success"
fi

echo "The certificate used for this identity preference is $result"