FROM alpine:3.23.6
RUN apk add nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
#COPY nginx.conf /etc/default.conf
CMD [ "nginx", "-g", "daemon off;" ]
