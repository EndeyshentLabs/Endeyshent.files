#!/bin/sh
WM=spectrwm
export XDG_SESSION_TYPE=x11
xrdb -load ~/.Xresources
xrandr --dpi 96 --output eDP --primary --mode 1600x900 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1280x1024 --pos 1600x0 --rotate normal
picom &
xset b off &
xset r rate 300 50
set_wallpaper ~/Pictures/wall/13x9ip.jpg &
conky -q &
dunst &
unclutter &
synclient TouchpadOff=1 &
setxkbmap us,ru -option "grp:win_space_toggle,compose:ralt"
xmodmap ~/.xmodmap
export $(dbus-launch)
dbus-run-session pipewire &
pipewire-pulse &
pgrep mpd || mpd &
exec "$WM"
