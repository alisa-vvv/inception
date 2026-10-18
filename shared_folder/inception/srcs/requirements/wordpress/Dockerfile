FROM	alpine:3.23.6
# installing php-fpm and other necessary php packages.
# taken from here: https://make.wordpress.org/hosting/handbook/server-environment/#php-extensions
# not sure what php-phar does but saw it in onther icneptions

RUN apk add --no-cache php84
#RUN	apk add --no-cache php84-hash
RUN apk add --no-cache php84-mysqli
RUN apk add --no-cache php84-fpm
RUN apk add --no-cache php84-curl
RUN apk add --no-cache php84-dom
RUN apk add --no-cache php84-exif
RUN apk add --no-cache php84-fileinfo
#RUN	apk add --no-cache php84-igbinary
RUN apk add --no-cache php84-mbstring
RUN apk add --no-cache php84-openssl
RUN apk add --no-cache php84-xml
RUN apk add --no-cache php84-zip
RUN apk add --no-cache php84-phar
RUN apk add --no-cache mysql-client

# change workind directory to this. I believe this is the default wordpress directory
# this is just the base example, consider using a different one?
WORKDIR	/var/www/html

#downloading wordpress. directly using example from https://make.wordpress.org/cli/handbook/guides/installing/
RUN	wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

#this will set up wordrpress and launch it, same as nginx
COPY php.ini /etc/php84/php.ini
COPY wp_start-script.sh /usr/local/bin/wp_start-script.sh
RUN chmod +x /usr/local/bin/wp_start-script.sh

# other containers connect to this one through this port
EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/wp_start-script.sh" ]
