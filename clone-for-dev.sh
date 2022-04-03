#/bin/sh

for project in joplin-terminal-xapi django-joplin-vieweb joplin-vieweb-nginx joplin-vieweb-certbot; do
  git clone git@github.com:joplin-vieweb/${project}.git
done
