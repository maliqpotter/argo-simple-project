FROM nginx:stable-perl
RUN apt update && apt install -y git curl && \
    rm -rf /usr/share/nginx/html/* && \
    git clone https://github.com/gabrielecirulli/2048.git /usr/share/nginx/html && \
    # Replace relative paths with paths that include the prefix
    find /usr/share/nginx/html -name "*.html" -exec sed -i 's/href="style/href="\/gameku\/style/g' {} \; && \
    find /usr/share/nginx/html -name "*.html" -exec sed -i 's/src="js/src="\/gameku\/js/g' {} \; && \
    find /usr/share/nginx/html -name "*.html" -exec sed -i 's/href="meta/href="\/gameku\/meta/g' {} \; && \
    find /usr/share/nginx/html -name "*.html" -exec sed -i 's/href="favicon.ico/href="\/gameku\/favicon.ico/g' {} \; && \
    # Verify setup
    ls -la /usr/share/nginx/html

# Copy your external nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf