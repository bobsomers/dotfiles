#!/usr/bin/env bash

lockscreen_file=$(mktemp --tmpdir lockscreen-XXXXXXXXXX.png)

scrot --silent --delay 0 "$lockscreen_file"
gm convert "$lockscreen_file" -blur 0x3 "$lockscreen_file"
i3lock -i "$lockscreen_file"

trap "rm '$lockscreen_file'" EXIT
