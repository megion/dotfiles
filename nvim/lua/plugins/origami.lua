return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    -- recommended: disable vim's auto-folding
    init = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
    end,
    config = function()
      -- Option 2: nvim lsp as LSP client
      -- Tell the server the capability of foldingRange,
      -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require("lspconfig")[ls].setup({
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        })
      end
      -- 
      -- Option 3: treesitter as a main provider instead
      -- (Note: the `nvim-treesitter` plugin is *not* needed.)
      -- ufo uses the same query files for folding (queries/<lang>/folds.scm)
      -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
  -- {
  --   "chrisgrieser/nvim-origami",
  --   event = "VeryLazy",
  --   opts = {}, -- needed even when using default config
  --
  --   -- recommended: disable vim's auto-folding
  --   init = function()
  --     vim.opt.foldlevel = 99
  --     vim.opt.foldlevelstart = 99
  --   end,
  --
  --   config = function()
  --     require("origami").setup({
  --       -- useLspFoldsWithTreesitterFallback = {
  --       --   enabled = true,
  --       --   foldmethodIfNeitherIsAvailable = "indent", ---@type string|fun(bufnr: number): string
  --       -- },
  --       autoFold = {
  --         enabled = false,
  --         -- kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
  --       },
  --       foldKeymaps = {
  --         setup = false, -- modifies `h`, `l`, `^`, and `$`
  --         closeOnlyOnFirstColumn = false, -- `h` and `^` only close in the 1st column
  --         scrollLeftOnCaret = false, -- `^` should scroll left (basically mapped to `0^`)
  --       },
  --     })
  --
  --     -- vim.api.nvim_create_autocmd("FileType", {
  --     --   pattern = { "htmlangular" },
  --     --   -- callback = function()
  --     --   --   vim.wo.foldmethod = "expr"
  --     --   --   vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  --     --   -- end,
  --     --
  --     --   callback = function(ctx)
  --     --     require("origami").setup({
  --     --       useLspFoldsWithTreesitterFallback = {
  --     --         enabled = false,
  --     --       },
  --     --     })
  --     --     local filetype = ctx.match or vim.bo[ctx.buf].filetype
  --     --     local win = vim.api.nvim_get_current_win()
  --     --     local ok, hasParser =
  --     --       pcall(vim.treesitter.query.get, filetype, "folds")
  --     --     if ok and hasParser then
  --     --       vim.wo[win][0].foldmethod = "expr"
  --     --       vim.wo[win][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
  --     --     else
  --     --       vim.wo[win][0].foldmethod = "indent"
  --     --       vim.wo[win][0].foldexpr = ""
  --     --     end
  --     --   end,
  --     -- })
  --   end,
  -- },
}
