-- Define the modifier key for app hotkeys.
local launcher_mod = {'cmd'}

-- -----------------------------------------------------------------------------
-- Application Hotkey Configuration
-- -----------------------------------------------------------------------------

local apps = {
  ['1'] = "Safari",
  ['2'] = "Warp",
  ['3'] = "Finder",
  ['4'] = "Xcode",
  ['5'] = "Zed",
  ['6'] = "Discord",
  ['7'] = "Apple Music",
  ['8'] = "Simulador de Autômatos",
  ['9'] = "Logisim-evolution",
  ['0'] = "iPhone Mirroring"
}

-- Core launch/toggle logic
local function launchOrToggle(appName)
  local app = hs.application.get(appName)
  local focusedWindow = hs.window.focusedWindow()

  if focusedWindow and focusedWindow:application():name() == appName then
    app:hide()
  elseif app and app:isFrontmost() == false then
    app:activate()
  else
    hs.application.launchOrFocus(appName)
  end
end

-- Binds the hotkeys from the `apps` table
for key, appName in pairs(apps) do
  hs.hotkey.bind(launcher_mod, key, function()
    launchOrToggle(appName)
  end)
end

-- =============================================================================
-- Configuration Reload
-- =============================================================================

-- Hotkey to reload the Hammerspoon config (cmd+alt+R)
hs.hotkey.bind({'cmd', 'alt'}, 'R', function()
  hs.reload()
end)

