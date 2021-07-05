#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DIR="$(dirname "${BASH_SOURCE[0]}")"

source "${DIR}/get-chrome.sh"

google-chrome-stable --disable-session-crashed-bubble --chrome --force-device-scale-factor=1.5 --user-data-dir=.config/chromium-for-work/ &
