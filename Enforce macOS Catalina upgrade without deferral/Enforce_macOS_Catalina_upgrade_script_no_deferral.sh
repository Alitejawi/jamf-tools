#!/bin/sh

#set -x

tput reset
printf '\e[3J'

##########################################################################################
# Booking.com
# Author: Ali Al-Itejawi
#
# Script to force the user to upgrade and bring them to the latest OS
#
# Versions
# 1.	Script to inform the user to upgrade and bring them to Self Service
#
#
##########################################################################################
#
# Exit Codes
#	0. Success/Help
# 2. Root privileges not given
# 3. Failed to download package
# 4. Failed to install package
# 5. No upgrade required
##########################################################################################

##########################################################################################
# Traps
################

ExitTrap () {

	printf $2
	# Exit code/cleanup

	# Clean up tmpdir
	rm -rf "$TMPDIR" || printf "Error removing temporary directory $TMPDIR\n"

	# Restore formatting
	printf "${KNRM}"

	# Restore the cursor
	tput cnorm

	#printf "Exiting $1\n"
	exit $1
}
trap 'ExitTrap $? $LINENO' INT EXIT TERM

ErrorTrap () {

	printf Error on line $2 with error $1

}
trap 'ErrorTrap $? $LINENO' ERR

##########################################################################################
# Environment setup
################
# Global Variables
BASEPATH="$(dirname $0)"
BASENAME="$(basename $0)"
MINIMAL_VERSION=${4:-15}
LATEST_OS=${5:-15}
CURRENT_OS=$(sw_vers -productVersion | cut -d '.' -f 2)
INSTALL_PACKAGE=${6:-Install_macOS_Catalina10156full.pkg}
AWS_URL=${7:-AWS_URL_HERE}
OS_FLAG_LOCATION=/tmp/os_flag_location_$LATEST_OS
FREESPACEGIGSBLOCKS=$(df / | tail -n 1 | tr -s "[:space:]" ':' | cut -d: -f 4)
REQUIREDFREESPACEGIGSBLOCKS=41943040
FREESPACEGIGS=$(df -h / | tail -n 1 | tr -s "[:space:]" ':' | cut -d: -f 4)

# Create temporary and working directory
WRKDIR="$TMPDIR"
TMPDIR="/tmp/$BASENAME."$(openssl rand -hex 12)
mkdir -p -m 777 "$TMPDIR"

# Colours
KNRM="\x1B[0m"
KRED="\x1B[31m"
KGRN="\x1B[32m"
KYEL="\x1B[33m"
KBLU="\x1B[34m"
KMAG="\x1B[35m"
KCYN="\x1B[36m"
KWHT="\x1B[37m"

KBLD="\033[1m"
KNRM="\033[0m"

# Default values
LOGGING=0

# Turn off line wrapping:
#printf '\033[?7l'
# Turn on  line wrapping:
#printf '\033[?7h'

# Set window size ex. 100w x 40h
#printf '\033[8;40;100t'

# Set window Title
printf "\033]0;${BASENAME%%.*}\007"

# Hide the cursor for the run of the script
tput civis

##########################################################################################
# Functions
################


##########################################################################################
# Main
################
printf "Upgrading any version from %d to %d\n" $MINIMAL_VERSION $LATEST_OS
printf "Current version is $CURRENT_OS\n"
printf "Minimum version required is $MINIMAL_VERSION\n"
printf "Latest version is $LATEST_OS\n"
printf "Currently installed OS is $CURRENT_OS\n"
printf "The URL in AWS is $AWS_URL\n"
printf "Available disk space is $FREESPACEGIGS\n"

# Check available disk space
    printf "Checking available disk space on /... "
    
    if [ $FREESPACEGIGSBLOCKS -gt $REQUIREDFREESPACEGIGSBLOCKS ]; then
        echo "$FREESPACEGIGS left, continuing"
    else
        echo "only $FREESPACEGIGS left,"' abandoning download!'
        exit 64
    fi

# Getting the current time in seconds
NOW=$(date -j -f "%a %b %d %T %Z %Y" "$(date)" "+%s")

if [ ! -e $OS_FLAG_LOCATION ]; then
	printf "Prompting the user to upgrade\n"
	RESPONSE=$(/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper \
			-windowType hud \
			-windowPosition lr \
			-heading "macOS Upgrade Starting" \
			-description 'Your operating system upgrade is going to begin now. Please save your work, quit all applications and click Start Upgrade when ready.'$'\n\n''The upgrade takes about 45 mins and you will not be able to use your computer during this time. After cicking Start, allow for your machine to reboot by itself, which usually happens in 3 minutes' \
			-lockHUD \
			-button1 "Start" \
			-alignHeading left \
			-alignCountdown center \
			-icon "/Applications/Install macOS Catalina.app/Contents/Resources/DarkProductPageIcon.icns" \
			-iconSize 256 \
			-timeout 600 \
			-countdown \
			)
	echo "Final reminder closed: beginning upgrade..."

	if [ $RESPONSE -eq 0 ]; then
		"/Applications/Install macOS Catalina.app/Contents/Resources/startosinstall" --agreetolicense --forcequitapps
	else
		printf "Apologies, an error occured. Please contact your IT Support for assistance\n"
	fi

	if [ $? -ne 0 ]; then
		printf "Apologies, an error occured. Please contact your IT Support for assistance\n"
	fi

fi


exit 0
