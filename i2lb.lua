_G.i2LB = {}
_G.innovation2Leaderboard = _G.i2LB
_G.innovation2LB = _G.i2LB
_G.innovationSquaredLeaderBoard = _G.i2LB
_G.innovationSquaredLB = _G.i2LB
_G.standardLeaderboard = _G.i2LB
_G.leaderboard = _G.i2LB
_G.leaderBoard = _G.i2LB
_G.LEADERBOARD = _G.i2LB
_G.LeaderBoard = _G.i2LB 

_G.i2LB.players = {}
_G.i2LB.stats = {}
_G.i2LB.core = {}

_G.i2LB.timeBetweenChecks = 30

_G.i2LB.core.addPlayer = function(player, leaderstats)
	_G.i2LB.players[player.Name] = {
		["player"] = player,
		["leaderstats"] = leaderstats,
		["realstats"] = {}
	}

	_G.i2LB.core.addAllStatsToPlayer(player)
end

_G.i2LB.core.addStat = function(statName, default)
	_G.i2LB.stats[statName] = {
		["name"] = statName
		["default"] = default or 0
	}

	for _, player in pairs(_G.i2LB.players) do
		_G.i2LB.core.addStatToPlayer(player, _G.i2LB.stats[statName])
	end
end

_G.i2LB.core.addStatToPlayer = function(player, stat)
	local statObject = Instance.new("IntValue", player.leaderstats)
	statObject.Name = stat.name
	statObject.value = stat.default
	player.realstats[stat.name] = stat.default
end

_G.i2LB.core.addAllStatsToPlayer = function(player)
	for _, stat in pairs(_G.i2LB.core.stats) do
		_G.i2LB.core.addStatToPlayer(player, stat)
	end
end

game.Players.PlayerAdded:connect(function(player)
	wait() -- Foolproof
	local leaderstats = player:FindFirstChild("leaderstats") or (Instance.new("IntValue", player).Name = "leaderstats")
	_G.i2LB.core.addPlayer(player, leaderstats)
end)

_G.i2LB.isLoaded = true