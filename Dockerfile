FROM alpine:3.12
ADD https://php.hernandev.com/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub
RUN echo "https://php.hernandev.com/v3.11/php-7.4" >> /etc/apk/repositories && \
	apk update && apk upgrade && apk add \
	\
	nginx \
	php7 \
	php7-gd \
	php7-fpm \
	php7-opcache \
	php7-session \
	php7-json \
	\
	&& rm /var/cache/apk/* && \
	\
	ln -sf /dev/stdout /var/log/nginx/access.log && \
	ln -sf /dev/stderr /var/log/nginx/error.log && \
	\
	mkdir /run/nginx && touch /run/nginx/nginx.pid && \
	rm -r /var/www/localhost && mkdir /var/www/html

COPY default.conf /etc/nginx/conf.d/
COPY dokuwiki.sh /opt/
COPY php.ini /etc/php7/
RUN chmod +x /opt/dokuwiki.sh
WORKDIR /root
EXPOSE 80
ENTRYPOINT ["sh", "/opt/dokuwiki.sh"]
