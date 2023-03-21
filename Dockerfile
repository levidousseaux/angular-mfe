FROM node:18.15.0-alpine AS build

WORKDIR /app
COPY . .

WORKDIR /app/root
RUN npm install
RUN npm run build

WORKDIR /app/investimentos
RUN npm install
RUN npm run build

FROM nginx:stable-alpine as server
COPY --from=build /app/root/dist/root /usr/share/nginx/html/root
COPY --from=build /app/investimentos/dist/investimentos /usr/share/nginx/html/modules/investimentos
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80