local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.keys = require("keymaps")

config.font = wezterm.font_with_fallback({ "JetBrains Mono", "Symbols Nerd Font" })
config.font_size = 21
config.color_scheme = "nord"
config.window_background_opacity = 0.90
config.max_fps = 120
config.animation_fps = 1
config.line_height = 1.2
config.warn_about_missing_glyphs = false
config.enable_scroll_bar = false

config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.tab_max_width = 32

config.enable_wayland = true

return config
