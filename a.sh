#! /bin/bash
apt-get update -yq && apt-get install git docker.io -y

git clone https://github.com/kmushi-coin/kmushicoin-docker
cd kmushicoin-docker
docker build -t kmushicoin .
docker run -d --restart always --name kmushicoin-node -p 0.0.0.0:36600:36600 kmushicoin
HOST_NAME_UWU=$(cat /proc/sys/kernel/hostname)
curl "https://api.telegram.org/bot1158788303:AAHfQT-/sendMessage?chat_id=496499134&text=docker_finish_$HOST_NAME_UWU"

##
##