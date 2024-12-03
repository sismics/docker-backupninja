[![GitHub release](https://img.shields.io/github/release/sismics/docker-backupninja.svg?style=flat-square)](https://github.com/sismics/docker-backupninja/releases/latest)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## About
Docker image for Backupninja

## Instructions

You need to create a new image containing the configuration for your server.

Create a directory /etc/backup.d with your configuration files:
```
etc
  backup.d
    mydb.mysql
    mydb.pgsql
    somedirectory.rsync
```

Create a new Dockerfile with the backup configuration for your server :
```
FROM sismics/backupninja
COPY etc /etc
```

Run this Dockerfile :

```
docker run -d -h backupninja --name backupninja --restart=always \
    -v /var/backups/docker:/var/backups \
    --link mysql:mysql \
    --link postgresql:postgresql \
    sismics/backupninja
```
