FROM ubuntu:20.04
LABEL contact="mavrick202@gmail.com"
RUN apt update && apt install -y nginx net-tools iputils-ping
COPY index.html /usr/share/nginx/html/
COPY scorekeeper.js /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
CMD ["/bin/bash","script.sh"]
