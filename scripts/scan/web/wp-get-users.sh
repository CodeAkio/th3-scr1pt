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

# Fetch the users from the WordPress API
curl -s "$URL/wp-json/wp/v2/users" | jq '.[] | {ID: .id, Name: .name, Username: .slug, URL: .link}'