# rpi-nginx-ws
Raspberry Pi Docker image for my personal website using nginx as a static content host

## Building
Build the container using something like the following:  

`docker build -t ajkayalan/rpi-nginx-ws:latest https://github.com/AjkayAlan/rpi-nginx-ws.git`  

If you have cloned locally, you can do something like the following instead:  

`docker build -t ajkayalan/rpi-nginx-ws:latest .`  

## Running
After building the container, you will want to run it. Note that this is running on localhost on port 8080 so you have to go through the reverse proxy:

`docker run --name rpi-nginx-ws -d -p 127.0.0.1:8080:80 ajkayalan/rpi-nginx-ws:latest`
