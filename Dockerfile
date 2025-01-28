# Этап сборки
FROM node:16 as build

# Устанавливаем рабочую директорию
WORKDIR /opt/build

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости с правами root
RUN npm install -g react-scripts && npm install

# Копируем исходный код
COPY . .

# Устанавливаем права на директорию
RUN chown -R node:node /opt/build && \
    chmod -R 755 /opt/build

# Переключаемся на пользователя node
USER node

# Выполняем сборку
RUN npm run build

# Этап production
FROM nginx:alpine

# Копируем собранные файлы
COPY --from=build /opt/build/build /var/www/build

# Копируем конфигурацию nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Устанавливаем права на файлы nginx
RUN chown -R nginx:nginx /var/www/build && \
    chmod -R 755 /var/www/build

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 