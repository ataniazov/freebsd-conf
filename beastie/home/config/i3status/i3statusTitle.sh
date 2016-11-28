#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
	read line
	#echo "mystuff | $line" || exit 1
	title=$(xdotool getactivewindow getwindowname 2>/dev/null || \
		echo Workspace `i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2`)
	if [ ${#title} -ge 99 ]; then
		echo "${title##*-} | $line" || exit 1
	else
		echo "$title | $line" || exit 1
	fi
done
