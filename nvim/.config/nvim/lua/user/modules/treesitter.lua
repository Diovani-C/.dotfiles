require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "typescript",
    "json",
    "html",
    "scss",
    "rust",
    "javascript",
    "c",
    "go"
  },
}

