-- https://www.hammerspoon.org/docs/index.html


-- Show app shortcuts
 
local function focusApp(name)
    local app = hs.application.get(name)
    if app then
        app:activate()
    else
        hs.application.launchOrFocus(name)
    end
end


local appShortcuts = {
    ["1"] = "Safari",
    ["2"] = "Mail",
    ["3"] = "Spotify",
    ["4"] = "wezTerm",
    ["5"] = "Dash",
}

for key, name in pairs(appShortcuts) do
    hs.hotkey.bind({"cmd", "alt"}, key, function()
        focusApp(name)
    end)
end

-- Show current Spotify track

hs.hotkey.bind({"cmd, alt"}, "T", function()
    hs.spotify.displayCurrentTrack()
end)
