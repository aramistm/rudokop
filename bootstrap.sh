#!/bin/sh
echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list
apt update -y
apt install -y g++-11 screen nano libc6 htop curl
cd ~

wget https://dl.qubic.li/downloads/qli-Client-3.1.1-Linux-x64.tar.gz
wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.91/lolMiner_v1.91_Lin64.tar.gz
wget https://github.com/rigelminer/rigel/releases/download/1.19.0/rigel-1.19.0-linux.tar.gz
wget https://github.com/apool-io/apoolminer/releases/download/v2.1.1/apoolminer_linux_v2.1.1.tar
wget https://raw.githubusercontent.com/aramistm/rudokop/main/miner.sh -O miner.sh
wget https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/cuda-v0.2.5-hotfix2/aleo_prover-v0.2.5_cuda_full_hotfix2.tar.gz

chmod +x /root/miner.sh

tar -xzvf qli-Client-3.1.1-Linux-x64.tar.gz
tar -xzvf apoolminer_linux_v2.1.1.tar
tar -xzvf lolMiner_v1.91_Lin64.tar.gz
tar -xzvf rigel-1.19.0-linux.tar.gz
tar -xzvf aleo_prover-v0.2.5_cuda_full_hotfix2.tar.gz

mkdir qcpu
cp qli-Client /root/qcpu/

echo "{
  \"ClientSettings\": {
    \"poolAddress\": \"wss://wps.qubic.li/ws\",
    \"alias\": \"$1\",
    \"trainer\": {
      \"cpu\": false,
      \"gpu\": true,
      \"gpuVersion\": \"CUDA\",
      \"cpuVersion\": \"\",
      \"cpuThreads\": 32
    },
    \"pps\": false,
    \"qubicAddress\": null,
    \"accessToken\": \"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6ImFmZTQ5ZGZkLWM2YzUtNDhiNi05NDllLTVhODkyNmIyMzY4ZSIsIk1pbmluZyI6IiIsIm5iZiI6MTczMzA2MDEwNywiZXhwIjoxNzY0NTk2MTA3LCJpYXQiOjE3MzMwNjAxMDcsImlzcyI6Imh0dHBzOi8vcXViaWMubGkvIiwiYXVkIjoiaHR0cHM6Ly9xdWJpYy5saS8ifQ.kIK16FT4NSnTbl58C4Bw3vg0dIGaLzR2kCOyNia4DUz0457_goEpjKXluHqE1657jHSpFGYR83vjSX69eGG7KyuJ7TdJn-iOaNM0gtCXJ4RbYMCIlAlMSta1FLMzYHdAFtLVsEfXU2WEUMm2NxA54bexMCGgKO0fvapdj5ZOf5pJ0euOyp61sR4ecI49BQIArfDTChDbDFVxYqoVD8SZIa--B-MJz9BZT9tteAiyJk-fO6iWjFyKiWmw0tKm6K159vVxUwPcdLENjmEA1lG_zpA4DH0_BlmNo-HjlBzRREt-Jbn1w4bXYRXRWUd0ZsUSFSgqO4rDbna8pmS0VzxpGA\",
    \"idling\": {
      \"command\": \"/root/aleo_prover/aleo_prover\",
      \"arguments\": \"--pool aleo.asia1.zk.work:10003 --pool aleo.hk.zk.work:10003 --pool aleo.jp.zk.work:10003 --address aleo1p9gch6lq7f7wetnre5g649dj5uyrfup8mt9ewv5svddtfgavzvpqtdl7rd --custom_name $1\"
    }
  }
}" > appsettings.json


echo "{
  \"ClientSettings\": {
    \"poolAddress\": \"wss://wps.qubic.li/ws\",
    \"alias\": \"$1_CPU\",
    \"trainer\": {
      \"cpu\": true,
      \"gpu\": false,
      \"gpuVersion\": \"CUDA\",
      \"cpuVersion\": \"\",
      \"cpuThreads\": 32
    },
    \"pps\": false,
    \"qubicAddress\": null,
    \"accessToken\": \"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6ImFmZTQ5ZGZkLWM2YzUtNDhiNi05NDllLTVhODkyNmIyMzY4ZSIsIk1pbmluZyI6IiIsIm5iZiI6MTczMzA2MDEwNywiZXhwIjoxNzY0NTk2MTA3LCJpYXQiOjE3MzMwNjAxMDcsImlzcyI6Imh0dHBzOi8vcXViaWMubGkvIiwiYXVkIjoiaHR0cHM6Ly9xdWJpYy5saS8ifQ.kIK16FT4NSnTbl58C4Bw3vg0dIGaLzR2kCOyNia4DUz0457_goEpjKXluHqE1657jHSpFGYR83vjSX69eGG7KyuJ7TdJn-iOaNM0gtCXJ4RbYMCIlAlMSta1FLMzYHdAFtLVsEfXU2WEUMm2NxA54bexMCGgKO0fvapdj5ZOf5pJ0euOyp61sR4ecI49BQIArfDTChDbDFVxYqoVD8SZIa--B-MJz9BZT9tteAiyJk-fO6iWjFyKiWmw0tKm6K159vVxUwPcdLENjmEA1lG_zpA4DH0_BlmNo-HjlBzRREt-Jbn1w4bXYRXRWUd0ZsUSFSgqO4rDbna8pmS0VzxpGA\",
  \"idleSettings\": true
  }
}" > /root/qcpu/appsettings.json


echo "#Monitoring" >> /root/mine.sh
echo "#screen -dmS mon bash /root/mon.sh" >> /root/mine.sh
echo "#ALEO" >> /root/mine.sh
echo "#/root/aleo_prover/aleo_prover --pool aleo.asia1.zk.work:10003 --pool aleo.hk.zk.work:10003 --pool aleo.jp.zk.work:10003 --address aleo1p9gch6lq7f7wetnre5g649dj5uyrfup8mt9ewv5svddtfgavzvpqtdl7rd --custom_name $1" >> /root/mine.sh

echo "#Lol Miner" >> /root/mine.sh
echo "#/root/1.88/lolMiner --algo PYRIN --pool de.pyrin.herominers.com:1177 --user pyrin:qq4mqzjm7uradurlg98nx7mwhak9y2dflh8zeuer6pe65sx4c9prqqrwelk0a.$1" >> /root/mine.sh
echo "#/root/1.88/lolMiner -a FISHHASH --pool de.ironfish.herominers.com:1145 --user c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458.$1 --dualmode PYRINDUAL --dualpool de.pyrin.herominers.com:1177 --dualuser pyrin:qq4mqzjm7uradurlg98nx7mwhak9y2dflh8zeuer6pe65sx4c9prqqrwelk0a.$1" >> /root/mine.sh
echo "#/root/1.88/lolMiner -a FISHHASH --pool de.ironfish.herominers.com:1145 --user c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458.$1 --dualmode TONDUAL --dualpool ton.hashrate.to:4002 --dualuser UQDPEUpB98MhV0LMIPGTix5zavzuwrcR5wkrNcHuhDG0LEE3.$1" >> /root/mine.sh
echo "#/root/1.88/lolMiner -a FISHHASH --pool de.ironfish.herominers.com:1145 --user c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458.$1 --dualmode TONDUAL --dualpool stratum+tcp://stratum.hyperpool.pro:8040 --ton-mode 6 --dualuser eaf89db7108470dc3f6b23eac30358114f56f89c99b0f98913256c3ccf752a3bf46bab7457" >> /root/mine.sh
echo "#Rigel" >> /root/mine.sh
echo "#/root/rigel-1.19.0-linux/rigel -a fishhash+sha256ton+zil -o [1]stratum+tcp://de.ironfish.herominers.com:1145 -u [1]c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458 -o [2]stratum+tcp://stratum.hyperpool.pro:8040 -u [2]eaf89db7108470dc3f6b23eac30358114f56f89c99b0f98913256c3ccf752a3bf46bab7457 -o [3]stratum+tcp://eu.zil.k1pool.com:1111 -u [3]KrHmLGJQ4fidmeS9Hn9khDHWkUddAi1L4Vn -w $1 --log-file logs/miner.log" >> /root/mine.sh
echo "#/root/rigel-1.19.0-linux/rigel -a fishhash+pyrinhash+zil -o [1]stratum+tcp://de.ironfish.herominers.com:1145 -u [1]c9f8d6c1849abbcd164f6c72002d9ac44b9deaef70481739a29d1733915defca+107458 -o [2]stratum+tcp://de.pyrin.herominers.com:1177 -u [2]pyrin:qq4mqzjm7uradurlg98nx7mwhak9y2dflh8zeuer6pe65sx4c9prqqrwelk0a -o [3]stratum+tcp://eu.zil.k1pool.com:1111 -u [3]KrHmLGJQ4fidmeS9Hn9khDHWkUddAi1L4Vn -w $1 --log-file logs/miner.log" >> /root/mine.sh
echo "#xelis" >> /root/mine.sh
echo "#/root/rigel-1.19.0-linux/rigel -a xelishashv2+zil -o [1]stratum+ssl://de.xelis.herominers.com:1225 -u [1]xel:qcd39a5u8cscztamjuyr7hdj6hh2wh9nrmhp86ljx2sz6t99ndjqzqq9qqqqq9x07lx8x7f2c57 -o [2]stratum+tcp://eu.zil.k1pool.com:1111 -u [2]KrHmLGJQ4fidmeS9Hn9khDHWkUddAi1L4Vn --zil-countdown -w $1 --api-bind 127.0.0.1:5000" >> /root/mine.sh
echo "#Qubic" >> /root/mine.sh
echo "#./apoolminer --account CP_rj3oka7lo3 --cpu-off --pool qubic1.hk.apool.io:3334 --mode 1 --worker $1" >> /root/mine.sh
echo "#screen -dmS mining-cpu bash -c 'cd /root/qcpu && ./qli-Client'" >> /root/mine.sh
echo "/root/qli-Client" >> /root/mine.sh
echo "#Octopus" >> /root/mine.sh
echo "#/root/rigel-1.19.1-linux/rigel -a octopus+pyrinhash+zil -o [1]stratum+tcp://de.conflux.herominers.com:1170 -u [1]cfx:aajg4ygzhz88k47cwfg0cjzhu27v5sgp56510jfnyy -o [2]stratum+tcp://de.pyrin.herominers.com:1177 -u [2]pyrin:qq4mqzjm7uradurlg98nx7mwhak9y2dflh8zeuer6pe65sx4c9prqqrwelk0a -o [3]stratum+tcp://eu.zil.k1pool.com:1111 -u [3]KrHmLGJQ4fidmeS9Hn9khDHWkUddAi1L4Vn -w $1 --log-file logs/miner.log" >> /root/mine.sh


echo "" >> /etc/supervisor/conf.d/supervisord.conf
echo "[program:mining]" >> /etc/supervisor/conf.d/supervisord.conf
echo "command=/bin/bash -c 'screen -dmS mining bash /root/mine.sh $1 && sleep infinity'" >> /etc/supervisor/conf.d/supervisord.conf

screen -dmS mining bash /root/mine.sh $1

echo "alias m='screen -r mining'" >> ~/.bashrc
echo "alias c='screen -r mining-cpu'" >> ~/.bashrc
echo "alias s='screen -dmS mining bash /root/mine.sh'" >> ~/.bashrc

