#!/bin/bash
#Copyright 2018 Miika Zitting http://miikazitting.wordpress.com GPL 3
#Script to setup of a liveusb and set it up as a slave for master

echo "Prepare yourself for the epic journey of salting your pc!"
set -o verbose

echo "Setting up your kblayout and installing salt-minion"

setxkbmap fi
sudo apt-get update
sudo apt-get -y install salt-minion

echo "Time to set you as a slave!"
read -p "Give your salted machine a name: " $saltId
echo -e 'master: 104.248.162.226\nid: saltId'|sudo tee /etc/salt/minion
sudo systemctl restart salt-minion
