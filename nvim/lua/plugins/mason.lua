return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "jdtls",
        "groovyls",
        "stylua",
        "eslint",
        "stylelint_lsp",
	"json-lsp",
      },
    },
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = {
          exclude = {
            "jdtls",
          },
        },
      })
    end,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ensure_installed = {
            -- "java-debug-adapter",
            "java-test",
            "google-java-format",
            -- to use local registries
            "yq",
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
      "neovim/nvim-lspconfig",
    },
  },
}
