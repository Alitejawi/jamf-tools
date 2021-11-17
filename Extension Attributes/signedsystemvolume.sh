#!/bin/bash

SSVstatus=$(csrutil authenticated-root | awk -F " " '{print $NF}')

echo "<result>SSVstatus</result>"