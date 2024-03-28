#!/bin/sh
apt update -y
apt install screen -y
cd ~
wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.85_beta/lolMiner_v1.85_beta_Lin64.tar.gz
tar -xzvf lolMiner_v1.85_beta_Lin64.tar.gz
echo "/root/1.85_beta/lolMiner --algo PYRIN --pool de.pyrin.herominers.com:1177 --user pyrin:qqag8k5fy8efvr22em0z054mcjksa77qr4p60ezxe90j5xmyrp4msct9pfxl6.$0" > /root/mine.sh
screen -dmS mining bash /root/mine.sh
echo "" >> /etc/supervisor/conf.d/supervisord.conf
echo "[program:mining]" >> /etc/supervisor/conf.d/supervisord.conf
echo "command=/bin/bash -c 'screen -dmS mining bash /root/mine.sh && sleep infinity'" >> /etc/supervisor/conf.d/supervisord.conf