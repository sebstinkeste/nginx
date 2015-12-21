FROM nginx

MAINTAINER  Sébastien.Stinkeste (sebastien.stinkeste@alterway.fr)

COPY nginx.conf /etc/nginx/nginx2.conf
COPY nginx.conf /etc/nginx/conf.d/nginx2.conf

COPY nginx.conf /etc/nginx/sites-available/nginx2.conf
RUN ln -s /etc/nginx/sites-available/nginx2.conf /etc/nginx/sites-enabled

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 80 443


WORKDIR /var/www

CMD ["/entrypoint.sh"]