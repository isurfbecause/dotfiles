#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DIR="$(dirname "${BASH_SOURCE[0]}")"

source "${DIR}/get-chrome.sh"
get_chrome --disable-session-crashed-bubble --chrome --force-device-scale-factor=1.5 --user-data-dir=.config/chromium-for-calendar/ --app=https://calendar.google.com/calendar/u/0/r/week &
