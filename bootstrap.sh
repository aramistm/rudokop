#!/bin/sh
apt update -y
apt install screen nano -y
cd ~

wget http://178.208.78.132/lolMiner_v1.88_Lin64.tar.gz
wget http://178.208.78.132/rigel-1.16.2-linux.tar.gz
tar -xzvf lolMiner_v1.88_Lin64.tar.gz
tar -xzvf rigel-1.16.2-linux.tar.gz

screen -dmS mining bash /root/mine.sh $1


echo "#Lol Miner" >> /root/mine.sh
echo "#/root/1.88/lolMiner --algo PYRIN --pool de.pyrin.herominers.com:1177 --user pyrin:qq4mqzjm7uradurlg98nx7mwhak9y2dflh8zeuer6pe65sx4c9prqqrwelk0a.$1" >> /root/mine.sh
echo "#/root/1.88/lolMiner -a FISHHASH --pool de.ironfish.herominers.com:1145 --user c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458.$1 --dualmode PYRINDUAL --dualpool de.pyrin.herominers.com:1177 --dualuser pyrin:qq4mqzjm7uradurlg98nx7mwhak9y2dflh8zeuer6pe65sx4c9prqqrwelk0a.$1" >> /root/mine.sh
echo "#/root/1.88/lolMiner -a FISHHASH --pool de.ironfish.herominers.com:1145 --user c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458.$1 --dualmode TONDUAL --dualpool ton.hashrate.to:4002 --dualuser UQDPEUpB98MhV0LMIPGTix5zavzuwrcR5wkrNcHuhDG0LEE3.$1" >> /root/mine.sh
echo "#/root/1.88/lolMiner -a FISHHASH --pool de.ironfish.herominers.com:1145 --user c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458.$1 --dualmode TONDUAL --dualpool stratum+tcp://stratum.hyperpool.pro:8040 --ton-mode 6 --dualuser eaf89db7108470dc3f6b23eac30358114f56f89c99b0f98913256c3ccf752a3bf46bab7457" >> /root/mine.sh

echo "#Rigel" >> /root/mine.sh
echo "/root/rigel-1.16.2-linux/rigel -a fishhash+sha256ton+zil -o [1]stratum+tcp://de.ironfish.herominers.com:1145 -u [1]c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458 -o [2]stratum+tcp://stratum.hyperpool.pro:8040 -u [2]eaf89db7108470dc3f6b23eac30358114f56f89c99b0f98913256c3ccf752a3bf46bab7457 -o [3]stratum+tcp://eu.zil.k1pool.com:1111 -u [3]KrHmLGJQ4fidmeS9Hn9khDHWkUddAi1L4Vn -w $1 --log-file logs/miner.log" >> /root/mine.sh
echo "#/root/rigel-1.16.2-linux/rigel -a fishhash+pyrinhash+zil -o [1]stratum+tcp://de.ironfish.herominers.com:1145 -u [1]c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458 -o [2]stratum+tcp://de.pyrin.herominers.com:1177 -u [2]pyrin:qq4mqzjm7uradurlg98nx7mwhak9y2dflh8zeuer6pe65sx4c9prqqrwelk0a -o [3]stratum+tcp://eu.zil.k1pool.com:1111 -u [3]KrHmLGJQ4fidmeS9Hn9khDHWkUddAi1L4Vn -w $1 --log-file logs/miner.log" >> /root/mine.sh


echo "" >> /etc/supervisor/conf.d/supervisord.conf
echo "[program:mining]" >> /etc/supervisor/conf.d/supervisord.conf
echo "command=/bin/bash -c 'screen -dmS mining bash /root/mine.sh $1 && sleep infinity'" >> /etc/supervisor/conf.d/supervisord.conf

