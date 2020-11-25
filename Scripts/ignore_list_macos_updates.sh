#!/bin/bash

# Defines whether to reset the current softwareupdate ignore list.
# Expected result is "yes", anything else is interpreted as a "no".
# Jamf Pro script parameter: "Reset softwareupdate Ignore List"
resetIgnoreList="$4"
# List all desired ignored software updates here, one per variable. Blank
# variables will be skipped.
# Jamf Pro script parameters: "Ignored Update 1", "Ignored Update 2", etc.
updateBlacklist=(
  "$5"
  "$6"
  "$7"
  "$8"
  "$9"
)


# Initialize softwareupdate ignore list.
if [ "$resetIgnoreList" = "yes" ]; then
  /usr/sbin/softwareupdate --reset-ignored
fi


# Add blacklisted items to softwareupdate ignore list.
for update in "${updateBlacklist[@]}"; do
  if [ -n "$update" ]; then
    /usr/sbin/softwareupdate --ignore "$update"
  fi
done

exit 0