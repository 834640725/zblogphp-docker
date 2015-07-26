FROM tutum/lamp:latest
MAINTAINER zsx <zsx@zsxsoft.com>

# Install plugins
RUN apt-get update && \
  apt-get -y install php5-gd php5-curl wget && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get clean

## Download Z-BlogPHP
RUN cd /app && wget http://update.zblogcn.com/zblogphp/install.tar.gz && tar -xf ./install.tar.gz

## Modify permissions
RUN chown -R www-data:www-data /app /var/www/html

## Add Database
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD create_db.sh /create_db.sh
RUN chmod +x /*.sh

## Open Ports
EXPOSE 80 3306
CMD ["/run.sh"]
