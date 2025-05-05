#!/bin/bash

# Get HDMI status
HDMI_STATUS1=$(xrandr | grep "HDMI-1 connected")
HDMI_STATUS2=$(xrandr | grep "HDMI-2 connected")

if [ -n "$HDMI_STATUS1" ]; then
    # HDMI1 external monitor is connected
    xrandr --output eDP-1 --off --output HDMI-2 off --output HDMI-1 --auto --primary
else if [ -n "$HDMI_STATUS2" ]; then
    # HDMI1 external monitor is connected
    xrandr --output eDP-1 --off --output HDMI-1 off --output HDMI-2 --auto --primary
else
    # External monitor is disconnected
    xrandr --output eDP-1 --auto --primary --output HDMI-1 --off --output HDMI-2 --off
fi
