#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

isPrimary=0
if type "xrandr" &> /dev/null;then
	monitors=$(polybar -m | sed -e 's/:.*$//g')
	if [[ $(echo $monitors | wc -w) -ge 2 ]];then
		for m in $monitors;do
			if [ $isPrimary -eq 0 ];then
				export MONITOR=$m 
				bspc monitor $m -d 1 2 3 4 5 6 7 8 9 10
				polybar main -c $(dirname $0)/external.ini &
				isPrimary=1
			else
				export MONITOR=$m 
				bspc monitor $m -d 1 2 3 4 5 6 7 8 9 10
				polybar main -c $(dirname $0)/config.ini &
			fi
		done
	else
		bspc monitor $m -d 1 2 3 4 5 6 7 8 9 10
		polybar main -c $(dirname $0)/config.ini &
	fi
fi
