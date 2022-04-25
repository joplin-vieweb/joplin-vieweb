# joplin-vieweb
A web viewer for Joplin app

# Please wait until it's ready... it should be quite soon.

# Installation instruction
Installation is done with docker-compose. The default docker-compose file installs a nginx server with certbot certificates mechanisms, and listens to ports 80 and 443.  
If you have your own server, use docker-compose-joplin-only.yml (*todo*)

* Not-documented prerequisites: your linux system has docker and docker-compose installed.
* Get docker-compose.yml *(either you clone this git repo, or you copy [the file](https://github.com/joplin-vieweb/joplin-vieweb/blob/main/docker-compose.yml) somewhere)*
* Edit the 3 variables (x-common-variables block) at the top of docker-compose file.
* And "run".
```bash
cd ~
mkdir joplin-vieweb
cd joplin-vieweb
wget https://raw.githubusercontent.com/joplin-vieweb/joplin-vieweb/main/docker-compose.yml
vi docker-compose.yml # edit the x-common-variables (3 variables)
sudo docker-compose up
```
## Systemd your docker-compose.
Todo

# Components
![image](https://user-images.githubusercontent.com/26554495/161628724-11b17aab-c3cf-4def-8159-dc2bebd11d22.png)

