# Базовая платформа для запуска Nginx
FROM ubuntu:18.04

# Стандартный апдейт репозитория
RUN apt-get -y update
# Установка Nginx
RUN apt-get install -y nginx

# Указываем Nginx запускаться на переднем плане (daemon off)
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
# В индексном файле меняем первое вхождение nginx на docker-nginx
#RUN sed -i "0,/nginx/s/nginx/docker-nginx/i" /usr/share/nginx/html/index.html
# Запускаем Nginx. CMD указывает, какую команду необходимо запустить, когда контейнер запущен.
##ADD https://raw.githubusercontent.com/aierohin/diplom_nginx/main/index.html /var/www/html/index.html
COPY index.html /var/www/html/index.html
#/usr/share/nginx/html/index.html
CMD [ "nginx" ]
