FROM nginx:1.11.3-alpine

COPY certbot.sh /etc/letsencrypt/certbot.sh
RUN apk update \
    && apk add --no-progress \
            bash certbot openssl  \
    && rm /var/cache/apk/* \
    && echo "preparing certbot webroot" \
    && mkdir -p /var/lib/certbot \
    && echo "generating initial self-signed certificate" \
    && mkdir -p /etc/letsencrypt/live/example.net/ \
    && openssl req -x509 -nodes -newkey rsa:4096 \
           -keyout /etc/letsencrypt/live/example.net/privkey.pem \
           -out /etc/letsencrypt/live/example.net/fullchain.pem \
           -subj "/C=/ST=/L=/O=/CN=example.net" \
    && /etc/letsencrypt/certbot.sh --nocert --noreload

COPY default.conf /etc/nginx/conf.d/default.conf
