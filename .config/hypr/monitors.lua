-- See https://wiki.hyprland.org/Configuring/Monitors/
-- Run 'hyprctl monitors' to see what values to enter
hl.monitor({
  output = "eDP-1", -- ThinkPad
  mode = "1920x1080@60",
  position = "0x0",
  scale = 1,
})

hl.monitor({
  output = "DP-1", --  Dell monitor
  mode = "3840x2160@60",
  position = "0x0",
  scale = 1.2,
})

hl.monitor({
  output = "DP-4", -- Dell monitor
  mode = "3840x2160@60",
  position = "0x0",
  scale = 1.2,
})

hl.monitor({
  output = "HDMI-A-1", -- default for HDMI1
  mode = "preferred",
  position = "auto",
  scale = 1,
})

hl.monitor({
  output = "HDMI-A-2", -- default for HDMI2
  mode = "preferred",
  position = "auto",
  scale = 1,
})
