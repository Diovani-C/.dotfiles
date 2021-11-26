local lspsaga = require 'lspsaga'

lspsaga.init_lsp_saga()

local keymap = vim.api.nvim_set_keymap

local opts = { noremap=true, silent=true }

keymap('n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
keymap('n', 'ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
keymap('v', '<leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
keymap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
keymap('n', '<leader>k', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
keymap('n', '<leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
keymap('n', 'gd', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
keymap('n', '<leader>id', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)
keymap('n', '<leader>cd', "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>", opts)
keymap('n', '[d', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
keymap('n', ']d', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
keymap('n', '<A-d>', "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>", opts)
keymap('t', '<A-d>', "<C-\\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>", opts)

