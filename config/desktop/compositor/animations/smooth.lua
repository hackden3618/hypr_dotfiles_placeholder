hl.config({ animations = { enabled = true } })

hl.curve("atlasEase", { type = "bezier", points = { {0.16, 1}, {0.3, 1} } })
hl.curve("atlasLinear", { type = "bezier", points = { {0, 0}, {1, 1} } })

hl.animation({ leaf = "global", enabled = true, speed = 8, bezier = "atlasEase" })
hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "atlasEase", style = "popin 90%" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "atlasEase" })
hl.animation({ leaf = "layers", enabled = true, speed = 4, bezier = "atlasEase" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "atlasEase", style = "fade" })
