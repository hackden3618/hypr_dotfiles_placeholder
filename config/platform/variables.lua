-- ATLAS shared Lua variables.

local home = os.getenv("HOME")
local root = home .. "/.config/hypr"

ATLAS = {
  root = root,
  automation = root .. "/automation",
  scripts = root .. "/scripts",
  user_scripts = root .. "/UserScripts",
}

USER = {
  terminal = os.getenv("ATLAS_TERMINAL") or "kitty",
  files = os.getenv("ATLAS_FILE_MANAGER") or "nautilus",
  browser = os.getenv("ATLAS_BROWSER") or "firefox",
  editor = os.getenv("ATLAS_EDITOR") or "nvim",
  mainMod = "SUPER",
}

return {
  ATLAS = ATLAS,
  USER = USER,
}
