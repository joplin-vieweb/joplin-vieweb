# joplin-vieweb
A simple web viewer for [Joplin](https://joplinapp.org/) notes.  
*If it's useful for you, you may consider to [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/donate/?business=T4U6TRV3PKYMY&no_recurring=0&item_name=Thanks+for+your+support+to+Joplin-Vieweb.%0AI+hope+you+find+it+useful.&currency_code=EUR)*

## Purpose
I'm going to use [Joplin](https://joplinapp.org/) as a notes application.  
It's a long time I wanted for something like Joplin: opensource, not coupled to a web giant, and without infinite storage: storage has a price, we should pay for it.

Joplin-vieweb purpose is to provide an **online view of my Joplin notes**.  
It's running on a "Django server", running beside [Joplin terminal app](https://joplinapp.org/terminal/). 

## Screenshot
![oplin-vieweb-screenshot](https://user-images.githubusercontent.com/26554495/121716124-f1e88f80-cadf-11eb-806b-c8b8d8c5ec03.png)

## Contact
I you want to discuss, ask, suggest... Please:
- Input [an issue](https://github.com/joplin-vieweb/joplin-vieweb/issues), or
- start [a discussion on github](https://github.com/joplin-vieweb/joplin-vieweb/discussions), or 
- post [on discord](https://discord.gg/akkn2y8vEg)

## Features and not(-yet?) features
### Yes it does ❤
- Protect joplin-vieweb access by login (see [here](https://github.com/joplin-vieweb/joplin-vieweb/releases/tag/v2.0.3) how to logout)
- Display notebooks, and notes
  - images
  - attachments
- search for notes
  - Press f key, or click magnifying glass icon
  - Search syntax: documented [here](https://discourse.joplinapp.org/t/search-syntax-documentation/9110) or [here](https://joplinapp.org/help/#searching).
  - ![image](https://github.com/joplin-vieweb/joplin-vieweb/assets/26554495/7b9645fc-1bd7-4877-8ba3-751e6e53f398)
- code syntax highlight
- Add a table of content if note contains headers
- Display tags, and notes linked.
- Joplin sync:
  - ![image](https://user-images.githubusercontent.com/26554495/121716272-1d6b7a00-cae0-11eb-9f39-d01b81d15d1f.png)
  - Background periodic joplin sync
  - Manual trigged sync, with notebooks and tag refresh
  - Supported target: nextcloud, Joplin server, webdav, S3
- Public link if note has ***public*** tag  
![image](https://user-images.githubusercontent.com/26554495/121775399-ac7f9d00-cb87-11eb-9f4a-2790af8b5f77.png)
- Option to number (or not) header in notes:  
![image](https://user-images.githubusercontent.com/26554495/121775425-e6e93a00-cb87-11eb-9018-80f24ac505a4.png)
- Tag edition: add / remove / create tags in notes:
![image](https://user-images.githubusercontent.com/26554495/122593861-89ad2700-d066-11eb-9cc0-bf82a0efef8e.png)
Once tags edited, a little reminder not to forget to synchronize Joplin:  
![image](https://user-images.githubusercontent.com/26554495/122594366-37203a80-d067-11eb-96c5-c3324fee376b.png)
- Checkbox list changes can be saved to notes.  
- ![image](https://user-images.githubusercontent.com/26554495/122877394-daf33a00-d336-11eb-8ac6-11ba16a240d7.png)
- Note edition / deletion, with support of image paste, and image / attachment drag&drop.
![image](https://user-images.githubusercontent.com/26554495/126487101-3d6fdae0-d1ed-4929-b000-5981928a2eb6.png)


![image](https://user-images.githubusercontent.com/26554495/126596832-a15895b6-90fb-416e-849a-192dfe8b08fd.png)
- Note creation
![joplin_create_note](https://user-images.githubusercontent.com/26554495/126760127-de455fb1-76ab-4d05-9ace-44f8fe719284.gif)
- Notebook edition: create / rename / delete
![notebook_edition](https://user-images.githubusercontent.com/26554495/127444638-a059931a-32f6-4027-8921-2dc073bf7034.gif)
- Notes history: list of the latest notes consulted, to be able to open them quickly, or pin them:
![demo_joplin_notes_history](https://user-images.githubusercontent.com/26554495/130871700-a78e54c1-81ff-4373-8b30-06bd826038d8.gif)
- Tabs in notes (not displayed in joplin applications). Syntax here.
![image](https://user-images.githubusercontent.com/26554495/130869166-4be37017-450b-4ee4-942a-3936963faaf8.png)
- Hyperlink preview in notes, on mouse hover:
![2022-02-08 10-31-54](https://user-images.githubusercontent.com/26554495/152967009-39286c76-bdc4-43bf-aaaa-1f04911cdf5f.gif)
- Render KaTeX:
![image](https://user-images.githubusercontent.com/26554495/171394071-a7f03926-73ee-4d44-9c27-b70f0b9d40d5.png)

### No it doesn't (yet?) 💔
- Sort notebooks nor notes
- Move note or notebook from one notebook to another.
- No specific handling for todos.

# Installation / configuration instructions
```diff
! Only linux systems are supported
! Only arm64 and amd64 architectures
! For raspberry users (I am): use 64 bits OS
```
## Installation
Installation is done with docker-compose. The default docker-compose file installs a nginx server with certbot certificates mechanisms, and listens to ports 80 and 443.  
If you have your own server, use [docker-compose-joplin-only.yml](https://github.com/joplin-vieweb/joplin-vieweb/blob/main/docker-compose-joplin-only.yml). Have a look to [the containers](#components).  
&nbsp;&nbsp;&nbsp;&nbsp;If your server is apache2, have a look to [this apache configuration procedure](https://github.com/joplin-vieweb/joplin-vieweb/wiki/Install-joplin-vieweb-on-a-local-web-server,-and-access-it-externally-from-a-subdomain-through-apache2).
  
* Prerequisites: your linux system has docker and docker-compose installed
* Enable docker service at system startup  
* Get docker-compose.yml *(either you clone this git repo, or you copy [the file](https://github.com/joplin-vieweb/joplin-vieweb/blob/main/docker-compose.yml) somewhere)*  
* Edit the 4 variables (x-common-variables block) at the top of docker-compose file:
  * ORIGINS: write the domain and/or IP address (only those origins are allowed to access joplin-vieweb)  
    Exemple:
    ```yaml
    x-common-variables: &common-variables
        ORIGINS: "'http://localhost:8080', 'http://192.168.21.1:8080'"
    ```
    or
    ```yaml
    x-common-variables: &common-variables
        ORIGINS: "'https://your_domain.com', 'https://12.34.56.78'"
        CERT_DOMAIN: your_domain.com 
        CERT_MAIL: you@zaclys.net
    ```
  * If you want to protect your notes access by requiring a login, set `JOPLIN_LOGIN_REQUIRED: True`. If you don't want the user to log in, set `JOPLIN_LOGIN_REQUIRED: False`.

  * If you use nginx and certbot containers:
    * CERT_DOMAIN: your domain so let's encrypt can contact (IP address doesn't work: you need a domain)
    * CERT_MAIL: a mail needed by let's encrypt.
  * If you don't use nginx and certbot container (if you use docker-compose-joplin-only.yml):
    * Change \<PORT-TO-YOUR-PROXY\> to fit your proxy setup.
* And "run"
```bash
sudo systemctl enable docker
cd ~
mkdir joplin-vieweb
cd joplin-vieweb
wget https://raw.githubusercontent.com/joplin-vieweb/joplin-vieweb/main/docker-compose.yml
vi docker-compose.yml # edit the x-common-variables (3 variables)
sudo docker-compose up
```

Congratulation, the server is running. If the system reboots, the server will start automatically (since we enabled docker.service at startup and the services in odcker-compose are set as "restart")

## Upgrade
When a new version is available, simply go to your docker-compose file:
```bash
sudo docker-compose down
sudo docker-compose pull
sudo docker-compose up
```

## Configuration and usage
```diff
! Users configuration is done from this url: https://your_domain.com/admin/
! Usage url, to access joplin notes: https://your_domain.com/joplin
```
### Users
First you must change admin password:
* login to https://your_domain.com/admin/ (login: admin / password: admin)
![image](https://user-images.githubusercontent.com/26554495/165942815-14d265eb-e68a-46c3-9cc4-a1171c3ae7e8.png)
* Change the admin password:  
![image](https://user-images.githubusercontent.com/26554495/165943055-ffea85c9-ddc2-4894-ae88-689ef5495d7c.png)
* If you want to login to joplin-vieweb with another login than admin: create a user:  
![image](https://user-images.githubusercontent.com/26554495/165943798-c7d03978-34ce-416e-98de-fab5fe4091e8.png)
* Now you can logout and visit https://your_domain.com/joplin  
![image](https://user-images.githubusercontent.com/26554495/165943443-718f0e50-8949-44a6-a9c4-629817442bc1.png)
* Login with admin or your newly created user:  
![image](https://user-images.githubusercontent.com/26554495/165943574-dc6349ac-6d3d-4f04-ae34-5c4353c24e15.png)

### Synchronisation
You should configure a synchronisation to secure your notes:

![image](https://user-images.githubusercontent.com/26554495/165929289-9a4e0855-e408-45c3-bc98-f9e9fb8b31cb.png)  
1️⃣ Click the settings tab  
2️⃣ Input synchronisation data (only nextcloud, webdav and joplin server are supported for now, if you would like other services, ask in a conversation)  
3️⃣ Test  
4️⃣ If test result is OK: save

If your cloud already contains joplin content, do a synchronisation:

![image](https://user-images.githubusercontent.com/26554495/165929859-af4f308c-704c-4afa-9c25-5c1f237b79f4.png)  
1️⃣ Click the synchronisation tab  
2️⃣ click the sync button  
3️⃣ Wait for the sync to finish (it may take a long time depending on your cloud content)

### Joplin
You can now access your notebooks: https://your_domain/joplin (⚠ don't forget the /joplin ⚠)

### Your reverse proxy: image size
Your reverse proxy probably limits the size of images that can be uploaded, and therefore put in notes.  
Don't forget to configure.  
For instance, or if you use the one provided, it's configured [here](https://github.com/joplin-vieweb/joplin-vieweb-nginx/blob/main/nginx_conf/joplin_vieweb.conf.template#L3).

# Components
![image](https://user-images.githubusercontent.com/26554495/165928456-731c2f4d-0280-4d95-a26c-1edf3020bb35.png)


