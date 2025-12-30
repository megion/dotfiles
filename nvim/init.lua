-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- use only for vim-X11
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.g.autoformat = false
-- vim.opt.termguicolors = true

local opt = vim.opt
opt.shiftwidth = 4
opt.number = true

-- set vertical diff for vimdiff
opt.diffopt:append("vertical")

require("config.lazy")
require("config.keymaps")
require("config.lsp")

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    -- Only open nvim-tree if no files are opened and the current buffer is empty
    if
      #vim.api.nvim_list_bufs() == 1 and vim.api.nvim_buf_get_name(0) == ""
    then
      -- require("nvim-tree.api").tree.open()
      require("neo-tree.command").execute({
        action = "focus", -- OPTIONAL, this is the default value
        -- source = "filesystem", -- OPTIONAL, this is the default value
        -- position = "left", -- OPTIONAL, this is the default value
      })
    end
  end,
})

vim.cmd([[
source ~/dotfiles/neo_solarized-light.vim

" https://github.com/junegunn/fzf.vim/issues/528
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg -g '!{node_modules,build,dist,release}' --sort-files --column --line-number --no-heading --color=always -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': ['--bind', 'ctrl-s:select-all,ctrl-d:deselect-all']}), <bang>0)

]])



-- see https://github.com/VonHeikemen/lsp-zero.nvim/tree/v1.x?tab=readme-ov-file#usage
-- local lsp = require("lsp-zero").preset({
--   name = "minimal",
--   set_lsp_keymaps = true,
--   manage_nvim_cmp = true,
--   suggest_lsp_servers = false,
-- })
--
-- lsp.setup_servers({ "tsserver", "eslint", "jdtls", "lua_ls" })
--
-- -- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()
--
-- lsp.setup()

-- vim.lsp.config('luals', {
--   cmd = {'lua-language-server'},
--   filetypes = {'lua'},
--   root_markers = {'.luarc.json', '.luarc.jsonc'},
-- })

-- vim.lsp.enable('luals')
