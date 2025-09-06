#!/bin/sh

# Disable touchscreen
setdevprop "Elan Touchscreen" "Device Enabled" 0
# Disable Stylus
setdevprop "0117 eraser" "Device Enabled" 0
setdevprop "0117 Stylus eraser" "Device Enabled" 0
setdevprop "0117 stylus" "Device Enabled" 0
setdevprop "0117 Stylus stylus" "Device Enabled" 0

# See 'xinput list-props 12' for touchpad config

setdevprop "Elan Touchpad" "Natural Scrolling Enabled" 1
setdevprop "Elan Touchpad" "Tapping Enabled" 1

# Set keyboardmap
setxkbmap se

# Load previous temp
tempctl -l

# default audio setting
pamixer --set-volume 25
pamixer -m

# set theme
xrdb "$HOME/.Xresources"

# set wallpaper
~/.fehbg &

# Notification server
exec dunst &

# Tray
exec dwmblocks &

exec discord &

# Window manager

exec dwm
