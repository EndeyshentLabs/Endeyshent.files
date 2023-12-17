#!/bin/sh
WM=bspwm
export XDG_SESSION_TYPE=x11
xrdb -load ~/.Xresources
xrandr --dpi 96 --output eDP --primary --mode 1600x900 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1280x1024 --pos 1600x0 --rotate normal
xcompmgr &
xset b off &
xset r rate 300 50 &
# set_wallpaper ~/Pictures/wall/13x9ip.jpg &
set_wallpaper ~/Pictures/wall/3gh3x9.png &
#xwallpaper --output all --zoom ~/Pictures/wall/gruvbox-street.png &
#wal --theme base16-gruvbox-hard &
#xdotool key super+F5 &
conky -q &
dunst &
unclutter &
synclient TouchpadOff=1 &
setxkbmap us,ru -option grp:win_space_toggle &
# betterlockscreen -u ~/Pictures/wall/3mxv6u.png & # cache lockscreen image
[ ! "$WM" = "bspwm" ] && sxhkd &
[ "$WM" = "bspwm" ] && sxhkd -c ~/.config/sxhkd/bspwm &
export $(dbus-launch)
dbus-run-session pipewire &
pipewire-pulse &
pgrep mpd || mpd &
[ "$WM" = "dwm" ] && dwm_bar &
exec $WM > /dev/null 2>&1
