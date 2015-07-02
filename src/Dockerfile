FROM debian:jessie
MAINTAINER Martin Simon <me@martinsimon.me>

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update && \
    apt-get -y install \
        git \
        mysql-client \
        mysql-server \
        python-dev \
        python-flup \
        python-crypto \
        python-mysqldb && \
        apt-get clean &&  \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR \
    /home

RUN \
    git clone https://github.com/alferz/worldcoin-abe.git

WORKDIR \
    /home/worldcoin-abe

ADD \
    ./mysql.conf /home/worldcoin-abe/

ADD \
    ./entrypoint.sh /home/worldcoin-abe/

RUN \
    chmod +x /home/worldcoin-abe/entrypoint.sh

RUN \
    sed -i 's/, "decimals":"1"//' Abe/DataStore.py && \
    sed -i 's/if args.host is None:/import socket/' Abe/abe.py && \
    sed -i 's/    args.host = "localhost"/args.host = socket.gethostbyname(socket.gethostname())/' Abe/abe.py && \
    service mysql start && \
    mysql -u root -e 'create database abe;' && \
    mysql -u root -e "CREATE USER 'abe'@'localhost' IDENTIFIED BY 'PASSWORD';" && \
    mysql -u root -e 'grant all on abe.* to abe;' && \
    python setup.py install

EXPOSE 80

CMD ["/home/worldcoin-abe/entrypoint.sh"]
