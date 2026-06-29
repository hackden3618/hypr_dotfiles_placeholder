-- ============================================================
-- ATLAS Workstation Engineering Platform
-- Hyprland Lua Entry Point
-- ============================================================
-- This file is the target Lua entry point. It is intentionally
-- not the active session entry point until parity with hyprland.conf
-- is complete and verified.

local root = os.getenv("HOME") .. "/.config/hypr"
package.path = root .. "/?.lua;" .. root .. "/?/init.lua;" .. package.path

require("config.init")
