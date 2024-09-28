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

# Fetch the page content and extract the WordPress version
curl -s "$URL" | grep -oP '(?<=content="WordPress )[^"]+'

# Check if grep found the WordPress version
if [ $? -ne 0 ]; then
  echo "No WordPress version found at URL: $2"
fi
