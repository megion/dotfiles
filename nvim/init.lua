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

vim.lsp.config("groovyls", {
  -- Unix
  cmd = {
    "java",
    "-jar",
    "/home/ilya/workspaces/java/groovy-language-server/build/libs/groovy-language-server-all.jar",
  },
  ...,
})

vim.lsp.config("jdtls", {
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-25",
            path = "/usr/lib/jvm/java-25-openjdk",
          },
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk",
            -- default = true, -- Set as the default if no project config is found
          },
        },
      },
    },
  },
})

-- open float window for diagnostic
vim.o.winborder = "single"

vim.lsp.enable("groovyls")

vim.lsp.enable("lua_ls")
vim.lsp.enable("jdtls")

-- Global diagnostics configuration
vim.diagnostic.config({
  -- Set virtual_text to false to disable inline diagnostic messages
  virtual_text = false,
  -- Configure the appearance of the floating window if needed (optional)
  float = {
    border = "rounded", -- or 'single', 'double', etc.
    source = "always",
    severity_sort = true,
    -- Add close events to make the window close automatically
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  },
})

-- Reduce updatetime to make the hover effect feel faster (default is 4000ms)
-- 250ms is a common value and does not aggressively write to swap files
vim.o.updatetime = 250

-- Autocommand to open the diagnostic float when the cursor stops moving
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "lua vim.diagnostic.open_float(nil, { focusable = false })",
  group = "lsp_diagnostics_hold",
})

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
