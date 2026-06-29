-- Desktop startup services.

hl.on("hyprland.start", function()
  hl.exec_cmd("awww-daemon --format xrgb")
  hl.exec_cmd("nm-applet --indicator")
  hl.exec_cmd("swaync")
  hl.exec_cmd("waybar")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd(ATLAS.automation .. "/display/hyprsunset.sh init")
  hl.exec_cmd(ATLAS.automation .. "/session/drop-terminal.sh " .. USER.terminal)
end)
