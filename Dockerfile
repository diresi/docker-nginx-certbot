FROM nginx:1.11.3-alpine

RUN apk update \
    && apk add --no-progress \
            certbot openssl  \
    && rm /var/cache/apk/* \
    && echo "generating initial self-signed certificate" \
    && mkdir -p /etc/letsencrypt/live/rissner.net \
    && openssl req -x509 -nodes -newkey rsa:4096 \
           -keyout /etc/letsencrypt/live/rissner.net/privkey.pem \
           -out /etc/letsencrypt/live/rissner.net/fullchain.pem \
           -subj "/C=/ST=/L=/O=/CN=rissner.net"

COPY default.conf /etc/nginx/conf.d/default.conf
