return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "javascript",
        "html",
        "typescript",
        "tsx",
        "css",
        "java",
        "javadoc",
        "groovy",
        "gitignore",
        "json",
        "json5",
        "jsdoc",
        "markdown",
        "nginx",
        "typespec",
      }, -- Install specific parsers
      auto_install = true,
      highlight = {
        enable = true, -- Enable highlighting
      },
    },
    config = function(_, opts)
      -- This setup function ensures configurations are applied
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
