# Этап сборки
FROM node:16 as build

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Устанавливаем react-scripts глобально для текущего пользователя
RUN npm install -g react-scripts

# Копируем исходный код
COPY . .

# Даем права на выполнение скриптов
RUN chmod +x node_modules/.bin/react-scripts && \
    chmod -R 777 node_modules/.bin/

# Выполняем сборку
RUN npm run build

# Этап production
FROM nginx:alpine

# Копируем собранные файлы
COPY --from=build /app/build /usr/share/nginx/html

# Копируем конфигурацию nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 