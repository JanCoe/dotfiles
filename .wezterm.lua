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

-- Define shortcut keys
config.keys = {
  -- splitting
  { mods = "LEADER", key = '-', action = a.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { mods = "LEADER", key = '=', action = a.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  -- maximising
  { mods = 'CMD', key = 'm', action = a.TogglePaneZoomState },
  -- Move to a pane (prompt to which one)
  { mods = "CMD|SHIFT", key = "m", action = a.PaneSelect },
  -- vim mode for navigating around and copying text  
  { mods = 'LEADER', key = 'Enter', action = a.ActivateCopyMode },
  -- rename current tab
  {
    mods = 'CMD', key = 'r',
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
  { mods = 'CMD', key = 'w', action = a.CloseCurrentPane { confirm = false }, },
  { mods = 'CMD|SHIFT', key = 'w', action = a.CloseCurrentTab { confirm = true }, },
  -- use CTRL + h,j,k,l to move between panes
  { mods = "CTRL", key = "h", action = a.ActivatePaneDirection('Left') },
  { mods = "CTRL", key = "j", action = a.ActivatePaneDirection('Down') },
  { mods = "CTRL", key = "k", action = a.ActivatePaneDirection('Up') },
  { mods = "CTRL", key = "l", action = a.ActivatePaneDirection('Right') },
  -- Move to another pane (next or previous)
  { mods = "CTRL", key = "Tab", action = a.ActivatePaneDirection('Next') },
  { mods = "CTRL|SHIFT", key = "Tab", action = a.ActivatePaneDirection('Prev') },
}

return config
