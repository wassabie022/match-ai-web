# Этап сборки
FROM node:16 as build

# Создаем пользователя node
USER node

# Создаем директорию и устанавливаем права
WORKDIR /home/node/app

# Копируем файлы package.json и package-lock.json
COPY --chown=node:node package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем исходный код
COPY --chown=node:node . .
RUN chmod +x node_modules/.bin/react-scripts

# Выполняем сборку
RUN npm run build

# Этап production
FROM nginx:alpine
COPY --from=build /home/node/app/build /var/www/build
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"] 