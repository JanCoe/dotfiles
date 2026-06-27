local apps = require("applications")

hl.on("hyprland.start", function()
  hl.exec_cmd(apps.terminal)
  hl.exec_cmd("nm-applet")
  hl.exec_cmd(apps.statusbar)
  hl.exec_cmd("hyprpaper")
end
)
