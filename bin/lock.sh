#!/bin/bash

# Example locker script -- demonstrates how to use the --transfer-sleep-lock
# option with a fixed delay to give simple lockers a little bit of time to lock
# the screen before the system goes the sleep.

## CONFIGURATION ##############################################################

# Location to save desktop screenshot.
image="/tmp/lockscreen.png"

# Lock icon to overlay onto screenshot.
icon="/usr/share/icons/Paper/512x512/actions/system-lock-screen.png"

# Command to start the locker (should not fork)
locker="i3lock --nofork --no-unlock-indicator --image $image"

# Delay in seconds. Note that by default systemd-logind allows a maximum sleep
# delay of 5 seconds.
sleep_delay=1

# Run before starting the locker
pre_lock() {
  rm "$image" 2> /dev/null
  scrot "$image"
  convert "$image" -scale 10% -scale 1000% -fill black -colorize 25% "$image"
  convert "$image" "$icon" -gravity center -composite -matte "$image"
  return
}

# Run after the locker exits
post_lock() {
    return
}

###############################################################################

pre_lock

# kill locker if we get killed
trap 'kill %%' TERM INT

if [[ -e /dev/fd/${XSS_SLEEP_LOCK_FD:--1} ]]; then
    # lock fd is open, make sure the locker does not inherit a copy
    $locker {XSS_SLEEP_LOCK_FD}<&- &

    sleep $sleep_delay

    # now close our fd (only remaining copy) to indicate we're ready to sleep
    exec {XSS_SLEEP_LOCK_FD}<&-
else
    $locker &
fi

wait # for locker to exit

post_lock
