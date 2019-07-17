#!/bin/bash

# https://pimylifeup.com/raspberry-pi-visual-studio-code/
wget https://packagecloud.io/headmelted/codebuilds/gpgkey -O - | sudo apt-key add -

curl -L https://code.headmelted.com/installers/apt.sh | sudo bash

# https://github.com/headmelted/codebuilds/issues/67
apt-get install code-oss=1.29.0-1539702286
apt-mark hold code-oss
apt-mark unhold code-oss
