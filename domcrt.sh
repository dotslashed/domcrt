#!/bin/bash

echo "[+]Enter your domain name in example.com format"

read DOMAIN

echo "[+]Calculating the subdomains..."

sleep 5

curl -sk "https://crt.sh/?q=$DOMAIN" | grep -oE "[a-zA-Z0-9._-]+\.$DOMAIN" | sed -e '/[A-Z]/d' -e '/*/d' | grep -oP '[a-z0-9]+\.[a-z]+\.[a-z]+'

#ALTERNATE WAY:

#curl -s https://crt.sh/\?q=%25.target.com\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | tee file_name.txt
