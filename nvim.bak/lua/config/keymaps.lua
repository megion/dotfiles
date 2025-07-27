local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- Типа 'Нажимает' на ESC при быстром нажатии jj, чтобы не тянутся
map('i', 'jj', '<Esc>', {noremap = true})

-- open new tab
map('n', 'tn', ':tabnew<CR>',  default_opts)

