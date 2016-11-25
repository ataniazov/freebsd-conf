#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
	read line
	#echo "mystuff | $line" || exit 1
	name=$(xdotool getactivewindow getwindowname 2>/dev/null || \
		echo Workspace `i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2`)
	echo "$name | $line" || exit 1
done
