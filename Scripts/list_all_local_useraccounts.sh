#!/bin/bash

# List all users on the machine with local accounts and UIDs between 501 and 999, excluding cached AD mobile accounts. Use this as an extension attribute to report local user accounts
 dscl . list /Users UniqueID | awk '$2 > 500 && $2 < 1000 { print $1 }'