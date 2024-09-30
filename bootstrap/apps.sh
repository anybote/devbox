#!/usr/bin/env bash

# install basic tools

cd /tmp/

# fish shell
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish -y
sudo chsh -s /usr/bin/fish vagrant

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim
rm nvim-linux64.tar.gz

# neovim deps
sudo apt install build-essential -y
sudo apt install ripgrep -y 
sudo apt install fd-find -y
sudo apt install python3-venv -y

# fastfetch
wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.24.0/fastfetch-linux-amd64.deb
sudo apt install ./fastfetch-linux-amd64.deb
rm fastfetch-linux-amd64.deb

