--[[

	SteamhappyOS v0.1.0
	
	The admin system primarily used for SIRF developed by Steamhappy Inc.
	Usage of this system outside of SIRF is prohibited unless told otherwise by a HR.
	
	Disregard the above line, it is a public version.

	*PUT THE MODULES INSIDE OF THIS SCRIPT*

]]--

-- Services

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

-- Modules

local Commands = require(script.Commands)
local Settings = require(script.Settings)
local Admins = require(script.Admins)

-- Chat event

local function OnChatted(Player, Message)
	
	local Split = Message:split(" ")
	local FiredCommand = Split[1]:split(Settings.Prefix)

	if Commands[FiredCommand[2]] then

		local Args = Split -- The 'me' in ';ff me' would be Args[1]

		table.remove(Args, 1) -- Removes the 'me'

		Commands[FiredCommand[2]](Player.Name, table.unpack(Args)) -- Fires the command with the new arguement (the target player)

	end
	
end

Players.PlayerAdded:Connect(function(Player) -- The player chat event
	
	Player.Chatted:Connect(function(Message)
		
		OnChatted(Player, Message)
		
	end)
	
end)