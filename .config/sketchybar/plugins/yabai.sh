#!/bin/bash

space_number=$(yabai -m query --spaces --display | jq 'map(select(."focused" == 1))[-1].index')
yabai_mode=$(yabai -m query --spaces --display | jq -r 'map(select(."focused" == 1))[-1].type')

sketchybar -m --set yabai label="$space_number:$yabai_mode"
