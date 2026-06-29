-- Input baseline.

hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",
    numlock_by_default = true,
    repeat_rate = 40,
    repeat_delay = 300,
    follow_mouse = 1,
    sensitivity = 0,
    touchpad = {
      natural_scroll = false,
      disable_while_typing = true,
      tap_to_click = true,
    },
  },
})

hl.config({
  gestures = {
    workspace_swipe_distance = 300,
    workspace_swipe_invert = true,
  },
})
