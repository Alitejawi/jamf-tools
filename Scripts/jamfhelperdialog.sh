#!/bin/bash

export PATH=/usr/bin:/bin:/usr/sbin:/sbin

consoleUser() {
	echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }'
}

displaydialog() { # $1: message
    message=${1:-"Message"}
	user=$(consoleUser)
    if [[ $user != "" ]]; then
        uid=$(id -u "$user")
		launchctl asuser $uid /usr/bin/osascript <<-EndOfScript
			button returned of ¬
			    (display dialog "$message" ¬
				buttons {"OK"} ¬
				default button "OK")
		EndOfScript
	fi
}

displaydialog "Hello"