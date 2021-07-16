#!/bin/bash
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
screen1="docked (detected) (current)"
screen2="mobile (detected) (current)"
screen_detected=$(autorandr | grep current)
if [ "$screen1" = "$screen_detected" ];then
  bspc monitor "DP-2" -d  I II III IV V
  bspc monitor "eDP-1-1" -d VI VII VIII IX X
  polybar primary&
  polybar secondary&
elif [ "$screen2" = "$screen_detected" ];then
  bspc monitor "eDP-1-1" -d I II III IV V VI VII VIII IX X
  polybar secondary&
else echo "nothing"
  bspc monitor -d I II III IV V VI VII VIII IX X
fi
