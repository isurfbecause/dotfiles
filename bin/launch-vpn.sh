#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

VPN_CONFIG_DIR="$HOME/$USER.tblk"
DATA_CIPHERS='AES-256-GCM:AES-128-GCM:BF-CBC'

sudo killall openvpn || true

cd "$VPN_CONFIG_DIR"
VPN_COMMAND="sudo openvpn --config $USER.ovpn --data-ciphers $DATA_CIPHERS &"

sh -c "$VPN_COMMAND"
