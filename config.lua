Config = {}
Config.Keybind = 0x3C0A40F2 -- F6
Config.KeybindJS = "F6"

Config.Framework = "vorp" -- "vorp" or "standalone"

Config.MenuItems = {
    {
        id = 'general',
        title = 'General',
        image = 'wheel.png',
        items = {
            {
                id = 'emote',
                title = 'Emotes',
                icon = "face-smile",
                type = 'command',
                event = 'emotemenu',
                shouldClose = true,
            },
        }
    },
    {
        id = 'character',
        title = 'Character',
        image = 'cowboy.png',
        items = {
            {
                id = 'checkgun',
                title = 'Inspect Gun',
                icon = "gun",
                type = 'command',
                event = 'checkgun',
                shouldClose = true,
            },
            {
                id = 'mail',
                title = 'Mail',
                icon = "envelope-open",
                type = 'command',
                event = 'mail',
                shouldClose = true,
            },
            {
                id = 'jobmenu',
                title = 'Jobs',
                icon = "briefcase",
                type = 'command',
                event = 'jobmenu',
                shouldClose = true,
            },
            {
                id = 'walk',
                title = 'Walks',
                icon = 'person-walking',
                items = {
                    {
                        id = 'MP_Style_Casual',
                        title = 'Casual',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'ez_radialmenu:client:walkanim',
                        shouldClose = true
                    },
                    {
                        id = 'MP_Style_Crazy',
                        title = 'Crazy',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'ez_radialmenu:client:walkanim',
                        shouldClose = true
                    },
                    {
                        id = 'MP_Style_drunk',
                        title = 'Drunk',
                        icon = 'beer-mug-empty',
                        type = 'client',
                        event = 'ez_radialmenu:client:walkanim',
                        shouldClose = true
                    },
                    {
                        id = 'MP_Style_EasyRider',
                        title = 'Easy Rider',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'ez_radialmenu:client:walkanim',
                        shouldClose = true
                    },
                    {
                        id = 'MP_Style_Flamboyant',
                        title = 'Flamboyant',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'ez_radialmenu:client:walkanim',
                        shouldClose = true
                    },
                    {
                        id = 'MP_Style_Greenhorn',
                        title = 'Greenhorn',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'ez_radialmenu:client:walkanim',
                        shouldClose = true
                    },
                    {
                        id = 'MP_Style_Gunslinger',
                        title = 'Gunslinger',
                        icon = 'gun',
                        type = 'client',
                        event = 'ez_radialmenu:client:walkanim',
                        shouldClose = true
                    },
                    {
                        id = 'MP_Style_inquisitive',
                        title = 'Inquisitive',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'ez_radialmenu:client:walkanim',
                        shouldClose = true
                    },
                    {
                        id = 'MP_Style_Refined',
                        title = 'Refined',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'ez_radialmenu:client:walkanim',
                        shouldClose = true
                    },
                    {
                        id = 'MP_Style_SilentType',
                        title = 'Silent Type',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'ez_radialmenu:client:walkanim',
                        shouldClose = true
                    },
                    {
                        id = 'MP_Style_Veteran',
                        title = 'Veteran',
                        icon = 'person-walking-with-cane',
                        type = 'client',
                        event = 'ez_radialmenu:client:walkanim',
                        shouldClose = true
                    }
                }
            },
            {
                id = 'clothesmenu',
                title = 'Clothing',
                icon = 'shirt',
                items = {
                    {
                        id = 'hat',
                        title = 'Hat',
                        image = "cowboy-hat.png",
                        type = 'command',
                        event = 'hat',
                        shouldClose = false
                    },
                    {
                        id = 'Mask',
                        title = 'Mask',
                        icon = 'masks-theater',
                        type = 'command',
                        event = 'mask',
                        shouldClose = false
                    },
                    {
                        id = 'EyeWear',
                        title = 'Glasses',
                        icon = 'glasses',
                        type = 'command',
                        event = 'EyeWear',
                        shouldClose = false
                    },
                    {
                        id = 'NeckWear',
                        title = 'Neck Wear',
                        icon = 'user',
                        type = 'command',
                        event = 'NeckWear',
                        shouldClose = false
                    },
                    {
                        id = 'Gloves',
                        title = 'Gloves',
                        icon = 'mitten',
                        type = 'command',
                        event = 'glove',
                        shouldClose = false
                    },
                    {
                        id = 'Bracelet',
                        title = 'Bracelet',
                        icon = 'user',
                        type = 'command',
                        event = 'bracelet',
                        shouldClose = false
                    },
                    {
                        id = 'more1',
                        title = '...',
                        icon = 'arrow-right', 
                        items = {
                            {
                                id = 'Vest',
                                title = 'Vest',
                                icon = 'vest',
                                type = 'command',
                                event = 'Vest',
                                shouldClose = false
                            },
                            {
                                id = 'CoatClosed',
                                title = 'Coat Closed',
                                image = 'coat.png',
                                type = 'command',
                                event = 'ccoat',
                                shouldClose = false
                            },
                            {
                                id = 'Coat',
                                title = 'Coat',
                                image = 'coat.png',
                                type = 'command',
                                event = 'Coat',
                                shouldClose = false
                            },
                            {
                                id = 'Shirt',
                                title = 'Shirt',
                                image = 'shirt.png',
                                type = 'command',
                                event = 'Shirt',
                                shouldClose = false
                            },
                            {
                                id = 'Poncho',
                                title = 'Poncho',
                                image = 'poncho.png',
                                type = 'command',
                                event = 'Poncho',
                                shouldClose = false
                            },
                            {
                                id = 'Cloak',
                                title = 'Cloak',
                                image = 'cape.png',
                                type = 'command',
                                event = 'cloak',
                                shouldClose = false
                            },
                            {
                                id = 'more2',
                                title = '...',
                                icon = 'arrow-right', 
                                items = {
                                    {
                                        id = 'Pant',
                                        title = 'Pant',
                                        image = 'trousers.png',
                                        type = 'command',
                                        event = 'pant',
                                        shouldClose = false
                                    },
                                    {
                                        id = 'Skirt',
                                        title = 'Skirt',
                                        image = 'skirt.png',
                                        type = 'command',
                                        event = 'skirt',
                                        shouldClose = false
                                    },
                                    {
                                        id = 'Dress',
                                        title = 'Dress',
                                        image = 'dress.png',
                                        type = 'command',
                                        event = 'Dress',
                                        shouldClose = false
                                    },
                                    {
                                        id = 'Boots',
                                        title = 'Boots',
                                        image = 'cowboy-boot.png',
                                        type = 'command',
                                        event = 'boots',
                                        shouldClose = false
                                    },
                                    {
                                        id = 'more3',
                                        title = '...',
                                        icon = 'arrow-right', 
                                        items = {
                                            {
                                                id = 'Undress',
                                                title = 'Undress All',
                                                image = 'nude.png',
                                                type = 'command',
                                                event = 'Undress',
                                                shouldClose = false
                                            },
                                            {
                                                id = 'Dress',
                                                title = 'Dress All',
                                                image = 'shirt.png',
                                                type = 'command',
                                                event = 'Dress',
                                                shouldClose = false
                                            },
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    },
    {
        id = 'map',
        title = 'Map',
        image = "signs.png",
        items = {
            {
                id = 'bank',
                title = 'Bank',
                image = "bank.png",
                type = 'map',
                shouldClose = true
            },
            {
                id = 'barber',
                title = 'Barber',
                image = "barber.png",
                type = 'map',
                shouldClose = true
            },
            {
                id = 'clothes',
                title = 'Clothes Shop',
                image = "shirt.png",
                type = 'map',
                shouldClose = true
            },
            {
                id = 'stable',
                title = 'Stables',
                image = "stable.png",
                type = 'map',
                shouldClose = true
            },
            {
                id = 'fasttravel',
                title = 'Fast Travel',
                image = "train.png",
                type = 'map',
                shouldClose = true
            },
            {
                id = 'police',
                title = 'Sheriffs',
                image = "sheriff.png",
                type = 'map',
                shouldClose = true
            },
            {
                id = 'doctor',
                title = 'Doctor',
                image = "doctor.png",
                type = 'map',
                shouldClose = true
            },
            {
                id = 'store',
                title = 'General Store',
                image = "groceries.png",
                type = 'map',
                shouldClose = true
            },
        }
    },
}


-- Adding waypoint, Change if you want coords = {x = 0, y = 0, z = 0}
Config.AddWaypoint = function (coords)
    blip = false
    SetWaypointOff()
    Wait(100)
    ClearGpsMultiRoute()
    StartGpsMultiRoute(`COLOR_RED`, true, true)
    AddPointToGpsMultiRoute(coords.x, coords.y, coords.z)
    SetGpsMultiRouteRender(true)
    blip = true
    Citizen.CreateThread(function()
        while blip do
            Wait(0)
            local distance = #(GetEntityCoords(PlayerPedId()) - coords)
            if distance < 5 or IsWaypointActive() then
                blip = false
                ClearGpsMultiRoute()
                SetGpsMultiRouteRender(false)
            end
        end
    end)
end

Config.Locations = {
    ["store"] = {

    },
    ["doctor"] = {
        vector3(-283.15, 803.36, 119.38), -- Valentine
        vector3(-1802.51, -428.41, 158.78), -- Strawberry
        vector3(2721.29, -1233.11, 50.37), -- Saint Denis
        vector3(1368.9, -1310.62, 77.94), -- Rhodes
        vector3(-3661.3, -2600.93, -13.29) -- Armadillo
    },
    ["police"] = {
        vector3(-278.17, 814.88, 119.28), -- Valentine
        vector3(-1805.13, -355.05, 164.14), -- Strawberry
        vector3(-752.53, -1266.1, 43.43), -- Blackwater
        vector3(2510.0, -1318.0, 48.53), -- Saint Denis
        vector3(1354.9, -1306.85, 76.94), -- Rhodes
        vector3(-5531.39, -2935.31, -1.91), -- Tumbleweed
        vector3(2916.59, 1317.09, 44.35), -- Annesburg
        vector3(-3610.4, -2599.16, -13.88) -- Armadillo
    },
    ["fasttravel"] = {
        vector3(-324.71, 576.36, 100.66), -- Valentine
        vector3(-1212.55, -1217.68, 75.52), -- Blackwater
        vector3(-1970.4, -371.71, 175.75), -- Strawberry
        vector3(2577.93, -1202.89, 55.92), -- Saint Denis
        vector3(1368.16, -1328.63, 77.53), -- Rhodes
        vector3(2491.54, 1403.84, 97.6), -- Annesburg
        vector3(2591.37, 463.22, 66.31), -- Van Horn
        vector3(-5501.38, -2720.85, -7.65), -- Tumbleweed
        vector3(-2931.64, -2905.09, 60.73), -- Armadillo
    },
    ["stable"] = {
        vector3(-367.73, 787.72, 116.26), -- Valentine
        vector3(-873.167, -1366.040, 43.531), -- Blackwater
        vector3(2503.153, -1442.725, 46.312), -- St Denis
        vector3(-2554.15, 399.35, 148.15), -- Big Valley
        vector3(1432.61, -1294.74, 77.82), -- Rhodes
        vector3(1861.60, -1368.07, 42.25), -- Caliga
        vector3(-2418.36, -2392.81, 61.17), -- Macfarlanes
        vector3(-5521.27, -3044.57, -2.38), -- Tumbleweed
        vector3(-5204.63, -2149.50, 12.12), -- Rathskeller
        vector3(-1813.69, -563.77, 156.08), -- Strawberry
        vector3(-3701.50, -2571.08, -13.71), -- Armadillo
        vector3(965.5, -1831.21, 46.52), -- Bluesprivate
        vector3(2970.55, 796.35, 51.40), -- Van horn
        vector3(1384.24, 352.22, 87.58), -- Emerald
        vector3(478.64, 2220.88, 247.04), -- Wapiti
        vector3(-1335.81, 2398.15, 307.10), -- Coulter
    },
    ["clothes"] = {
        vector3(-326.1, 774.48, 117.46), -- Valentine
        vector3(-761.61, -1291.98, 43.85), -- Blackwater
        vector3(2552.4, -1165.22, 53.73), -- Saint Denis
        vector3(1324.66, -1291.59, 77.08), -- Rhodes
        vector3(-1791.07, -392.71, 160.29), -- Strawberry
        vector3(-5483.24, -2933.42, -0.35), -- Tumbleweed
        vector3(-3686.21, -2626.6, -13.38), -- Armadillo
    },
    ["barber"] = {
        vector3(-307.51, 813.96, 118.99), -- Valentine
        vector3(-814.915, -1367.89, 43.75), -- Blackwater
        vector3(2655.21, -1179.9, 53.27), -- Saint Denis
        vector3(2924.3, 1343.7, 44.4), -- Annsberg
        vector3(-1810.92, -372.15, 162.89), -- Strawberry
        vector3(-5493.4, -2940.7, -0.46), -- Tumbleweed
        vector3(-3684.22, -2621.05, -13.44), -- Armadillo
    },
    ["bank"] = {
        vector3(-308.50, 776.24, 118.75), -- Valentine
        vector3(-813.18, -1277.60, 43.68), -- Blackwater
        vector3(2644.08, -1292.21, 52.29), -- Saint Denis
        vector3(1294.14, -1303.06, 77.04), -- Rhodes
    }
}

Config.JobInteractions = {
    ['doctor'] = {
        image = 'doctor.png',
        items = {
            {
                id = 'revive',
                title = 'Revive',
                icon = 'suitcase-medical',
                type = 'client',
                event = 'entereventhere',
                shouldClose = false
            }, {
                id = 'heal',
                title = 'Heal',
                icon = 'hand-holding-heart',
                type = 'client',
                event = 'entereventhere',
                shouldClose = true
            }
        }
    },
    ['police'] = {
        image = 'sheriff.png',
        items = {
            {
                id = 'escort',
                title = 'Escort',
                icon = 'user-group',
                type = 'client',
                event = 'police:client:SendPoliceEmergencyAlert',
                shouldClose = true
            }, {
                id = 'searchplayer',
                title = 'Search',
                icon = 'magnifying-glass',
                type = 'client',
                event = 'qb-tunerchip:client:TuneStatus',
                shouldClose = true
            }
        }
    },
}

Config.Walks = {
    "MP_Style_Casual",
    "MP_Style_Crazy",
    "MP_Style_drunk",
    "MP_Style_EasyRider",
    "MP_Style_Flamboyant",
    "MP_Style_Greenhorn",
    "MP_Style_Gunslinger",
    "MP_Style_inquisitive",
    "MP_Style_Refined",
    "MP_Style_SilentType",
    "MP_Style_Veteran",
}
