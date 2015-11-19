#!/bin/bash

STATUS=`cat /sys/class/power_supply/BAT0/status`
AVG=`cat /sys/class/power_supply/BAT0/capacity`

if [ "$STATUS" == "Discharging" ]; then
	if (($AVG >= 80 )); then
		echo "" "" $AVG%
	elif (($AVG <= 80)) && (($AVG > 51)); then
		echo "" "" $AVG%
	elif (($AVG <= 50))&& (($AVG > 21)); then
		echo "" "" $AVG%
	elif (($AVG <= 20))&& (($AVG >5)); then
		echo "" "" $AVG%
	elif (($AVG <= 5)); then
		i3-nagbar -t warning -m 'the battery is low do you like hibernate system?' -b 'Yes, hibernate' 'systemctl hibernate'
	else
  		echo "" "" $AVG%
	fi
else
	echo "" "" $AVG%
fi

