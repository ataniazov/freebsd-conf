# System
sudo nano portmaster
xf86-video-{fbdev/intel/ati}
linux_base-c6 wpa_supplicant linuxfdisk

# Terminal
vim git py27-ranger htop zathura(djvu,pdf)

# GUI
xorg dbus hal slim ratpoison xfce xfce-wm-themes 

# Multimedia
vlc cmus smplayer

# Internet
firefox irssi openvpn

# Misc
zip unzip rar unrar wget curl p7zip p7zip-codec-rar xarchiver ristretto
fusefs-ext4fuse #automount mtpfs xfce4-genmon-plugin xfce4-fsguard-plugin xfce4-power-manager
bash-completion slock
#### !!! WARNING: "automount" will cause long system booting !!!

# Fonts
webfonts urwfonts dejavu ubuntu-font terminus-font
inconsolata-ttf droid-fonts-ttf liberation-fonts-ttf urwfonts-ttf freefont-ttf

# Have a Fun:)

# FreeBSD theme for slim

## fetch http://daemon-notes.com/downloads/assets/themes/slim-freebsd.tar.bz2

# cp slim-freebsd.tar.bz2 /usr/local/share/slim/themes
# cd /usr/local/share/slim/themes
# tar jxvf slim-freebsd.tar.bz2
# rm slim-freebsd.tar.bz2

More themes could be found at SLiM site.

Edit /usr/local/etc/slim.conf, set theme:

#current_theme       default
current_theme       freebs
