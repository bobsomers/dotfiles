#!/usr/bin/ruby

trigger = ARGV.shift

if trigger == 'songstart'
   songinfo = {}

   STDIN.each_line {|line| songinfo.store(*line.chomp.split('=', 2))}
   `notify-send -i /usr/share/icons/Faenza/emblems/16/emblem-sound.png "#{songinfo['title']}" "#{songinfo['artist']}"`
end
