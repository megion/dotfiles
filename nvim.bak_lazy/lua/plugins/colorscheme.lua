return {

   -- NeoSolarized
   {
     "overcache/NeoSolarized",
     lazy = false,
      config = function(_, opts)
        -- vim.o.termguicolors = true
        vim.o.background = 'light'
        vim.cmd.colorscheme 'NeoSolarized'
        vim.opt.termguicolors = false
      end,
   },

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
