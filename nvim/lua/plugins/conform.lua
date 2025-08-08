return {
  {
    "stevearc/conform.nvim",
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "ff",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    }, ---@type conform.setupOpts
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        -- python = { "isort", "black" },
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      -- Set default options
      -- default_format_opts = {
      --   lsp_format = "fallback",
      -- },
      -- Set up format-on-save
      -- format_on_save = { timeout_ms = 500 },
    },
  },
}
