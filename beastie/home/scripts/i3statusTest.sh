#!/bin/sh
# shell script to prepend i3status with more stuff

#i3status | while :
#do
#	read line
#	#echo "mystuff | $line" || exit 1
#	title=$(xdotool getactivewindow getwindowname 2>/dev/null || \
	#		echo Workspace `i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2`)
#	if [ ${#title} -ge 82 ]; then
#		echo "${title##*-} | $line" || exit 1
#	else
#		echo "$title | $line" || exit 1
#	fi
#done

echo -e '{"version":1}\n[\n[{"name":"active_window","markup":"none","full_text":"WM_NAME"},{"name":"volume","instance":"default.Master.0","markup":"none","full_text":"♪: 20%"},{"name":"disk_info","instance":"/","markup":"none","full_text":"84.2 GiB"},{"name":"wireless","instance":"wlan0","color":"#00FF00","markup":"none","full_text":"W: Cisco 192.168.223.55"},{"name":"ethernet","instance":"re0","color":"#FF0000","markup":"none","full_text":"E: down"},{"name":"battery","instance":"/sys/class/power_supply/BAT0/uevent","markup":"none","full_text":"CHR -1%"},{"name":"cpu_temperature","instance":"hw.acpi.thermal.tz0.temperature","markup":"none","full_text":"T: 67.0 °C"},{"name":"load","markup":"none","full_text":"2.19, 1.82, 1.22"},{"name":"tztime","instance":"local","markup":"none","full_text":"2017-01-05 20:36"}]\n'
while :
do
	echo -e ',[{"name":"active_window","markup":"none","full_text":"WM_NAME"},{"name":"volume","instance":"default.Master.0","markup":"none","full_text":"♪: 20%"},{"name":"disk_info","instance":"/","markup":"none","full_text":"84.2 GiB"},{"name":"wireless","instance":"wlan0","color":"#00FF00","markup":"none","full_text":"W: Cisco 192.168.223.55"},{"name":"ethernet","instance":"re0","color":"#FF0000","markup":"none","full_text":"E: down"},{"name":"battery","instance":"/sys/class/power_supply/BAT0/uevent","markup":"none","full_text":"CHR -1%"},{"name":"cpu_temperature","instance":"hw.acpi.thermal.tz0.temperature","markup":"none","full_text":"T: 67.0 °C"},{"name":"load","markup":"none","full_text":"2.19, 1.82, 1.22"},{"name":"tztime","instance":"local","markup":"none","full_text":"2017-01-05 20:36"}]\n'
done
