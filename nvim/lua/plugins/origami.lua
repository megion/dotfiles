return {
  {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {}, -- needed even when using default config

    -- recommended: disable vim's auto-folding
    init = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
    end,

    config = function()
      require("origami").setup({
        -- useLspFoldsWithTreesitterFallback = {
        --   enabled = true,
        --   -- foldmethodIfNeitherIsAvailable = "indent", ---@type string|fun(bufnr: number): string
        -- },
        autoFold = {
          enabled = false,
          -- kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
        },
        foldKeymaps = {
          setup = false, -- modifies `h`, `l`, `^`, and `$`
          closeOnlyOnFirstColumn = false, -- `h` and `^` only close in the 1st column
          scrollLeftOnCaret = false, -- `^` should scroll left (basically mapped to `0^`)
        },
      })
    end,
  },
}
