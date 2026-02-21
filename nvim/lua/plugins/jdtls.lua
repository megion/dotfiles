return {
  {
    "mfussenegger/nvim-jdtls",
    dependencies = { "neovim/nvim-lspconfig", "mason-org/mason-lspconfig.nvim" },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          -- require("lint").try_lint("checkstyle")
          require("lsp.jdtls_setup").setup()
        end,
      })
    end,
  },
}
