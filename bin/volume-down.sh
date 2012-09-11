#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Usage: $0 <amount in percent, no %>"
    exit 1
fi

VOLUME_RATE=$1

VOLUME_ENABLED=`amixer -R get Master | grep "\[" | cut -d "[" -f 4 | cut -d "]" -f 1`
if [ $VOLUME_ENABLED = "on" ]; then
    CURRENT_VOLUME=`amixer -R get Master | grep "\[" | cut -d "[" -f 2 | cut -d "%" -f 1`
    NEXT_VOLUME=`expr $CURRENT_VOLUME - $VOLUME_RATE`
    if [ $NEXT_VOLUME -lt 0 ]; then
        NEXT_VOLUME=0
    fi

    volnoti-show $NEXT_VOLUME
    amixer -q set Master $NEXT_VOLUME% unmute
else
    volnoti-show -m
fi
