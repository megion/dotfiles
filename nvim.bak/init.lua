-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- use only for vim-X11
vim.api.nvim_set_option("clipboard", "unnamedplus")

require("config.lazy")
require("config.keymaps")
