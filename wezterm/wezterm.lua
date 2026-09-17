-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28
config.enable_tab_bar = false

config.font = wezterm.font("Mononoki Nerd Font")

-- or, changing the font size and color scheme.
config.font_size = 11
-- config.color_scheme = 'AdventureTime'

local canonical_solarized = require("canonical_solarized")
canonical_solarized.apply_to_config(config)

config.color_scheme = 'Canonical Solarized Dark'
--
-- Path to the file where your script will write the active theme name
-- local theme_file = wezterm.home_dir .. "/.current_theme.txt"

-- Helper function to read the file safely
-- local function get_current_theme()
--   local f = io.open(theme_file, "r")
--   if f then
--     local theme = f:read("*l")
--     f:close()
--
--     wezterm.log_info("MY_theme from file: " .. theme)
--     if theme then
--       -- Trim whitespace just in case
--       return theme
--     end
--   end
--   return "Batman" -- Fallback default scheme
-- end

wezterm.log_info("MY_theme from file: " .. config.color_scheme)

local myvar = os.getenv("MY_VAR")

if myvar then
  wezterm.log_info("MY_VAR from env: " .. myvar)

  -- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
  local function is_vim(pane)
    -- this is set by the plugin, and unset on ExitPre in Neovim
    return pane:get_user_vars().IS_NVIM == "true"
  end

  local direction_keys = {
    h = "Left",
    j = "Down",
    k = "Up",
    l = "Right",
  }

  local function split_nav(resize_or_move, key)
    return {
      key = key,
      mods = resize_or_move == "resize" and "META" or "CTRL",
      action = wezterm.action_callback(function(win, pane)
        if is_vim(pane) then
          -- pass the keys through to vim/nvim
          win:perform_action({
            SendKey = {
              key = key,
              mods = resize_or_move == "resize" and "META" or "CTRL",
            },
          }, pane)
        else
          if resize_or_move == "resize" then
            win:perform_action(
              { AdjustPaneSize = { direction_keys[key], 3 } },
              pane
            )
          else
            win:perform_action(
              { ActivatePaneDirection = direction_keys[key] },
              pane
            )
          end
        end
      end),
    }
  end

  config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 3000 }
  config.keys = {
    {
      key = '"',
      mods = "LEADER|SHIFT",
      action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "%",
      mods = "LEADER|SHIFT",
      action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },

    -- Navigate between panes (Arrow keys)
    -- move between split panes
    split_nav("move", "h"),
    split_nav("move", "j"),
    split_nav("move", "k"),
    split_nav("move", "l"),
    -- resize panes
    split_nav("resize", "h"),
    split_nav("resize", "j"),
    split_nav("resize", "k"),
    split_nav("resize", "l"),
    -- {
    --   key = "h",
    --   mods = "CTRL",
    --   action = act.ActivatePaneDirection("Left"),
    -- },
    -- {
    --   key = "l",
    --   mods = "CTRL",
    --   action = act.ActivatePaneDirection("Right"),
    -- },
    -- {
    --   key = "k",
    --   mods = "CTRL",
    --   action = act.ActivatePaneDirection("Up"),
    -- }, -- adjust as needed
    -- {
    --   key = "j",
    --   mods = "CTRL",
    --   action = act.ActivatePaneDirection("Down"),
    -- },

    -- Close current pane (x in tmux)
    {
      key = "x",
      mods = "LEADER",
      action = act.CloseCurrentPane({ confirm = true }),
    },

    -- Create new tab (c in tmux)
    { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

    {
      key = "w",
      mods = "LEADER",
      action = wezterm.action.ShowTabNavigator,
    },
    -- paste from the clipboard
    {
      key = "p",
      mods = "LEADER",
      action = act.PasteFrom("Clipboard"),
    },
    -- {
    --   key = "p",
    --   mods = "LEADER",
    --   action = act.PasteFrom("PrimarySelection"),
    -- },
    {
      key = "B",
      mods = "LEADER",
      -- \r sends the Enter key so the command executes immediately
      action = wezterm.action.SendString("~/dotfiles/tmux-solarized.sh dark\r"),
    },
    {
      key = "b",
      mods = "LEADER",
      -- \r sends the Enter key so the command executes immediately
      action = wezterm.action.SendString(
        "~/dotfiles/tmux-solarized.sh light\r"
      ),
      -- action = wezterm.action.SpawnCommandInNewTab({
      --   args = { "~/dotfiles/tmux-solarized.sh light" },
      -- }),
    },
    -- Press Ctrl+A then [ to enter copy mode
    {
      key = "[",
      mods = "LEADER",
      action = act.ActivateCopyMode,
    },
  }
else
  wezterm.log_error("MY_VAR1 not defined")
end

-- config.color_scheme = 'Solarized (light) (terminal.sexy)'

-- require("theme").set(config)

-- Check for an environment variable to determine the color scheme
-- local scheme_name = os.getenv("WEZTERM_COLOR_SCHEME")

-- if scheme_name and wezterm.get_builtin_color_schemes()[scheme_name] then
--     config.color_scheme = scheme_name
-- else
--     -- Fallback to a default scheme if the variable is not set or invalid
--     -- config.color_scheme = 'Builtin Solarized Dark'
--     require("theme").set(config)
-- end

-- return config

-- Finally, return the configuration to wezterm:
return config
