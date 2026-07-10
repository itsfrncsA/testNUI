-- =========================================================================
--  DEFACE PAGE DUI - CLIENT SIDE
-- =========================================================================

local duiObj = nil
local duiHandle = nil
local isDefaced = false

-- Create and show the Defacement DUI
local function StartDeface(videoUrl)
    if duiObj then
        DestroyDui(duiObj)
        duiObj = nil
    end

    local resourceName = GetCurrentResourceName()
    local defaultUrl = "nui://" .. resourceName .. "/ui/index.html"
    local width, height = 1920, 1080 -- High resolution for crisp UI rendering

    -- Create Direct User Interface (DUI)
    duiObj = CreateDui(defaultUrl, width, height)
    duiHandle = GetDuiHandle(duiObj)

    -- Create Runtime Texture Dictionary (TXD) and Texture (TXN)
    local txd = CreateRuntimeTxd("DefaceTxd")
    local txn = CreateRuntimeTextureFromDuiHandle(txd, "DefaceTxn", duiHandle)

    isDefaced = true

    -- Wait for DUI to load, parse YouTube URL and start playback
    Citizen.CreateThread(function()
        Citizen.Wait(1800)
        if duiObj then
            local ytid = "music.mp3"
            if videoUrl and videoUrl ~= "default" then
                local extracted = string.match(videoUrl, "v=([%w_-]+)")
                if not extracted then
                    extracted = string.match(videoUrl, "youtu%.be/([%w_-]+)")
                end
                if not extracted then
                    extracted = string.match(videoUrl, "embed/([%w_-]+)")
                end
                if extracted then
                    ytid = extracted
                else
                    ytid = videoUrl
                end
            end
            
            SendDuiMessage(duiObj, json.encode({ action = "playMusic", videoId = ytid }))
        end
    end)

    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 60 },
        multiline = true,
        args = { "System", "Server defaced by Tylers Amari." }
    })
end

-- Destroy and remove the Defacement DUI
local function StopDeface()
    isDefaced = false
    if duiObj then
        DestroyDui(duiObj)
        duiObj = nil
        duiHandle = nil
    end
    TriggerEvent('chat:addMessage', {
        color = { 0, 230, 118 },
        args = { "System", "Defacement removed." }
    })
end

-- Render Loop: Draws the DUI texture full-screen
Citizen.CreateThread(function()
    while true do
        if isDefaced and duiHandle then
            -- Draw sprite full-screen (relative: x=0.5, y=0.5, w=1.0, h=1.0)
            DrawSprite(
                "DefaceTxd", 
                "DefaceTxn", 
                0.5, 
                0.5, 
                1.0, 
                1.0, 
                0.0, 
                255, 255, 255, 255
            )
            Citizen.Wait(0)
        else
            Citizen.Wait(500) -- Wait when not defaced
        end
    end
end)

-- Command to start defacement
RegisterCommand('deface', function(source, args)
    local url = args[1] or "default"
    StartDeface(url)
end, false)

-- Command to stop defacement
RegisterCommand('undeface', function()
    StopDeface()
end, false)

-- Handle resource cleanup on stop
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if duiObj then
            DestroyDui(duiObj)
            duiObj = nil
        end
    end
end)
