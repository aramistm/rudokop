#!/bin/bash

# Проверка на количество аргументов
if [ "$#" -ne 1 ]; then
    echo "Использование: $0 {start|stop|restart}"
    exit 1
fi

case "$1" in
    start)
        # Запуск команды screen
        screen -dmS mining bash /root/mine.sh
        echo "Запущен скрипт mine.sh в screen с именем 'mining'."
        ;;
    stop)
        # Остановка screen
        screen -S mining -X quit
        echo "Остановлен скрипт в screen с именем 'mining'."
        ;;
    restart)
        # Перезапуск screen
        screen -S mining -X quit
        sleep 10  # Небольшая пауза для завершения процесса
        screen -dmS mining bash /root/mine.sh
        echo "Перезапущен скрипт mine.sh в screen с именем 'mining'."
        ;;
    *)
        echo "Неверный аргумент: $1"
        echo "Использование: $0 {start|stop|restart}"
        exit 1
        ;;
esac