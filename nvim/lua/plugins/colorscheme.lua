return {

  -- NeoSolarized
  -- {
  --   "overcache/NeoSolarized",
  --   lazy = false,
  --   config = function(_, opts)
  --     vim.o.background = "light"
  --     vim.cmd.colorscheme("NeoSolarized")
  --     vim.opt.termguicolors = true
  --   end,
  -- },

  -- {
  --   "ishan9299/nvim-solarized-lua",
  --   lazy = false,
  --   config = function(_, opts)
  --     vim.o.background = "light"
  --     vim.cmd.colorscheme("solarized")
  --     -- vim.opt.termguicolors = true
  --     -- vim.cmd("colorscheme solarized-high")
  --     -- vim.g.solarized_diffmode = "high"
  --     -- vim.g.solarized_termtrans = 1
  --   end,
  -- },

  {
    "lifepillar/vim-solarized8",
    branch = "neovim",
    lazy = false,
    config = function(_, opts)
      vim.o.background = "light"
      -- vim.cmd.colorscheme("solarized8_flat")
      vim.cmd.colorscheme("solarized8")
      vim.opt.termguicolors = true
    end,
  },

  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     use_background = true,
  --   },
  --   config = function(_, opts)
  --     vim.opt.termguicolors = true
  --     require("solarized-osaka").setup({
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       transparent = true, -- Enable this to disable setting the background color
  --       terminal_colors = false, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  --       styles = {
  --         -- Style to be applied to different syntax groups
  --         -- Value is any valid attr-list value for `:help nvim_set_hl`
  --         comments = { italic = true },
  --         keywords = { italic = true },
  --         -- functions = {},
  --         -- variables = {},
  --         -- Background styles. Can be "dark", "transparent" or "normal"
  --         sidebars = "transparent", -- style for sidebars, see below
  --         floats = "transparent", -- style for floating windows
  --       },
  --       -- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  --       -- day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  --       -- hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  --       -- dim_inactive = false, -- dims inactive windows
  --       -- lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
  --       --
  --       --- You can override specific color groups to use other groups or a hex color
  --       --- function will be called with a ColorScheme table
  --       ---@param colors ColorScheme
  --       on_colors = function(colors)
  --         -- colors.hint = colors.orange
  --         -- colors.info = colors.orange
  --         -- colors.error = "#ff0000"
  --       end,
  --
  --       --- You can override specific highlights to use other groups or a hex color
  --       --- function will be called with a Highlights and ColorScheme table
  --       -- ---@param highlights Highlights
  --       -- ---@param colors ColorScheme
  --       -- on_highlights = function(highlights, colors) end,
  --     })
  --
  --     vim.cmd.colorscheme("solarized-osaka")
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

  -- {
  --   "maxmx03/solarized.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   ---@type solarized.config
  --   opts = {},
  --   config = function(_, opts)
  --     vim.o.termguicolors = true
  --     vim.o.background = "light"
  --     require("solarized").setup(opts)
  --     vim.cmd.colorscheme("solarized")
  --   end,
  -- },

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
