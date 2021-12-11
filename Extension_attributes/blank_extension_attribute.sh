#!/bin/bash

# Variables
variable1=$(/usr/bin/stat -f%Su "/dev/console")

# Run your if statement
if <your_condition_goes_here> "return value of condition"; then
  defaulttype="result1"
else
  defaulttype="result2"
fi

# Report result, use "<result>$defaulttype</result>" to have Jamf report only the result
echo "<result>$accountType</result>"

# Exit script, not per sé needed
exit 0