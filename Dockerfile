FROM debian:9

RUN apt-get update -yq && apt-get install wget unzip -y
RUN mkdir -p /opt/coin
WORKDIR /opt/coin
RUN wget https://github.com/CoinBlack/blackcoin/releases/download/v1.2.5.2/blackcoin-1.2.5.2-linux.zip -O tmp.zip && \
  unzip tmp.zip && \
  rm -f tmp.zip

VOLUME ["/opt/coin/data", "/opt/coin/coin.conf"]
EXPOSE 15715

ENTRYPOINT ["/opt/coin/blackcoind"]
CMD ["-conf=/opt/coin/coin.conf"]
