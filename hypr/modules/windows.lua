-- General
hl.config({
    general = {
        gaps_in  = 0,
        gaps_out = 0,

        border_size = 1,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 0,
        rounding_power = 1,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.window_rule({
    name = "general",
    match = {
      class = "*"
    },
    border_size = 1,
    opacity = "1.0 0.7 1.0",
    rounding = 0,
})

-- Specific windows
hl.window_rule({
  name = "kitty",
  match = {
    class = "kitty"
  },
  opacity = "0.9 0.7 1.0"
})




-- Workspace rules
-- hl.workspace_rule({ workspace = "3", no_rounding = true, decorate = false })
