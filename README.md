# blackcoin-docker
Dockerfile for blackcoin


# Building

```bash
docker build -t blackcoin .
```

# Running

Customize config file `coin.conf` first.

```bash
# block dir
mkdir data
docker run --rm -it --name blackcoin-node -p 0.0.0.0:15715:15715 -v `pwd`/data:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf blackcoin
```

# Using pre-built docker image

```bash
docker run --rm -it --name blackcoin-node -p 0.0.0.0:15715:15715 -v `pwd`/data:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf mixhq/blackcoin:latest
```
