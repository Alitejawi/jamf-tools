#!/bin/sh

# Get desired setting with default to 300
[ -z $4 ] && DESIREDTIME=300 || DESIREDTIME=$4

# Check current settings
CURRENTTIME=$(/usr/bin/sudo -u $(logname) defaults -currentHost read com.apple.screensaver idleTime)
[ $? -ne 0 ] && CURRENTTIME=1000000
[ -z $CURRENTTIME ] && CURRENTTIME=2000000
[ $CURRENTTIME -eq 0 ] && CURRENTTIME=3000000

if [ $CURRENTTIME -eq 1000000 ]; then
    /usr/bin/sudo -u $(logname) defaults -currentHost write com.apple.screensaver idleTime -int $DESIREDTIME
    echo "Screensaver: Error, Presummed not set, Set first value to  $DESIREDTIME"
    
    # Restart the cfpresd to update the preference
	sudo killall cfprefsd
	
    exit 0
fi

if [ $CURRENTTIME -eq 2000000 ]; then
    /usr/bin/sudo -u $(logname) defaults -currentHost write com.apple.screensaver idleTime -int $DESIREDTIME
    echo "Screensaver: Unexplained erorr, Set first value to $DESIREDTIME"
    
    # Restart the cfpresd to update the preference
	sudo killall cfprefsd
	
    exit 0
fi

if [ $CURRENTTIME -eq 3000000 ]; then
    /usr/bin/sudo -u $(logname) defaults -currentHost write com.apple.screensaver idleTime -int $DESIREDTIME
    echo "Screensaver: Set to NEVER, Set value to $DESIREDTIME"
    
    # Restart the cfpresd to update the preference
	sudo killall cfprefsd
	
    exit 0
fi

if [ $CURRENTTIME -gt $DESIREDTIME ]; then
    # Write the new value
	/usr/bin/sudo -u $(logname) defaults -currentHost write com.apple.screensaver idleTime -int $DESIREDTIME
	echo "Screensaver: Set from $CURRENTTIME to $DESIREDTIME"
	
	# Restart the cfpresd to update the preference
	sudo killall cfprefsd
else
	echo "Screensaver: Already set to $CURRENTTIME"
fi

exit 0

