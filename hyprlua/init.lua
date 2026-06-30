HOME = os.getenv("HOME") or "/home/admin"

mainMod = "SUPER"
scriptsDir = HOME .. "/.config/hypr/scripts"
UserScripts = HOME .. "/.config/hypr/UserScripts"
UserConfigs = HOME .. "/.config/hypr/hyprconf/UserConfigs"
hyprlua = HOME .. "/.config/hypr/hyprlua"

local function load(path)
    dofile(hyprlua .. "/" .. path)
end

hl.on("hyprland.start", function()
    hl.exec_cmd(HOME .. "/.config/hypr/initial-boot.sh")
end)

load("configs/Keybinds.lua")

load("configs/Startup_Apps.lua")
load("UserConfigs/Startup_Apps.lua")

load("UserConfigs/ENVariables.lua")

load("UserConfigs/Laptops.lua")
load("UserConfigs/LaptopDisplay.lua")

load("configs/WindowRules.lua")
load("UserConfigs/WindowRules.lua")

load("UserConfigs/UserDecorations.lua")
load("UserConfigs/UserAnimations.lua")
load("UserConfigs/01-UserDefaults.lua")
load("UserConfigs/UserKeybinds.lua")
load("UserConfigs/UserSettings.lua")

load("monitor.lua")
load("workspaces.lua")
load("configs/plugins/hyprexpo.lua")
