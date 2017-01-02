#
# A dockerfile for Backupninja
#

FROM ubuntu:xenial
MAINTAINER Jean-Marc Tremeaux <jm.tremeaux@sismics.com>

# Run Debian in non interactive mode
ENV DEBIAN_FRONTEND noninteractive

# Install PostgreSQL client
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get update
RUN apt-get -y -q install postgresql-client-9.6

# Download and install backupninja
RUN apt-get update
RUN apt-get -y -q install supervisor rsyslog cron postfix backupninja borgbackup patch rsync mysql-client less vim

COPY etc /etc
COPY usr /usr
RUN /usr/local/bin/init-backupninja.sh

CMD ["/usr/local/bin/entrypoint.sh"]
