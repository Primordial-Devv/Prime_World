ESX = {}
ESX.Players = {}
ESX.Jobs = {}
ESX.JobsPlayerCount = {}
ESX.Items = {}
Core = {}
Core.UsableItemsCallbacks = {}
Core.RegisteredCommands = {}
Core.Pickups = {}
Core.PickupId = 0
Core.PlayerFunctionOverrides = {}
Core.DatabaseConnected = false
Core.playersByIdentifier = {}

Core.vehicleTypesByModel = {}

AddEventHandler("esx:getSharedObject", function()
	local Invoke = GetInvokingResource()
	print(("[^1ERROR^7] Resource ^5%s^7 Used the ^5getSharedObject^7 Event, this event ^1no longer exists!^7 Visit https://documentation.esx-framework.org/tutorials/tutorials-esx/sharedevent for how to fix!"):format(Invoke))
end)

exports('getSharedObject', function()
	return ESX
end)

if GetResourceState('qs-inventory') ~= 'missing' then
	Config.QSInventory = true
	Config.PlayerFunctionOverride = 'QSInventory'
end

local function StartDBSync()
	CreateThread(function()
		local interval <const> = 10 * 60 * 1000
		while true do
			Wait(interval)
			Core.SavePlayers()
		end
	end)
end

MySQL.ready(function()
	Core.DatabaseConnected = true
	if Config.QSInventory then
		ESX.Items = exports['qs-inventory']:GetItemList()
	end

	local items = MySQL.query.await('SELECT * FROM items')
	for _, v in ipairs(items) do
		ESX.Items[v.name] = { label = v.label, weight = v.weight, rare = v.rare, canRemove = v.can_remove }
	end

	ESX.RefreshJobs()

	print(('[^2INFO^7] ESX ^5Legacy %s^0 initialized!'):format(GetResourceMetadata(GetCurrentResourceName(), "version", 0)))

	StartDBSync()
	if Config.EnablePaycheck then
		StartPayCheck()
	end
end)

RegisterServerEvent('esx:clientLog')
AddEventHandler('esx:clientLog', function(msg)
	if Config.EnableDebug then
		print(('[^2TRACE^7] %s^7'):format(msg))
	end
end)

RegisterNetEvent("esx:ReturnVehicleType", function(Type, Request)
	if Core.ClientCallbacks[Request] then
		Core.ClientCallbacks[Request](Type)
		Core.ClientCallbacks[Request] = nil
	end
end)
