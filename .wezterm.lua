-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Config choices
config.leader = {mods = 'CTRL', key = 'a', timeout_milliseconds = 1000 }
config.keys = {
  --splitting
  {
    mods = "LEADER",
    key = "-",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    mods = "LEADER",
    key = "=",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  --maximising
  {
    mods = 'CTRL',
    key = 'm',
    action = wezterm.action.TogglePaneZoomState
  },
  --vim mode for navigating around and copying text  
  {
    mods = 'LEADER', 
    key = 'Enter',
    action = wezterm.action.ActivateCopyMode
  },
}

config.font = wezterm.font 'Jetbrains Mono'
config.font_size = 12
config.color_scheme = 'nord'

config.tab_bar_at_bottom = true 

-- Return the configuration to wezterm
return config
