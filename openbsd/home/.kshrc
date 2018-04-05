#       $OpenBSD: ksh.kshrc,v 1.31 2018/04/04 19:56:00 kn Exp $
#
# NAME:
#       $HOME/.kshrc - user configuration for ksh
#
# DESCRIPTION:
#       Each invocation of /bin/ksh processes the file pointed
#       to by $ENV (usually $HOME/.kshrc).
#       This file is intended as a global .kshrc file for the
#       Korn shell.  A user's $HOME/.kshrc file simply requires
#       the line:
#               . /etc/ksh.kshrc
#       at or near the start to pick up the defaults in this
#       file which can then be overridden as desired.
#
# SEE ALSO:
#       /etc/ksh.kshrc
#

. /etc/ksh.kshrc
PS1="\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
