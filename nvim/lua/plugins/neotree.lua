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
        default_component_configs = {
          file_size = {
            enabled = false,
          },
        },
        use_default_mappings = false,
        show_scrolled_off_parent_node = true,
        filesystem = {
          filtered_items = {
            show_hidden_count = false, -- when true, the number of hidden items in each folder will be shown as the last entry
            hide_dotfiles = true,
            hide_gitignored = false,
            hide_ignored = false, -- hide files that are ignored by other gitignore-like files
          },
        },
        -- bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
        commands = {
          open_node_to_newtab = function(state)
            local node = state.tree:get_node()

            -- print(node)

            if node.type == "directory" then
              vim.cmd("tabnew")
              -- vim.cmd("Neotree action=focus")
              require("neo-tree.command").execute({
                action = "focus", -- OPTIONAL, this is the default value
                source = "filesystem", -- OPTIONAL, this is the default value
                position = "left", -- OPTIONAL, this is the default value
                -- reveal_file = node.path, -- path to file or folder to reveal
                dir = node.path,
                reveal_force_cwd = true, -- change cwd without asking if needed
              })
              -- api.tree.change_root_to_node(node)
              -- api.tree.toggle({
              --   -- path = "<args>",
              --   -- find_file = false,
              --   update_root = true,
              --   focus = true,
              -- })
              print(node.path)
            else
              -- vim.cmd("tabnew")
              require("neo-tree.sources.filesystem.commands").open_tabnew(state)
              -- require("neo-tree.command").execute({
              --   action = "open_tabnew", -- OPTIONAL, this is the default value
              --   -- source = "filesystem", -- OPTIONAL, this is the default value
              --   -- position = "left", -- OPTIONAL, this is the default value
              --   -- reveal_file = node.path, -- path to file or folder to reveal
              --   -- dir = node.path,
              --   -- reveal_force_cwd = true, -- change cwd without asking if needed
              -- })
              print(node.path)
              -- api.node.open.tab()
              -- api.node.open.vertical()
            end
          end,
          my_toggle = function(state)
            vim.cmd("Neotree toggle")
          end,
        },
        window = {
          mapping_options = {
            noremap = true,
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
            ["o"] = {
              command = "open",
              -- nowait = true,
            },
            ["e"] = {
              command = "toggle_auto_expand_width",
              -- nowait = true,
            },
            ["s"] = {
              command = "open_vsplit",
              -- nowait = true,
            },
            ["I"] = {
              command = "toggle_hidden",
              -- nowait = true,
            },
            ["i"] = {
              command = "open_split",
              -- nowait = true,
            },
            ["O"] = {
              "open",
              -- nowait = true,
            },
            -- file actions
            ["a"] = {
              "add",
            },
            ["d"] = {
              "delete",
            },
            ["r"] = {
              "rename",
            },
            ["y"] = {
              "copy_to_clipboard",
            },
            ["x"] = {
              "cut_to_clipboard",
            },
            ["p"] = {
              "paste_from_clipboard",
            },
            ["c"] = {
              "copy",
            },
            ["m"] = {
              "move",
            },
            -- end file actions
            [".."] = {
              "navigate_up",
              -- nowait = true,
            },
            ["tt"] = {
              command = "my_toggle",
              nowait = true,
              -- noremap = false,
              -- command = function(state)
              --   local node = state.tree:get_node()
              --   print(node.name)
              -- end,
              desc = "toggle tree",
              -- nowait = true,
            },
            ["t"] = {
              command = "open_node_to_newtab",
              -- wait for `tt` key
              nowait = false,
              -- noremap = false,
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
