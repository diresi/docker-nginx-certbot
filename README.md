# docker-nginx-certbot
nginx in docker doing SSL termination with certbot

This nginx instance forwards all requests to upstreams on the same docker network.

# Requirements
- docker >= 1.19
- docker-compose >= 1.8

# TOS

# Installation
- clone this repo
- edit `.env` and set your `EMAIL` and `DOMAINS` variables

The `DOMAINS` variable is expanded using bash, any whitespace is replaced with commas. This way you can define a bunch of subdomains at once.

# Terms of service

`certbot` is a frontend to handle [letsencrypt](https://letsencrypt.org/) SSL certificates.
This image uses these services you must accept their terms of service.

Right now, I cannot find an URL to point you there, but be sure to check them out.

When installing the initial certificate, certbot will ask you to accept the TOS (so run it interactive). Or you can set the `TOS=--agree-tos` environment variable in `.env`.

# Get your initial certificate

Run `certbot.sh` in the docker container. It'll see that it didn't fetch any certifcates yet and run the inital setup.

    docker-compose exec nginx /etc/letsencrypt/certbot.sh -v
    
If you haven't set the `TOS` environment variable `certbot` will ask you to accept their TOS, so be sure to run this command from an interactive shell.

# Update your certificate

`certbot` certificates are only valid for some 90 days. You'll need to refresh them regularly.
The procedure is the same as for the inital step.

Run `certbot.sh` in the docker container. It'll see the existing certificate and run the updater.

    docker-compose exec nginx /etc/letsencrypt/certbot.sh -v
    
Put this line in your docker-host crontab and run it every month or so.
