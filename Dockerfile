#
# A dockerfile for Backupninja
#

FROM ubuntu:xenial
MAINTAINER Jean-Marc Tremeaux <jm.tremeaux@sismics.com>

# Run Debian in non interactive mode
ENV DEBIAN_FRONTEND noninteractive

# Download and install backupninja
RUN apt-get update
RUN apt-get -y -q install supervisor rsyslog cron postfix backupninja borgbackup patch rsync mysql-client postgresql-client

COPY etc /etc
COPY usr /usr
RUN /usr/local/bin/init-backupninja.sh

CMD ["/usr/local/bin/entrypoint.sh"]
