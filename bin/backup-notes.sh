#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
cd "$HOME"/obsidian-notes/"$USER"
git pull
git add .
git commit -m "Adding notes for $(date '+%d/%m/%Y')"
git status
git push
echo "🚀 🚀"
