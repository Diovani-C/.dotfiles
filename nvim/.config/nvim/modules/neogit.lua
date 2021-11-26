local neogit = require('neogit')

neogit.setup {}

local keymap = vim.api.nvim_set_keymap

local opts = { noremap=true, silent=true }

keymap('n', '<leader>g', "<cmd>lua require('neogit').open()", opts )
keymap('n', '<leader>gc', "<cmd>lua require('neogit').open({ 'commit' })", opts )


