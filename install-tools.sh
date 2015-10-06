#!/bin/bash
sudo apt-get install sl
sudo apt-get install cowsay
sudo apt-get install toilet
cp 69-motu-id /etc/update-motd.d/
toilet "good job" | cowsay -W 69
