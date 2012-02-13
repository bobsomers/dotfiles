#!/usr/bin/ruby

trigger = ARGV.shift

if trigger == 'songstart'
   songinfo = {}

   STDIN.each_line {|line| songinfo.store(*line.chomp.split('=', 2))}
   `notify-send "Now Playing" "#{songinfo['title']}\nby #{songinfo['artist']}"`
end
