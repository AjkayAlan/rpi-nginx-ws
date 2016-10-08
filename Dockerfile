# Newer jessie images are busted
FROM resin/rpi-raspbian:jessie-20160831
MAINTAINER github.com/AjkayAlan

#Update package lists, install nginx, and cleanup
RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

#Use personal config
COPY nginx.conf /etc/nginx/nginx.conf

#Copy personal website
COPY www/* /data/www/

# Expose ports
EXPOSE 80

# Start up NGINX
CMD ["nginx", "-g", "daemon off;"]
