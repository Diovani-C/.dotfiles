#!/usr/bin/env bash

# Update repository
    git pull origin main

# Install Nerd Font
    NERDFONT=~/.local/share/fonts/

    read -p "Enter a nerd font name [JetBrainsMono]:" FontName
    FontName=${FontName:-JetBrainsMono}

    NERDFONT="${NERDFONT}${FontName}"

    if [[ ! -d "$NERDFONT" ]]; then

        printf "\n### Installing ${FontName} Nerd Font \n"

        curl -fLo "${NERDFONT}.zip" --create-dirs \
            "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FontName}.zip"

        unzip "${NERDFONT}.zip" -d "$NERDFONT"

        rm "${NERDFONT}.zip"

        printf "\n### ${FontName} Nerd Font installed! \n"
    fi

# Create a SSH key
    SSHKEY=~/.ssh/id_ed25519

    if [[ ! -f "$SSHKEY" ]]; then

        read -p "Type an e-mail to create a SSH key:" Email 

        printf "\n### Creating SSH Key \n"

        ssh-keygen -t ed25519 -C Email

        eval "$(ssh-agent -s)"

        ssh-add $SSHKEY

        printf "\n### SSH Key created at $SSHKEY \n"
    fi

# Set zsh as default shell
    printf "\n### Setting zsh as default shell \n"
    chsh -s $(which zsh)

# Install zsh plugins
    printf "\n### Installing zsh plugins \n"

    if [[ ! -d ~/.config/zsh/syntax-highlighting ]]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/syntax-highlighting
    fi

    if [[ ! -d ~/.config/zsh/completions ]]; then
        git clone https://github.com/zsh-users/zsh-completions.git ~/.config/zsh/completions
        rm -f ~/.zcompdump; compinit

    fi
    if [[ ! -d ~/.config/zsh/powerlevel10k ]]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
    fi

#Install AtroNvim
    NVIMDIR=~/.config/nvim

    if [[ ! -d "$NVIMDIR" ]]; then
        printf "\n### Installing AtroNvim \n"

        git clone https://github.com/AstroNvim/AstroNvim "$NVIMDIR"
        nvim +PackerSync

        printf "\n### AtroNvim installed! \n"
    fi

# Install Miniconda
    CONDA=~/miniconda3

    if [[ ! -d "$CONDA" ]]; then
        printf "\n### Installing Miniconda\n"
        curl -L https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh > miniconda.sh
        bash miniconda.sh -p "$CONDA" 
        rm -f miniconda.sh
    fi

# Symlink dotfiles

    printf "\n### Linking config files\n"

    read -r -p "Do you want to link all the config files? [y/N]" response 
    response=${response,,}
    if [[ "$response" =~ ^(yes|y)$ ]]; then
        cd "$(dirname "${BASH_SOURCE[0]}")"
        stow -vt ~/ */ --no-folding
        printf "\n### All config files linked! \n"
    fi

