# Shouldn't really be doing from latest tag, but whatever
FROM resin/rpi-raspbian:latest
MAINTAINER github.com/AjkayAlan

#Update package lists, install nginx and configure, and cleanup
RUN apt-get update \
    && apt-get install -y nginx \
    && cp -rf nginx.config /etc/nginx/ \
    && cp --parents www/* /data/www/ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Expose ports
EXPOSE 80

# Start up NGINX
CMD ["nginx", "-g", "daemon off;"]
