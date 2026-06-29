-- ============================================================
-- ATLAS Lua Module Loader
-- Load order: platform -> desktop -> input -> startup.
-- ============================================================

require("config.platform.variables")
require("config.platform.environment")
require("config.platform.input")

require("config.desktop.monitors.workspaces")
require("config.desktop.compositor.general")
require("config.desktop.compositor.decorations")
require("config.desktop.compositor.misc")
require("config.desktop.compositor.animations")
require("config.desktop.rules.generated")

require("config.input.keybinds.core")
require("config.input.keybinds.media")
require("config.input.keybinds.desktop")
require("config.input.keybinds.user")
require("config.input.devices.laptop")

require("config.startup.core")
require("config.startup.desktop")
require("config.startup.user")
