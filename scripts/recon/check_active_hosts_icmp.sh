# Initialize the network array
networks=()

# Process command line parameters
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    -f|--file)
      if [[ -f "$2" ]]; then
        while IFS= read -r line; do
          networks+=("$line")
        done < "$2"
        shift 2
      else
        echo "Error: File not found: $2"
        exit 1
      fi
      ;;
    -n|--network)
      IFS=',' read -ra networks_param <<< "$2"
      networks+=("${networks_param[@]}")
      shift 2
      ;;
    -h|--help)
      show_usage
      ;;
    *)
      show_usage
      ;;
  esac
done

# Check if at least one network was provided
if [[ "${#networks[@]}" -eq 0 ]]; then
  show_usage
fi

# Output files
discovered_hosts="discovered_hosts.txt"
active_ips="active_ips.txt"

# Clear output files if they already exist
> "$discovered_hosts"
> "$active_ips"

# Discover active hosts in the specified networks
echo "Discovering active hosts in the networks..."
for network in "${networks[@]}"; do
  fping -a -g "$network" 2>/dev/null >> "$discovered_hosts"
done

echo "Discovered hosts saved in: $discovered_hosts"

# Validate if the discovered hosts are actually active
echo "Checking connectivity of discovered hosts, this may take some time..."

# Counter for active IPs
active_count=0

# Loop to check each discovered IP
while IFS= read -r ip; do
  if ping -c 1 -W 1 "$ip" &> /dev/null; then
    echo " - $ip is active"
    echo "$ip" >> "$active_ips"
    ((active_count++))
  else
    echo "$ip is inactive"
  fi
done < "$discovered_hosts"

# Remove the discovered hosts file as it is no longer needed
rm -f "$discovered_hosts"

# Display the total number of active IPs
echo "Check completed. Total active IPs: $active_count"
echo "Active IPs saved in: $active_ips"
