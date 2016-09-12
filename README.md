# docker-nginx-certbot
nginx in docker doing SSL termination with certbot

# Requirements
- docker >= 1.19
- docker-compose >= 1.8

# Installation
- clone this repo
- edit `.env` and set your `EMAIL` and `DOMAINS` variables

The `DOMAINS` variable is expanded using bash, any whitespace is replaced with commas. This way you can define a bunch of subdomains at once.

Get your initial certificate
############################

Run `certbot.sh` in the docker container. It'll see that it didn't fetch any certifcates yet and run the inital setup.

    docker-compose exec nginx /etc/letsencrypt/certbot.sh -v
    
Update your certificate
#######################

`certbot`/letsencrypt certificates are only valid for some 90 days. You'll need to refresh them regularly.
The procedure is the same as for the inital step.

Run `certbot.sh` in the docker container. It'll see the existing certificate and run the updater.

    docker-compose exec nginx /etc/letsencrypt/certbot.sh -v
    
Put this line in your docker-host crontab and run it every month or so.
