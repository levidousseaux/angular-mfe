FROM nginx:latest
COPY ./root/dist/root /usr/share/nginx/html/root
COPY ./investimentos/dist/investimentos /usr/share/nginx/html/modules/investimentos
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80