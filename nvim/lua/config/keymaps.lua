local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Типа 'Нажимает' на ESC при быстром нажатии jj, чтобы не тянутся
-- map('i', 'jj', '<Esc>', {noremap = true})

-- open new tab
-- map('n', 'tn', ':tabnew<CR>',  default_opts)

-- " open new tab
vim.api.nvim_set_keymap(
  "n",
  "tn",
  ":tabnew<CR>",
  { noremap = true, silent = false, desc = "Open new tab" }
)

-- open tree
-- vim.api.nvim_set_keymap(
--   "n",
--   "tt",
--   ":NvimTreeToggle<CR>",
--   { noremap = true, silent = true, desc = "Toggle Tree" }
-- )
vim.api.nvim_set_keymap(
  "n",
  "tt",
  ":Neotree toggle<CR>",
  { noremap = true, silent = true, desc = "Toggle Tree" }
)

-- find file in tree
vim.api.nvim_set_keymap(
  "n",
  "tf",
  ":NvimTreeFindFile<CR>",
  { noremap = true, silent = true, desc = "Find file in Tree" }
)

-- vertical resize
vim.api.nvim_set_keymap(
  "n",
  "<leader>t",
  ":vertical resize +10<CR>",
  { noremap = true, silent = true, desc = "Vertical resize" }
)

-- <esc> to exit terminal-mode
-- vim.api.nvim_set_keymap(
--   "t",
--   "<Esc>",
--   [[<C-\><C-n>]],
--   { noremap = true, silent = true, desc = "to exit terminal-mode" }
-- )

-- vim.api.nvim_set

-- :tnoremap <Esc> <C-\><C-n>

-- copy file path to clipboard
vim.api.nvim_set_keymap(
  "n",
  ",cl",
  ":let @+ = expand('%:p')<CR>",
  { noremap = true, silent = true, desc = "Copy full path to clipboard" }
)
