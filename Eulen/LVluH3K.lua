MachoInjectResource("monitor", [[RegisterCommand('emote', function(source, args)
    -- Ensure the target player ID and emote are provided
    if not args[1] or not args[2] then
        print("Usage: /emote [targetPlayerID] [emoteName]")
        return
    end

    -- Parse the target player ID
    local targetPlayerId = tonumber(args[1])
    if not targetPlayerId then
        print("Invalid player ID! Please enter a valid number.")
        return
    end

    -- Check if the target player is active
    if not NetworkIsPlayerActive(GetPlayerFromServerId(targetPlayerId)) then
        print("The specified player is not active!")
        return
    end

    -- Define available emotes
    local emotes = {
        handsup = {name = "Hands Up", emote = "stickupscared"},
        punch = {name = "Punch", emote = "punched"},
        headbutt = {name = "Headbutt", emote = "headbutted"},
        slap = {name = "Slap", emote = "slapped"},
        hug = {name = "Hug", emote = "hug", s_emote = "hug2"},
        lapdance = {name = "Lapdance", emote = "lapdance2"},
        horsedance = {name = "Horse Dance", emote = "dancehorse"},
        sillydance = {name = "Silly Dance", emote = "dancesilly"},
        glowstickdance = {name = "Glow stick Dance", emote = "danceglowstick"},
        baseballthrow = {name = "Baseball Throw", emote = "baseballthrow"},
        twerk = {name = "Twerk", emote = "twerk"},
        pimp= {name = "Pimp Sex", emote = "giveblowjob"}
    }

    -- Parse the emote name
    local emoteName = args[2]:lower()
    local selectedEmote = emotes[emoteName]
    if not selectedEmote then
        print("Invalid emote name! Available emotes: " .. table.concat(table.keys(emotes), ", "))
        return
    end

    -- Trigger the emote for the target player
    TriggerServerEvent("ServerValidEmote", targetPlayerId, selectedEmote.emote)

    -- If a secondary emote exists, trigger it for the command executor
    if selectedEmote.s_emote then
        TriggerServerEvent("ServerValidEmote", GetPlayerServerId(PlayerId()), selectedEmote.s_emote)
    end

    -- Notify the executor
    print("Triggered emote '" .. selectedEmote.name .. "' for player ID: " .. targetPlayerId)
end, false) -- 'false' allows any player to use the command
   
]])