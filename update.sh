#!/bin/bash

# ?????????????????? ?????????? ?? ???????????????????? Rigel
wget https://github.com/rigelminer/rigel/releases/download/1.17.4/rigel-1.17.4-linux.tar.gz

# ?????????????????????????? ??????????
tar -zxf rigel-1.17.4-linux.tar.gz

# ?????????????????? screen ?? ???????????? "mining"
screen -S mining -X quit

# ???????????????? ???????????? ?? ?????????????? mine.sh
sed -i 's/rigel-1.17.3/rigel-1.17.4/g' mine.sh

# ?????????????????? ???????????? mine.sh ?? ?????????? screen ?? ???????????? "mining"
screen -dmS mining bash /root/mine.sh
