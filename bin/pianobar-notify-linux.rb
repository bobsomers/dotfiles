#!/usr/bin/ruby

trigger = ARGV.shift

if trigger == 'songstart'
   songinfo = {}

   STDIN.each_line {|line| songinfo.store(*line.chomp.split('=', 2))}
   `notify-send -i ~/.config/awesome/themes/zenburn/icons/pandora.png "Now Playing" "#{songinfo['title']}\nby #{songinfo['artist']}"`
end
