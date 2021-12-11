#!/bin/bash

# Getting the logged in user

loggedInUser=$(logname)
#loggedInUser=$(/usr/bin/stat -f%Su "/dev/console")

echo "<result>$loggedInUser</result>"