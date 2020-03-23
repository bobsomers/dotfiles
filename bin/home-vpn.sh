#!/usr/bin/env bash

# Toggle the VPN state based on whether it's currently enabled or disabled.
ip addr show dev wg0 >> /dev/null 2>&1
vpn_disabled=$(echo $?)
case "$vpn_disabled" in
  "0")
    echo "Disabling home VPN..."
    sudo wg-quick down wg0
    ;;
  "1")
    echo "Enabling home VPN..."
    sudo wg-quick up wg0
    ;;
esac

# Check that it worked.
external_ip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
home_ip="$(dig +short bobsomers.net)"
echo "External IP: $external_ip"
echo "Home IP: $home_ip"
case "$vpn_disabled" in
  "0")
    if [ "$external_ip" = "$home_ip" ]; then
      echo "Something doesn't look right (unless you're home right now)..."
    else
      echo "GOOD BYE"
    fi
    ;;
  "1")
    if [ "$external_ip" = "$home_ip" ]; then
      echo "WELCOME HOME"
    else
      echo "Something doesn't look right..."
    fi
    ;;
esac
