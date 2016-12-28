#!/bin/bash
chmod -R 0600 /etc/backup.*
find /etc/backup.d -type d | xargs chmod 700
find /etc/backup.d -type f | xargs chmod 600
/usr/local/bin/init-postfix.sh
/usr/bin/supervisord -n
