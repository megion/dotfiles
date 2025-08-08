return {

  -- NeoSolarized
  -- {
  --   "overcache/NeoSolarized",
  --   lazy = false,
  --   config = function(_, opts)
  --     vim.o.background = "light"
  --     vim.cmd.colorscheme("NeoSolarized")
  --     vim.opt.termguicolors = false
  --   end,
  -- },

  {
    "ishan9299/nvim-solarized-lua",
    lazy = false,
    config = function(_, opts)
      vim.o.background = "light"
      vim.cmd.colorscheme("solarized")
      vim.opt.termguicolors = true
    end,
  },



  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function(_, opts)
  --     -- vim.opt.termguicolors = false
  --   end,
  -- },

  -- {
  --   "Tsuzat/NeoSolarized.nvim",
  --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --     priority = 1000, -- make sure to load this before all the other start plugins
  --     config = function()
  --       vim.cmd [[ colorscheme NeoSolarized ]]
  --       -- vim.opt.termguicolors = false
  --     end
  -- },

  --    {
  --      'maxmx03/solarized.nvim',
  --      lazy = false,
  --      priority = 1000,
  --      ---@type solarized.config
  --      opts = {},
  --      config = function(_, opts)
  -- vim.o.termguicolors = false
  -- vim.o.background = 'light'
  -- require('solarized').setup(opts)
  -- vim.cmd.colorscheme 'solarized'
  --      end,
  --    }

  --{
  --  'maxmx03/solarized.nvim',
  --  lazy = false,
  --  priority = 1000,
  --  ---@type solarized.config
  --  opts = {},
  --  config = function(_, opts)
  --    -- vim.o.termguicolors = true
  --    vim.o.background = 'light'
  --    require('solarized').setup(opts)
  --    vim.cmd.colorscheme 'solarized'
  --  end,
  --}
}
--return {
--  'maxmx03/solarized.nvim',
--  lazy = false,
--  priority = 1000,
--  ---@type solarized.config
--  opts = {},
--  config = function(_, opts)
--    -- vim.o.termguicolors = true
--    vim.o.background = 'light'
--    require('solarized').setup(opts)
--    vim.cmd.colorscheme 'solarized'
--  end,
--}
