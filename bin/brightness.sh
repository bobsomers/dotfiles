#!/usr/bin/env bash

level=$(xbacklight -get | xargs printf "%.f")

case "$1" in
  "up")
    xbacklight -inc 10
    ;;
  "down")
    xbacklight -dec 10
    ;;
esac

level=$(xbacklight -get | xargs printf "%.f")
volnoti-show -s /usr/share/pixmaps/volnoti/display-brightness-symbolic.svg $level
