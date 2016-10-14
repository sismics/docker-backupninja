#!/bin/sh
chmod -R 0600 /etc/backup.*

# Report disk usage
patch -p2 < /usr/local/bin/backupninja.patch /usr/sbin/backupninja

# Fix issue in Debian packaging of rsync action
patch -p1 < /usr/local/bin/backupninja-1.0.1_fix-cmd-quoting.patch

# Allow password authentication on Postgresql
patch -p1 < /usr/local/bin/pgsql-auth.patch /usr/share/backupninja/pgsql

# Add rotation of Mysql backups
patch -p1 < /usr/local/bin/mysql.patch /usr/share/backupninja/mysql

# Add rotation of Postgresql backups
patch -p1 < /usr/local/bin/pgsql-rotate.patch /usr/share/backupninja/pgsql

# Remove system backups
rm /etc/cron.daily/dpkg /etc/cron.daily/logrotate /etc/cron.daily/passwd
