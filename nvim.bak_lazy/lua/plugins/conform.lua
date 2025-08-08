return {
  -- You can add this to an existing plugin spec, or create a new one like this:
  {
    "stevearc/conform.nvim", -- The formatter plugin LazyVim uses
    keys = {
      {
           "<leader>F", -- Your desired keymap
        function()
          require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
        end,
        mode = { "n", "v" }, -- Apply in normal and visual modes
        desc = "Format File",
      },
    },
  },
}
