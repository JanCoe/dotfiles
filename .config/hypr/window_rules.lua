local apps = require("applications")

-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
-- See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

hl.window_rule({
  name        = "pavucontrol-float",
  match       = { class = "org.pulseaudio.pavucontrol" },
  float       = true,
  size        = "1200 900",
  border_size = 0,
})

hl.window_rule({
  name  = "nm-connection-editor-float",
  match = { class = "nm-connection-editor" },
  float = true,
  size  = "1200 900",
})

hl.window_rule({
  name        = "files-float",
  match       = { class = apps.files },
  float       = true,
  size        = "1200 900",
  border_size = 0,
})

hl.window_rule({
  name      = "terminal-ws",
  match     = { class = apps.terminal },
  workspace = "1",
})

hl.window_rule({
  name      = "vivaldi-ws",
  match     = { initial_title = "Vivaldi - Vivaldi" },
  workspace = "2",
})

hl.window_rule({
  name      = "claude-ws",
  match     = { initial_title = "claude.ai_/" },
  workspace = "3",
})

hl.window_rule({
  name      = "chatgpt-ws",
  match     = { initial_title = "chatgpt.com_/" },
  workspace = "4",
})

hl.window_rule({
  name      = "youtube-ws",
  match     = { initial_title = "youtube.com_/" },
  workspace = "5",
})

hl.window_rule({
  name      = "excalidraw-ws",
  match     = { initial_title = "excalidraw.com_/" },
  workspace = "6",
})

hl.window_rule({
  name      = "email-ws",
  match     = { class = apps.email },
  workspace = "7",
})

hl.window_rule({
  name      = "whatsapp-ws",
  match     = { initial_title = "web.whatsapp.com_/" },
  workspace = "8",
})

hl.window_rule({
  name      = "notes-ws",
  match     = { class = apps.notes },
  workspace = "9",
})

hl.window_rule({
  name      = "1password-ws",
  match     = { class = "1Password" },
  workspace = "10",
})

hl.window_rule({
  name           = "suppress-maximize",
  match          = { class = ".*" },
  suppress_event = "maximize",
})
