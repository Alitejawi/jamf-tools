#!/bin/bash

# This command dumps the Device Information into a text file. You could use this in a runonce policy and scope it to only those that need it when you are troubleshooting mdm device issues
/usr/libexec/mdmclient QueryDeviceInformation > /tmp/mdm.txt