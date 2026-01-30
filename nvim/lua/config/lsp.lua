-- Diagnostics {{{
local config = {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "single",
    source = "always",
    header = "",
    prefix = "",
    suffix = "",
  },
}
vim.diagnostic.config(config)
-- }}}

-- open float window for diagnostic
vim.o.winborder = "single"

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

-- vim.lsp.config("gradle_ls", {
--   -- Unix
--   cmd = {
--     "/home/ilya/workspaces/lua/vscode-gradle/gradle-language-server/build/install/gradle-language-server/bin/gradle-language-server",
--   },
--   filetypes = { "gradle", "groovy" },
-- })
-- vim.lsp.enable('gradle_ls')
