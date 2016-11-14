#! /bin/sh
VOLUME=40
LOCAL_VOLUME=$(mixer vol | awk -F : '{print $2}')
if [ $LOCAL_VOLUME != '0' ]; then
	mixer vol 0 > /dev/null
	echo $LOCAL_VOLUME
else
	mixer vol $VOLUME > /dev/null
	echo $VOLUME
fi
