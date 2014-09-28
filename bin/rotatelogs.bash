#!/bin/bash

# Move the live logs to dated ones.
mv /srv/http/5tubborn.com/logs/access.log /srv/http/5tubborn.com/logs/$(date +%F)_access.log
mv /srv/http/5tubborn.com/logs/error.log /srv/http/5tubborn.com/logs/$(date +%F)_error.log
mv /srv/http/andrewchancoin.com/logs/access.log /srv/http/andrewchancoin.com/logs/$(date +%F)_access.log
mv /srv/http/andrewchancoin.com/logs/error.log /srv/http/andrewchancoin.com/logs/$(date +%F)_error.log
mv /srv/http/bobsomers.com/logs/access.log /srv/http/bobsomers.com/logs/$(date +%F)_access.log
mv /srv/http/bobsomers.com/logs/error.log /srv/http/bobsomers.com/logs/$(date +%F)_error.log
mv /srv/http/flexrender.org/logs/access.log /srv/http/flexrender.org/logs/$(date +%F)_access.log
mv /srv/http/flexrender.org/logs/error.log /srv/http/flexrender.org/logs/$(date +%F)_error.log
mv /srv/http/kimarre.com/logs/access.log /srv/http/kimarre.com/logs/$(date +%F)_access.log
mv /srv/http/kimarre.com/logs/error.log /srv/http/kimarre.com/logs/$(date +%F)_error.log
mv /srv/http/steampodcast.com/logs/access.log /srv/http/steampodcast.com/logs/$(date +%F)_access.log
mv /srv/http/steampodcast.com/logs/error.log /srv/http/steampodcast.com/logs/$(date +%F)_error.log

# Tell nginx to reopen the logs.
kill -USR1 $(cat /run/nginx.pid)

# Wait...
sleep 3

# Compress the dated logs.
bzip2 /srv/http/5tubborn.com/logs/$(date +%F)_access.log
bzip2 /srv/http/5tubborn.com/logs/$(date +%F)_error.log
bzip2 /srv/http/andrewchancoin.com/logs/$(date +%F)_access.log
bzip2 /srv/http/andrewchancoin.com/logs/$(date +%F)_error.log
bzip2 /srv/http/bobsomers.com/logs/$(date +%F)_access.log
bzip2 /srv/http/bobsomers.com/logs/$(date +%F)_error.log
bzip2 /srv/http/flexrender.org/logs/$(date +%F)_access.log
bzip2 /srv/http/flexrender.org/logs/$(date +%F)_error.log
bzip2 /srv/http/kimarre.com/logs/$(date +%F)_access.log
bzip2 /srv/http/kimarre.com/logs/$(date +%F)_error.log
bzip2 /srv/http/steampodcast.com/logs/$(date +%F)_access.log
bzip2 /srv/http/steampodcast.com/logs/$(date +%F)_error.log
