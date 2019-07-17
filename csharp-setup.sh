#!/bin/bash

# https://pimylifeup.com/raspberry-pi-visual-studio-code/
wget https://packagecloud.io/headmelted/codebuilds/gpgkey -O - | sudo apt-key add -

curl -L https://code.headmelted.com/installers/apt.sh | sudo bash

# https://github.com/headmelted/codebuilds/issues/67
apt-get -y --allow-downgrades install code-oss=1.29.0-1539702286
apt-mark hold code-oss
apt-mark unhold code-oss

# install vs code C# support
code-oss --install-extension ms-vscode.csharp

# install .net core dependencies
apt-get install curl libunwind8 gettext

# install dotnet sdk
curl -L https://dotnet.microsoft.com/download/thank-you/dotnet-sdk-2.2.301-linux-arm32-binaries
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-2.2.301-linux-arm.tar.gz -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
