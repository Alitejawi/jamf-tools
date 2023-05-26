# Filter the log messages to only include ones that contain the string 'progress'

sudo log stream --predicate "processImagePath Contains[c] 'softwareupdate' AND eventMessage Contains[c] 'progress'"