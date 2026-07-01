-- =========================================================================
--  DUI VIDEO & MUSIC PLAYER - CLIENT SIDE
-- =========================================================================

local duiObj = nil
local duiHandle = nil
local isVideoPlaying = false
local showVideo = false
local isPipMode = true -- Default to Picture-in-Picture mode on screen
local hasFocus = false

-- Screen positions & size configuration
-- Screen coordinates are relative (0.0 to 1.0)
local screenPos = {
    pip = { x = 0.82, y = 0.22, w = 0.32, h = 0.32 }, -- Top-right corner PiP (16:9 ratio w/h)
    fullscreen = { x = 0.5, y = 0.5, w = 1.0, h = 1.0 }
}

local currentPos = screenPos.pip

-- Helper: Get YouTube Video ID from URL
local function GetYouTubeId(url)
    if not url then return nil end
    local id = string.match(url, "v=([%w_-]+)")
    if not id then
        id = string.match(url, "youtu%.be/([%w_-]+)")
    end
    if not id then
        id = string.match(url, "embed/([%w_-]+)")
    end
    return id or url -- fallback to raw URL if not matched
end

-- Initialize and Create the DUI
local function CreateVideoDUI(videoUrl)
    if duiObj then
        DestroyDui(duiObj)
        duiObj = nil
    end

    local defaultUrl = "nui://" .. GetCurrentResourceName() .. "/ui/index.html"
    local width, height = 1280, 720

    -- Create Direct User Interface (DUI)
    duiObj = CreateDui(defaultUrl, width, height)
    duiHandle = GetDuiHandle(duiObj)

    -- Create Runtime Texture Dictionary (TXD) and Texture (TXN)
    local txd = CreateRuntimeTxd("MyVideoDuiTxd")
    local txn = CreateRuntimeTextureFromDuiHandle(txd, "MyVideoDuiTxn", duiHandle)

    showVideo = true
    isVideoPlaying = true

    -- Wait for UI to load and send initial video parameters
    Citizen.CreateThread(function()
        Citizen.Wait(1500) -- Allow page load
        if duiObj then
            local ytid = GetYouTubeId(videoUrl)
            SendDuiMessage(duiObj, json.encode({
                action = "loadVideo",
                videoId = ytid or "QD3BMv8ujzU" -- Default to requested video if parser failed
            }))
        end
    end)
end

-- Destroy / Cleanup DUI
local function CloseVideoDUI()
    showVideo = false
    isVideoPlaying = false
    hasFocus = false
    SetNuiFocus(false, false)

    if duiObj then
        DestroyDui(duiObj)
        duiObj = nil
        duiHandle = nil
    end
    
    TriggerEvent('chat:addMessage', {
        color = { 0, 230, 118 },
        multiline = true,
        args = { "VideoPlayer", "DUI Video player closed." }
    })
end

-- Send direct messages to the DUI page javascript
local function SendDuiAction(data)
    if duiObj then
        SendDuiMessage(duiObj, json.encode(data))
    end
end

-- Render Loop: Draws the DUI texture on-screen if visible
Citizen.CreateThread(function()
    while true do
        if showVideo and duiHandle then
            -- Draw sprite onto screen overlay
            DrawSprite(
                "MyVideoDuiTxd", 
                "MyVideoDuiTxn", 
                currentPos.x, 
                currentPos.y, 
                currentPos.w, 
                currentPos.h, 
                0.0, 
                255, 255, 255, 255
            )
            Citizen.Wait(0)
        else
            Citizen.Wait(500) -- Idle wait when video is hidden
        end
    end
end)

-- Command to play a video
RegisterCommand('playvideo', function(source, args, rawCommand)
    local url = args[1] or "https://www.youtube.com/watch?v=QD3BMv8ujzU"
    TriggerEvent('chat:addMessage', {
        color = { 0, 230, 118 },
        multiline = true,
        args = { "VideoPlayer", "Loading video: " .. url }
    })
    CreateVideoDUI(url)
end, false)

-- Command to close video
RegisterCommand('closevideo', function()
    CloseVideoDUI()
end, false)

-- Command to control volume
RegisterCommand('videovol', function(source, args)
    local vol = tonumber(args[1])
    if vol and vol >= 0 and vol <= 100 then
        SendDuiAction({ action = "setVolume", volume = vol })
        TriggerEvent('chat:addMessage', {
            color = { 0, 230, 118 },
            args = { "VideoPlayer", "Volume set to " .. vol .. "%" }
        })
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 23, 68 },
            args = { "VideoPlayer", "Usage: /videovol [0-100]" }
        })
    end
end, false)

-- Command to toggle play/pause
RegisterCommand('videopause', function()
    if isVideoPlaying then
        SendDuiAction({ action = "pause" })
        isVideoPlaying = false
        TriggerEvent('chat:addMessage', { color = { 0, 230, 118 }, args = { "VideoPlayer", "Paused" } })
    else
        SendDuiAction({ action = "play" })
        isVideoPlaying = true
        TriggerEvent('chat:addMessage', { color = { 0, 230, 118 }, args = { "VideoPlayer", "Resumed playing" } })
    end
end, false)

-- Command to toggle focus to click elements on player HUD
RegisterCommand('videofocus', function()
    hasFocus = not hasFocus
    SetNuiFocus(hasFocus, hasFocus)
    TriggerEvent('chat:addMessage', {
        color = { 0, 230, 118 },
        args = { "VideoPlayer", "Cursor control: " .. (hasFocus and "Enabled" or "Disabled") }
    })
end, false)

-- Command to toggle screen layout mode (Picture-in-Picture vs Fullscreen)
RegisterCommand('videopip', function()
    isPipMode = not isPipMode
    currentPos = isPipMode and screenPos.pip or screenPos.fullscreen
    
    TriggerEvent('chat:addMessage', {
        color = { 0, 230, 118 },
        args = { "VideoPlayer", "Switched to " .. (isPipMode and "Picture-in-Picture" or "Fullscreen") .. " mode" }
    })
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
