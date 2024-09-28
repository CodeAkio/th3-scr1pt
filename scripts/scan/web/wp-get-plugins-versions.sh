#!/bin/bash

# Function to display correct script usage
function show_usage() {
  echo "Usage: $0 --url URL"
  exit 1
}

# Check if the correct parameters are provided
if [ "$1" != "--url" ] || [ -z "$2" ]; then
  show_usage
fi

# Get the base URL from the argument
URL="$2"

# Fetch the page, look for plugin paths, and extract plugin versions or details
curl -H 'Cache-Control: no-cache, no-store' -L -ik -s "$URL" \
| grep -E 'wp-content/plugins/' \
| sed -E 's,href=|src=,THIIIIS,g' \
| awk -F "THIIIIS" '{print $2}' \
| cut -d "'" -f2 \
| while read line; do
    # Extract the path after 'wp-content/plugins/' and version after '?ver='
    plugin_path=$(echo "$line" | sed -E 's,.*/wp-content/plugins/([^?]+)\?ver=([0-9.]+).*,\1 - \2,')
    # Only print if the line has valid output and exclude extra attributes
    if [[ $plugin_path != "$line" ]]; then
        echo "$plugin_path" | sed 's/"[^"]*//g' # Remove everything after the version
    fi
done