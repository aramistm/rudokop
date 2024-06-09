#!/bin/bash

while true; do
    # Выполняем запрос к http://127.0.0.1:5000 и сохраняем ответ в переменную
    response=$(curl -s http://127.0.0.1:5000)

    # Проверяем, что ответ не пустой
    if [ -n "$response" ]; then
        # Отправляем полученный JSON на адрес http://172.151.15.1:3000/data
        curl -X POST -H "Content-Type: application/json" -d "$response" http://178.208.78.132:3000/data
        echo "Data sent to server"
    else
        echo "Empty response"
    fi

    # Ждем 1 минуту перед повторным выполнением
    sleep 60
done