#!/bin/bash

# The built-in web server is a non-essential service built into macOS and MUST be disabled.

# Check if it is enabled
/bin/launchctl print-disabled system | /usr/bin/grep -c '"org.apache.httpd" => true'
# If the result is not 1, this is a finding.

# Let's disable it
sudo /bin/launchctl disable system/org.apache.httpd