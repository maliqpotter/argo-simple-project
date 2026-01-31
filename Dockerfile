FROM httpd
MAINTAINER Renaldy Gatan Test Coba
RUN apt update && apt install -y git curl && \
    rm -rf /usr/local/apache2/htdocs/* && \
    git clone https://github.com/gabrielecirulli/2048.git /usr/local/apache2/htdocs
