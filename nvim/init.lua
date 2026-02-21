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

-- %l for line number, %s for sign column
-- opt.statuscolumn = "%l%s"
-- opt.numberwidth = 4
-- opt.signwidth = 4
opt.signcolumn = "yes"

-- set vertical diff for vimdiff
opt.diffopt:append("vertical")
-- opt.cursorline = true

require("config.lazy")
require("config.keymaps")
require("config.lsp")
require("config.lualine_themes")

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    -- Only open nvim-tree if no files are opened and the current buffer is empty
    if
      #vim.api.nvim_list_bufs() >= 1 and vim.api.nvim_buf_get_name(0) == ""
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

vim.cmd('command! -nargs=* MyLint lua MyEslint()')
