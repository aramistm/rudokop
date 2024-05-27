#!/bin/sh
echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list
apt update -y
apt install -y g++-11 screen nano libc6 htop
cd ~

wget http://178.208.78.132/lolMiner_v1.88_Lin64.tar.gz
wget http://178.208.78.132/rigel-1.17.3-linux.tar.gz
wget http://178.208.78.132/qli-Client-1.9.6-Linux-x64.tar.gz


tar -xzvf qli-Client-1.9.6-Linux-x64.tar.gz
tar -xzvf lolMiner_v1.88_Lin64.tar.gz
tar -xzvf rigel-1.17.3-linux.tar.gz

mkdir qcpu
cp qli-Client /root/qcpu/

echo "{\"Settings\":{\"baseUrl\": \"https://mine.qubic.li/\",\"amountOfThreads\": 54,\"alias\": \"$1\",\"accessToken\": \"eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJJZCI6ImFmZTQ5ZGZkLWM2YzUtNDhiNi05NDllLTVhODkyNmIyMzY4ZSIsIk1pbmluZyI6IiIsIm5iZiI6MTcxNDk5NzY3OSwiZXhwIjoxNzQ2NTMzNjc5LCJpYXQiOjE3MTQ5OTc2NzksImlzcyI6Imh0dHBzOi8vcXViaWMubGkvIiwiYXVkIjoiaHR0cHM6Ly9xdWJpYy5saS8ifQ.cCSpB82OyBvvvoJKkufrig-COgXIZQ0Zk97pQPyjVNWNKaF--fsCgRcfad5ZG9nG1kN67RYqILCczq90ZQr2mQ\", \"autoupdateEnabled\": true, \"trainer\": { \"gpu\": true, \"gpuVersion\": \"CUDA12\" }}}" > appsettings.json

echo "{\"Settings\":{\"baseUrl\": \"https://mine.qubic.li/\",\"amountOfThreads\": 24,\"alias\": \"$1_CPU\",\"accessToken\": \"eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJJZCI6ImFmZTQ5ZGZkLWM2YzUtNDhiNi05NDllLTVhODkyNmIyMzY4ZSIsIk1pbmluZyI6IiIsIm5iZiI6MTcxNDk5NzY3OSwiZXhwIjoxNzQ2NTMzNjc5LCJpYXQiOjE3MTQ5OTc2NzksImlzcyI6Imh0dHBzOi8vcXViaWMubGkvIiwiYXVkIjoiaHR0cHM6Ly9xdWJpYy5saS8ifQ.cCSpB82OyBvvvoJKkufrig-COgXIZQ0Zk97pQPyjVNWNKaF--fsCgRcfad5ZG9nG1kN67RYqILCczq90ZQr2mQ\", \"autoupdateEnabled\": true}}" > /root/qcpu/appsettings.json

echo "#Lol Miner" >> /root/mine.sh
echo "#/root/1.88/lolMiner --algo PYRIN --pool de.pyrin.herominers.com:1177 --user pyrin:qq4mqzjm7uradurlg98nx7mwhak9y2dflh8zeuer6pe65sx4c9prqqrwelk0a.$1" >> /root/mine.sh
echo "#/root/1.88/lolMiner -a FISHHASH --pool de.ironfish.herominers.com:1145 --user c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458.$1 --dualmode PYRINDUAL --dualpool de.pyrin.herominers.com:1177 --dualuser pyrin:qq4mqzjm7uradurlg98nx7mwhak9y2dflh8zeuer6pe65sx4c9prqqrwelk0a.$1" >> /root/mine.sh
echo "#/root/1.88/lolMiner -a FISHHASH --pool de.ironfish.herominers.com:1145 --user c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458.$1 --dualmode TONDUAL --dualpool ton.hashrate.to:4002 --dualuser UQDPEUpB98MhV0LMIPGTix5zavzuwrcR5wkrNcHuhDG0LEE3.$1" >> /root/mine.sh
echo "#/root/1.88/lolMiner -a FISHHASH --pool de.ironfish.herominers.com:1145 --user c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458.$1 --dualmode TONDUAL --dualpool stratum+tcp://stratum.hyperpool.pro:8040 --ton-mode 6 --dualuser eaf89db7108470dc3f6b23eac30358114f56f89c99b0f98913256c3ccf752a3bf46bab7457" >> /root/mine.sh

echo "#Rigel" >> /root/mine.sh
echo "#/root/rigel-1.17.3-linux/rigel -a fishhash+sha256ton+zil -o [1]stratum+tcp://de.ironfish.herominers.com:1145 -u [1]c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458 -o [2]stratum+tcp://stratum.hyperpool.pro:8040 -u [2]eaf89db7108470dc3f6b23eac30358114f56f89c99b0f98913256c3ccf752a3bf46bab7457 -o [3]stratum+tcp://eu.zil.k1pool.com:1111 -u [3]KrHmLGJQ4fidmeS9Hn9khDHWkUddAi1L4Vn -w $1 --log-file logs/miner.log" >> /root/mine.sh
echo "#/root/rigel-1.17.3-linux/rigel -a fishhash+pyrinhash+zil -o [1]stratum+tcp://de.ironfish.herominers.com:1145 -u [1]c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458 -o [2]stratum+tcp://de.pyrin.herominers.com:1177 -u [2]pyrin:qq4mqzjm7uradurlg98nx7mwhak9y2dflh8zeuer6pe65sx4c9prqqrwelk0a -o [3]stratum+tcp://eu.zil.k1pool.com:1111 -u [3]KrHmLGJQ4fidmeS9Hn9khDHWkUddAi1L4Vn -w $1 --log-file logs/miner.log" >> /root/mine.sh

echo "#xelis" >> /root/mine.sh
echo "/root/rigel-1.17.3-linux/rigel -a xelishash+zil -o [1]stratum+ssl://eu.xel.k1pool.com:9352 -u [1]KrHmLGJQ4fidmeS9Hn9khDHWkUddAi1L4Vn -o [2]stratum+tcp://eu.zil.k1pool.com:1111 -u [2]KrHmLGJQ4fidmeS9Hn9khDHWkUddAi1L4Vn --zil-countdown -w $1" >> /root/mine.sh

echo "#Qubic" >> /root/mine.sh
echo "#screen -dmS qubic ./qli-Client" >> /root/mine.sh
echo "#screen -dmS qubic-cpu bash -c 'cd /root/qcpu && ./qli-Client'" >> /root/mine.sh


echo "" >> /etc/supervisor/conf.d/supervisord.conf
echo "[program:mining]" >> /etc/supervisor/conf.d/supervisord.conf
echo "command=/bin/bash -c 'screen -dmS mining bash /root/mine.sh $1 && sleep infinity'" >> /etc/supervisor/conf.d/supervisord.conf

screen -dmS mining bash /root/mine.sh $1
