FROM ubuntu:14.04

MAINTAINER marcko "marco.itnl@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -qq update
RUN apt-get install -y nodejs npm git
RUN npm install -g express bower
RUN npm install -g nodemon

RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get autoremove -y

ADD ./config/supervisord.conf /etc/supervisor/conf.d/supervisord-nodejs.conf

RUN ln -s /usr/bin/nodejs /usr/local/bin/node

EXPOSE 3000

WORKDIR /var/www

VOLUME ["/var/files", "/var/www"]

CMD ["/usr/bin/supervisord", "-n"]
