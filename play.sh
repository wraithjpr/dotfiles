#! /usr/bin/bash

# Plays a media stream selected from a list defined in the file ~/Music/play-them.csv
# play-them.csv has fields: name,url,command
# e.g. 
#Dawlish Beach Cam,https://www.youtube.com/watch?v=sKQJEL-xjjc,mpv
#Radio Caroline,http://78.129.202.200:8030/;,mpv

URLs=~/Music/play-them.csv

awk -v FS=, '! /^#/ {print $1}' ${URLs} \
    | dmenu -i -l 20 \
    | xargs -I{} -- awk -v FS=, '/{}/ {print $3,$2}' ${URLs} \
    | sh -s
