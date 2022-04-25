# Setup neovim

My nvim config file only works with `neovim >= 0.5` because of the lsp and lua support.

## Dependecies

- rg
- fd
- python3
- nodejs
- go

## Commands after install

- `python3 -m pip install --user --upgrade pynvim`
- `npm install -g neovim`
- `:PlugIntall` #Install all the plugins
- `:TSInstall c cpp dockerfile json scss javascript typescript go python rust lua` #Install language parsers
- `:LspInstall clangd tsserver eslint gopls rust_analyzer pyright` #Install LSP servers

## Extra

- [shortcuts](./SHORTCUTS.md)
  