-- Diagnostics {{{
-- Define the icons
local icons = {
  Error = " ",
  Warn = " ",
  Info = " ",
  Hint = "💡",
}

local config = {
  signs = {
    text = {
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

  -- Set virtual_text to false to disable inline diagnostic messages
  -- virtual_text = false,

  -- virtual_text = {
  --   format = function(diagnostic)
  --     return string.format(
  --       "%s (%s): [%s]",
  --       diagnostic.message,
  --       diagnostic.source,
  --       diagnostic.code
  --     )
  --   end,
  -- },

  -- float = {
  --   focusable = false,
  --   style = "minimal",
  --   border = "single",
  --   source = "always",
  --   header = "",
  --   prefix = "",
  --   suffix = "",
  -- },
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
    virtual_lines = { current_line = true },

    -- format = function(diagnostic)
    --   return string.format(
    --     "%s (%s) [%s]",
    --     diagnostic.message,
    --     diagnostic.source,
    --     diagnostic.code
    --   )
    -- end,
  },
}

vim.diagnostic.config(config)

-- open float window for diagnostic
vim.o.winborder = "single"

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

    -- Set the highlight groups for the signs (optional, but ensures correct colors)
    -- vim.api.nvim_set_hl(
    --   0,
    --   "DiagnosticSignError",
    --   { fg = "#f7768e", bold = true }
    -- ) -- Example color
    -- vim.api.nvim_set_hl(
    --   0,
    --   "DiagnosticSignWarn",
    --   { fg = "#e0af68", bold = true }
    -- ) -- Example color
    -- vim.api.nvim_set_hl(
    --   0,
    --   "DiagnosticSignInfo",
    --   { fg = "#7aa2f7", bold = true }
    -- ) -- Example color
    -- vim.api.nvim_set_hl(
    --   0,
    --   "DiagnosticSignHint",
    --   { fg = "#9d7cde", bold = true }
    -- ) -- Example color
  end,
})

-- Reduce updatetime to make the hover effect feel faster (default is 4000ms)
-- 250ms is a common value and does not aggressively write to swap files
-- vim.o.updatetime = 150

-- Autocommand to open the diagnostic float when the cursor stops moving
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "lua vim.diagnostic.open_float(nil, { focusable = false })",
  group = "lsp_diagnostics_hold",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    -- require("origami.features.lsp-and-treesitter-foldexpr").checkForLsp(event.buf, event.data.client_id)

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client == nil then
      return
    end

    -- Disable semantic highlights
    client.server_capabilities.semanticTokensProvider = nil

    local opts = { buffer = event.buf }
    local builtin = require("telescope.builtin")
    -- vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    -- vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
    -- vim.keymap.set("n", "gr", builtin.lsp_references, opts)

    vim.keymap.set("n", "gk", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
    vim.keymap.set("n", "fi", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gs", builtin.lsp_workspace_symbols, opts)

    -- vim.keymap.set(
    --   "n",
    --   "K",
    --   vim.lsp.buf.hover,
    --   { buffer = bufnr, desc = "Hover Documentation" }
    -- )
    -- vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
    -- vim.keymap.set(
    --   { "n", "x" },
    --   "=",
    --   "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
    --   opts
    -- )
    -- vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
    -- vim.keymap.set(
    --   "n",
    --   "g]",
    --   "<cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>",
    --   opts
    -- )
    -- vim.keymap.set(
    --   "n",
    --   "g[",
    --   "<cmd>lua vim.diagnostic.jump({count=-1, float=true})<cr>",
    --   opts
    -- )
  end,
})

-- firing FileType to attach all LSPs
-- vim.api.nvim_create_autocmd("SessionLoadPost", {
--   group = vim.api.nvim_create_augroup("LspAfterSession", { clear = true }),
--   callback = function()
--     for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
--       if
--         vim.api.nvim_buf_is_loaded(bufnr)
--         and vim.bo[bufnr].buflisted
--         and vim.bo[bufnr].buftype == ""
--       then
--         vim.api.nvim_exec_autocmds("FileType", { buffer = bufnr })
--       end
--     end
--   end,
-- })

vim.lsp.enable('clangd')
