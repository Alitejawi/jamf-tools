# Periodical Job Template

###  Run job every 5 minutes

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.example.filenamehere</string>
    <key>ProgramArguments</key>
    <array>
        <string>touch</string>
        <string>/tmp/helloworld</string>
    </array>
    <key>StartInterval</key>
    <integer>300</integer>
</dict>
</plist>
```

### Periodical via Calendar Interval Job Template
###### Every Sunday at 13.45
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.example.touch_some_files</string>
    <key>ProgramArguments</key>
    <array>
        <string>touch</string>
        <string>/tmp/helloworld</string>
    </array>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Minute</key>
        <integer>45</integer>
        <key>Hour</key>
        <integer>13</integer>
        <key>Day</key>
        <integer>7</integer>
    </dict>
</dict>
</plist>
```

### Monitoring Folder Job Template
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.example.watchhostconfig</string>
    <key>ProgramArguments</key>
    <array>
        <string>syslog</string>
        <string>-s</string>
        <string>-l</string>
        <string>notice</string>
        <string>somebody touched /etc/hostconfig</string>
    </array>
    <key>WatchPaths</key>
    <array>
        <string>/etc/hostconfig</string>
    </array>
</dict>
</plist>
```
