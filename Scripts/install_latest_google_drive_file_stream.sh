#!/bin/bash

# Set some Variables
SupportContactInfo="your system administrator."
dmgfile="GoogleDriveFileStream.dmg"
logfile="/Library/Logs/GoogleFileStreamInstallScript.log"
url="https://dl.google.com/drive-file-stream/GoogleDriveFileStream.dmg"
user=$logname

# Download Google DFS from Google servers
/bin/echo "`date`: Downloading the latest version of File Stream from Google's servers" >> ${logfile}
/usr/bin/curl -k -o /tmp/$dmgfile $url
/bin/echo "`date`: Mounting dmg file." >> ${logfile}
/usr/bin/hdiutil attach /tmp/$dmgfile -nobrowse -quiet

# Install from pkg
/bin/echo "`date`: Installing pkg" >> ${logfile}
/usr/sbin/installer -pkg /Volumes/Install\ Google\ Drive\ File\ Stream/GoogleDriveFileStream.pkg -target /

# Look for Google Drive and remove it
if [ -d /Applications/Google\ Drive.app/ ]; then
  /bin/echo "`date`: Found depricated version of Google Drive. Stopping Drive service." >> ${logfile}
  /usr/bin/osascript -e 'tell application "Google Drive" to quit'
  /bin/echo "`date`: Deleting Google Drive Application." >> ${logfile}
  rm -Rf /Applications/Google\ Drive.app/

# Cleanup Tasks
/bin/echo "`date`: Unmounting installer disk image." >> ${logfile}
/usr/bin/hdiutil detach $(/bin/df | /usr/bin/grep "Install Google File Stream" | awk '{print $1}') -quiet
/bin/echo "`date`: Deleting temp files." >> ${logfile}
rm -fv /tmp/$dmgfile
/bin/sleep 3
/bin/echo "`date`: Launching File Stream" >> ${logfile}
open -a /Applications/Google\ Drive\ File\ Stream.app/
/bin/echo "`date`: Finished." >> ${logfile}

exit 0