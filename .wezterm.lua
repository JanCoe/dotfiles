local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font { family = "JetBrains Mono", scale = 1.2 }
config.font_size = 12
config.color_scheme = "nord"
config.colors = {
  tab_bar = { inactive_tab_edge = '#ECEFF4',
    active_tab = { fg_color = '#D8DEE9', bg_color = '#4c566A' },
  }
}
config.window_background_opacity = 0.95
config.max_fps = 120
config.default_workspace = "main"

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.tab_max_width = 32

-- Define the leader key
config.leader = {mods = 'CTRL', key = 'q', timeout_milliseconds = 1000 }

local a = wezterm.action

-- Define shortcut keys using CTRL throughout.
config.keys = {
  -- splitting
  { mods = "CTRL", key = '=', action = a.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { mods = "CTRL", key = '-', action = a.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  -- full screen
  { mods = 'CTRL', key = 'f', action = a.TogglePaneZoomState },
  -- Move to a pane (prompt to which one)
  { mods = "CTRL|SHIFT", key = "m", action = a.PaneSelect },
  -- vim mode for navigating around and copying text  
  { mods = 'CTRL', key = 'Enter', action = a.ActivateCopyMode },
  -- rename current tab
  {
    mods = 'CTRL', key = 'r',
    action = a.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(
        function(window, _, line)
          if line then
            window:active_tab():set_title(line)
          end
        end
      ),
    },
  },
  { mods = 'CTRL', key = 'w', action = a.CloseCurrentPane { confirm = false }, },
  { mods = 'CTRL|SHIFT', key = 'w', action = a.CloseCurrentTab { confirm = true }, },
  -- use CTRL + h,j,k,l to move between panes
  { mods = "CTRL", key = "h", action = a.ActivatePaneDirection('Left') },
  { mods = "CTRL", key = "j", action = a.ActivatePaneDirection('Down') },
  { mods = "CTRL", key = "k", action = a.ActivatePaneDirection('Up') },
  { mods = "CTRL", key = "l", action = a.ActivatePaneDirection('Right') },
  -- Move to another pane (next or previous)
  { mods = "CTRL", key = "]", action = a.ActivatePaneDirection('Next') },
  { mods = "CTRL", key = "[", action = a.ActivatePaneDirection('Prev') },

  -- Create a new tab in the same domain as the current pane.
  { mods = 'CTRL', key = 't', action = a.SpawnTab 'CurrentPaneDomain' },
  -- Create a new tab in the default domain
  { mods = 'CTRL|SHIFT', key = 't', action = a.SpawnTab 'DefaultDomain' },

-- Switch to tab by index with CTRL+number
  { mods = 'CTRL', key = '1', action = a.ActivateTab(0) },
  { mods = 'CTRL', key = '2', action = a.ActivateTab(1) },
  { mods = 'CTRL', key = '3', action = a.ActivateTab(2) },
  { mods = 'CTRL', key = '4', action = a.ActivateTab(3) },
  { mods = 'CTRL', key = '5', action = a.ActivateTab(4) },
  { mods = 'CTRL', key = '6', action = a.ActivateTab(5) },
  { mods = 'CTRL', key = '7', action = a.ActivateTab(6) },
  { mods = 'CTRL', key = '8', action = a.ActivateTab(7) },
  { mods = 'CTRL', key = '9', action = a.ActivateTab(8) },

  -- Cycle tabs with Ctrl+Tab and Ctrl+Shift+Tab
  { mods = 'CTRL', key = 'Tab', action = a.ActivateTabRelative(1) },
  { mods = 'CTRL|SHIFT', key = 'Tab', action = a.ActivateTabRelative(-1) },
}

return config
