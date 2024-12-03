#!/bin/sh

# Report disk usage
patch -p2 < /usr/local/bin/backupninja-disk.patch /usr/sbin/backupninja

# Allow configuration in sub-directories
patch -p2 < /usr/local/bin/backupninja-conf.patch /usr/sbin/backupninja

# Allow password authentication on Postgresql
patch -p1 < /usr/local/bin/pgsql-auth.patch /usr/share/backupninja/pgsql
patch -p2 < /usr/local/bin/pgsql-auth-2.patch /usr/share/backupninja/pgsql

# Remove system backups
rm /etc/cron.daily/dpkg /etc/cron.daily/logrotate
