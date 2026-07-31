local focus_or_launch = require("focus_or_launch")
local apps = require("applications")

-- Add CTRL to a keycombination to move the active thing there
local mainMod = "SUPER"
local lft = "H"
local dwn = "J"
local up_ = "K"
local rgt = "L"

local webapp = apps.browser .. " --new-window --ozone-platform=wayland --app"

-- System and window management
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + MINUS", hl.dsp.layout("preselect r")) -- next window: split vertically, opens right
hl.bind(mainMod .. " + EQUAL", hl.dsp.layout("preselect d")) -- next window: split horizontally, opens bottom

hl.bind(mainMod .. " + SPACE", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Applications and utilities
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("system-menu"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(apps.terminal))
hl.bind(mainMod .. " + SLASH", focus_or_launch("1Password", "1password"))
hl.bind(mainMod .. " + A", focus_or_launch("claude.ai_/", webapp .. "=https://claude.ai"))
hl.bind(mainMod .. " + B", focus_or_launch("Vivaldi - Vivaldi", apps.browser))
hl.bind(mainMod .. " + C", focus_or_launch("chatgpt.com_/", webapp .. "=https://chatgpt.com"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("run-or-kill " .. apps.menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("run-or-kill " .. apps.files))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("quickshell ipc call systemmenu toggle"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(apps.terminal .. " -e nvim"))
hl.bind(mainMod .. " + O", focus_or_launch("obsidian", "md.obsidian.Obsidian -disable-gpu"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("run-or-kill pavucontrol --tab=3"))
hl.bind(mainMod .. " + W", focus_or_launch("web.whatsapp.com_/", webapp .. "=https://web.whatsapp.com"))
hl.bind(mainMod .. " + X", focus_or_launch("excalidraw.com_/", webapp .. "=https://excalidraw.com"))
hl.bind(mainMod .. " + Y", focus_or_launch("youtube.com_/", webapp .. "=https://youtube.com"))

-- Focus movement
hl.bind(mainMod .. " + " .. lft, hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + " .. dwn, hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + " .. up_, hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + " .. rgt, hl.dsp.focus({ direction = "r" }))

-- Window movement
hl.bind(mainMod .. " + CTRL + " .. lft, hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + CTRL + " .. dwn, hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + CTRL + " .. up_, hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CTRL + " .. rgt, hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Switch workspaces and move active window to a workspace
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i, silent = true }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
local lock_repeat = { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), lock_repeat)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), lock_repeat)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), lock_repeat)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), lock_repeat)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), lock_repeat)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), lock_repeat)

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
