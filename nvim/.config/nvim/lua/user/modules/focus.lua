require("focus").setup()

local keymap = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

keymap('n', '<c-f>', ':FocusToggle<CR>', opts)
keymap('n', '<c-h>', ':FocusSplitLeft<CR>', opts)
keymap('n', '<c-j>', ':FocusSplitDown<CR>', opts)
keymap('n', '<c-k>', ':FocusSplitUp<CR>', opts)
keymap('n', '<c-l>', ':FocusSplitRight<CR>', opts)

