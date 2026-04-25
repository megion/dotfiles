return {
  {
    "stevearc/conform.nvim",
    lazy = false,
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
        java = { "google_java_format" }, -- Prioritize google_java_format, then fallback to jdtls
        -- python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        less = { "prettier" },
        scss = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        htmlangular = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        jsonls = { "prettier" },
        yaml = { "prettier" },
        typescriptreact = { "prettier" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        objc = { "clang-format" },
        -- groovy = { "npm_groovy_lint" },
        -- groovy = { lsp_format = "fallback" },
      },
      formatters = {
        google_java_format = {
          -- Change where to find the command
          -- command = "/home/ilya/Downloads/google-java-format_linux-x86-64",
          command = "google-java-format",
          -- Optional: Specify the full path if not in your PATH
          -- command = "/path/to/google-java-format",
          -- Optional: Add arguments if needed
          -- '-' arg to use stdin
          args = { "--aosp", "--skip-removing-unused-imports", "-" },
          -- prepend_args = { "--aosp" },
          -- Adds environment args to the yamlfix formatter
          -- env = {
          --   YAMLFIX_SEQUENCE_STYLE = "block_style",
          -- },
        },
        -- npm_groovy_lint = {
        --   args = { "--stdin", "--fix", "--insight=false" }, -- Use --fix for auto-fixing
        --   -- conform handles stdin and stdout automatically
        -- },
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
