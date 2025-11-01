return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master",
    -- lazy = false,
    -- dependencies = {
    --   "windwp/nvim-ts-autotag",
    --   opts = {
    --     -- Defaults
    --     enable_close = true, -- Auto close tags
    --     enable_rename = true, -- Auto rename pairs of tags
    --     enable_close_on_slash = false, -- Auto close on trailing </
    --   },
    -- },
    -- opts = {
    --   autotag = {
    --     -- Setup autotag using treesitter config.
    --     enable = true,
    --   },
    -- },
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "java",
          "javadoc",
          "javascript",
          "jsdoc",
          "cpp",
          "angular",
          "diff",
          -- "json"
          "markdown",
          "nginx",
          "typescript",
          "html",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  -- Automatically add closing tags for HTML and JSX
  -- {
  --   "windwp/nvim-ts-autotag",
  --   -- event = "LazyFile",
  --   opts = {},
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   lazy = false,
  --   enabled = true,
  --   -- keys = {
  --   --   { "]m", false }, -- already tried without those 2 lines
  --   --   { "[m", false },
  --   -- },
  --   -- ft = { "go", "gomod" },
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       incremental_selection = {
  --         enable = true,
  --         -- keymaps = {
  --         --   -- mappings for incremental selection (visual mappings)
  --         --   init_selection = "gnn", -- maps in normal mode to init the node/scope selection
  --         --   node_incremental = "grn", -- increment to the upper named parent
  --         --   scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
  --         --   node_decremental = "grm", -- decrement to the previous node
  --         -- },
  --       },
  --
  --       textobjects = {
  --         -- syntax-aware textobjects
  --         enable = true,
  --         -- Automatically jump forward to textobj, similar to targets.vim
  --         lookahead = true,
  --         -- lsp_interop = {
  --         --   enable = true,
  --         --   peek_definition_code = {
  --         --     ["DF"] = "@function.outer",
  --         --     ["DF"] = "@class.outer",
  --         --   },
  --         -- },
  --         keymaps = {
  --           -- You can use the capture groups defined in textobjects.scm
  --           ["af"] = "@function.outer",
  --           ["if"] = "@function.inner",
  --           ["ac"] = "@class.outer",
  --           -- You can optionally set descriptions to the mappings (used in the desc parameter of
  --           -- nvim_buf_set_keymap) which plugins like which-key display
  --           ["ic"] = {
  --             query = "@class.inner",
  --             desc = "Select inner part of a class region",
  --           },
  --           -- You can also use captures from other query groups like `locals.scm`
  --           ["as"] = {
  --             query = "@local.scope",
  --             query_group = "locals",
  --             desc = "Select language scope",
  --           },
  --         },
  --         select = {
  --           enable = true,
  --           keymaps = {
  --             -- You can use the capture groups defined in textobjects.scm
  --             ["af"] = "@function.outer",
  --             ["if"] = "@function.inner",
  --             ["ac"] = "@class.outer",
  --             ["ic"] = "@class.inner",
  --             -- Or you can define your own textobjects like this
  --             -- ["iF"] = {
  --             --   python = "(function_definition) @function",
  --             --   cpp = "(function_definition) @function",
  --             --   c = "(function_definition) @function",
  --             --   java = "(method_declaration) @function",
  --             --   go = "(method_declaration) @function",
  --             -- },
  --           },
  --         },
  --         -- You can choose the select mode (default is charwise 'v')
  --         --
  --         -- Can also be a function which gets passed a table with the keys
  --         -- * query_string: eg '@function.inner'
  --         -- * method: eg 'v' or 'o'
  --         -- and should return the mode ('v', 'V', or '<c-v>') or a table
  --         -- mapping query_strings to modes.
  --         selection_modes = {
  --           ["@parameter.outer"] = "v", -- charwise
  --           ["@function.outer"] = "V", -- linewise
  --           ["@class.outer"] = "<c-v>", -- blockwise
  --         },
  --         -- If you set this to `true` (default is `false`) then any textobject is
  --         -- extended to include preceding or succeeding whitespace. Succeeding
  --         -- whitespace has priority in order to act similarly to eg the built-in
  --         -- `ap`.
  --         --
  --         -- Can also be a function which gets passed a table with the keys
  --         -- * query_string: eg '@function.inner'
  --         -- * selection_mode: eg 'v'
  --         -- and should return true or false
  --         include_surrounding_whitespace = true,
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "windwp/nvim-ts-autotag",
  --   lazy = false,
  --   opts = {
  --     -- Defaults
  --     enable_close = true, -- Auto close tags
  --     enable_rename = true, -- Auto rename pairs of tags
  --     enable_close_on_slash = false, -- Auto close on trailing </
  --   },
  --   -- Also override individual filetype configs, these take priority.
  --   -- Empty by default, useful if one of the "opts" global settings
  --   -- doesn't work well in a specific filetype
  --   -- per_filetype = {
  --   --   ["html"] = {
  --   --     enable_close = false,
  --   --   },
  --   -- },
  -- },
}
