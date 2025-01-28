# Этап сборки
FROM node:20.18.2 AS build

# Устанавливаем рабочую директорию
WORKDIR /opt/build

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости и react-scripts глобально
RUN npm install -g react-scripts && \
    npm install

# Копируем исходный код
COPY . .

# Устанавливаем правильные права
RUN chmod -R 777 /opt/build/node_modules/.bin/ && \
    chown -R node:node /opt/build

# Переключаемся на пользователя node
USER node

# Выполняем сборку с явным путем к react-scripts
RUN /opt/build/node_modules/.bin/react-scripts build

# Этап production
FROM nginx:alpine

# Копируем собранные файлы из предыдущего этапа
COPY --from=build /opt/build/build /usr/share/nginx/html

# Копируем конфигурацию nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Указываем порт
EXPOSE 80

# Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]
