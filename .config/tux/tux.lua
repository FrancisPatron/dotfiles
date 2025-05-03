-- Enable window navigation with Alt + H, J, K, L
table.insert(keybindings, {
    mods = {"Alt"},
    key = "h",
    action = act.ActivatePaneDirection("Left"),
})

table.insert(keybindings, {
    mods = {"Alt"},
    key = "j",
    action = act.ActivatePaneDirection("Down"),
})

table.insert(keybindings, {
    mods = {"Alt"},
    key = "k",
    action = act.ActivatePaneDirection("Up"),
})

table.insert(keybindings, {
    mods = {"Alt"},
    key = "l",
    action = act.ActivatePaneDirection("Right"),
})
