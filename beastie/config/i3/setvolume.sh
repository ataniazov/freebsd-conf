#! /bin/sh
VOLUME=$($HOME/.config/i3/mutetoggle.sh $(mixer vol | awk -F : '{print $2}'))
echo $VOLUME
if [ $VOLUME != '0' ]; then
	sed -i '' -e "s/VOLUME=.*/VOLUME=${VOLUME}/" $HOME/.config/i3/mutetoggle.sh
fi
