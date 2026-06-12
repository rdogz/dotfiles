-- Variables
local browser = "librewolf"
local terminal = "kitty"
local chromium = "chromium --disable-features=ExtensionManifestV2Unsupported,ExtensionManifestV2Disabled --password-store=basic"
local file_manager = "thunar"
local screenshot = "$HOME/.config/scripts/screenshot.sh"
local music = "spotify-launcher"
local audio = "pavucontrol"
local wallpaper = "waypaper"


-- Affected by variables
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + N", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + C", hl.dsp.exec_cmd(chromium))
hl.bind("SUPER + E", hl.dsp.exec_cmd(file_manager))
hl.bind("SUPER + S", hl.dsp.exec_cmd(screenshot))
hl.bind("SUPER + M", hl.dsp.exec_cmd(music))
hl.bind("SUPER + A", hl.dsp.exec_cmd(audio))
hl.bind("SUPER + A", hl.dsp.exec_cmd(audio))
hl.bind("SUPER + W", hl.dsp.exec_cmd(wallpaper))


-- Static
hl.bind("SUPER + D", hl.dsp.exec_cmd("discord"))
hl.bind("SUPER + F", function() hl.dispatch(hl.dsp.window.fullscreen()) end)
hl.bind("ALT + Q", hl.dsp.exec_cmd("killactive"))
local closeWindowBind = hl.bind("ALT + Q", hl.dsp.window.close())


-- Workspaces
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("ALT + " .. key, hl.dsp.window.move({ workspace = i }))
end


-- Switch focus
hl.bind("SUPER + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())    -- Change focus to another window
end)
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))


-- Drag
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })    -- ALT + LMB: Move a window by dragging more than 10px.
