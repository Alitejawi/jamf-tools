#!/bin/bash

# Variables
fdeList=$(/usr/bin/fdesetup list | /usr/bin/awk -F',' '{print $1}')

# Report result, use "<result>$defaulttype</result>" to have Jamf report only the result
echo "<result>$fdeList</result>"