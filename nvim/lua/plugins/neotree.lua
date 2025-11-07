return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself

    config = function()
      require("neo-tree").setup({
        use_default_mappings = false,
        -- filesystem = {
          -- bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
          commands = {
            open_node_to_newtab = function(state)
              local node = state.tree:get_node()

              print(node)

              if node.type == "directory" then
                -- vim.cmd("tabnew")
                -- api.tree.change_root_to_node(node)
                -- api.tree.toggle({
                --   -- path = "<args>",
                --   -- find_file = false,
                --   update_root = true,
                --   focus = true,
                -- })
                -- print(node.absolute_path)
              else
                -- api.node.open.tab()
                -- api.node.open.vertical()
              end
            end,
          },
          window = {
            mapping_options = {
              noremap = false,
              nowait = true,
            },
            mappings = {
              ["?"] = {
                function(state)
                  local node = state.tree:get_node()
                  print(node.name)
                end,
                desc = "print name",
                -- nowait = true,
              },
              ["i"] = {
                command = function(state)
                  local node = state.tree:get_node()
                  print(node.name)
                end,
                desc = "print name",
                -- nowait = true,
              },
              ["o"] = {
                command = "open",
                -- nowait = true,
              },
              ["O"] = {
                "open",
                -- nowait = true,
              },
              ["t"] = {
                command = "open_node_to_newtab",
                nowait = true,
                -- command = function(state)
                --   local node = state.tree:get_node()
                --   print(node.name)
                -- end,
                desc = "open file to new tab",
                -- nowait = true,
              },
            },
          },
        -- },
      })
    end,
  },
}
