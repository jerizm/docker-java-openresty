FROM java:7

ADD install.sh install.sh

RUN chmod +x ./install.sh

RUN apt-get update
RUN apt-get install -y build-essential autoconf automake libtool libpcap-dev libnet1-dev libpcre3-dev libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 wget curl unzip libreadline-dev libncurses5-dev

RUN wget http://www.lua.org/ftp/lua-5.1.5.tar.gz
RUN tar zxvf lua-5.1.5.tar.gz
WORKDIR /lua-5.1.5
RUN make linux install
WORKDIR /
RUN wget https://github.com/keplerproject/luarocks/archive/v2.2.2.zip
RUN unzip v2.2.2.zip
WORKDIR /luarocks-2.2.2
RUN ./configure
RUN make build
RUN make install
RUN make bootstrap

WORKDIR /

RUN ./install.sh