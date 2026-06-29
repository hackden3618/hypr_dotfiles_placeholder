-- User startup entries.

hl.on("hyprland.start", function()
  hl.exec_cmd("qs")
  hl.exec_cmd("blueman-applet")
end)
