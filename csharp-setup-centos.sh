#!/bin/bash

# ensure centos host is graphical
yum groupinstall "GNOME Desktop" "Graphical Administration Tools" -y
ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target

# create a guest user
useradd guest
echo Be1fast1 | passwd guest --stdin

# update git
yum -y remove git # needs to be removed, as it removes an dep that is incompatible with later version
yum -y install https://centos7.iuscommunity.org/ius-release.rpm
yum -y install git2u-all

# install vscode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
yum install code -y

# install vscode c sharp extensions
runuser -l guest -c 'code --install-extension ms-vscode.csharp'
runuser -l guest -c 'code --install-extension jmrog.vscode-nuget-package-manager'

# install dotnet
rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
yum install dotnet-sdk-2.2 -y
