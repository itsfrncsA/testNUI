-- =========================================================================
--  INJECTABLE LUA SCRIPT: VIDEO & MUSIC PLAYER
--  Designed for execution/injection environment (e.g. Macho Executor)
-- =========================================================================

local videoDui = nil
local videoPlaying = false
local currentVolume = 100
local isPipMode = true

-- Relative screen positions (Picture-in-Picture vs Fullscreen)
local posPip = { x = 0.82, y = 0.22, w = 0.32, h = 0.32 }
local posFull = { x = 0.5, y = 0.5, w = 1.0, h = 1.0 }
local currentPos = posPip

-- Helper: Send message to the DUI
local function SendDuiAction(data)
    if not videoDui then return end
    local jsonStr = json.encode(data)
    if MachoSendDuiMessage then
        MachoSendDuiMessage(videoDui, jsonStr)
    else
        SendDuiMessage(videoDui, jsonStr)
    end
end

-- Helper: Get YouTube ID
local function GetYouTubeId(url)
    if not url then return nil end
    local id = string.match(url, "v=([%w_-]+)")
    if not id then
        id = string.match(url, "youtu%.be/([%w_-]+)")
    end
    if not id then
        id = string.match(url, "embed/([%w_-]+)")
    end
    return id or url
end

-- Create the video player DUI
local function CreateVideoPlayer(videoUrl)
    -- Clean up any existing instances
    if videoDui then
        if MachoCreateDui then
            -- Let native cleanup happen
            DestroyDui(videoDui)
        else
            DestroyDui(videoDui)
        end
        videoDui = nil
    end

    local url = "nui://my_video_dui/ui/index.html"
    videoPlaying = true

    if MachoCreateDui then
        -- Executor Environment
        videoDui = MachoCreateDui(url)
        if videoDui then
            MachoShowDui(videoDui)
        end
    else
        -- Standard FiveM Native Fallback
        videoDui = CreateDui(url, 1280, 720)
        local handle = GetDuiHandle(videoDui)
        local txd = CreateRuntimeTxd("MyVideoDuiTxd")
        local txn = CreateRuntimeTextureFromDuiHandle(txd, "MyVideoDuiTxn", handle)

        -- Drawing Thread for fallback
        Citizen.CreateThread(function()
            while videoDui do
                DrawSprite("MyVideoDuiTxd", "MyVideoDuiTxn", currentPos.x, currentPos.y, currentPos.w, currentPos.h, 0.0, 255, 255, 255, 255)
                Citizen.Wait(0)
            end
        end)
    end

    -- Wait for UI CEF to spin up, then load video
    Citizen.CreateThread(function()
        Citizen.Wait(1800)
        if videoDui then
            local ytid = GetYouTubeId(videoUrl) or "QD3BMv8ujzU"
            SendDuiAction({ action = "loadVideo", videoId = ytid })
        end
    end)

    print("^2[DUI Player] Injected Video Player Started Successfully!^7")
end

-- Close the video player
local function CloseVideoPlayer()
    videoPlaying = false
    if videoDui then
        DestroyDui(videoDui)
        videoDui = nil
    end
    print("^1[DUI Player] Injected Video Player Stopped.^7")
end

-- Register Commands
RegisterCommand('injplay', function(source, args)
    local url = args[1] or "https://www.youtube.com/watch?v=QD3BMv8ujzU"
    CreateVideoPlayer(url)
end, false)

RegisterCommand('injclose', function()
    CloseVideoPlayer()
end, false)

RegisterCommand('injvol', function(source, args)
    local vol = tonumber(args[1])
    if vol and vol >= 0 and vol <= 100 then
        currentVolume = vol
        SendDuiAction({ action = "setVolume", volume = vol })
    else
        print("^1[DUI Player] Usage: /injvol [0-100]^7")
    end
end, false)

RegisterCommand('injpause', function()
    if videoPlaying then
        SendDuiAction({ action = "pause" })
        videoPlaying = false
    else
        SendDuiAction({ action = "play" })
        videoPlaying = true
    end
end, false)

RegisterCommand('injpip', function()
    isPipMode = not isPipMode
    currentPos = isPipMode and posPip or posFull
    
    -- If in Macho Executor environment, we can inject JS to scale it
    if MachoSendDuiMessage then
        local css = ""
        if isPipMode then
            css = ".player-container { width: 90%; height: 90%; transform: translate(-50%, -50%); }"
        else
            css = ".player-container { width: 100%; height: 100%; max-width: 100%; max-height: 100%; border-radius: 0; }"
        end
        local injectCode = [[
            var style = document.getElementById('pipScaleStyle') || document.createElement('style');
            style.id = 'pipScaleStyle';
            style.innerHTML = `]] .. css .. [[`;
            document.head.appendChild(style);
        ]]
        SendDuiAction({ action = "executeJS", code = injectCode })
    end
end, false)

-- Register clean up on script stops
AddEventHandler('onResourceStop', function(res)
    if res == GetCurrentResourceName() then
        CloseVideoPlayer()
    end
end)
