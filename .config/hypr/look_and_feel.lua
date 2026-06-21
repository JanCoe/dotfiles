-- Refer to https://wiki.hyprland.org/Configuring/Variables/

-- https://wiki.hyprland.org/Configuring/Variables/#general
hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 8,

    border_size = 8,

    -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    -- col.active_border = rgba(88c0d0ff) rgba(b48eadff) 45deg # frost-blue -> aurora-purple
    col = {
      active_border = { colors = { "rgba(ebcb8bff)", "rgba(d08770ff)" }, angle = 45 }, -- aurora yellow -> orange
      inactive_border = "rgba(3b4252aa)",                                              -- Nord1
    },

    -- Set to true enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true,

    -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false,

    layout = "dwindle" --- master
    --- font = "Inter"
  },

  -- https://wiki.hyprland.org/Configuring/Variables/#decoration
  decoration = {
    rounding = 0,
    rounding_power = 2,

    -- Change transparency of focused and unfocused windows
    active_opacity = 0.88,
    inactive_opacity = 0.88,

    shadow = {
      enabled = true,
      range = 20,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },

    -- https://wiki.hyprland.org/Configuring/Variables/#blur
    blur = {
      enabled = true,
      size = 6,
      passes = 3,
      new_optimizations = true,
      xray = false,
      vibrancy = 0.1696,
    },
  },

  -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
  dwindle = {
    -- pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true, -- You probably want this
  },

  -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
  master = {
    new_status = "master",
  },

  -- https://wiki.hyprland.org/Configuring/Variables/#misc
  misc = {
    force_default_wallpaper = 0,  -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
    disable_hyprland_guiutils_check = true,
  },

  animations = {
    enabled = true,
  },
})
