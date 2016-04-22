#!/bin/bash
sudo apt-get install ack-grep
sudo ln -s /usr/bin/ack-grep /usr/bin/ack
sudo apt-get install sl
sudo apt-get install cowsay
sudo apt-get install toilet
sudo cp 69-motu-id /etc/update-motd.d/
sudo run-parts /etc/update-motd.d/
toilet "good job" | cowsay -W 69
