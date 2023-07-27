#!/bin/bash

# Function to read plist value
read_plist() {
    local key="$1"
    local plist_file="$2"
    /usr/bin/defaults read "$plist_file" "$key"
}
