# Personal config repository

This repository contains all my personal configuration files that I stole from other developers, you can pick what you want to use or you can use all by cloning this repository and running the `bootstrap` script(only tested on linux).

## 00 - What will the setup script it do?

- Install [AtroNvim](https://astronvim.github.io/) for [neovim](https://neovim.io/)
- Install a [Nerd Font](https://www.nerdfonts.com/) -- Default: [JetbrainsMono Nerd Font](https://www.nerdfonts.com/)
- Generate a [ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- Set [Zsh](https://www.zsh.org/) as the default shell and install it's plugins
- Link all the config files using [stow](https://www.gnu.org/software/stow/)

## 01 - Dependencie apps

Before running the setup script you need to have some applications installed on your machine for the script to work

- [git](https://git-scm.com/)
- [curl](https://curl.se/)
- [zsh](https://www.zsh.org/)
- [stow](https://www.gnu.org/software/stow/)
- [chsh](https://linux.die.net/man/1/chsh) -- If you don't have and don't want to install it just run `sudo usermod --shell /bin/zsh $USER` instead

## 02 - Setting up

First clone the repo where you want and cd inside the folder

```bash
git clone https://github.com/Diovani-C/.dotfiles.git
cd ./.dotfiles
```

run the `bootstrap.sh` script

```bash
bash bootstrap.sh
```

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
stow -vt ~/ configFolderName --no-folding
```

as an example for the neovim config

```bash
stow -vt ~/ nvim --no-folding
```

Or if you want you can add the files to ignore in `.stow-local-ignore` and then run the `bootstrap.sh` script or the following command
```bash
stow -vt ~/ */ --no-folding
```

and finaly the command to remove all the links is

```bash
stow -D -t ~/ */
```
## 05 - Extra

My main linux distro is [Fedora Silverblue](https://silverblue.fedoraproject.org/), and for convinience I made the `toolbox-init.sh` script to kickstart a [Toolbox](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/) environment, I don't really recomend using it since it's very specific for my needs, but it should work on any sytem using [dnf](https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/package-management/DNF/) as package manager.
