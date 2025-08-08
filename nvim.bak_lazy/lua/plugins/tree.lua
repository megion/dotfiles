-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
-- vim.opt.termguicolors = true
--

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
  -- vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
  -- vim.keymap.set("t", "?", api.tree.toggle_help, opts("Help"))
  -- vim.keymap.set("n", "t",          api.node.open.tab,                  opts("Open: New Tab"))
  -- vim.keymap.set("n", "<C-t>",          api.node.open.tab,                  opts("Open: New Tab"))
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      on_attach = my_on_attach,
    })
  end,
}

-- pass to setup along with your other options
-- require("nvim-tree").setup {
--   ---
--   on_attach = my_on_attach,
--   ---
-- }
