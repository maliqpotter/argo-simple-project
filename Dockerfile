FROM nginx:stable-perl
RUN apt update && apt install -y git && rm -rf /usr/share/nginx/html/* && git clone https://github.com/gabrielecirulli/2048.git /usr/share/nginx/html