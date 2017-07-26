(xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0)
(feh --bg-scale $HOME/Wallpaper/Arch.png) &
(nextcloud) &
(/usr/lib/gnome-settings-daemon/gnome-settings-daemon) &
(udiskie --no-automount --no-notify --tray --use-udisks2) &
(xscreensaver -nosplash) &
(xautolock -time 5 -locker '/bin/fish i3exit saver' -corners -000 -cornersize 50) &

exec i3
