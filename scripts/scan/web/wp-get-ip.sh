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

# Get the base URL from the argument and add the suffix
URL="$2/wp-json/wp/v2/pages"

# Execute curl to fetch the page content and filter IP addresses
curl -s "$URL" | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}'

# Check if grep found any IP addresses
if [ $? -ne 0 ]; then
  echo "No IP address found at URL: $2"
fi