-- docs: https://www.hammerspoon.org/go/

-- ==========================================================
-- HAMMERSPOON CONFIGURATION
-- ==========================================================

-- Auto-reload config when saved
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()
-- hs.alert.show("Hammerspoon Config Loaded")

-- Disable window animations for instant Rectangle-like snapping
hs.window.animationDuration = 0

-- ==========================================================
-- WINDOW MANAGEMENT (similar to `Rectangle` app)
-- ==========================================================
local rectMash = { "ctrl", "alt" }

local function move(unit)
    local win = hs.window.focusedWindow()
    if win then win:moveToUnit(unit) end
end

--- Corners ---
hs.hotkey.bind(rectMash, "u", function() move { x = 0, y = 0, w = 0.5, h = 0.5 } end)
hs.hotkey.bind(rectMash, "i", function() move { x = 0.5, y = 0, w = 0.5, h = 0.5 } end)
-- Bottom Left/Right (⌃⌥ + J/K)
hs.hotkey.bind(rectMash, "j", function() move { x = 0, y = 0.5, w = 0.5, h = 0.5 } end)
hs.hotkey.bind(rectMash, "k", function() move { x = 0.5, y = 0.5, w = 0.5, h = 0.5 } end)

--- Full & Center ---
hs.hotkey.bind(rectMash, "return", function() move(hs.layout.maximized) end)
hs.hotkey.bind(rectMash, "c", function() move { x = 0.125, y = 0.125, w = 0.75, h = 0.75 } end)

--- Halves: If left/right is at the end of display, move it to the other monitor ---
-- hs.hotkey.bind(rectMash, "left", function() move(hs.layout.left50) end)
-- hs.hotkey.bind(rectMash, "right", function() move(hs.layout.right50) end)
hs.hotkey.bind(rectMash, "up", function() move { x = 0, y = 0, w = 1, h = 0.5 } end)
hs.hotkey.bind(rectMash, "down", function() move { x = 0, y = 0.5, w = 1, h = 0.5 } end)

-- Smart function to handle snapping AND display jumping
-- Idea: try to move half window within the same monitor display. If frame hasn't moved, then we need to move it to next monitor
local function snapOrMoveDisplay(direction)
    local win = hs.window.focusedWindow()
    if not win then return end

    local oldFrame = win:frame()
    if direction == "left" then
        win:moveToUnit(hs.layout.left50)
    else
        win:moveToUnit(hs.layout.right50)
    end
    local newFrame = win:frame()

    local didNotMove = math.abs(oldFrame.x - newFrame.x) < 2 and
        math.abs(oldFrame.y - newFrame.y) < 2 and
        math.abs(oldFrame.w - newFrame.w) < 2 and
        math.abs(oldFrame.h - newFrame.h) < 2

    if didNotMove then
        local screen = win:screen()
        if direction == "left" then
            local target = screen:toWest() or screen:previous()
            win:moveToScreen(target, false, true)
            win:moveToUnit(hs.layout.right50)
        else
            local target = screen:toEast() or screen:next()
            win:moveToScreen(target, false, true)
            win:moveToUnit(hs.layout.left50)
        end
    end
end
hs.hotkey.bind(rectMash, "left", function() snapOrMoveDisplay("left") end)
hs.hotkey.bind(rectMash, "right", function() snapOrMoveDisplay("right") end)


-- ==========================================================
-- KEY CASTER TOGGLE
-- ==========================================================

local keyCasterMash = { "cmd", "alt", "ctrl" }
local keyTap = nil
local keyStack = ""
local clearTimer = nil
local currentAlert = nil

-- Customize the appearance of the alert
local alertStyle = {
    textFont = ".AppleSystemUIFont", -- Menlo
    atScreenEdge = 2,                -- 2 pins the alert to the bottom of the screen
    strokeColor = { white = 1, alpha = 0 },
    fillColor = { white = 0, alpha = 0.8 },
    textColor = { white = 1, alpha = 1 },
    radius = 8,
    textSize = 32,
    fadeInDuration = 0, -- Instant appear for responsive typing
    fadeOutDuration = 0.2
}

local function stopKeyCaster()
    if keyTap then
        keyTap:stop()
        keyTap = nil
    end
    if clearTimer then
        clearTimer:stop()
        clearTimer = nil
    end
    hs.alert.closeAll()
    keyStack = ""
    hs.alert.show("Key Caster: OFF")
end

local function startKeyCaster()
    hs.alert.show("Key Caster: ON")

    -- Listen for physical key down events globally
    keyTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
        local keyCode = event:getKeyCode()
        local keyName = hs.keycodes.map[keyCode] or ""

        -- Capture modifier keys held during the press
        local mods = event:getFlags()
        local modStr = ""
        if mods.cmd then modStr = modStr .. "⌘" end
        if mods.alt then modStr = modStr .. "⌥" end
        if mods.ctrl then modStr = modStr .. "⌃" end
        if mods.shift then modStr = modStr .. "⇧" end

        -- Format the key name nicely (capitalize letters, bracket specials)
        local displayStr = modStr
        if string.len(keyName) == 1 then
            displayStr = displayStr .. string.upper(keyName)
        else
            displayStr = displayStr .. "[" .. keyName .. "]"
        end

        -- Append left-to-right
        if keyStack == "" then
            keyStack = displayStr
        else
            keyStack = keyStack .. " " .. displayStr
        end

        -- Close the previous alert so they don't stack vertically
        if currentAlert then
            hs.alert.closeSpecific(currentAlert)
        end

        -- Determine current screen (where the mouse or focused window is)
        local currentScreen = hs.window.focusedWindow() and hs.window.focusedWindow():screen() or
            hs.mouse.getCurrentScreen()

        -- Show the updated string
        currentAlert = hs.alert.show(keyStack, alertStyle, currentScreen, 2)

        -- Clear the stack if you stop typing for 1.5 seconds
        if clearTimer then clearTimer:stop() end
        clearTimer = hs.timer.doAfter(1.5, function()
            keyStack = ""
            if currentAlert then
                hs.alert.closeSpecific(currentAlert)
                currentAlert = nil
            end
        end)

        -- Return false so we don't intercept/block the actual keypress
        return false
    end)

    keyTap:start()
end

-- Toggle Hotkey (⌃⌥⌘ + K)
hs.hotkey.bind(keyCasterMash, "k", function()
    if keyTap then
        stopKeyCaster()
    else
        startKeyCaster()
    end
end)

-- ==========================================================
-- BLUETOOTH DEVICE CONNECTIONS
-- ==========================================================

-- Note: bluetooth device mac address can be found with command `blueutil --paired`
-- FIXME command `blueutil --connect` is accurate, but doesn't properly execute using hammerspoon for some reason
-- use `hs.task.new()` instead?
local bluetoothMash = { "cmd", "alt", "ctrl" }
local mouseMacAddress = "ac-bc-32-e5-de-23"
local headphonesMacAddress = "84-d3-52-a4-d8-23"
local earphonesMacAddress = "27-87-b4-75-c7-58"

hs.hotkey.bind(bluetoothMash, "b", function()
    hs.alert.show("Connecting Bluetooth devices...")

    -- Ensure Hammerspoon can find blueutil whether on Apple Silicon or Intel Macs
    local envPath = "export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH; "

    -- Execute the connections (to execute parallelly, use `&`)
    hs.execute(envPath .. "blueutil --connect " .. mouseMacAddress)
    hs.execute(envPath .. "blueutil --connect " .. headphonesMacAddress)
    hs.execute(envPath .. "blueutil --connect " .. earphonesMacAddress)
end)
