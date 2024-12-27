-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font('JetBrains Mono')
config.font_size = 12
config.color_scheme = 'nord'

config.max_fps = 120 
-- Set the current working directory
config.default_cwd = "~/Projects"

config.tab_bar_at_bottom = true 


-- Define the leader key
config.leader = {key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

-- Define shortcut keys
config.keys = {
  -- splitting
  {
    key = "-",
    mods = "LEADER",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = "=",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  -- maximising
  {
    key = 'm',
    mods = 'CTRL',
    action = wezterm.action.TogglePaneZoomState
  },
  -- vim mode for navigating around and copying text  
  {
    key = 'Enter',
    mods = 'LEADER', 
    action = wezterm.action.ActivateCopyMode
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
}

-- Return the configuration to wezterm
return config
