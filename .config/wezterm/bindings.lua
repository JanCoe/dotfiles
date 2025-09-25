local wezterm = require("wezterm")

local function prompt_input()
  return wezterm.action.PromptInputLine {
    description = 'Enter new name for tab',
    action = wezterm.action_callback(
      function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end
    ),
  }
end

-- Keybinding helper function
local function key_binding(key_table)
  local result = {}
  for _, val in ipairs(key_table) do
    table.insert(result, { mods = val[1], key = val[2], action = val[3] })
  end
  return result
end

local a = wezterm.action
-- Define shortcut keys using CTRL throughout.
return key_binding({
  -- Splitting
  { "CTRL",       '=',     a.SplitVertical { domain = 'CurrentPaneDomain' } },
  { "CTRL",       '-',     a.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  -- Full screen
  { 'CTRL',       'f',     a.TogglePaneZoomState },
  -- Move to a pane (prompt to which one)
  { "CTRL|SHIFT", "m",     a.PaneSelect },
  -- Vim mode for navigating around and copying text
  { 'CTRL',       'Enter', a.ActivateCopyMode },
  -- Name current tab
  { 'CTRL',       'n',     prompt_input() },
  { 'CTRL',       'q',     a.CloseCurrentPane { confirm = false } },
  { 'CTRL|SHIFT', 'q',     a.CloseCurrentTab { confirm = false } },
  -- Use CTRL + h,j,k,l to move between panes
  { "CTRL",       "h",     a.ActivatePaneDirection('Left') },
  { "CTRL",       "j",     a.ActivatePaneDirection('Down') },
  { "CTRL",       "k",     a.ActivatePaneDirection('Up') },
  { "CTRL",       "l",     a.ActivatePaneDirection('Right') },
  -- Move to another pane (next or previous)
  { "CTRL",       "]",     a.ActivatePaneDirection('Next') },
  { "CTRL",       "[",     a.ActivatePaneDirection('Prev') },
  -- Create a new tab in the same domain as the current pane.
  { 'CTRL',       't',     a.SpawnTab 'CurrentPaneDomain' },
  -- Create a new tab in the default domain
  { 'CTRL|SHIFT', 't',     a.SpawnTab 'DefaultDomain' },
  -- Switch to tab by index with CTRL+number
  { 'CTRL',       '1',     a.ActivateTab(0) },
  { 'CTRL',       '2',     a.ActivateTab(1) },
  { 'CTRL',       '3',     a.ActivateTab(2) },
  { 'CTRL',       '4',     a.ActivateTab(3) },
  { 'CTRL',       '5',     a.ActivateTab(4) },
  -- Cycle tabs with Ctrl+Tab and Ctrl+Shift+Tab
  { 'CTRL',       'Tab',   a.ActivateTabRelative(1) },
  { 'CTRL|SHIFT', 'Tab',   a.ActivateTabRelative(-1) },
})
