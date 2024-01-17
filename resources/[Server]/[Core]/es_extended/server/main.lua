SetMapName('San Andreas')
SetGameType('ESX Legacy')

local oneSyncState = GetConvar('onesync', 'off')
local newPlayer = 'INSERT INTO `users` SET `accounts` = ?, `identifier` = ?, `group` = ?'
local loadPlayer = 'SELECT `accounts`, `job`, `job_grade`, `group`, `position`, `inventory`, `skin`, `loadout`, `metadata`'

-- Do not remove this, it is used for Selecting a characters identity data before they have loaded in
----------
loadPlayer = loadPlayer .. ', `firstname`, `lastname`, `dateofbirth`, `sex`, `height`'
----------
loadPlayer = loadPlayer .. ' FROM `users` WHERE identifier = ?'

RegisterNetEvent('esx:onPlayerJoined')
AddEventHandler('esx:onPlayerJoined', function()
	local _source = source
	while not next(ESX.Jobs) do
		Wait(50)
	end

	if not ESX.Players[_source] then
		onPlayerJoined(_source)
	end
end)

function onPlayerJoined(playerId)
	local identifier = ESX.GetIdentifier(playerId)
	if identifier then
		if ESX.GetPlayerFromIdentifier(identifier) then
			DropPlayer(playerId,
				('there was an error loading your character!\nError code: identifier-active-ingame\n\nThis error is caused by a player on this server who has the same identifier as you have. Make sure you are not playing on the same Rockstar account.\n\nYour Rockstar identifier: %s'):format(
					identifier))
		else
			local result = MySQL.scalar.await('SELECT 1 FROM users WHERE identifier = ?', { identifier })
			if result then
				loadESXPlayer(identifier, playerId, false)
			else
				createESXPlayer(identifier, playerId)
			end
		end
	else
		DropPlayer(playerId,
			'there was an error loading your character!\nError code: identifier-missing-ingame\n\nThe cause of this error is not known, your identifier could not be found. Please come back later or report this problem to the server administration team.')
	end
end

function createESXPlayer(identifier, playerId, data)
	local accounts = {}

	for account, money in pairs(Config.StartingAccountMoney) do
		accounts[account] = money
	end

	local defaultGroup = "user"
	if Core.IsPlayerAdmin(playerId) then
		print(('[^2INFO^0] Player ^5%s^0 Has been granted admin permissions via ^5Ace Perms^7.'):format(playerId))
		defaultGroup = "admin"
	end

	local parameters = Config.Multichar and { json.encode(accounts), identifier, defaultGroup, data.firstname, data.lastname, data.dateofbirth, data.sex, data.height } or { json.encode(accounts), identifier, defaultGroup }

	MySQL.prepare(newPlayer, parameters, function()
		loadESXPlayer(identifier, playerId, true)
	end)
end

AddEventHandler('playerConnecting', function(_, _, deferrals)
	deferrals.defer()
	local playerId = source
	local identifier = ESX.GetIdentifier(playerId)

	if oneSyncState == "off" or oneSyncState == "legacy" then
		return deferrals.done(('[ESX] ESX Requires Onesync Infinity to work. This server currently has Onesync set to: %s'):format(oneSyncState))
	end

	if not Core.DatabaseConnected then
		return deferrals.done('[ESX] OxMySQL Was Unable To Connect to your database. Please make sure it is turned on and correctly configured in your server.cfg')
	end

	if identifier then
		if ESX.GetPlayerFromIdentifier(identifier) then
			return deferrals.done(
				('[ESX] There was an error loading your character!\nError code: identifier-active\n\nThis error is caused by a player on this server who has the same identifier as you have. Make sure you are not playing on the same account.\n\nYour identifier: %s'):format(
					identifier))
		else
			return deferrals.done()
		end
	else
		return deferrals.done(
			'[ESX] There was an error loading your character!\nError code: identifier-missing\n\nThe cause of this error is not known, your identifier could not be found. Please come back later or report this problem to the server administration team.')
	end
end)

function loadESXPlayer(identifier, playerId, isNew)
	local userData = {
		accounts = {},
		inventory = {},
		job = {},
		loadout = {},
		playerName = GetPlayerName(playerId),
		weight = 0,
		metadata = {}
	}
	local result = MySQL.prepare.await(loadPlayer, { identifier })
	local job, grade, jobObject, gradeObject = result.job, tostring(result.job_grade)
	local foundAccounts, foundItems = {}, {}

	-- Accounts
	if result.accounts and result.accounts ~= '' then
		local accounts = json.decode(result.accounts)

		for account, money in pairs(accounts) do
			foundAccounts[account] = money
		end
	end

	for account, data in pairs(Config.Accounts) do
		if data.round == nil then
			data.round = true
		end
		local index = #userData.accounts + 1
		userData.accounts[index] = {
			name = account,
			money = foundAccounts[account] or Config.StartingAccountMoney[account] or 0,
			label = data.label,
			round = data.round,
			index = index
		}
	end

	-- Job
	if ESX.DoesJobExist(job, grade) then
		jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]
	else
		print(('[^3WARNING^7] Ignoring invalid job for ^5%s^7 [job: ^5%s^7, grade: ^5%s^7]'):format(identifier, job, grade))
		job, grade = 'unemployed', '0'
		jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]
	end

	userData.job.id = jobObject.id
	userData.job.name = jobObject.name
	userData.job.label = jobObject.label

	userData.job.grade = tonumber(grade)
	userData.job.grade_name = gradeObject.name
	userData.job.grade_label = gradeObject.label
	userData.job.grade_salary = gradeObject.salary

	userData.job.skin_male = {}
	userData.job.skin_female = {}

	if gradeObject.skin_male then
		userData.job.skin_male = json.decode(gradeObject.skin_male)
	end
	if gradeObject.skin_female then
		userData.job.skin_female = json.decode(gradeObject.skin_female)
	end


	if result.inventory and result.inventory ~= '' then
		userData.inventory = json.decode(result.inventory)
	else
		userData.inventory = {}
	end

	-- Group
	if result.group then
		if result.group == "superadmin" then
			userData.group = "admin"
			print("[^3WARNING^7] ^5Superadmin^7 detected, setting group to ^5admin^7")
		else
			userData.group = result.group
		end
	else
		userData.group = 'user'
	end

	-- Position
	userData.coords = json.decode(result.position) or Config.DefaultSpawns[math.random(#Config.DefaultSpawns)]

	-- Skin
	if result.skin and result.skin ~= '' then
		userData.skin = json.decode(result.skin)
	else
		if userData.sex == 'f' then
			userData.skin = { sex = 1 }
		else
			userData.skin = { sex = 0 }
		end
	end

	-- Identity
	if result.firstname and result.firstname ~= '' then
		userData.firstname = result.firstname
		userData.lastname = result.lastname
		userData.playerName = userData.firstname .. ' ' .. userData.lastname
		if result.dateofbirth then
			userData.dateofbirth = result.dateofbirth
		end
		if result.sex then
			userData.sex = result.sex
		end
		if result.height then
			userData.height = result.height
		end
	end

	if result.metadata and result.metadata ~= '' then
		local metadata = json.decode(result.metadata)
		userData.metadata = metadata
	end

	local xPlayer = CreateExtendedPlayer(playerId, identifier, userData.group, userData.accounts, userData.inventory, userData.weight, userData.job, userData.loadout, userData.playerName, userData.coords, userData.metadata)
	ESX.Players[playerId] = xPlayer
	Core.playersByIdentifier[identifier] = xPlayer

	if userData.firstname then
		xPlayer.set('firstName', userData.firstname)
		xPlayer.set('lastName', userData.lastname)
		if userData.dateofbirth then
			xPlayer.set('dateofbirth', userData.dateofbirth)
		end
		if userData.sex then
			xPlayer.set('sex', userData.sex)
		end
		if userData.height then
			xPlayer.set('height', userData.height)
		end
	end
    --saved player health and armor in metadata
    local ped = GetPlayerPed(xPlayer.source)
    if ped then
        xPlayer.setMeta('health', xPlayer.getMeta('health') or GetEntityHealth(ped))
        xPlayer.setMeta('armor', xPlayer.getMeta('armor') or GetPedArmour(ped))
    end

	TriggerEvent('esx:playerLoaded', playerId, xPlayer, isNew)

	xPlayer.triggerEvent('esx:playerLoaded',
		{
			accounts = xPlayer.getAccounts(),
			coords = userData.coords,
			identifier = xPlayer.getIdentifier(),
			inventory = xPlayer.getInventory(),
			job = xPlayer.getJob(),
			loadout = xPlayer.getLoadout(),
			maxWeight = xPlayer.getMaxWeight(),
			money = xPlayer.getMoney(),
			sex = xPlayer.get("sex") or "m",
			firstName = xPlayer.get("firstName") or "John",
			lastName = xPlayer.get("lastName") or "Doe",
			dateofbirth = xPlayer.get("dateofbirth") or "01/01/2000",
			height = xPlayer.get("height") or 120,
			dead = false,
			metadata = xPlayer.getMeta()
		}, isNew,
		userData.skin)

	xPlayer.triggerEvent('esx:createMissingPickups', Core.Pickups)
	xPlayer.triggerEvent('esx:registerSuggestions', Core.RegisteredCommands)
	print(('[^2INFO^0] Player ^5"%s"^0 has connected to the server. ID: ^5%s^7'):format(xPlayer.getName(), playerId))
end

AddEventHandler('chatMessage', function(playerId, _, message)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	if message:sub(1, 1) == '/' and playerId > 0 then
		CancelEvent()
		local commandName = message:sub(1):gmatch("%w+")()
		xPlayer.showNotification(TranslateCap('commanderror_invalidcommand', commandName))
	end
end)

AddEventHandler('playerDropped', function(reason)
	local playerId = source
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		TriggerEvent('esx:playerDropped', playerId, reason)
        local job = xPlayer.getJob().name
		local currentJob = ESX.JobsPlayerCount[job]
        ESX.JobsPlayerCount[job] = ((currentJob and currentJob > 0) and currentJob or 1) -1
		GlobalState[("%s:count"):format(job)] = ESX.JobsPlayerCount[job]
		Core.playersByIdentifier[xPlayer.identifier] = nil
		Core.SavePlayer(xPlayer, function()
			ESX.Players[playerId] = nil
		end)
	end
end)

AddEventHandler("esx:playerLoaded", function(playerId, xPlayer, isNew)
    local job = xPlayer.getJob().name
	local jobKey = ("%s:count"):format(job)
	
    ESX.JobsPlayerCount[job] = (ESX.JobsPlayerCount[job] or 0) +1
	GlobalState[jobKey] = ESX.JobsPlayerCount[job]
end)

AddEventHandler("esx:setJob", function(src, job, lastJob)
	local lastJobKey = ('%s:count'):format(lastJob.name)
	local jobKey = ('%s:count'):format(job.name)
	local currentLastJob = ESX.JobsPlayerCount[lastJob.name]

    ESX.JobsPlayerCount[lastJob.name] = ((currentLastJob and currentLastJob > 0) and currentLastJob or 1) -1
    ESX.JobsPlayerCount[job.name] = (ESX.JobsPlayerCount[job.name] or 0) + 1

	GlobalState[lastJobKey] = ESX.JobsPlayerCount[lastJob.name]
	GlobalState[jobKey] = ESX.JobsPlayerCount[job.name]
end)

AddEventHandler('esx:playerLogout', function(playerId, cb)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	if xPlayer then
		TriggerEvent('esx:playerDropped', playerId)

		Core.playersByIdentifier[xPlayer.identifier] = nil
		Core.SavePlayer(xPlayer, function()
			ESX.Players[playerId] = nil
			if cb then
				cb()
			end
		end)
	end
	TriggerClientEvent("esx:onPlayerLogout", playerId)
end)

ESX.RegisterServerCallback('esx:getPlayerData', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb({
		identifier = xPlayer.identifier,
		accounts = xPlayer.getAccounts(),
		inventory = xPlayer.getInventory(),
		job = xPlayer.getJob(),
		loadout = xPlayer.getLoadout(),
		money = xPlayer.getMoney(),
		position = xPlayer.getCoords(true),
		metadata = xPlayer.getMeta()
	})
end)

ESX.RegisterServerCallback('esx:isUserAdmin', function(source, cb)
	cb(Core.IsPlayerAdmin(source))
end)

ESX.RegisterServerCallback('esx:getGameBuild', function(_, cb)
	cb(tonumber(GetConvar("sv_enforceGameBuild", 1604)))
end)

ESX.RegisterServerCallback('esx:getOtherPlayerData', function(_, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	cb({
		identifier = xPlayer.identifier,
		accounts = xPlayer.getAccounts(),
		inventory = xPlayer.getInventory(),
		job = xPlayer.getJob(),
		loadout = xPlayer.getLoadout(),
		money = xPlayer.getMoney(),
		position = xPlayer.getCoords(true),
		metadata = xPlayer.getMeta()
	})
end)

ESX.RegisterServerCallback('esx:getPlayerNames', function(source, cb, players)
	players[source] = nil

	for playerId, _ in pairs(players) do
		local xPlayer = ESX.GetPlayerFromId(playerId)

		if xPlayer then
			players[playerId] = xPlayer.getName()
		else
			players[playerId] = nil
		end
	end

	cb(players)
end)

ESX.RegisterServerCallback("esx:spawnVehicle", function(source, cb, vehData)
	local ped = GetPlayerPed(source)
	ESX.OneSync.SpawnVehicle(vehData.model or `ADDER`, vehData.coords or GetEntityCoords(ped), vehData.coords.w or 0.0, vehData.props or {}, function(id)
		if vehData.warp then
			local vehicle = NetworkGetEntityFromNetworkId(id)
			local timeout = 0
			while GetVehiclePedIsIn(ped) ~= vehicle and timeout <= 15 do
				Wait(0)
				TaskWarpPedIntoVehicle(ped, vehicle, -1)
				timeout += 1
			end
		end
		cb(id)
	end)
end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
	if eventData.secondsRemaining == 60 then
		CreateThread(function()
			Wait(50000)
			Core.SavePlayers()
		end)
	end
end)

AddEventHandler('txAdmin:events:serverShuttingDown', function()
	Core.SavePlayers()
end)

local DoNotUse = {
    ['essentialmode'] = true,
    ['es_admin2'] = true,
    ['basic-gamemode'] = true,
    ['mapmanager'] = true,
    ['fivem-map-skater'] = true,
    ['fivem-map-hipster'] = true,
    ['qb-core'] = true,
    ['default_spawnpoint'] = true,
}

AddEventHandler('onResourceStart', function(key)
    if DoNotUse[string.lower(key)] then
        while GetResourceState(key) ~= 'started' do 
            Wait(0)
        end 
        
		StopResource(key)
        print(("[^1ERROR^7] WE STOPPED A RESOURCE THAT WILL BREAK ^1ESX^7, PLEASE REMOVE ^5%s^7"):format(key))
    end 
end)

for key in pairs(DoNotUse) do
    if GetResourceState(key) == 'started' or GetResourceState(key) == 'starting' then
		StopResource(key)
        print(("[^1ERROR^7] WE STOPPED A RESOURCE THAT WILL BREAK ^1ESX^7, PLEASE REMOVE ^5%s^7"):format(key))
    end
end
