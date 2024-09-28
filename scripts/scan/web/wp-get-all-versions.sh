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

# Fetch the page, look for versioned assets, and extract details
curl -H 'Cache-Control: no-cache, no-store' -L -ik -s "$URL" \
| grep http | grep -E '?ver=' \
| sed -E 's,href=|src=,THIIIIS,g' \
| awk -F "THIIIIS" '{print $2}' \
| cut -d "'" -f2 \
| while read line; do
    # Extract the path and version
    path=$(echo "$line" | sed -E 's,.*/wp-content/(plugins|themes|uploads|includes)/([^?]+)\?ver=([0-9.]+).*,\1/\2 - \3,')
    
    # Only print valid paths with versions
    if [[ $path != "$line" ]]; then
        # Clean up extra attributes if present
        echo "$path" | sed 's/"[^"]*//g'
    fi
done