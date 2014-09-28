#!/bin/sh

# Map the Wacom stylus and eraser only to the Wacom screen.
xsetwacom set "Wacom Cintiq 13HD stylus" MapToOutput "1920x1080+0+1080"
xsetwacom set "Wacom Cintiq 13HD eraser" MapToOutput "1920x1080+0+1080"

# Account for screen calibration.
xsetwacom set "Wacom Cintiq 13HD stylus" Area 374 300 59033 33250
xsetwacom set "Wacom Cintiq 13HD eraser" Area 374 300 59033 33250 
