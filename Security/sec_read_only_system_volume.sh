#!/bin/bash

/usr/sbin/system_profiler SPStorageDataType | /usr/bin/awk '/Mount Point: \/$/{x=NR+2}(NR==x){print $2}'

# If the result is not No, this is a finding.
# To remount the System volume as Read Only, rebooting the computer will mount it as Read Only.