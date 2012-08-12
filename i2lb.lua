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

_G.i2LB.core.addPlayer = function(player)
	_G.i2LB.players[player.Name] = {
		["player"] = player,
		["leaderstats"] = player.leaderstats,
		["realstats"] = {}
	}
end

_G.i2LB.core.addStat = function(statName)
	_G.i2LB.stats[statName] = {
		
	}
end

_G.i2LB.core.addStatToPlayer = function(playerName, statName)
	local plTable = _G.i2LB.players[playerName]
	local statObject = Instance.new("IntValue", plTable.leaderstats).Name = statName
	plTable.realstates[statName] = 0
end

game.Players.PlayerAdded:connect(function(player)
	wait() -- Foolproof
	local leaderstats = player:FindFirstChild("leaderstats") or (Instance.new("IntValue", player).Name = "leaderstats")
	_G.i2LB.core.addPlayer(player, leaderstats)
end)

_G.i2LB.isLoaded = true