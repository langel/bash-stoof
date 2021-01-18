#!/bin/bash
sudo apt-get install ack-grep
sudo ln -s /usr/bin/ack-grep /usr/bin/ack
sudo apt-get install silversearcher-ag
sudo apt-get install sl
sudo apt-get install cowsay
sudo apt-get install toilet
sudo cp 69-motu-id /etc/update-motd.d/
sudo run-parts /etc/update-motd.d/
echo "setting default git editor to vim"
git config --global core.editor "vim"
toilet --gay "cow say" 
cowsay -W 69 "jood jorb"
