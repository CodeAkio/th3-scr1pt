#!/bin/bash


# Function to display usage of the script
usage() {
  echo "Usage: $0 --ip <ip-address> --port <port1,port2,...>"
  echo "       $0 --ip <ip-address> -p <port1,port2,...>"
  echo "       $0 -h | --help"
  exit 1
}

# Initialize variables for IP and Port
IP=""
PORT=""

# Process arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
    --ip) IP="$2"; shift ;;
    --port|-p) PORT="$2"; shift ;;
    -h|--help) usage ;;
    *) usage ;;
  esac
  shift
done

# Check if IP and Port were provided
if [ -z "$IP" ] || [ -z "$PORT" ]; then
  usage
fi

# Execute the nmap command with the provided parameters
echo "Running nmap for IP $IP on ports $PORT..."
nmap -sV -p "$PORT" "$IP"
