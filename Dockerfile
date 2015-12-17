FROM nginx

MAINTAINER  Sébastien.Stinkeste (sebastien.stinkeste@alterway.fr)

COPY nginx.conf /etc/nginx/donf.d/default.conf

COPY nginx.conf /etc/nginx/sites-available/default.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled


COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh


EXPOSE 80 443

WORKDIR /var/www/

CMD ["/entrypoint.sh"]
