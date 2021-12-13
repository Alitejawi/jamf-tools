#!/bin/bash

/usr/libexec/mdmclient QuerySecurityInfo | /usr/bin/grep -c "SecureBootLevel = full"

# If the result is not 1, this is a finding.
# Boot into Recovery Mode and enable Full Secure Boot