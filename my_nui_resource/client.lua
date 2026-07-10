local isMenuOpen    = false
local isKeyboardOpen = false

-- Pending keyboard callback (set by ShowKeyboard, called on submit/cancel)
local pendingKeyboardCb = nil

-- ==================== TOGGLE NUI ====================
RegisterCommand('opennui', function()
    ToggleNUI(not isMenuOpen)
end, false)

RegisterKeyMapping('opennui', 'Toggle Shinigami Esse NUI', 'keyboard', 'F9')

function ToggleNUI(state)
    isMenuOpen = state
    SetNuiFocus(state, state)
    SendNUIMessage({
        type   = "ui",
        status = state
    })
end

-- ==================== KEYBOARD INPUT ====================

---Open the NUI keyboard overlay and wait for a typed response.
---@param title string  Prompt shown in the overlay header
---@param defaultValue string  Pre-filled value (optional)
---@param callback function  Called with (value) on submit, or (nil) on cancel
function ShowKeyboard(title, defaultValue, callback)
    pendingKeyboardCb = callback
    isKeyboardOpen    = true

    -- Tell the NUI to show the keyboard overlay
    SendNUIMessage({
        action  = "updateKeyboard",
        visible = true,
        title   = title or "INPUT",
        value   = defaultValue or ""
    })
end

function HideKeyboard()
    isKeyboardOpen = false
    SendNUIMessage({
        action  = "updateKeyboard",
        visible = false
    })
end

-- JS submits the typed value via this callback
RegisterNUICallback('keyboardSubmit', function(data, cb)
    isKeyboardOpen = false
    SendNUIMessage({ action = "updateKeyboard", visible = false })

    if pendingKeyboardCb then
        local value = tostring(data.value or "")
        pendingKeyboardCb(value)
        pendingKeyboardCb = nil
    end
    cb('ok')
end)

-- JS cancels (ESC) via this callback
RegisterNUICallback('keyboardCancel', function(data, cb)
    isKeyboardOpen = false
    SendNUIMessage({ action = "updateKeyboard", visible = false })

    if pendingKeyboardCb then
        pendingKeyboardCb(nil) -- nil signals cancel
        pendingKeyboardCb = nil
    end
    cb('ok')
end)

-- ==================== CLOSE NUI ====================
RegisterNUICallback('closeNUI', function(data, cb)
    ToggleNUI(false)
    cb('ok')
end)

-- ==================== CATEGORY CALLBACKS ====================
RegisterNUICallback('prevCategory', function(data, cb)
    if Esse and Esse.PrevCategory then Esse:PrevCategory() end
    cb('ok')
end)

RegisterNUICallback('nextCategory', function(data, cb)
    if Esse and Esse.NextCategory then Esse:NextCategory() end
    cb('ok')
end)

RegisterNUICallback('changeCategory', function(data, cb)
    -- data.newCategoryIndex is available if needed
    cb('ok')
end)

-- ==================== MENU ACTIONS ====================
RegisterNUICallback('menuAction', function(data, cb)
    local action = data.action

    TriggerEvent('chat:addMessage', {
        color     = { 255, 62, 62 },
        multiline = true,
        args      = { "Esse", "Action: ^2" .. tostring(action) }
    })

    if action == "self" then
    elseif action == "exploits" then
    elseif action == "weapon" then
    elseif action == "teleport" then
    elseif action == "visuals" then
    elseif action == "misc" then
    end

    cb('ok')
end)

RegisterNUICallback('selectItem', function(data, cb)
    -- Example: items with type "input" trigger ShowKeyboard
    local label = tostring(data.itemLabel or "")

    -- Demo: if item label contains "Input" open the keyboard
    if string.find(label:lower(), "input") then
        ShowKeyboard("Enter value for: " .. label, "", function(value)
            if value ~= nil then
                TriggerEvent('chat:addMessage', {
                    color = { 100, 255, 100 },
                    args  = { "Esse", "Input received: ^2" .. value }
                })
            end
        })
    end

    cb('ok')
end)

RegisterNUICallback('toggleCheckbox', function(data, cb)
    cb('ok')
end)

RegisterNUICallback('scrollableChange', function(data, cb)
    cb('ok')
end)

RegisterNUICallback('sliderChange', function(data, cb)
    cb('ok')
end)

RegisterNUICallback('keySelected', function(data, cb)
    cb('ok')
end)

-- ==================== GAME CONTROL BLOCKING ====================
Citizen.CreateThread(function()
    while true do
        if isMenuOpen then
            Citizen.Wait(0)
            DisableControlAction(0, 1,   true) -- LookLeftRight
            DisableControlAction(0, 2,   true) -- LookUpDown
            DisableControlAction(0, 142, true) -- MeleeAttackAlternate
            DisableControlAction(0, 18,  true) -- Enter
            DisableControlAction(0, 322, true) -- ESC
            DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
            DisableControlAction(0, 30,  true) -- MoveLeftRight
            DisableControlAction(0, 31,  true) -- MoveUpDown
        else
            Citizen.Wait(500)
        end
    end
end)
