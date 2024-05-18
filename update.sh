#!/bin/bash

# Скачиваем архив с программой Rigel
wget https://github.com/rigelminer/rigel/releases/download/1.17.3/rigel-1.17.3-linux.tar.gz

# Распаковываем архив
tar -zxf rigel-1.17.3-linux.tar.gz

# Закрываем screen с именем "mining"
screen -S mining -X quit

# Заменяем версию в скрипте mine.sh
sed -i 's/rigel-1.17.0/rigel-1.17.3/g' mine.sh

# Запускаем скрипт mine.sh в новом screen с именем "mining"
screen -dmS mining bash /root/mine.sh
