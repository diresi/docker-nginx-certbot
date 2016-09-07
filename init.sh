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


certbot certonly --email resi@rissner.net --webroot -w /var/lib/certbot/ -d rissner.net -d www.rissner.net -d rissner.com -d w
ww.rissner.com

# maybe ... (https://blog.qualys.com/ssllabs/2013/08/05/configuring-apache-nginx-and-openssl-for-forward-secrecy)
# ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
# ssl_prefer_server_ciphers on;
# ssl_ciphers "EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA RC4 !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS";

