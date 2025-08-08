local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

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
vim.api.nvim_set_keymap(
  "n",
  "tt",
  ":NvimTreeToggle<CR>",
  { noremap = true, silent = true, desc = "Toggle Tree" }
)

-- find file in tree
vim.api.nvim_set_keymap(
  "n",
  "tf",
  ":NvimTreeFindFile<CR>",
  { noremap = true, silent = true, desc = "Find file in Tree" }
)

-- copy file path to clipboard
-- vim.api.nvim_set_keymap(
--   "n",
--   "<Leader>yp",
--   ":let @+ = expand('%:p')<CR>",
--   { noremap = true, silent = true, desc = "Copy full path to clipboard" }
-- )
