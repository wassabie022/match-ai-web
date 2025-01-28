#!/bin/bash
# Устанавливаем права на выполнение для node_modules
chmod -R 755 node_modules/.bin/
# Запускаем сборку
CI=false ./node_modules/.bin/react-scripts build 