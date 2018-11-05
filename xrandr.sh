#!/bin/sh
xrandr --output HDMI3 --off --output HDMI2 --mode 1920x1080 --pos 1680x0 --rotate normal --output HDMI1 --off --output VIRTUAL1 --off --output DP1 --mode 1680x1050 --pos 0x0 --rotate normal
pactl set-card-profile 0 output:analog-stereo && pkill -RTMIN+2 i3blocks