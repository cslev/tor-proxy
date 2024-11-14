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

# Run 
 - via docker
```
$ sudo docker run --rm --name tor-proxy -d -v ./log/tor:/var/log/tor -v ./lib/tor:/var/lib/tor cslev/tor-proxy:latest
```
 - via docker-compose
```
$ sudo docker-compose up -d
```

# Control - Create a new circuit
As can be seen in the `Dockerfile`, the tor-proxy is set not to change and re-establish new circuits every time a request is sent to it.
This is set by me in an attempt to reduce the overall latency. On the other hand, remote control is enabled via the `ControlPort` directive.
The remote control is possible through Cookie-based authentication, which is generated under `/var/lib/tor/control_auth_cookie`. 
That's why we add volume to our container in the `docker run` command or in the `docker-compose.yml`; to have access to that cookie file 
(besides the logs) on the host.

We need 


# Use
## via curl

## via Firefox

