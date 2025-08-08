-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap(
  "n",
  "<Leader>yp",
  ":let @+ = expand('%:p')<CR>",
  { noremap = true, silent = true, desc = "Copy full path to clipboard" }
)

-- " open new tab
-- nnoremap tn :tabnew<CR>
vim.api.nvim_set_keymap(
  "n",
  "tn",
  ":tabnew<CR>",
  { noremap = true, silent = false, desc = "Open new tab" }
)

-- open tree
vim.api.nvim_set_keymap(
  "n",
  "tt",
  ":NvimTreeToggle<CR>",
  { noremap = true, silent = true, desc = "Toggle Tree" }
)
-- vim.keymap.set("n", "tt", "<cmd>Neotree toggle<CR>", { silent = false })
-- vim.keymap.set('n', 'tt', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
-- vim.keymap.set('n', '<leader>aa', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
-- vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
