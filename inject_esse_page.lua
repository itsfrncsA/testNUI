-- =========================================================================
--  INJECTABLE LUA SCRIPT: ESSE MENU PAGE
--  Designed for execution/injection environment (e.g. Macho Executor)
-- =========================================================================

local Esse = {}
local DUI = nil
local AuthPassed = true
_G.LoggedUser = "Made by"
_G.LoggedType = "Frncs"
_G.LoggedExpiry = 'Never'

function Esse:SendMessage(data)
    if not DUI or not data or type(data) ~= "table" then
        return
    end
    local jsonStr = json.encode(data)
    if MachoSendDuiMessage then
        MachoSendDuiMessage(DUI, jsonStr)
    else
        SendDuiMessage(DUI, jsonStr)
    end
end

function Esse:SyncAccountToDUI()
    if not DUI then return end
    self:SendMessage({
        action = "updateAuthFooter",
        username = _G.LoggedUser,
        subscription = _G.LoggedType,
        expiry = _G.LoggedExpiry or "LIFETIME"
    })
end

function Esse:Initialize()
    if not AuthPassed then return end

    if DUI then
        DestroyDui(DUI)
        DUI = nil
    end

    if MachoCreateDui then
        -- Executor Environment
        DUI = MachoCreateDui("https://itsfrncsa.github.io/testNUI/my_esse_dui/ui/index.html" .. GetGameTimer())
        if DUI then
            MachoShowDui(DUI)
        end
    else
        -- Standard FiveM Native Fallback
        local url = "https://itsfrncsa.github.io/testNUI/my_esse_dui/ui/index.html" .. GetGameTimer()
        DUI = CreateDui(url, 1920, 1080)
        local handle = GetDuiHandle(DUI)
        local txd = CreateRuntimeTxd("EsseTxd")
        local txn = CreateRuntimeTextureFromDuiHandle(txd, "EsseTxn", handle)

        -- Drawing Thread for fallback (always full screen)
        Citizen.CreateThread(function()
            while DUI do
                DrawSprite("EsseTxd", "EsseTxn", 0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
                Citizen.Wait(0)
            end
        end)
    end
end

-- Close Esse UI
local function StopEsse()
    if DUI then
        DestroyDui(DUI)
        DUI = nil
    end
    print("^1[DUI Esse] Injected Esse page removed.^7")
end

-- Register Commands
RegisterCommand('injesse', function()
    Esse:Initialize()
end, false)

RegisterCommand('injuesse', function()
    StopEsse()
end, false)

-- Register clean up on script stops
AddEventHandler('onResourceStop', function(res)
    if res == GetCurrentResourceName() then
        StopEsse()
    end
end)

-- Auto-initialize when injected
Citizen.CreateThread(function()
    Esse:Initialize()
end)
