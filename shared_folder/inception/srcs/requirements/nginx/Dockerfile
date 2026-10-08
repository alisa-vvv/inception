FROM alpine:3.23.6
RUN apk add nginx
COPY nginx.conf /etc/nginx.conf
#COPY nginx.conf /etc/default.conf
CMD [ "nginx -c /etc/nginx.conf" ]
