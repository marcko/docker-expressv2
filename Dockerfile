FROM ubuntu:14.04

MAINTAINER marcko "marco.itnl@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -qq update
RUN apt-get install -y nodejs npm git
RUN npm install -g express bower

RUN ln -s /usr/bin/nodejs /usr/local/bin/node

EXPOSE 3000

WORKDIR /var/www

VOLUME ["/var/files", "/var/www"]

CMD ["/usr/bin/supervisord", "-n"]
