# Personal config repository

This repository contains all my personal configuration files that I stole from other developers, you can pick what you want to use or you can use all by cloning this repository and running the setup script(only tested on linux).

## 00 - What will the setup script it do?

- Install [vim-plug](https://github.com/junegunn/vim-plug) for [neovim](https://neovim.io/)
- Install [JetbrainsMono Nerd Font](https://www.nerdfonts.com/)
- Generate a [ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- Set [Zsh](https://www.zsh.org/) as the default shell and install it's plugins
- Link all the config files using [stow](https://www.gnu.org/software/stow/)

## 01 - Dependencie apps

Before running the setup script you need to have some applications installed on your machine for the script to work

- [git](https://git-scm.com/)
- [zsh](https://www.zsh.org/)
- [stow](https://www.gnu.org/software/stow/)

## 02 - Setting up

First clone the repo where you want and cd inside the folder

```bash
git clone https://github.com/Diovani-C/.dotfiles.git
cd ./.dotfiles
```

run the setup script

```bash
./setup
```

If tou dont have chsh you will need to run `sudo usermod --shell /bin/zsh $USER`

## 03 - Possible problems

The stow program will refuse to link a directory or file if you already have the config file there, this is to prevent it from replacing your config files, so if you see (using .gitconfig as example) a message like:

```bash
WARNING! stowing gitconfig would cause conflicts:
  * existing target is neither a link nor a directory: .gitconfig
```

You would have to manually delete the config file or manually select the configs you want to link instead.

## 04 - Linking individual config files

If you want to select wich config files you want to use, you can run this command inside the project folder

```bash
stow -t ~/ configFolderName
```

as an example for the neovim config

```bash
stow -t ~/ nvim
```

Or if you want just the config files you can run this command to link all the files (the -v is for verbose so you know what is happening to your files)

```bash
stow -vt ~/ */
```

and finaly the command to remove all the links is

```bash
stow -D -t ~/ */
```
