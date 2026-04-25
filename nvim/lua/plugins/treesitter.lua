return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
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

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        -- additional_vim_regex_highlighting = false,
      },
    },
    config = function(_, opts)
      -- This setup function ensures configurations are applied
      require("nvim-treesitter").setup(opts)

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
    end,
  },
  -- build = ':TSUpdate'
  --   config = function(_, opts)
  --     -- This setup function ensures configurations are applied
  --     -- require("nvim-treesitter.configs").setup(opts)
  --
  --     require("nvim-treesitter").setup({
  --       -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  --       ensure_installed = {
  --         "c",
  --         "lua",
  --         "vim",
  --         "javascript",
  --         "html",
  --         "typescript",
  --         "tsx",
  --         "css",
  --         "java",
  --         "javadoc",
  --         "groovy",
  --         "gitignore",
  --         "gitcommit",
  --         -- "git_config",
  --         "json",
  --         "json5",
  --         "jsdoc",
  --         "markdown",
  --         "nginx",
  --         "typespec",
  --       }, -- Install specific parsers
  --       auto_install = true,
  --       indent = { enable = true },
  --       highlight = {
  --         enable = true, -- Enable highlighting
  --
  --         -- list of language that will be disabled
  --         -- disable `git_config` because syntax not work correct
  --         disable = { "git_config" },
  --
  --         -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  --         -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  --         -- Using this option may slow down your editor, and you may see some duplicate highlights.
  --         -- Instead of true it can also be a list of languages
  --         -- additional_vim_regex_highlighting = false,
  --       },
  --     })
  --
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = { "typescript", "javascript", "html" },
  --       callback = function()
  --         vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  --       end,
  --     })
  --   end,
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   lazy = false,
  --   -- opts = {
  --   -- },
  --   --   config = function(_, opts)
  --   --     -- This setup function ensures configurations are applied
  --   --     -- require("nvim-treesitter.configs").setup(opts)
  --   --
  --   --     require("nvim-treesitter").setup({
  --   --       -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  --   --       ensure_installed = {
  --   --         "c",
  --   --         "lua",
  --   --         "vim",
  --   --         "javascript",
  --   --         "html",
  --   --         "typescript",
  --   --         "tsx",
  --   --         "css",
  --   --         "java",
  --   --         "javadoc",
  --   --         "groovy",
  --   --         "gitignore",
  --   --         "gitcommit",
  --   --         -- "git_config",
  --   --         "json",
  --   --         "json5",
  --   --         "jsdoc",
  --   --         "markdown",
  --   --         "nginx",
  --   --         "typespec",
  --   --       }, -- Install specific parsers
  --   --       auto_install = true,
  --   --       indent = { enable = true },
  --   --       highlight = {
  --   --         enable = true, -- Enable highlighting
  --   --
  --   --         -- list of language that will be disabled
  --   --         -- disable `git_config` because syntax not work correct
  --   --         disable = { "git_config" },
  --   --
  --   --         -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  --   --         -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  --   --         -- Using this option may slow down your editor, and you may see some duplicate highlights.
  --   --         -- Instead of true it can also be a list of languages
  --   --         -- additional_vim_regex_highlighting = false,
  --   --       },
  --   --     })
  --   --
  --   --     vim.api.nvim_create_autocmd("FileType", {
  --   --       pattern = { "typescript", "javascript", "html" },
  --   --       callback = function()
  --   --         vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  --   --       end,
  --   --     })
  --   --   end,
  -- },
}
