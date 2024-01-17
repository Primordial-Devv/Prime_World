Config = {}
Locales = {}

--[[
    The first thing will be to choose our main language, here you can choose
    between the default languages that you will find within locales/*,
    if yours is not there, feel free to create it!
]]

local esxHas = GetResourceState('es_extended') == 'started'
local qbHas = GetResourceState('qb-core') == 'started'

Config.Framework = esxHas and 'esx' or qbHas and 'qb' or 'esx'

Config.Language = 'en'

--[[
    Shop system based on qb-shops!
    Here you have a small configuration for the details of your stores,
    remember that UseTrucketJob is exclusive for qb-core!

    For the firearms license, you must use the item weaponlicense.
]]

Config.UseTruckerJob = false                            -- true = The shops stock is based on when truckers refill it | false = shop inventory never runs out (ONLY FOR QB)
Config.FirearmsLicenseCheck = false                     -- Whether a arms dealer checks for a firearms license (ONLY FOR QB)
Config.ShopsInvJsonFile = './json/shops-inventory.json' -- json file location (ONLY FOR QB)

--[[
    Part of esx_licenses, in this case, we can make the licenses
    functional through esx_licenses in case of using true, if you
    use false, then the conventional form of items will be used.

    Remember to put the license name in Config.Locations:
    ['requiredLicense'] = nil -- or example 'itemname' or 'license name in esx_license case)'
]]

Config.ESXLicense = false                                   -- Do you want to use esx_license? if this is the case use true/false (only for ESX)
Config.esx_licensecheckLicense = 'esx_license:checkLicense' -- esx_license event name, edit it if you modify it in your script

--[[
    You can use the following targets by default:
        'qb-target'
        'ox_target'

        'none'
]]

Config.UseTarget = 'none' -- Choose between 'qb-target', 'ox_target' or 'none'

--[[
    Stashing system!
    Here you can add your stashes, their blips or even add a license to them!

    Remember that the licenses are an item, so you must put the name of said item!
    Example:
        ['requiredLicense'] = 'weapon_license' -- item or nil
]]

Config.Stashes = {
    [1] = {
        ['coords'] = vector3(456.672516, -983.195618, 30.678345),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 50000,
            slots = 15
        },
        ['blip'] = {
            name = 'Police Stash',
            coords = vector3(456.672516, -983.195618, 30.678345),
            sprite = 1,
            color = 38,
            size = 0.5
        },
        ['label'] = 'police_stash',
        ['requiredJobs'] = { 'police' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = { 2, 3, 4 },
        ['requiredLicense'] = nil,       -- nil or example 'itemname',
        ['personal'] = false
    },
    [2] = {
        ['coords'] = vector3(306.303284, -1457.709839, 29.953857),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 9500,
            slots = 15
        },
        ['blip'] = nil,
        ['label'] = 'doctor_stash',
        ['requiredJobs'] = { 'ambulance' }, -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil,       -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil,          -- nil or example 'itemname',
        ['personal'] = false
    },
    [3] = {
        ['coords'] = vector3(237.481323, -1354.747192, 31.032227),
        ['targetLabel'] = 'Open Stash',
        ['size'] = {
            weight = 10000,
            slots = 50
        },
        ['blip'] = nil,
        ['label'] = 'mysterious_shed',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil,    -- nil or example 'itemname',
        ['personal'] = true
    }
}

--[[
    Store setup!
    Remember to add the items correctly, checking that they exist
    within your qb-core or your qs-inventory/shared/*.

    Below you can add these items to the desired stores.

    Remember that the licenses are an item, so you must put the name of said item!
    Example:
        ['requiredLicense'] = 'weapon_license' -- item or nil
]]

Config.Products = {
    ['normal'] = {
        [1] = {
            name = 'micard_psa',
            price = 2,
            amount = 50,
            info = {},
            type = 'item',
            slot = 1,
        },
        [2] = {
            name = 'water_bottle',
            price = 2,
            amount = 50,
            info = {},
            type = 'item',
            slot = 2,
        },
        [3] = {
            name = 'kurkakola',
            price = 2,
            amount = 50,
            info = {},
            type = 'item',
            slot = 3,
        },
        [4] = {
            name = 'twerks_candy',
            price = 2,
            amount = 50,
            info = {},
            type = 'item',
            slot = 4,
        },
        [5] = {
            name = 'snikkel_candy',
            price = 2,
            amount = 50,
            info = {},
            type = 'item',
            slot = 5,
        },
        [6] = {
            name = 'sandwich',
            price = 2,
            amount = 50,
            info = {},
            type = 'item',
            slot = 6,
        },
        [7] = {
            name = 'beer',
            price = 7,
            amount = 50,
            info = {},
            type = 'item',
            slot = 7,
        },
        [8] = {
            name = 'whiskey',
            price = 10,
            amount = 50,
            info = {},
            type = 'item',
            slot = 8,
        },
        [9] = {
            name = 'vodka',
            price = 12,
            amount = 50,
            info = {},
            type = 'item',
            slot = 9,
        },
        [10] = {
            name = 'bandage',
            price = 100,
            amount = 50,
            info = {},
            type = 'item',
            slot = 10,
        },
        [11] = {
            name = 'lighter',
            price = 2,
            amount = 50,
            info = {},
            type = 'item',
            slot = 11,
        },
        [12] = {
            name = 'rolling_paper',
            price = 2,
            amount = 5000,
            info = {},
            type = 'item',
            slot = 12,
        },
    },
    ['liquor'] = {
        [1] = {
            name = 'beer',
            price = 7,
            amount = 50,
            info = {},
            type = 'item',
            slot = 1,
        },
        [2] = {
            name = 'whiskey',
            price = 10,
            amount = 50,
            info = {},
            type = 'item',
            slot = 2,
        },
        [3] = {
            name = 'vodka',
            price = 12,
            amount = 50,
            info = {},
            type = 'item',
            slot = 3,
        },
    },
    ['hardware'] = {
        [1] = {
            name = 'lockpick',
            price = 200,
            amount = 50,
            info = {},
            type = 'item',
            slot = 1,
        },
        [2] = {
            name = 'weapon_wrench',
            price = 250,
            amount = 250,
            info = {},
            type = 'item',
            slot = 2,
        },
        [3] = {
            name = 'weapon_hammer',
            price = 250,
            amount = 250,
            info = {},
            type = 'item',
            slot = 3,
        },
        [4] = {
            name = 'repairkit',
            price = 250,
            amount = 50,
            info = {},
            type = 'item',
            slot = 4,
            requiredJob = { 'mechanic', 'police' }
        },
        [5] = {
            name = 'screwdriverset',
            price = 350,
            amount = 50,
            info = {},
            type = 'item',
            slot = 5,
        },
        [6] = {
            name = 'phone',
            price = 850,
            amount = 50,
            info = {},
            type = 'item',
            slot = 6,
        },
        [7] = {
            name = 'radio',
            price = 250,
            amount = 50,
            info = {},
            type = 'item',
            slot = 7,
        },
        [8] = {
            name = 'binoculars',
            price = 50,
            amount = 50,
            info = {},
            type = 'item',
            slot = 8,
        },
        [9] = {
            name = 'firework1',
            price = 50,
            amount = 50,
            info = {},
            type = 'item',
            slot = 9,
        },
        [10] = {
            name = 'firework2',
            price = 50,
            amount = 50,
            info = {},
            type = 'item',
            slot = 10,
        },
        [11] = {
            name = 'firework3',
            price = 50,
            amount = 50,
            info = {},
            type = 'item',
            slot = 11,
        },
        [12] = {
            name = 'firework4',
            price = 50,
            amount = 50,
            info = {},
            type = 'item',
            slot = 12,
        },
        [13] = {
            name = 'fitbit',
            price = 400,
            amount = 150,
            info = {},
            type = 'item',
            slot = 13,
        },
        [14] = {
            name = 'cleaningkit',
            price = 150,
            amount = 150,
            info = {},
            type = 'item',
            slot = 14,
        },
        [15] = {
            name = 'advancedrepairkit',
            price = 500,
            amount = 50,
            info = {},
            type = 'item',
            slot = 15,
            requiredJob = { 'mechanic' }
        },
    },
    ['weedshop'] = {
        [1] = {
            name = 'joint',
            price = 10,
            amount = 50,
            info = {},
            type = 'item',
            slot = 1,
        },
        [2] = {
            name = 'weapon_poolcue',
            price = 100,
            amount = 50,
            info = {},
            type = 'item',
            slot = 2,
        },
        [3] = {
            name = 'weed_nutrition',
            price = 20,
            amount = 50,
            info = {},
            type = 'item',
            slot = 3,
        },
        [4] = {
            name = 'empty_weed_bag',
            price = 2,
            amount = 1000,
            info = {},
            type = 'item',
            slot = 4,
        },
        [5] = {
            name = 'rolling_paper',
            price = 2,
            amount = 1000,
            info = {},
            type = 'item',
            slot = 5,
        },
    },
    ['gearshop'] = {
        [1] = {
            name = 'diving_gear',
            price = 2500,
            amount = 10,
            info = {},
            type = 'item',
            slot = 1,
        },
        [2] = {
            name = 'jerry_can',
            price = 200,
            amount = 50,
            info = {},
            type = 'item',
            slot = 2,
        },
    },
    ['leisureshop'] = {
        [1] = {
            name = 'parachute',
            price = 2500,
            amount = 10,
            info = {},
            type = 'item',
            slot = 1,
        },
        [2] = {
            name = 'binoculars',
            price = 50,
            amount = 50,
            info = {},
            type = 'item',
            slot = 2,
        },
        [3] = {
            name = 'diving_gear',
            price = 2500,
            amount = 10,
            info = {},
            type = 'item',
            slot = 3,
        },
        [4] = {
            name = 'diving_fill',
            price = 500,
            amount = 10,
            info = {},
            type = 'item',
            slot = 4,
        },
    },
    ['weapons'] = {
        [1] = {
            name = 'weapon_knife',
            price = 250,
            amount = 250,
            info = {},
            type = 'item',
            slot = 1,
        },
        [2] = {
            name = 'weapon_bat',
            price = 250,
            amount = 250,
            info = {},
            type = 'item',
            slot = 2,
        },
        [3] = {
            name = 'weapon_hatchet',
            price = 250,
            amount = 250,
            info = {},
            type = 'item',
            slot = 3,
            requiredJob = { 'mechanic', 'police' }
        },
        [4] = {
            name = 'weapon_pistol',
            price = 2500,
            amount = 5,
            info = {},
            type = 'item',
            slot = 4,
            requiresLicense = true
        },
        [5] = {
            name = 'weapon_snspistol',
            price = 1500,
            amount = 5,
            info = {},
            type = 'item',
            slot = 5,
            requiresLicense = true
        },
        [6] = {
            name = 'weapon_vintagepistol',
            price = 4000,
            amount = 5,
            info = {},
            type = 'item',
            slot = 6,
            requiresLicense = true
        },
        [7] = {
            name = 'pistol_ammo',
            price = 250,
            amount = 250,
            info = {},
            type = 'item',
            slot = 7,
            requiresLicense = true
        },
    }
}

Config.Locations = {
    -- 24/7 Locations
    ['247supermarket'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(24.47, -1346.62, 29.5, 271.66),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(26.45, -1315.51, 29.62, 0.07),
        ['distance'] = 2.0,
        ['account'] = 'bank',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['247supermarket2'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(-3039.54, 584.38, 7.91, 17.27),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(-3047.95, 590.71, 7.62, 19.53),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['247supermarket3'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(-3242.97, 1000.01, 12.83, 357.57),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(-3245.76, 1005.25, 12.83, 269.45),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['247supermarket4'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(1728.07, 6415.63, 35.04, 242.95),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(1741.76, 6419.61, 35.04, 6.83),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['247supermarket5'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(1959.82, 3740.48, 32.34, 301.57),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(1963.81, 3750.09, 32.26, 302.46),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['247supermarket6'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(549.13, 2670.85, 42.16, 99.39),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(541.54, 2663.53, 42.17, 120.51),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['247supermarket7'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(2677.47, 3279.76, 55.24, 335.08),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(2662.19, 3264.95, 55.24, 168.55),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['247supermarket8'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(2556.66, 380.84, 108.62, 356.67),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(2553.24, 399.73, 108.56, 344.86),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['247supermarket9'] = {
        ['label'] = '24/7 Supermarket',
        ['coords'] = vector4(372.66, 326.98, 103.57, 253.73),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(379.97, 357.3, 102.56, 26.42),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    -- LTD Gasoline Locations
    ['ltdgasoline'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(-47.02, -1758.23, 29.42, 45.05),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(-40.51, -1747.45, 29.29, 326.39),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ltdgasoline2'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(-706.06, -913.97, 19.22, 88.04),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(-702.89, -917.44, 19.21, 181.96),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ltdgasoline3'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(-1820.02, 794.03, 138.09, 135.45),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(-1829.29, 801.49, 138.41, 41.39),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ltdgasoline4'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(1164.71, -322.94, 69.21, 101.72),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(1160.62, -312.06, 69.28, 3.77),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ltdgasoline5'] = {
        ['label'] = 'LTD Gasoline',
        ['coords'] = vector4(1697.87, 4922.96, 42.06, 324.71),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['normal'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(1702.68, 4917.28, 42.22, 139.27),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    -- Rob's Liquor Locations
    ['robsliquor'] = {
        ['label'] = "Rob's Liqour",
        ['coords'] = vector4(-1221.58, -908.15, 12.33, 35.49),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(-1226.92, -901.82, 12.28, 213.26),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['robsliquor2'] = {
        ['label'] = "Rob's Liqour",
        ['coords'] = vector4(-1486.59, -377.68, 40.16, 139.51),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(-1468.29, -387.61, 38.79, 220.13),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['robsliquor3'] = {
        ['label'] = "Rob's Liqour",
        ['coords'] = vector4(-2966.39, 391.42, 15.04, 87.48),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(-2961.49, 376.25, 15.02, 111.41),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['robsliquor4'] = {
        ['label'] = "Rob's Liqour",
        ['coords'] = vector4(1165.17, 2710.88, 38.16, 179.43),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(1194.52, 2722.21, 38.62, 9.37),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['robsliquor5'] = {
        ['label'] = "Rob's Liqour",
        ['coords'] = vector4(1134.2, -982.91, 46.42, 277.24),
        ['ped'] = 'mp_m_shopkeep_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-shopping-basket',
        ['targetLabel'] = 'Open Shop',
        ['products'] = Config.Products['liquor'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(1129.73, -989.27, 45.97, 280.98),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    -- Hardware Store Locations
    ['hardware'] = {
        ['label'] = 'Hardware Store',
        ['coords'] = vector4(45.68, -1749.04, 29.61, 53.13),
        ['ped'] = 'mp_m_waremech_01',
        ['scenario'] = 'WORLD_HUMAN_CLIPBOARD',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-wrench',
        ['targetLabel'] = 'Open Hardware Store',
        ['products'] = Config.Products['hardware'],
        ['showblip'] = true,
        ['blipsprite'] = 402,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(89.15, -1745.29, 30.09, 315.25),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['hardware2'] = {
        ['label'] = 'Hardware Store',
        ['coords'] = vector4(2747.71, 3472.85, 55.67, 255.08),
        ['ped'] = 'mp_m_waremech_01',
        ['scenario'] = 'WORLD_HUMAN_CLIPBOARD',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-wrench',
        ['targetLabel'] = 'Open Hardware Store',
        ['products'] = Config.Products['hardware'],
        ['showblip'] = true,
        ['blipsprite'] = 402,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(2704.68, 3457.21, 55.54, 176.28),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['hardware3'] = {
        ['label'] = 'Hardware Store',
        ['coords'] = vector4(-421.83, 6136.13, 31.88, 228.2),
        ['ped'] = 'mp_m_waremech_01',
        ['scenario'] = 'WORLD_HUMAN_CLIPBOARD',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-wrench',
        ['targetLabel'] = 'Hardware Store',
        ['products'] = Config.Products['hardware'],
        ['showblip'] = true,
        ['blipsprite'] = 402,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-438.25, 6146.9, 31.48, 136.99),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    -- Ammunation Locations
    ['ammunation'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-661.96, -933.53, 21.83, 177.05),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 0,
        ['delivery'] = vector4(-660.61, -938.14, 21.83, 167.22),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ammunation2'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(809.68, -2159.13, 29.62, 1.43),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 5,
        ['delivery'] = vector4(820.97, -2146.7, 28.71, 359.98),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ammunation3'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(1692.67, 3761.38, 34.71, 227.65),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 5,
        ['delivery'] = vector4(1687.17, 3755.47, 34.34, 163.69),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ammunation4'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-331.23, 6085.37, 31.45, 228.02),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 5,
        ['delivery'] = vector4(-341.72, 6098.49, 31.32, 11.05),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ammunation5'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(253.63, -51.02, 69.94, 72.91),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 5,
        ['delivery'] = vector4(249.0, -50.64, 69.94, 60.71),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ammunation6'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(23.0, -1105.67, 29.8, 162.91),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 5,
        ['delivery'] = vector4(-5.82, -1107.48, 29.0, 164.32),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ammunation7'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(2567.48, 292.59, 108.73, 349.68),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 5,
        ['delivery'] = vector4(2578.77, 285.53, 108.61, 277.2),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ammunation8'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-1118.59, 2700.05, 18.55, 221.89),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 5,
        ['delivery'] = vector4(-1127.67, 2708.18, 18.8, 41.76),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ammunation9'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(841.92, -1035.32, 28.19, 1.56),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 5,
        ['delivery'] = vector4(847.83, -1020.36, 27.88, 88.29),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ammunation10'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-1304.19, -395.12, 36.7, 75.03),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 5,
        ['delivery'] = vector4(-1302.44, -385.23, 36.62, 303.79),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    ['ammunation11'] = {
        ['label'] = 'Ammunation',
        ['type'] = 'weapon',
        ['coords'] = vector4(-3173.31, 1088.85, 20.84, 244.18),
        ['ped'] = 's_m_y_ammucity_01',
        ['scenario'] = 'WORLD_HUMAN_COP_IDLES',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-gun',
        ['targetLabel'] = 'Open Ammunation',
        ['products'] = Config.Products['weapons'],
        ['showblip'] = true,
        ['blipsprite'] = 110,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 5,
        ['delivery'] = vector4(-3183.6, 1084.35, 20.84, 68.13),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    -- Weedshop Locations
    ['weedshop'] = {
        ['label'] = 'Smoke On The Water',
        ['coords'] = vector4(-1168.26, -1573.2, 4.66, 105.24),
        ['ped'] = 'a_m_y_hippy_01',
        ['scenario'] = 'WORLD_HUMAN_AA_SMOKE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-cannabis',
        ['targetLabel'] = 'Open Weed Shop',
        ['products'] = Config.Products['weedshop'],
        ['showblip'] = true,
        ['blipsprite'] = 140,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(-1162.13, -1568.57, 4.39, 328.52),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    -- Sea Word Locations
    ['seaword'] = {
        ['label'] = 'Sea Word',
        ['coords'] = vector4(-1687.03, -1072.18, 13.15, 52.93),
        ['ped'] = 'a_m_y_beach_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_IMPATIENT',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-fish',
        ['targetLabel'] = 'Sea Word',
        ['products'] = Config.Products['gearshop'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.6,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(-1674.18, -1073.7, 13.15, 333.56),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname'
    },
    -- Leisure Shop Locations
    ['leisureshop'] = {
        ['label'] = 'Leisure Shop',
        ['coords'] = vector4(-1505.91, 1511.95, 115.29, 257.13),
        ['ped'] = 'a_m_y_beach_01',
        ['scenario'] = 'WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE',
        ['radius'] = 1.5,
        ['targetIcon'] = 'fas fa-leaf',
        ['targetLabel'] = 'Open Leisure Shop',
        ['products'] = Config.Products['leisureshop'],
        ['showblip'] = true,
        ['blipsprite'] = 52,
        ['blipscale'] = 0.8,
        ['blipcolor'] = 2,
        ['delivery'] = vector4(-1507.64, 1505.52, 115.29, 262.2),
        ['distance'] = 2.0,
        ['account'] = 'money',
        ['requiredJobs'] = nil,       -- nil or example { 'police', 'ambulance' }
        ['requiredJobsGrades'] = nil, -- nil or grade tables example { 2, 3, 4},
        ['requiredLicense'] = nil     -- or example 'itemname' -- or example 'itemname'
    },
}
