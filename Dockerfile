#
# A dockerfile for Backupninja
#

FROM ubuntu:noble
MAINTAINER Jean-Marc Tremeaux <jm.tremeaux@sismics.com>

# Run Debian in non interactive mode
ENV DEBIAN_FRONTEND noninteractive

# Install PostgreSQL client
RUN apt-get update && \
    apt-get -y -q install gnupg && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ noble-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    apt-get -y -q install postgresql-client-16 && \
    rm -rf /var/lib/apt/lists/*

# Download and install backupninja
RUN apt-get update && \
    apt-get -y -q install supervisor rsyslog cron postfix backupninja borgbackup patch rsync mysql-client less vim && \
    rm -rf /var/lib/apt/lists/*

COPY etc /etc
COPY usr /usr
RUN chmod +x /usr/local/bin/init-backupninja.sh && /usr/local/bin/init-backupninja.sh

CMD ["/usr/local/bin/entrypoint.sh"]
