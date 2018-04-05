# $OpenBSD: dot.profile,v 1.5 2018/02/02 02:29:54 yasuoka Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
export PATH HOME TERM
export LC_CTYPE=en_US.UTF-8

# Debian 9 /etc/skel/.profile
# ~/.profile: executed by the command interpreter for login shells.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# which shell running
if [ "$SHELL" = "/bin/ksh" ]; then
	# include .kshrc if it exists
	if [ -f "$HOME/.kshrc" ]; then
		. "$HOME/.kshrc"
	fi
elif [ "$SHELL" = "/usr/local/bin/bash" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi
