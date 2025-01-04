local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font { family = "JetBrains Mono" }
config.font_size = 12
config.color_scheme = "nord"
config.colors = {
  tab_bar = {
    inactive_tab_edge = '#ECEFF4',
    active_tab = { fg_color = '#D8DEE9', bg_color = '#4c566A' },
  }
}
config.max_fps = 120

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.tab_max_width = 32

-- Define the leader key
config.leader = {mods = 'CTRL', key = 'q', timeout_milliseconds = 1000 }

-- Define shortcut keys
config.keys = {
  -- splitting
  {
    mods = "LEADER", key = '-',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    mods = "LEADER", key = '=',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- maximising
  {
    mods = 'CMD', key = 'm',
    action = wezterm.action.TogglePaneZoomState
  },
  -- Move to a pane (prompt to which one)
  {
    mods = "CMD|SHIFT", key = "m",
    action = wezterm.action.PaneSelect
  },
  -- vim mode for navigating around and copying text  
  {
    mods = 'LEADER', key = 'Enter',
    action = wezterm.action.ActivateCopyMode
  },
  -- rename current tab
  {
    mods = 'CMD', key = 'r',
    action = wezterm.action.PromptInputLine {
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
  {
    mods = 'CMD', key = 'w',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    mods = 'CMD|SHIFT', key = 'w',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  -- use CTRL + [h|j|k|l] to move between panes
  {
    mods = "CTRL", key = "h",
    action = wezterm.action.ActivatePaneDirection('Left')
  },

  {
    mods = "CTRL", key = "j",
    action = wezterm.action.ActivatePaneDirection('Down')
  },

  {
    mods = "CTRL", key = "k",
    action = wezterm.action.ActivatePaneDirection('Up')
  },

  {
    mods = "CTRL", key = "l",
    action = wezterm.action.ActivatePaneDirection('Right')
  },
  -- Move to another pane (next or previous)
  {
    mods = "CTRL", key = "[",
    action = wezterm.action.ActivatePaneDirection('Prev')
  },
  {
    mods = "CTRL", key = "]",
    action = wezterm.action.ActivatePaneDirection('Next')
  },
}

return config
