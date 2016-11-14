#! /bin/sh
if [ "$(mixer vol | awk -F : '{print $2}')" != '0' ]; then
	mixer vol 0
else
	mixer vol 40
fi
