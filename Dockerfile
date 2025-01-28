# Этап сборки
FROM node:20.18.2 AS build

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем исходный код
COPY . .

# Выполняем сборку
RUN npm run build

# Этап production
FROM nginx:alpine

# Копируем собранные файлы из предыдущего этапа
COPY --from=build /app/build /usr/share/nginx/html

# Копируем конфигурацию nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Указываем порт, который будет прослушиваться
EXPOSE 80

# Запускаем Nginx в фореин режиме
CMD ["nginx", "-g", "daemon off;"]
