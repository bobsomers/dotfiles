#!/usr/bin/bash
echo -e "Subject: Investment Report for $(date "+%a %F")\nContent-Type: text/html\n\n$(cat /srv/http/bobsomers.com/public/invest.html)" | sendmail MagicBobert@gmail.com
