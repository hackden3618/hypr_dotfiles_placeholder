-- Animation profiles.

local profile = os.getenv("ATLAS_ANIMATIONS") or "smooth"

if profile == "disabled" then
  require("config.desktop.compositor.animations.disabled")
elseif profile == "fast" then
  require("config.desktop.compositor.animations.fast")
else
  require("config.desktop.compositor.animations.smooth")
end
