#!/bin/bash -e

rsync --verbose --progress --compress --recursive --times --perms --links \
   --delete --exclude ".git" --exclude "*.swp" ~/Code/* cominor:Code
