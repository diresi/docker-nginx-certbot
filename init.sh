mkdir /var/lib/certroot

#    #include certbot.conf;
#    location ^~ /.well-known/acme-challenge {
#        alias /var/lib/certbot/.well-known/acme-challenge;
#        default_type "text/plain";
#        try_files $uri =404;
#    }
#
#    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains";
#    ssl_certificate /etc/letsencrypt/live/rissner.net/fullchain.pem;
#    ssl_certificate_key /etc/letsencrypt/live/rissner.net/privkey.pem;


certbot --agree-tos --text certonly --email resi@rissner.net --webroot -w /var/lib/certbot/ -d rissner.net -d www.rissner.net -d mail.rissner.net -d rissner.com -d www.rissner.com -d mail.rissner.com

# and finally
nginx -s reload
