#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
cd "$HOME"/notes
git pull
git add .
git status
git commit -m "Adding notes for $(date '+%m/%d/%Y')"
git push
echo "🚀 🚀"
