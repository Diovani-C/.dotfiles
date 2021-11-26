# choose neovim as default text editor
export EDITOR="nvim"
export VISUAL="nvim"

# History in cache directory:
export XDG_CONFIG_HOME="$HOME/.config"

export HISTFILE="$XDG_CONFIG_HOME/zsh/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file