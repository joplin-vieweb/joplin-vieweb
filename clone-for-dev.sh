#/bin/sh

for project in joplin-terminal-xapi django-joplin-vieweb; do
  git clone git@github.com:joplin-vieweb/${project}.git
done
