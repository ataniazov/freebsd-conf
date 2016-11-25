#! /bin/sh
# Kill StartUp daemons
pkill xfsettingsd
pkill xfce4-power-manager
pkill xfce4-volumed
pkill redshift
pkill compton
sleep 0.5
# StartUp daemons
xfsettingsd &
xfce4-power-manager &
xfce4-volumed &
redshift -l 40.7:29.9 -t 5900:5500 -g 0.8 -m randr &
compton -c --fade-delta=3 --menu-opacity=1.0 --inactive-opacity=1.0 --inactive-dim 0.1 --dbus &
