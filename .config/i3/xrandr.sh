#!/bin/sh

DP1=$(xrandr | grep -o -P 'DP-1 con')
HDMI0=$(xrandr | grep -o -P 'HDMI-0 con')

if [[ "$DP1" != "" ]] && [[ "$HDMI0" != "" ]]; then
  echo "both connected"
  xrandr --output HDMI-0 --mode 1920x1080 --pos 0x180 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 4480x180 --rotate normal --output DP-1 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output DP-2 --off
elif [[ "$DP1" = "connected" ]]; then
  echo "DP1 connected"
  xrandr --output HDMI-0 --off --output eDP-1-1 --mode 1920x1080 --pos 2560x180 --rotate normal --output DP-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2 --off
else
  echo "Integrated only"
  xrandr --output HDMI-0 --off --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off
fi
