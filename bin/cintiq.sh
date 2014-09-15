#!/bin/sh

# Map the Wacom stylus and eraser only to the Wacom screen.
xsetwacom set "Wacom Cintiq 13HD stylus" MapToOutput "1920x1080+0+1080"
xsetwacom set "Wacom Cintiq 13HD eraser" MapToOutput "1920x1080+0+1080"

# Account for screen calibration.
xsetwacom set "Wacom Cintiq 13HD stylus" Area 551 412 58831 33125
xsetwacom set "Wacom Cintiq 13HD eraser" Area 551 412 58831 33125

# Map Wacom buttons to useful Krita keys.
xsetwacom set "Wacom Cintiq 13HD pad" Button 2 "key +shift"
xsetwacom set "Wacom Cintiq 13HD pad" Button 3 "key 5"

xsetwacom set "Wacom Cintiq 13HD pad" Button 11 "key esc"
xsetwacom set "Wacom Cintiq 13HD pad" Button 12 "key +ctrl z -ctrl"
xsetwacom set "Wacom Cintiq 13HD pad" Button 1 "key tab"
xsetwacom set "Wacom Cintiq 13HD pad" Button 10 "key +ctrl +shift z -shift -ctrl"
# TODO: button 13?

xsetwacom set "Wacom Cintiq 13HD pad" Button 8 "key 2"
xsetwacom set "Wacom Cintiq 13HD pad" Button 9 "key +ctrl"
