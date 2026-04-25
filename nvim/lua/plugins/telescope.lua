return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- optional but recommended
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--no-ignore",
          "--fixed-strings",
        },
        -- Add patterns to ignore here
        file_ignore_patterns = {
          "^node_modules/",
          "^vendor/",
          "^build/",
          "^dist/",
          "^release/",
          "^.git/",
        },
      },
      pickers = {
        find_files = {
          no_ignore_parent = true,
        },
      },
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set(
        "n",
        "<leader>a",
        builtin.grep_string,
        { desc = "Telescope find files under cursor" }
      )
      -- vim.keymap.set(
      --   "n",
      --   "<leader>fg",
      --   builtin.live_grep,
      --   { desc = "Telescope live grep" }
      -- )
      -- vim.keymap.set(
      --   "n",
      --   "<leader>fb",
      --   builtin.buffers,
      --   { desc = "Telescope buffers" }
      -- )
      -- vim.keymap.set(
      --   "n",
      --   "<leader>fh",
      --   builtin.help_tags,
      --   { desc = "Telescope help tags" }
      -- )

      require("telescope").setup({
        defaults = {
          -- mappings = {
          --   i = {
          --     -- map actions.which_key to <C-h> (default: <C-/>)
          --     -- actions.which_key shows the mappings for your picker,
          --     -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          --     -- ["<C-h>"] = "which_key",
          --   },
          -- },
          vimgrep_arguments = {
            "rg",
            -- "--glob=!node_modules,build,dist,release}'",
            "--glob=!release",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--sort-files",
            -- "--no-ignore",
            -- "--fixed-strings",
            -- "--exclude-dir=.git",
            -- "--exclude-dir=node_modules",
            -- "--exclude-dir=vendor",
            -- "--exclude-dir=build",
            -- "--exclude-dir=dist",
            -- "--exclude-dir=release",
          },
          -- Add patterns to ignore here
          file_ignore_patterns = {
            "^node_modules/",
            "^vendor/",
            "^build/",
            "^dist/",
            "^release/",
            "^.git/",
          },
        },
        -- pickers = {
        --   find_files = {
        --     no_ignore_parent = true,
        --   },
        -- },
        extensions = {
          -- Your extension configuration goes here:
          -- extension_name = {
          --   extension_config_key = value,
          -- }
          -- please take a look at the readme of the extension you want to configure
        },
      })
    end,
  },
}
