-- https://www.hammerspoon.org/docs/index.html

-- Set the default text size for alerts
hs.alert.defaultStyle.textSize = 18

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
  hs.hotkey.bind({ "cmd", "alt" }, key, function()
    focusApp(name)
  end)
end

-- Show current Spotify track

hs.hotkey.bind({ "cmd", "alt" }, "T", function()
  hs.spotify.displayCurrentTrack()
end)

-- Toggle Safari Sidebar

hs.hotkey.bind({ "cmd", "alt" }, "S", function()
  local app = hs.application.frontmostApplication()
  if app:name() == "Safari" then
    if not app:selectMenuItem({ "View", "Show Sidebar" }) then
      app:selectMenuItem({ "View", "Hide Sidebar" })
    end
  end
end)

-- Copy the current Safari tab as a Markdown link

local function escapeMarkdownLinkText(text)
  return text:gsub("\\", "\\\\"):gsub("%[", "\\["):gsub("%]", "\\]")
end

hs.hotkey.bind({ "cmd", "alt" }, "L", function()
  local app = hs.application.frontmostApplication()
  if not app or app:bundleID() ~= "com.apple.Safari" then
    hs.alert.show("Safari is not active")
    return
  end

  local ok, tab = hs.osascript.applescript([[
        tell application "Safari"
            if (count of windows) is 0 then error "Safari has no open windows."
            set activeTab to current tab of front window
            return {name of activeTab, URL of activeTab}
        end tell
    ]])

  if not ok or type(tab) ~= "table" or not tab[2] then
    hs.alert.show("Could not read the current Safari tab")
    return
  end

  local title = tostring(tab[1] or tab[2]):gsub("%s+", " ")
  local url = tostring(tab[2]):gsub("<", "%%3C"):gsub(">", "%%3E"):gsub("%(", "%%28"):gsub("%)", "%%29")
  local markdownLink = string.format("[%s](%s)", escapeMarkdownLinkText(title), url)

  if hs.pasteboard.setContents(markdownLink) then
    hs.alert.show("Copied link")
  else
    hs.alert.show("Failed to copy link")
  end
end)
