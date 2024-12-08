#!/bin/bash

# Recebe o IP como argumento (por exemplo, 192.168.1.2)
IP="$1"

if [ -z "$IP" ]; then
  echo "Uso: $0 <endereco-ip> (exemplo: 192.168.1.2)"
  exit 1
fi

# Executa o rustscan
if [[ "$IP" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Executando rustscan no IP: $IP"
  rustscan -a "$IP" --ulimit 5000 -- -sS -Pn -v -T4
fi
