FROM ubuntu:20.04

RUN apt-get update -yq && apt-get install wget unzip -y
RUN mkdir -p /opt/coin
WORKDIR /opt/coin
RUN wget https://github.com/kmushi-coin/kmushicoin-source/releases/download/1.2.3/KmushiCoind.ubuntu.20-04-03.amd64.tar.gz -O tmp.tar.gz && \
  tar -xzvf tmp.tar.gz && \
  rm -f tmp.tar.gz
  
RUN wget https://github.com/kmushi-coin/kmushicoin-source/releases/download/KmushiCoin.conf/KmushiCoin.conf
RUN wget https://github.com/kmushi-coin/kmushicoin-source/releases/download/Bootstrap.14.06.2022/bootstrap.dat

VOLUME ["/opt/coin/data", "/opt/coin/KmushiCoin.conf"]
EXPOSE 15715

ENTRYPOINT ["/opt/coin/KmushiCoind"]
CMD ["-conf=/opt/coin/KmushiCoin.conf", ["-datadir=/opt/coin/"]]
