#!/usr/bin/env bash

# install basic tools

cd /tmp/

# fish shell
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish -y
sudo chsh -s /usr/bin/fish vagrant

# dotfiles
git clone https://github.com/anybote/dotfiles.git
./dotfiles/bootstrap.fish -f
rm -rf dotfiles

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim
rm nvim-linux64.tar.gz

# fastfetch
wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.24.0/fastfetch-linux-amd64.deb
sudo apt install ./fastfetch-linux-amd64.deb
rm fastfetch-linux-amd64.deb

# code-server
curl -fsSL https://code-server.dev/install.sh | sh
sudo systemctl enable --now code-server@vagrant
mkdir -p ~/.config/code-server && cat << EOF > ~/.config/code-server/config.yaml
bind-addr: 0.0.0.0:8080
auth: none
cert: false
EOF
sudo systemctl restart code-server@vagrant

