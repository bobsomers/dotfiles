#!/bin/sh

mount --bind /mnt/fluttershy/books /home/bsomers/books
mount -o remount,ro,bind /mnt/fluttershy/books /home/bsomers/books

mount --bind /mnt/fluttershy/dropbox /home/bsomers/dropbox
mount -o remount,ro,bind /mnt/fluttershy/dropbox /home/bsomers/dropbox

mount --bind /mnt/fluttershy/movies /home/bsomers/movies
mount -o remount,ro,bind /mnt/fluttershy/movies /home/bsomers/movies

mount --bind /mnt/fluttershy/music /home/bsomers/music
mount -o remount,ro,bind /mnt/fluttershy/music /home/bsomers/music

mount --bind /mnt/fluttershy/storage /home/bsomers/storage
mount -o remount,ro,bind /mnt/fluttershy/storage /home/bsomers/storage

mount --bind /mnt/fluttershy/torrents /home/bsomers/torrents
mount -o remount,ro,bind /mnt/fluttershy/torrents /home/bsomers/torrents

mount --bind /mnt/fluttershy/tv /home/bsomers/tv
mount -o remount,ro,bind /mnt/fluttershy/tv /home/bsomers/tv
