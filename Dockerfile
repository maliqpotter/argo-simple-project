FROM nginx:stable-perl
RUN apt update && apt install -y git && \
    rm -rf /usr/share/nginx/html/* && \
    git clone https://github.com/gabrielecirulli/2048.git /usr/share/nginx/html && \
    # Replace relative paths with paths that include the prefix
    find /usr/share/nginx/html -name "*.html" -exec sed -i 's/href="style/href="\/gameku\/style/g' {} \; && \
    find /usr/share/nginx/html -name "*.html" -exec sed -i 's/src="js/src="\/gameku\/js/g' {} \; && \
    find /usr/share/nginx/html -name "*.html" -exec sed -i 's/href="meta/href="\/gameku\/meta/g' {} \; && \
    find /usr/share/nginx/html -name "*.html" -exec sed -i 's/href="favicon.ico/href="\/gameku\/favicon.ico/g' {} \;