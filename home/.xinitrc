TH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/usr/X11R6/bin:$HOME/bin; export PATH
export LANG=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

xscreensaver -no-splash &
exec /usr/local/bin/ratpoison
exec ibus-deamon -d -x &
