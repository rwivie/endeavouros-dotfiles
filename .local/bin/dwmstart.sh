#!/bin/sh

xrdb merge ~/.Xresources &
nitrogen --restore &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
(sleep 5; nm-applet) &
(sleep 5; blueman-applet) &
numlockx on &
mpDris2 &
dunst -conf ~/.config/dunst/dunstrc &
picom --config ~/.config/picom/picom_dwm.conf  --daemon &
#(sleep 1; xautolock -time 10 -locker lock -corners '+-00' -cornerdelay 15 -notify 15 -notifier "notify-send 'Screen will lock in 15 s'") &
(sleep 1; xautolock -detectsleep -time 10 -locker 'lock -n' -killtime 11 -killer 'systemctl suspend' -corners '+-00' -cornerdelay 15 -notify 15 -notifier "notify-send 'Screen will lock in 15 s'") &
#steam-screensaver-fix-runtime -silent %U &
sleep 10 && mpd &
caffeine &
sleep 15 && $HOME/.config/dwmblocks-async/build/dwmblocks &

#exec dbus-launch --sh-syntax --exit-with-session dwm
exec $HOME/.config/dwm-6.4/dwm

