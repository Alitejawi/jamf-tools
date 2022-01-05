#!/bin/bash

for application in /Applications/*.app;
do
    /usr/bin/codesign -dv "${application}" &>> /tmp/codes
done
grep -B3 'none' /tmp/codes | grep ^Executable | sed 's/^Executable=/No Hardened Runtime: /g'

/bin/rm -rf /tmp/codes


#for i in /Applications/*.app; do codesign -dv "${i}" &>> /tmp/codes; done; grep -B3 'none' /tmp/codes | grep ^Executable | sed 's/^Executable=/No Hardened Runtime: /g'; rm -rf /tmp/codes