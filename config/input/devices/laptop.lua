-- Laptop hardware bindings.

hl.bind(" + XF86KbdBrightnessUp", hl.dsp.exec_cmd(ATLAS.automation .. "/display/brightness-kbd.sh --inc"))
hl.bind(" + XF86KbdBrightnessDown", hl.dsp.exec_cmd(ATLAS.automation .. "/display/brightness-kbd.sh --dec"))
hl.bind(" + XF86TouchpadToggle", hl.dsp.exec_cmd(ATLAS.automation .. "/system/touchpad.sh"))
hl.bind(" + XF86Launch1", hl.dsp.exec_cmd("rog-control-center"))
hl.bind(" + XF86Launch3", hl.dsp.exec_cmd("asusctl led-mode -n"))
hl.bind(" + XF86Launch4", hl.dsp.exec_cmd("asusctl profile -n"))
hl.bind(USER.mainMod .. " + F6", hl.dsp.exec_cmd(ATLAS.scripts .. "/ScreenShot.sh --now"))
hl.bind(USER.mainMod .. " + SHIFT + F6", hl.dsp.exec_cmd(ATLAS.scripts .. "/ScreenShot.sh --area"))
hl.bind(USER.mainMod .. " + CTRL + F6", hl.dsp.exec_cmd(ATLAS.scripts .. "/ScreenShot.sh --in5"))
hl.bind(USER.mainMod .. " + ALT + F6", hl.dsp.exec_cmd(ATLAS.scripts .. "/ScreenShot.sh --in10"))
hl.bind("ALT + F6", hl.dsp.exec_cmd(ATLAS.scripts .. "/ScreenShot.sh --active"))
