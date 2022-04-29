local config = {

  -- Set colorscheme
  colorscheme = "ayu",

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      {"ayu-theme/ayu-vim", as = "ayu"}
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
  },

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local map = vim.keymap.set
    local set = vim.opt
    -- Set options
    set.shiftwidth = 4 -- Number of space inserted for indentation
    set.tabstop = 4 -- Number of space in a tab
    set.wildmode = { "longest", "list", "full"} -- Auto complete file names
    set.backspace = {"indent", "eol", "start"} -- Allow backspace end of line
    set.list = true -- Enable invisble characters
    set.listchars = {tab = "⤚-", space = "·", eol = "¬", nbsp = "⁃"} -- Show "invisible" characters

    -- Set key bindings
    map("n", "<C-s>", ":w!<CR>")

  end,
}
-- set guifont=JetBrains_Mono_Nerd_Font:h14

return config
