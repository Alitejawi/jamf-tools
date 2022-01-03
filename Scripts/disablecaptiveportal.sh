#!/bin/bash

When macOS connects to new networks, it checks for Internet connectivity and may launch a Captive Portal assistant utility application.

# An attacker could trigger the utility and direct a Mac to a site with malware without user interaction, so it's best to
# disable this feature and log in to captive portals using your regular Web browser by navigating to a non-secure HTTP page
# and accepting a redirect to the captive portal login interface (after disabling any custom proxy or DNS settings).

/usr/bin/defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false