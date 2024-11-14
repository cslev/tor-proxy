# Dockerized ToR proxy
This is a simple Dockerized Tor proxy that can be used with other containers or host applications to communicate easily through the Tor network.

The container has nothing special in it, you probably find the same Dockerfile somewhere else too.

I aimed to have a smaller footprint container; hence, this one is based on Alpine.

# Build
 - via docker
```
$ git clone https://github.com/cslev/tor-proxy
$ sudo docker build -t cslev/tor-proxy:latest .
```
 - via docker-compose
```
$ git clone https://github.com/cslev/tor-proxy
$ sudo docker-compose build
```

