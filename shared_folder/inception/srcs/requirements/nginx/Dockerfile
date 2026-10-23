FROM alpine:3.23.6
RUN apk add --no-cache nginx openssl
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
RUN mkdir -p /etc/ssl/private
RUN mkdir -p /etc/ssl/certs
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/incept_key.pem \
	-out /etc/ssl/certs/incept_cert.pem -sha256 \
	-noenc -subj "/CN=avaliull.42.fr"
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]
