# docker-backupninja
Dockerfile for Backupninja

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
