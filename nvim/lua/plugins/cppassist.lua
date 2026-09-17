return {
  {
    "Kohirus/cppassist.nvim",
    ft = { "h", "cpp", "hpp", "c", "cc", "cxx" },
    -- opt = true,
    config = function()
      require("cppassist").setup()

      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- switch between source and header
      map("n", "<A-o>", "<Cmd>SwitchSourceAndHeader<CR>", opts)
      -- generate the function definition or static variable definition in source
      map("n", "<leader>cf", "<Cmd>ImplementInSource<CR>", opts)
      -- generate the function definition or static variable definition in source in visual mode
      map(
        "v",
        "<leader>cf",
        '<Cmd>lua require("cppassist").ImplementInSourceInVisualMode<CR>',
        opts
      )
      -- generate the function definition or static variable definition in header
      map("n", "<leader>cv", "<Cmd>ImplementOutOfClass<CR>", opts)
      -- goto the header file
      -- map("n", "<leader>gh", "<Cmd>GotoHeaderFile<CR>", opts)
    end,
  },
}
