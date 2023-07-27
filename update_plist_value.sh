# Function to update plist value
update_plist() {
    local key="$1"
    local value="$2"
    local plist_file="$3"
    /usr/bin/defaults write "$plist_file" "$key" -int "$value"
}
