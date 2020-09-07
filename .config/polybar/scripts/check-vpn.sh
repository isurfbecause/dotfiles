#!/bin/bash
VPN_PROFILE=$(nmcli connection show --active | grep 'vpn' | cut -d ' ' -f 1)

if [ -n "${VPN_PROFILE}" ]; then
  echo "${VPN_PROFILE} "
else
  echo "vpn off "
fi
