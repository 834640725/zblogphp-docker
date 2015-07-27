FROM tutum/lamp:latest
MAINTAINER zsx <zsx@zsxsoft.com>

# Install plugins
RUN apt-get update && \
  apt-get -y install wget php5-gd php5-curl && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get clean 

## Set /app as volume
VOLUME /app

## Add Database
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD create_db.sh /create_db.sh
ADD docker_entrypoint.sh /entrypoint.sh
RUN chmod +x /*.sh

## Open Ports
EXPOSE 80 3306
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/run.sh"]
