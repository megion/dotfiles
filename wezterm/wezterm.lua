-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28
config.enable_tab_bar = false

config.font = wezterm.font 'Mononoki Nerd Font Mono'

-- or, changing the font size and color scheme.
config.font_size = 11 
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Canonical Solarized Light'

local canonical_solarized = require "canonical_solarized"
canonical_solarized.apply_to_config(config)

config.color_scheme = 'Canonical Solarized Light'

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
