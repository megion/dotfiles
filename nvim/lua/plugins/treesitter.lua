return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "angular",
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
        "gitcommit",
        -- "git_config",
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

        -- list of language that will be disabled
        -- disable `git_config` because syntax not work correct
        disable = { "git_config" },
      },
    },
    config = function(_, opts)
      -- This setup function ensures configurations are applied
      require("nvim-treesitter").setup(opts)

      -- vim.treesitter.start()

      -- vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      --   pattern = { "*.component.html" },
      --   callback = function()
      --     vim.treesitter.start(nil, "angular")
      --   end,
      -- })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "htmlangular" },
        callback = function()
          vim.treesitter.start()

          vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo[0][0].foldmethod = "expr"

          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typescriptreact" },
        callback = function()
          vim.treesitter.start()

          -- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          -- vim.wo[0][0].foldmethod = "expr"
          --
          -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
