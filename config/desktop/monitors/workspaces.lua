-- Monitor/workspace baseline.
-- nwg-displays still owns the active Hyprlang monitor file.

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})

for i = 1, 10 do
  hl.workspace_rule({ workspace = tostring(i), persistent = true })
end
