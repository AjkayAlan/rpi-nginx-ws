# rpi-nginx-ws
Raspberry Pi Docker image for my personal website using nginx as a static content host

## Building
Build the container using something like the following:  

`docker build -t ajkayalan/rpi-nginx-ws:latest https://github.com/AjkayAlan/rpi-nginx-ws.git`  

If you have cloned locally, you can do something like the following instead:  

`docker build -t ajkayalan/rpi-nginx-ws:latest .`  

## Running
After building the container, you will want to run it.

If you are spinning up this before the reverse proxy, you will need to create the network first:

`docker network create rp`

Now you can run the container. Note that you can only reach this through the reverse proxy since it doesn't have any ports exposed:

`docker run --name rpi-nginx-ws --net rp --restart always -d ajkayalan/rpi-nginx-ws:latest`
