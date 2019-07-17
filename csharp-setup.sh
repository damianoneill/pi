#!/bin/bash

# https://pimylifeup.com/raspberry-pi-visual-studio-code/
wget https://packagecloud.io/headmelted/codebuilds/gpgkey -O - | sudo apt-key add -

curl -L https://code.headmelted.com/installers/apt.sh | sudo bash
