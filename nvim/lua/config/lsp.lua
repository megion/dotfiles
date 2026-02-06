-- Diagnostics {{{
-- Define the icons
local icons = {
  Error = " ",
  Warn = " ",
  Info = " ",
  Hint = " ",
}
local config = {
  signs = {
    -- local signs = {
    --     Error = " ",
    --     Warn = " ",
    --     Hint = " ",
    --     Info = " ",
    -- }
    --Error	 (or similar)	Indicates an error (red in color).
    -- Warning	 (or similar)	Indicates a warning (yellow/orange).
    -- Hint	 (or similar)	Indicates a hint (usually blue).
    -- Info	 (or similar)	Indicates information (usually blue/cyan).
    --  and for lightbulb: text = " "
    text = {
      -- [vim.diagnostic.severity.ERROR] = "",
      -- [vim.diagnostic.severity.WARN] = "",
      -- [vim.diagnostic.severity.HINT] = "",
      -- [vim.diagnostic.severity.INFO] = "",
      -- [vim.diagnostic.severity.ERROR] = "",
      -- [vim.diagnostic.severity.WARN] = "",
      -- [vim.diagnostic.severity.HINT] = " ",
      -- [vim.diagnostic.severity.INFO] = "",
      --
      -- [vim.diagnostic.severity.ERROR] = "",
      -- [vim.diagnostic.severity.WARN] = "",
      -- [vim.diagnostic.severity.HINT] = "",
      -- [vim.diagnostic.severity.INFO] = "",

      [vim.diagnostic.severity.ERROR] = icons.Error,
      [vim.diagnostic.severity.WARN] = icons.Warn,
      [vim.diagnostic.severity.INFO] = icons.Info,
      [vim.diagnostic.severity.HINT] = icons.Hint,
    },

    -- Enable signs in the gutter
    active = true,
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

-- local my_border = {
--     { "┌", "FloatBorder" }, { "─", "FloatBorder" }, { "┐", "FloatBorder" },
--     { "│", "FloatBorder" }, { "┘", "FloatBorder" }, { "─", "FloatBorder" },
--     { "└", "FloatBorder" }, { "│", "FloatBorder" },
-- }

-- Make the background transparent for diagnostics/floating windows
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

    -- Set the highlight groups for the signs (optional, but ensures correct colors)
    vim.api.nvim_set_hl(
      0,
      "DiagnosticSignError",
      { fg = "#f7768e", bold = true }
    ) -- Example color
    vim.api.nvim_set_hl(
      0,
      "DiagnosticSignWarn",
      { fg = "#e0af68", bold = true }
    ) -- Example color
    vim.api.nvim_set_hl(
      0,
      "DiagnosticSignInfo",
      { fg = "#7aa2f7", bold = true }
    ) -- Example color
    vim.api.nvim_set_hl(
      0,
      "DiagnosticSignHint",
      { fg = "#9d7cde", bold = true }
    ) -- Example color
  end,
})

-- Global diagnostics configuration
vim.diagnostic.config({
  -- Set virtual_text to false to disable inline diagnostic messages
  virtual_text = true,
  -- virtual_text = {
  --   prefix = '●', -- Icons like LazyVim
  --   -- spacing = 4,
  -- },
  -- Configure the appearance of the floating window if needed (optional)
  float = {
    border = "rounded", -- or 'single', 'double', etc.
    -- border = my_border, -- or 'single', 'double', etc.
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

-- Change the foreground color of the FloatBorder
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7aa2f7" }) -- Example color
-- You can also set cterm and background colors
-- vim.api.nvim_set_hl(0, "FloatBorder", { ctermfg = "blue", ctermbg = "none" })

-- Add this to your init.lua or equivalent config file
-- vim.diagnostic.config({
--   virtual_text = {
--     prefix = '●', -- Icons like LazyVim
--     spacing = 4,
--   },
--   -- signs = true,
--   -- underline = true,
--   -- update_in_insert = false, -- or true to match your preference
--   severity_sort = true,
--   float = {
--     focusable = false,
--     style = 'minimal',
--     border = 'rounded',
--     source = 'always',
--     -- header = '',
--     -- prefix = '',
--     -- Add close events to make the window close automatically
--     close_events = {
--       "CursorMoved",
--       "CursorMovedI",
--       "BufHidden",
--       "InsertCharPre",
--       "WinLeave",
--     },
--   },
-- })

-- Reduce updatetime to make the hover effect feel faster (default is 4000ms)
-- 250ms is a common value and does not aggressively write to swap files
vim.o.updatetime = 250

-- Autocommand to open the diagnostic float when the cursor stops moving
-- vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   pattern = "*",
--   command = "lua vim.diagnostic.open_float(nil, { focusable = false })",
--   group = "lsp_diagnostics_hold",
-- })

-- vim.lsp.config("gradle_ls", {
--   -- Unix
--   cmd = {
--     "/home/ilya/workspaces/lua/vscode-gradle/gradle-language-server/build/install/gradle-language-server/bin/gradle-language-server",
--   },
--   filetypes = { "gradle", "groovy" },
-- })
-- vim.lsp.enable('gradle_ls')
