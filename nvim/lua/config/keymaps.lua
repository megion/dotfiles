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
  { noremap = true, silent = false, desc = "Toggle Tree" }
)

-- find file in tree
vim.api.nvim_set_keymap(
  "n",
  "tf",
  ":Neotree reveal<CR>",
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

-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     -- Buffer-local keymaps. The { buffer = ev.buf } option is crucial.
--     local opts = { buffer = args.buf }
--
--     -- Map 'gi' to go to implementation
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
--     vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--     vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
--     vim.keymap.set("n", "fi", vim.lsp.buf.code_action, opts)
--
--     -- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
--     -- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
--     -- vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
--
--     -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   end,
-- })
