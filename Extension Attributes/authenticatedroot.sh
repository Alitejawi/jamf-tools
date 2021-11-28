#!/bin/bash

# Authenticated Root MUST be enabled
authrootstatus=$(/usr/bin/csrutil authenticated-root)

# Report result, use "<result>$defaulttype</result>" to have Jamf report only the result
echo "<result>$authrootstatus</result>"