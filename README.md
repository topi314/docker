# docker
contains my docker-compose configuration for my VServer :)

## Container Starting Order:

    1. database
    
    2. teamcity
    
    3. kittybot
    
    4. kittybot-website
    
    5. nginx

or run the start script

## Updating KittyBot
run ```./update``` in kittybot

## Updating KittyBot-Website
run ```./update``` in kittybot-website

## LetsEncrypt Cert Bot
run ```certbot certonly --standalone -d anteiku.de -d www.anteiku.de -d kittybot.anteiku.de -d api.anteiku.de -d ci.anteiku.de```
(nothing should run on port 80)