#! /bin/sh
# ---------------------------------------------------------------------------
# setvolume.sh - generate and execute volume toggler for 
# muting and unmuting volume with mixer

# Copyright 2016, Ata Niyazov <https://github.com/ataniazov>
  
# The FreeBSD Copyright
# <https://www.freebsd.org/copyright/freebsd-license.html> for
# more details.

# Copyright 1992-2016 The FreeBSD Project. All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:

#  1. Redistributions of source code must retain the above copyright
#  notice, this list of conditions and the following disclaimer.

#  2. Redistributions in binary form must reproduce the above copyright
#  notice, this list of conditions and the following disclaimer in the
#  documentation and/or other materials provided with the distribution.

# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
# THE POSSIBILITY OF SUCH DAMAGE.

# Tested on FreeBSD 11.0-RELEASE-p2

# Revision history:
# 2016-11-14
# ---------------------------------------------------------------------------

write_script() {
cat << _EOF_
#! /bin/sh
VOLUME=100
if [ \$1 != '0' ]; then
	mixer vol 0 > /dev/null
	echo \$1
else
	mixer vol \$VOLUME > /dev/null
	echo \$VOLUME
fi
_EOF_
}

# Set filename for vol to mute and Vice Versa toggler
TGL_FILE=$HOME/.config/i3/mutetoggle.sh

if [ ! -f "$TGL_FILE" ]; then
	write_script > $TGL_FILE
	chmod +x "$TGL_FILE"
fi

# Get volume value to save
VOLUME=$($TGL_FILE $(mixer vol | awk -F : '{print $2}'))
if [ $VOLUME != '0' ]; then
	sed -i '' -e "s/VOLUME=.*/VOLUME=${VOLUME}/" $TGL_FILE
fi
