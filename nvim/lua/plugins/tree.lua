-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
-- vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    -- , nowait = true
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
    }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
  -- vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
  -- vim.keymap.set("t", "?", api.tree.toggle_help, opts("Help"))
  -- vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
  -- vim.keymap.set("n", "w",          api.tree.change_root_to_node,                  opts("Change cwd for selected node"))

  -- if current node is directory then open new tab and set current node to root
  -- if file then open node to new tab
  vim.keymap.set("n", "t", function()
    local node = api.tree.get_node_under_cursor()

    if node.type == "directory" then
      vim.cmd("tabnew")
      api.tree.change_root_to_node(node)
      api.tree.toggle({
        -- path = "<args>",
        -- find_file = false,
        -- update_root = true,
        focus = true,
      })
      print(node.absolute_path)
    else
      api.node.open.tab()
      -- api.node.open.vertical()
    end
    -- print("New tab with new root node", api.tree.get_node_under_cursor())
  end, opts("Change cwd for selected node"))

  -- vim.keymap.set("n", "w",          api.node.open.tab_drop,                  opts("Change cwd for selected node"))
  -- vim.keymap.set("n", "tn", ":tabnew<CR>", { noremap = true, silent = false, desc = "Open new tab" })
  vim.keymap.set(
    "n",
    "s",
    api.node.open.vertical_no_picker,
    opts("Open: Vertical Split")
  )
  vim.keymap.set(
    "n",
    "i",
    api.node.open.horizontal_no_picker,
    opts("Open: Horizontal Split")
  )
  vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", opts("Open: New Tab"))
end

return {
  { "nvim-tree/nvim-web-devicons", lazy = false, opts = {} },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    -- dependencies = {
    --   "nvim-tree/nvim-web-devicons",
    -- },
    config = function()
      require("nvim-tree").setup({
        -- ensures that when you navigate to a new directory or open a directory in a new tab/split,
        -- Nvim-tree will update the Neovim's current working directory to that location
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        hijack_cursor = true,
        disable_netrw = true,
        view = { width = {
          max = 100,
        } },
        filters = {
          dotfiles = true,
          git_ignored = false,
        },
        on_attach = my_on_attach,
      })
    end,
  },
}
