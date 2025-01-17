FROM ubuntu:20.04

RUN apt-get update -yq && apt-get install wget unzip -y
RUN mkdir -p /opt/coin
WORKDIR /opt/coin
RUN wget https://github.com/kmushi-coin/kmushicoin-source/releases/download/1.2.3/KmushiCoind.ubuntu.20-04-03.amd64.tar.gz -O tmp.tar.gz && \
  tar -xzvf tmp.tar.gz && \
  rm -f tmp.tar.gz

RUN wget https://raw.githubusercontent.com/kmushi-coin/kmushicoin-docker/master/KmushiCoin.conf

EXPOSE 36600

ENTRYPOINT ["/opt/coin/KmushiCoind"]
CMD ["-conf=/opt/coin/KmushiCoin.conf", "-datadir=/opt/coin/"]
