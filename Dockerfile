# Use Alpine as the base image for a lightweight Tor proxy container
FROM alpine:latest

# Install Tor
RUN apk update && \
  apk add --no-cache tor bash net-tools busybox-extras

# Configure Tor to run as a SOCKS proxy on port 9050
RUN echo "SOCKSPort 0.0.0.0:9050" >> /etc/tor/torrc && \
  echo "ControlPort 0.0.0.0:9051" >> /etc/tor/torrc && \
  echo "CookieAuthentication 1" >> /etc/tor/torrc && \
  echo "CookieAuthFile /var/lib/tor/control_auth_cookie" >> /etc/tor/torrc && \
  echo "CookieAuthFileGroupReadable 1" >> /etc/tor/torrc && \
  echo "DataDirectoryGroupReadable 1" >> /etc/tor/torrc && \
  echo "Log notice file /var/log/tor/tor.log" >> /etc/tor/torrc && \
  echo "Log notice stdout" >> /etc/tor/torrc

 
# only for debug
#RUN echo "Log debug file /var/log/tor/tor-debug.log" >> /etc/tor/torrc

# prevents Tor from isolating each stream based on SOCKS authentication, 
# allowing browsers to reuse the same circuit -> can result in more stable
# connection to onion sites when, for instance, images constantly do not
# load on a webiste
RUN echo "StrictNodes 1" >> /etc/tor/torrc
# Later if want to create new circuits for every website visit, we
# can use the control port and netcat commands
# COOKIE=$(hexdump -e '32/1 "%02x""\n"' ./lib/tor/control_auth_cookie)
# echo -ne "AUTHENTICATE ${COOKIE}\r\nSIGNAL NEWNYM\r\nQUIT" | nc 172.17.0.2 9051


# Expose the SOCKS port - note this is just a note here, this command itself
# does not expose the port as it is a docker feature, not the image feature itself
# it is here to just indicate that this is the port we should look for
EXPOSE 9050

# Run Tor
CMD ["tor"]
