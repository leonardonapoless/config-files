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

-- Core launch/toggle logic (Corrected)
local function launchOrToggle(appName)
  local app = hs.application.find(appName)

  -- If the app is already the frontmost application, hide it.
  if app and app:isFrontmost() then
    app:hide()
  else
    -- Otherwise, launch the app if it's not running, or focus it if it is.
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
