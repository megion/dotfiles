return {
  {
    "lifepillar/vim-solarized8",
    branch = "neovim",
    lazy = false,
    config = function(_, opts)
      -- vim.o.background = "light"
      -- vim.cmd.colorscheme("solarized8_flat")
      vim.cmd.colorscheme("solarized8")
      vim.opt.termguicolors = true
    end,
  },

}
