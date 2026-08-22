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
        sources = {
          "nx-console",
          "filesystem",
          "buffers",
          "git_status",
        },
        ["nx-console"] = {
          -- Auto-refresh when workspace changes (default: true)
          -- auto_refresh_on_workspace_change = true,
          window = {
            mappings = {
              ["<CR>"] = "open_or_run",
              ["R"] = "refresh",
            },
          },
        },

        default_component_configs = {
          file_size = {
            enabled = false,
          },
          symlink_target = {
            enabled = true,
            -- text_format = " ➛ %s", -- %s will be replaced with the symlink target's path.
          },
        },
        enable_git_status = false,
        enable_diagnostics = false,
        use_default_mappings = false,
        show_scrolled_off_parent_node = true,
        filesystem = {
          filtered_items = {
            show_hidden_count = false, -- when true, the number of hidden items in each folder will be shown as the last entry
            hide_gitignored = false,
            hide_ignored = false, -- hide files that are ignored by other gitignore-like files
            -- show dotfiles by default, but hide some dotfiles by name. It need if reveal file in parent dot folder for show all hidden files
            hide_dotfiles = false,
            hide_by_name = {
              ".git",
              ".settings",
              ".turbo",
              ".project",
              ".pnpm-debug.log",
              ".gradle",
              ".vim",
              ".cache",
              ".jest",
            },
          },
          scan_mode = "deep",
          group_empty_dirs = true,

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
                require("neo-tree.sources.filesystem.commands").open_tabnew(
                  state
                )
                print(node.path)
                -- api.node.open.tab()
                -- api.node.open.vertical()
              end
            end,
            -- toggle_git_status = function(state)
            --   -- print("toggle_git_status")
            --   -- print(state.config.enable_git_status)
            --   state.config.enable_git_status = not state.config.enable_git_status
            --
            -- end,
            my_toggle = function(state)
              vim.cmd("Neotree toggle")
            end,
            copy_with_symlinks = function(state)
              local node = state.tree:get_node()
              local src = node.path

              -- Only run if a valid file/folder is selected
              if src == nil then
                return
              end

              -- Prompt user for the destination path
              vim.ui.input({
                prompt = "Copy to: ",
                default = src,
                completion = "file",
              }, function(dest)
                if dest == nil or dest == "" or dest == src then
                  vim.notify("Error copying folder", vim.log.levels.ERROR)
                  return
                end

                -- Use standard 'cp -a' to copy structure and keep symlinks intact
                local cmd = string.format(
                  "cp -a %s %s",
                  vim.fn.shellescape(src),
                  vim.fn.shellescape(dest)
                )

                vim.fn.jobstart(cmd, {
                  on_exit = function(_, exit_code)
                    if exit_code == 0 then
                      -- Refresh Neo-tree UI to show the new folder
                      require("neo-tree.sources.manager").refresh(state.name)
                      vim.notify(
                        "Folder copied successfully with symlinks preserved!"
                      )
                    else
                      vim.notify("Error copying folder", vim.log.levels.ERROR)
                    end
                  end,
                })
              end)
            end,
          },
          window = {
            mapping_options = {
              noremap = true,
              nowait = true,
            },
            mappings = {
              -- ["?"] = {
              --   function(state)
              --     local node = state.tree:get_node()
              --     print(node.name)
              --   end,
              --   desc = "print name",
              --   -- nowait = true,
              -- },
              -- Map the "g" key to toggle the setting
              -- ["g"] = function(state)
              --   -- Toggle the boolean value in the active state configuration
              --   state.group_empty_dirs = not state.group_empty_dirs
              --
              --   -- Refresh the filesystem source to apply changes immediately
              --   require("neo-tree.sources.manager").refresh(state)
              -- end,
              ["u"] = {
                -- nowait = false,
                command = function(state)
                  -- Toggle the boolean value in the active state configuration
                  state.group_empty_dirs = not state.group_empty_dirs

                  -- Refresh the filesystem source to apply changes immediately
                  require("neo-tree.sources.manager").refresh(state)
                end,
                desc = "toggle group_empty_dirs",
              },
              ["?"] = {
                command = "show_file_details",
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
              ["R"] = {
                "refresh",
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
              ["Y"] = {
                "copy_to_clipboard",
              },
              ["x"] = {
                "cut_to_clipboard",
              },
              ["p"] = {
                "paste_from_clipboard",
              },
              ["c"] = {
                -- command = "copy",
                command = "copy_with_symlinks",
                -- wait for `cd` key
                nowait = false,
                desc = "copy",
              },
              ["cd"] = {
                nowait = true,
                command = function(state)
                  local node = state.tree:get_node()
                  if node and node.type == "directory" then
                    -- This command changes the current working directory in Neovim
                    -- local cwd = vim.loop.cwd()
                    -- print("CWD: " .. cwd)
                    vim.cmd(":cd " .. node.path)
                    -- vim.cmd(":Neotree dir=" .. cwd)
                    print("CWD is now: " .. node.path)
                  end
                end,
                desc = "change working directory",
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
              -- ["g"] = {
              --   command = "toggle_git_status",
              --   -- wait for `tt` key
              --   nowait = true,
              --   -- noremap = false,
              --   -- command = function(state)
              --   --   local node = state.tree:get_node()
              --   --   print(node.name)
              --   -- end,
              --   desc = "toggle git integration",
              --   -- nowait = true,
              -- },
            },
          },
        },
        -- bind_to_cwd = false, -- true creates a 2-way binding between vim's cwd and neo-tree's root
        -- },
      })
    end,
  },
}
