#!/usr/bin/env bash

# Enable fedora testing repo
sudo dnf config-manager --set-enabled updates-testing
sudo dnf config-manager --set-enabled updates-testing-modular

# Add vscode repo
printf "\n### Add VSCode repo"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

DNFCONF=/etc/dnf/dnf.conf

# Config to improove dnf speed
if ! grep -q "fastestmirror=True" "$DNFCONF"; then
  printf "\n### Configuring dnf\n"
  printf "\nfastestmirror=True\nmax_parallel_downloads=10\ndefaultyes=True\nkeepcache=True\n" | sudo tee -a "$DNFCONF" > /dev/null
fi

bash sudo dnf update -y

# Install essetial dev packages
sudo dnf install -y zsh nodejs rustc cargo pip code neovim python3-neovim ripgrep ncdu htop elixir erlang julia pinentry pinentry-gtk

# Install pnpm
printf "\n### Installing pnpm\n"
curl -fsSL https://get.pnpm.io/install.sh | PNPM_VERSION=7.0.0-rc.9 sh -

# Install neovim node package
sudo npm install -g neovim

# Install Elm
printf "\n### Installing Elm\n"
curl -L https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz | gunzip -c | sudo tee /usr/local/bin/elm > /dev/null
sudo chmod +x /usr/local/bin/elm

