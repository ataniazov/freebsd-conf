#! /bin/sh
# Kill StartUp daemons
#pkill at-spi-bus-launcher
#pkill polkit-gnome-authentication-agent-1
#pkill xfsettingsd
#pkill xfce4-power-manager
#pkill redshift
#pkill compton
#pkill conky

sleep 1

# StartUp daemons
#/usr/lib/at-spi2-core/at-spi-bus-launcher --launch-immediately &
#/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
#xfsettingsd &
#xfce4-power-manager &
#redshift -l 40.7:29.9 -t 5900:5500 -g 0.8 -m randr &
#compton -cCG --shadow-opacity=1.0 --fade-delta=3 --menu-opacity=1.0 --inactive-opacity=1.0 --inactive-dim 0.0 --dbus --detect-rounded-corners --detect-client-opacity --vsync opengl --shadow-exclude fullscreen --frame-opacity=1.0 --no-dnd-shadow --backend glx &
#conky -c "/home/delta/.conky/SimpleClock/DArk_Simple_" &
