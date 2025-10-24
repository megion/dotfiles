return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },

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
        -- Default configuration for telescope goes here:
        -- config_key = value,
        -- mappings = {
        --   i = {
        --     -- map actions.which_key to <C-h> (default: <C-/>)
        --     -- actions.which_key shows the mappings for your picker,
        --     -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        --     ["<C-h>"] = "which_key",
        --   },
        -- },
      })
    end,
  },
}
