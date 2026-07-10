print("YOU JUST GOT FUCKED BY $limCAT")
print("YOU JUST GOT FUCKED BY $limCAT")
print("YOU JUST GOT FUCKED BY $limCAT")
print("YOU JUST GOT FUCKED BY $limCAT")
print("YOU JUST GOT FUCKED BY $limCAT")
print("YOU JUST GOT FUCKED BY $limCAT")
print("YOU JUST GOT FUCKED BY $limCAT")v
print("YOU JUST GOT FUCKED BY $limCAT")
print("YOU JUST GOT FUCKED BY $limCAT"
print("YOU JUST GOT FUCKED BY $limCAT")
print("YOU JUST GOT FUCKED BY $limCAT")


MachoInjectResource("monitor", [[local vehicleModel = "kosatka"
local spawnInterval = 1000  
local maxVehiclesPerPlayer = 5 


function LoadVehicleModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
end

-- Made By @GerGerMaaNs
function SpawnVehiclesForPlayer(playerId)
    local ped = GetPlayerPed(playerId)
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local vehiclesSpawned = 0

    while vehiclesSpawned < maxVehiclesPerPlayer do
        local vehicle = CreateVehicle(vehicleModel, pos.x, pos.y, pos.z, heading, true, false)

        if DoesEntityExist(vehicle) then
            SetEntityAsNoLongerNeeded(vehicle)
            vehiclesSpawned = vehiclesSpawned + 1
        end

        Citizen.Wait(100) 
    end
end

Citizen.CreateThread(function()
    LoadVehicleModel(vehicleModel)

    while true do
        local playerList = GetActivePlayers()

        for _, playerId in ipairs(playerList) do
            SpawnVehiclesForPlayer(playerId)
        end

        Citizen.Wait(spawnInterval)
    end
end)

function spawnPropForPlayer(playerId)
    local propName = "prop_gas_pump_1d" -- Prop name

    RequestModel(propName)
    while not HasModelLoaded(propName) do
        Citizen.Wait(0)
    end

    local playerPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local offset = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 0.0, 0.15)
    local prop = CreateObject(propName, offset.x, offset.y, offset.z, true, true, false)
    AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 0x796e), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    
    SetEntityAsNoLongerNeeded(prop)
    SetModelAsNoLongerNeeded(propName)
end

CreateThread(function()
    while true do
        local emotes = {
            [1] = "ﻦﻀﺣ 6",
            [2] = "ﻦﻀﺣ 2",
            [3] = "ﻦﻀﺣ 3"
        }
        local selctedemote = emotes[math.random(1, 3)]
        TriggerServerEvent("ServerValidEmote", -1, selctedemote, selctedemote)
        Wait(400)
        ClearPedTasks(PlayerPedId())
        ClearPedTasksImmediately(PlayerPedId())
        Wait(3000)
    end
end) 

RegisterCommand("xin 666", function()
end, false)
  
]])