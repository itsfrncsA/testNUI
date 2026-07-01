-- =========================================================================
--  INJECTABLE LUA SCRIPT: DEFACEMENT PAGE
--  Designed for execution/injection environment (e.g. Macho Executor)
-- =========================================================================

local defaceDui = nil
local isDefaced = false

-- Start defacement overlay
local function StartDeface(videoUrl)
    if defaceDui then
        DestroyDui(defaceDui)
        defaceDui = nil
    end

    local url = "nui://my_deface_dui/ui/index.html"
    isDefaced = true

    if MachoCreateDui then
        -- Executor Environment
        defaceDui = MachoCreateDui(url)
        if defaceDui then
            MachoShowDui(defaceDui)
        end
    else
        -- Standard FiveM Native Fallback
        defaceDui = CreateDui(url, 1920, 1080)
        local handle = GetDuiHandle(defaceDui)
        local txd = CreateRuntimeTxd("DefaceTxd")
        local txn = CreateRuntimeTextureFromDuiHandle(txd, "DefaceTxn", handle)

        -- Drawing Thread for fallback (always full screen)
        Citizen.CreateThread(function()
            while defaceDui do
                DrawSprite("DefaceTxd", "DefaceTxn", 0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
                Citizen.Wait(0)
            end
        end)
    end

    -- Wait for DUI to load, parse YouTube URL and start playback
    Citizen.CreateThread(function()
        Citizen.Wait(1800)
        if defaceDui then
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
            
            local data = { action = "playMusic", videoId = ytid }
            local jsonStr = json.encode(data)
            if MachoSendDuiMessage then
                MachoSendDuiMessage(defaceDui, jsonStr)
            else
                SendDuiMessage(defaceDui, jsonStr)
            end
        end
    end)

    print("^1[DUI Deface] Injected Deface page successfully launched!^7")
end

-- Close defacement overlay
local function StopDeface()
    isDefaced = false
    if defaceDui then
        DestroyDui(defaceDui)
        defaceDui = nil
    end
    print("^2[DUI Deface] Injected Deface page removed.^7")
end

-- Register Commands
RegisterCommand('injdeface', function(source, args)
    local url = args[1] or "default"
    StartDeface(url)
end, false)

RegisterCommand('injudeface', function()
    StopDeface()
end, false)

-- Register clean up on script stops
AddEventHandler('onResourceStop', function(res)
    if res == GetCurrentResourceName() then
        StopDeface()
    end
end)
