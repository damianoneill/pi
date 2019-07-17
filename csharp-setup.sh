#!/bin/bash

# https://pimylifeup.com/raspberry-pi-visual-studio-code/
wget https://packagecloud.io/headmelted/codebuilds/gpgkey -O - | sudo apt-key add -

curl -L https://code.headmelted.com/installers/apt.sh | sudo bash

# https://github.com/headmelted/codebuilds/issues/67
sudo apt-get -y --allow-downgrades install code-oss=1.29.0-1539702286
sudo apt-mark hold code-oss
sudo apt-mark unhold code-oss

# install vs code C# support
code-oss --install-extension ms-vscode.csharp --force

# install .net core dependencies
sudo apt-get -y install curl libunwind8 gettext

# install dotnet sdk
# see https://dotnet.microsoft.com/download/thank-you/dotnet-sdk-2.2.301-linux-arm32-binaries contents for url below
curl -L https://download.visualstudio.microsoft.com/download/pr/4bc4d8e7-e736-4323-b82c-f75559502e9c/582e01f7b7a67cd23a22e5bfff317f10/dotnet-sdk-2.2.301-linux-arm.tar.gz --output dotnet-sdk-2.2.301-linux-arm.tar.gz
mkdir -p ~/dotnet && tar zxf dotnet-sdk-2.2.301-linux-arm.tar.gz -C ~/dotnet
grep -qxF 'export DOTNET_ROOT=$HOME/dotnet' ~/.bashrc || echo 'export DOTNET_ROOT=$HOME/dotnet' >>~/.bashrc
grep -qxF 'export PATH=$PATH:$HOME/dotnet' ~/.bashrc || echo 'export PATH=$PATH:$HOME/dotnet' >>~/.bashrc
source ~/.bashrc
