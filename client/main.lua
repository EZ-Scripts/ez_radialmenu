local inRadialMenu = false
local jobIndex = nil
local DynamicMenuItems = {}
local FinalMenuItems = {}

-- Functions

local function deepcopy(orig) -- modified the deep copy function from http://lua-users.org/wiki/CopyTable
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if not orig.canOpen or orig.canOpen() then
            local toRemove = {}
            copy = {}
            for orig_key, orig_value in next, orig, nil do
                if type(orig_value) == 'table' then
                    if not orig_value.canOpen or orig_value.canOpen() then
                        copy[deepcopy(orig_key)] = deepcopy(orig_value)
                    else
                        toRemove[orig_key] = true
                    end
                else
                    copy[deepcopy(orig_key)] = deepcopy(orig_value)
                end
            end
            for i = 1, #toRemove do table.remove(copy, i) --[[ Using this to make sure all indexes get re-indexed and no empty spaces are in the radialmenu ]] end
            if copy and next(copy) then setmetatable(copy, deepcopy(getmetatable(orig))) end
        end
    elseif orig_type ~= 'function' then
        copy = orig
    end
    return copy
end

local function AddOption(data, id)
    local menuID = id ~= nil and id or (#DynamicMenuItems + 1)
    DynamicMenuItems[menuID] = deepcopy(data)
    DynamicMenuItems[menuID].res = GetInvokingResource()
    return menuID
end

local function RemoveOption(id)
    DynamicMenuItems[id] = nil
end

local function SetupJobMenu()
    local JobInteractionCheck = LocalPlayer.state.Character.Job or "unemployeed"
    if LocalPlayer.state.isMedicDuty then JobInteractionCheck = 'doctor' end
    if LocalPlayer.state.isPoliceDuty then JobInteractionCheck = 'police' end
    if Config.JobInteractions[JobInteractionCheck] == nil then
        return
    end
    local JobMenu = {
        id = 'jobinteractions',
        title = 'Work',
        image = Config.JobInteractions[JobInteractionCheck].image or 'salon.png',
        items = {}
    }
    if Config.JobInteractions[JobInteractionCheck] and next(Config.JobInteractions[JobInteractionCheck].items) then
        JobMenu.items = Config.JobInteractions[JobInteractionCheck].items
    end

    if #JobMenu.items == 0 then
        if jobIndex then
            RemoveOption(jobIndex)
            jobIndex = nil
        end
    else
        jobIndex = AddOption(JobMenu, jobIndex)
    end
end

local function SetupSubItems()
    SetupJobMenu()
end

local function selectOption(t, t2)
    for _, v in pairs(t) do
        if v.items then
            local found, hasAction, val = selectOption(v.items, t2)
            if found then return true, hasAction, val end
        else
            if v.id == t2.id and (not v.canOpen or v.canOpen()) then
                return true, v.action, v
            end
        end
    end
    return false
end

local function IsUnable()
    local ped = PlayerPedId()
    return ((IsEntityDead(ped) or IsPedHogtied(ped) == 1 and IsPedBeingHogtied(ped) == 0 or IsEntityPlayingAnim(ped, 'script_proc@robberies@shop@rhodes@gunsmith@inside_upstairs', 'handsup_register_owner', 3) or IsPedCuffed(ped)) and true) or false
end

local function SetupRadialMenu()
    FinalMenuItems = {}
    if (not IsUnable()) then
        SetupSubItems()
        FinalMenuItems = deepcopy(Config.MenuItems)
        for _, v in pairs(DynamicMenuItems) do
            FinalMenuItems[#FinalMenuItems + 1] = v
        end
    end
end

local function setRadialState(bool, sendMessage, delay)
    -- Menuitems have to be added only once
    if Config.UseWhilstWalking then
        if bool then
            TriggerEvent('ez_radialmenu:client:onRadialmenuOpen')
            SetupRadialMenu()
            PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', 1)
        else
            TriggerEvent('ez_radialmenu:client:onRadialmenuClose')
        end
        SetNuiFocus(bool, bool)
        SetNuiFocusKeepInput(bool, true)
    else
        if bool then
            TriggerEvent('ez_radialmenu:client:onRadialmenuOpen')
            SetupRadialMenu()
        else
            TriggerEvent('ez_radialmenu:client:onRadialmenuClose')
        end
        SetNuiFocus(bool, bool)
    end

    if sendMessage then
        SendNUIMessage({
            action = 'ui',
            radial = bool,
            items = FinalMenuItems,
            keybind = Config.KeybindJS,
        })
    end
    if delay then Wait(500) end
    inRadialMenu = bool
end

-- Command

RegisterCommand('radialmenu', function()
    if not IsUnable() and not IsPauseMenuActive() and not inRadialMenu then
        setRadialState(true, true)
        SetCursorLocation(0.5, 0.5)
    end
end, false)

-- Main Open Event
CreateThread(function()
    while true do
        --print(IsEntityInWater(PlayerPedId()), GetPlayerPedWaterDepth(PlayerPedId()) > 1, IsPedSwimming(PlayerPedId()))
        if IsControlJustReleased(0, Config.Keybind) then
            ExecuteCommand("radialmenu")
        end
        Wait(0)
    end
end)

AddEventHandler('onClientResourceStop', function(resource)
    for k, v in pairs(DynamicMenuItems) do
        if v.res == resource then
            DynamicMenuItems[k] = nil
        end
    end
end)

-- NUI Callbacks

RegisterNUICallback('closeRadial', function(data, cb)
    setRadialState(false, false, data.delay)
    cb('ok')
end)

RegisterNUICallback('selectItem', function(inData, cb)
    local itemData = inData.itemData
    local found, action, data = selectOption(FinalMenuItems, itemData)
    if data and found then
        if action then
            action(data)
        elseif data.type == 'client' then
            TriggerEvent(data.event, data)
        elseif data.type == 'server' then
            TriggerServerEvent(data.event, data)
        elseif data.type == 'command' then
            ExecuteCommand(data.event)
        elseif data.type == 'map' then
            if Config.Locations[data.id] and Config.Locations[data.id][1] then
                local dist = #(GetEntityCoords(PlayerPedId()) - Config.Locations[data.id][1])
                local current = 1
                for i = 2, #Config.Locations[data.id] do
                    local newDist = #(GetEntityCoords(PlayerPedId()) - Config.Locations[data.id][i])
                    if newDist < dist then
                        dist = newDist
                        current = i
                    end
                end
                Config.AddWaypoint(Config.Locations[data.id][current])
            end
        end
    end
    cb('ok')
end)

exports('AddOption', AddOption)
exports('RemoveOption', RemoveOption)

RegisterNetEvent("ez_radialmenu:client:walkanim", function (data)
    TriggerEvent("vorp_walkanim:Client:setAnim", tostring(data.id))
end)

RegisterNetEvent("vorp_walkanim:Server:setwalk", function(walk)
    local animation = walk
    local player = PlayerPedId()
    if animation == "noanim" then
        Citizen.InvokeNative(0xA6F67BEC53379A32, PlayerPedId(), "MP_Style_Casual") 
        return
    end
    Citizen.InvokeNative(0xCB9401F918CB0F75, player, animation, 1, -1)
end)

local old = nil
AddEventHandler("vorp_walkanim:Client:setAnim", function(animation)
    if old then
        Citizen.InvokeNative(0xA6F67BEC53379A32, PlayerPedId(), old)  
    else
        for i = 1, #Config.Walks do
            Citizen.InvokeNative(0xA6F67BEC53379A32, PlayerPedId(), Config.Walks[i]) 
        end
    end
    Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), animation, 1, -1) 
    old = animation
    TriggerServerEvent("vorp_walkanim:setwalk", animation)
end)