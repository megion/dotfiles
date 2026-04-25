return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- "java-debug-adapter",
        "java-test",
        "google-java-format",
        "checkstyle",
	"clang-format",
        -- "npm_groovy_lint",
        -- to use local registries
        "yq",
	"css-lsp",
      },
    },
    config = function()
      require("mason").setup({
        registries = {
          -- requier install yq https://github.com/mikefarah/yq
          "file:~/workspaces/lua/mason-registry",
          -- "github:megion/mason-registry",
        },
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    config = function()
      -- vim.lsp.config("angularls", {
      --   -- filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
      --   filetypes = { "html", "htmlangular" },
      -- })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          -- "ts_ls",
          "vtsls",
          "jdtls",
          "groovyls",
          "stylua",
          "eslint",
          "angularls",
          -- "json-lsp",
          -- "gradle-language-server",
          -- "stylelint_lsp",
        },
        automatic_enable = {
          exclude = {
            "jdtls",
            "groovyls",
            -- "angularls",
            -- "gradle-language-server",
          },
        },
      })
    end,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
}
