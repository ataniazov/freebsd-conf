#! /bin/sh
# Kill StartUp daemons
pkill xfsettingsd
pkill xfce4-power-manager
pkill xfce4-volumed
pkill redshift
sleep 0.5
# StartUp daemons
xfsettingsd &
xfce4-power-manager &
xfce4-volumed &
redshift -l 40.7:29.9 -t 5900:5500 -g 0.8 -m randr &
