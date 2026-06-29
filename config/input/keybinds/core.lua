-- Core window and workspace keybinds.

local mod = USER.mainMod

local function keys(...)
  return table.concat({...}, " + ")
end

local function dispatch(command)
  return hl.dsp.exec_cmd("hyprctl dispatch " .. command)
end

hl.bind(keys("CTRL", "ALT", "Delete"), hl.dsp.exit())
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(keys(mod, "SHIFT", "Q"), hl.dsp.exec_cmd(ATLAS.automation .. "/system/kill-process.sh"))
hl.bind(keys(mod, "SHIFT", "F"), dispatch("fullscreen 0"))
hl.bind(keys(mod, "CTRL", "F"), dispatch("fullscreen 1"))
hl.bind(keys(mod, "SPACE"), dispatch("togglefloating"))
hl.bind(keys(mod, "ALT", "SPACE"), dispatch("workspaceopt allfloat"))

hl.bind(keys(mod, "left"), dispatch("movefocus l"))
hl.bind(keys(mod, "right"), dispatch("movefocus r"))
hl.bind(keys(mod, "up"), dispatch("movefocus u"))
hl.bind(keys(mod, "down"), dispatch("movefocus d"))

hl.bind(keys(mod, "CTRL", "left"), dispatch("movewindow l"))
hl.bind(keys(mod, "CTRL", "right"), dispatch("movewindow r"))
hl.bind(keys(mod, "CTRL", "up"), dispatch("movewindow u"))
hl.bind(keys(mod, "CTRL", "down"), dispatch("movewindow d"))
hl.bind(keys(mod, "ALT", "left"), dispatch("swapwindow l"))
hl.bind(keys(mod, "ALT", "right"), dispatch("swapwindow r"))
hl.bind(keys(mod, "ALT", "up"), dispatch("swapwindow u"))
hl.bind(keys(mod, "ALT", "down"), dispatch("swapwindow d"))
hl.bind(keys(mod, "SHIFT", "left"), dispatch("resizeactive -50 0"))
hl.bind(keys(mod, "SHIFT", "right"), dispatch("resizeactive 50 0"))
hl.bind(keys(mod, "SHIFT", "up"), dispatch("resizeactive 0 -50"))
hl.bind(keys(mod, "SHIFT", "down"), dispatch("resizeactive 0 50"))

for i = 1, 10 do
  local key = i == 10 and "0" or tostring(i)
  hl.bind(keys(mod, key), dispatch("workspace " .. i))
  hl.bind(keys(mod, "SHIFT", key), dispatch("movetoworkspace " .. i))
end

hl.bind(keys(mod, "Tab"), dispatch("workspace m+1"))
hl.bind(keys(mod, "SHIFT", "Tab"), dispatch("workspace m-1"))
hl.bind(keys(mod, "U"), dispatch("togglespecialworkspace"))
hl.bind(keys(mod, "SHIFT", "U"), dispatch("movetoworkspace special"))
hl.bind(keys(mod, "G"), dispatch("togglegroup"))
hl.bind(keys(mod, "CTRL", "Tab"), dispatch("changegroupactive"))
hl.bind(keys(mod, "CTRL", "D"), dispatch("layoutmsg removemaster"))
hl.bind(keys(mod, "I"), dispatch("layoutmsg addmaster"))
hl.bind(keys(mod, "CTRL", "Return"), dispatch("layoutmsg swapwithmaster"))
hl.bind(keys(mod, "P"), dispatch("pseudo"))
hl.bind(keys(mod, "M"), dispatch("splitratio 0.3"))
hl.bind(keys("ALT", "Tab"), dispatch("cyclenext"))
hl.bind(keys("ALT", "Tab"), dispatch("bringactivetotop"))
hl.bind(keys(mod, "CTRL", "F9"), dispatch("movecurrentworkspacetomonitor l"))
hl.bind(keys(mod, "CTRL", "F10"), dispatch("movecurrentworkspacetomonitor r"))
hl.bind(keys(mod, "CTRL", "F11"), dispatch("movecurrentworkspacetomonitor u"))
hl.bind(keys(mod, "CTRL", "F12"), dispatch("movecurrentworkspacetomonitor d"))
