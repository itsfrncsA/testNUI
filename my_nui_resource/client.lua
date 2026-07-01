local isMenuOpen = false

-- Open the menu on a keypress or chat command
RegisterCommand('opennui', function()
    ToggleNUI(not isMenuOpen)
end, false)

-- Register key mapping to open/close menu (default F9 key)
RegisterKeyMapping('opennui', 'Toggle Shinigami Esse NUI', 'keyboard', 'F9')

function ToggleNUI(state)
    isMenuOpen = state
    -- Enable cursor control and input focus
    SetNuiFocus(state, state)
    
    -- Send message to ui/script.js
    SendNUIMessage({
        type = "ui",
        status = state
    })
end

-- Listen for the callback from JavaScript when the close button or esc/backspace is pressed
RegisterNUICallback('closeNUI', function(data, cb)
    ToggleNUI(false)
    cb('ok') -- Always respond to the callback
end)

RegisterNUICallback('prevCategory', function(data, cb)
    -- Trigger category switch on Lua side (e.g. Esse:PrevCategory())
    if Esse and Esse.PrevCategory then
        Esse:PrevCategory()
    end
    cb('ok')
end)

RegisterNUICallback('nextCategory', function(data, cb)
    -- Trigger category switch on Lua side (e.g. Esse:NextCategory())
    if Esse and Esse.NextCategory then
        Esse:NextCategory()
    end
    cb('ok')
end)

-- Listen for the action callbacks when menu options are triggered
RegisterNUICallback('menuAction', function(data, cb)
    local action = data.action
    
    -- Display a client-side notification or chat message
    TriggerEvent('chat:addMessage', {
        color = { 255, 62, 62 },
        multiline = true,
        args = { "Esse", "Executed action: ^2" .. tostring(action) }
    })
    
    -- Optional: Perform custom gameplay logic depending on the action
    if action == "self" then
        -- Handle self option
    elseif action == "exploits" then
        -- Handle exploits option
    elseif action == "weapon" then
        -- Handle weapon option
    elseif action == "teleport" then
        -- Handle teleport option
    elseif action == "visuals" then
        -- Handle visuals option
    elseif action == "misc" then
        -- Handle misc option
    end
    
    cb('ok') -- Always respond to the callback
end)

-- Keep keyboard controls active but disable player actions while menu is open
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isMenuOpen then
            -- Disable standard game actions when NUI is open to prevent character moving/shooting
            DisableControlAction(0, 1, true) -- LookLeftRight
            DisableControlAction(0, 2, true) -- LookUpDown
            DisableControlAction(0, 142, true) -- MeleeAttackAlternate
            DisableControlAction(0, 18, true) -- Enter
            DisableControlAction(0, 322, true) -- ESC
            DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
        else
            -- Small delay when menu is closed
            Citizen.Wait(250)
        end
    end
end)
