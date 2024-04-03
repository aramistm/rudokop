#!/bin/sh
apt update -y
apt install screen -y
cd ~

wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.86/lolMiner_v1.86_Lin64.tar.gz
wget https://github.com/rigelminer/rigel/releases/download/1.15.1/rigel-1.15.1-linux.tar.gz
tar -xzvf lolMiner_v1.86_Lin64.tar.gz
tar -xzvf rigel-1.15.1-linux.tar.gz

screen -dmS mining bash /root/mine.sh $1

echo "#/root/1.86/lolMiner --algo PYRIN --pool de.pyrin.herominers.com:1177 --user pyrin:qq4mqzjm7uradurlg98nx7mwhak9y2dflh8zeuer6pe65sx4c9prqqrwelk0a.$1" >> /root/mine.sh
echo "/root/rigel-1.15.1-linux/rigel -a octopus -o stratum+tcp://de.conflux.herominers.com:1170 -u cfx:aajg4ygzhz88k47cwfg0cjzhu27v5sgp56510jfnyy -w $1 --log-file logs/miner.log" >> /root/mine.sh
echo "" >> /etc/supervisor/conf.d/supervisord.conf
echo "[program:mining]" >> /etc/supervisor/conf.d/supervisord.conf
echo "command=/bin/bash -c 'screen -dmS mining bash /root/mine.sh $1 && sleep infinity'" >> /etc/supervisor/conf.d/supervisord.conf