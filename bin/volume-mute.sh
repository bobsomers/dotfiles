#!/bin/sh

VOLUME_ENABLED=`amixer -R get Master | grep "\[" | cut -d "[" -f 4 | cut -d "]" -f 1`
if [ $VOLUME_ENABLED = "on" ]; then
    volnoti-show -m
else
    CURRENT_VOLUME=`amixer -R get Master | grep "\[" | cut -d "[" -f 2 | cut -d "%" -f 1`
    volnoti-show $CURRENT_VOLUME
fi
amixer -q set Master toggle
