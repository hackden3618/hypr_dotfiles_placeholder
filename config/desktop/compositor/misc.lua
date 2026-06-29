-- Miscellaneous compositor behavior.

hl.config({
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    animate_manual_resizes = false,
    animate_mouse_windowdragging = false,
  },
  binds = {
    workspace_back_and_forth = true,
    allow_workspace_cycles = true,
    hide_special_on_workspace_change = true,
  },
  xwayland = {
    force_zero_scaling = true,
  },
  ecosystem = {
    no_update_news = true,
    no_donation_nag = true,
  },
})
