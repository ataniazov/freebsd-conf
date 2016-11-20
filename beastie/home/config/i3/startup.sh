#! /bin/sh
# Kill StartUp daemons
pkill xfsettingsd
pkill redshift
#pkill xfce4-power-manager
#pkill xfce4-volumed
sleep 0.5
# StartUp daemons
xfsettingsd &
redshift -l 40.7:29.9 -t 5700:5000 -g 0.8 -m randr &
#xfce4-power-manager &
#xfce4-volumed &
