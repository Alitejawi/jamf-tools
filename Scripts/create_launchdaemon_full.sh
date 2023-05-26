#!/bin/bash

cat << EOF > /Library/LaunchDaemons/com.org.mydaemon.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.org.mydaemon</string>
    <key>ProgramArguments</key>
    <array>
        <string>/path/to/script</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF

chmod 644 /Library/LaunchDaemons/com.org.mydaemon.plist
chown root:wheel /Library/LaunchDaemons/com.org.mydaemon.plist

/bin/launchctl load /Library/LaunchDaemons/com.org.mydaemon.plist