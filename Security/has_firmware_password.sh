#!/bin/bash

FWpassword=$(/usr/sbin/firmwarepasswd -check | /usr/bin/awk '/Enabled/ {print $NF}')

echo "<result>$FWpassword</result>"