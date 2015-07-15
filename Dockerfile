FROM java:7

ADD install.sh install.sh

RUN chmod +x ./install.sh

RUN apt-get update
RUN apt-get install -y build-essential autoconf automake libtool libpcap-dev libnet1-dev libpcre3-dev libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 wget curl luarocks

RUN ./install.sh