--[[

	SteamhappyOS v0.1.0
	Public version
	
	Commands
	
	Developed by iiBright2676/bright2676

]]--

local Commands = {}

local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Admins = require(script.Parent.Admins)
local Settings = require(script.Parent.Settings)

Commands.kill = function(playerExecuting, playerToKill)

	if table.find(Admins.Admins, playerExecuting) then

		print("Executing command")

		local success, reponse = pcall(function()

			if playerToKill == "me" then

				local Player:Player = Players:FindFirstChild(playerExecuting)

				if Player then

					local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")

					if Humanoid then

						Humanoid.Health = 0

					else

						warn("No humanoid")

					end

				else

					warn("No player")

				end

			elseif playerToKill == "all" then

				for _, player in pairs(Players:GetPlayers()) do

					if player:IsA("Player") then

						local plr = player

						plr.Character:FindFirstChildOfClass("Humanoid").Health = 0

					end

				end

			elseif playerToKill == "others" then

				for _, player in pairs(Players:GetPlayers()) do

					if player:IsA("Player") then

						local plr = player

						if plr.Name ~= playerExecuting then

							plr.Character:FindFirstChildOfClass("Humanoid").Health = 0

						end

					end

				end

			else

				local Player:Player = Players:FindFirstChild(playerToKill)

				if Player then

					local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")

					if Humanoid then

						Humanoid.Health = 0

					else

						warn("No humanoid")

					end

				else

					warn("No player")

				end

			end

		end)

		if not success then

			warn(reponse)

		else

			print("Success")

		end

	else

		warn("not an admin")

	end

end

Commands.bring = function(playerExecuting, playerToBring)

	if table.find(Admins.Admins, playerExecuting) then

		print("Executing command")

		local success, reponse = pcall(function()

			local PlayerToBring:Player = Players:FindFirstChild(playerToBring)
			local PlayerExecuting:Player = Players:FindFirstChild(playerExecuting)

			if PlayerToBring and PlayerExecuting then

				PlayerToBring.Character:FindFirstChild("HumanoidRootPart").CFrame = PlayerExecuting.Character.HumanoidRootPart.CFrame

			else

				warn("No player")

			end

		end)

		if not success then

			warn(reponse)

		else

			print("Success")

		end

	end

end

Commands.to = function(playerExecuting, playerToGoTo)

	if table.find(Admins.Admins, playerExecuting) then

		print("Executing command")

		local success, reponse = pcall(function()

			local PlayerToGoTo:Player = Players:FindFirstChild(playerToGoTo)
			local PlayerExecuting:Player = Players:FindFirstChild(playerExecuting)

			if PlayerToGoTo and PlayerExecuting then

				PlayerExecuting.Character:FindFirstChild("HumanoidRootPart").CFrame = PlayerToGoTo.Character.HumanoidRootPart.CFrame

			else

				warn("No player")

			end

		end)

		if not success then

			warn(reponse)

		else

			print("Success")

		end

	end

end

Commands.give = function(playerExecuting, playerToGiveItemTo, itemName)

	if table.find(Admins.Admins, playerExecuting) then

		print("Executing command")

		local success, reponse = pcall(function()

			if playerToGiveItemTo == "me" then

				local PlayerToGiveItemTo:Player = Players:FindFirstChild(playerExecuting)
				local PlayerExecuting:Player = Players:FindFirstChild(playerExecuting)

				if PlayerExecuting then

					for _, thing in pairs(ServerStorage:GetDescendants()) do

						if thing:IsA("Tool") then

							if thing.Name == itemName then

								thing:Clone().Parent = PlayerExecuting.Backpack

							end

						end

					end

				else

					warn("No player")

				end

			elseif playerToGiveItemTo == "all" then

				for _, player in pairs(Players:GetPlayers()) do

					local plr = player

					if plr then

						for _, thing in pairs(ServerStorage:GetDescendants()) do

							if thing:IsA("Tool") then

								if thing.Name == itemName then

									thing:Clone().Parent = plr.Backpack

								end

							end

						end

					end

				end

			elseif playerToGiveItemTo == "others" then

				for _, player in pairs(Players:GetPlayers()) do

					local plr = player

					if plr then
						
						if plr.Name ~= playerExecuting then
							
							for _, thing in pairs(ServerStorage:GetDescendants()) do

								if thing:IsA("Tool") then

									if thing.Name == itemName then

										thing:Clone().Parent = plr.Backpack

									end

								end

							end
							
						end

					end

				end

			else

				local PlayerToGiveItemTo:Player = Players:FindFirstChild(playerToGiveItemTo)
				local PlayerExecuting:Player = Players:FindFirstChild(playerExecuting)

				if PlayerToGiveItemTo and PlayerExecuting then

					for _, thing in pairs(ServerStorage:GetDescendants()) do

						if thing:IsA("Tool") then

							if thing.Name == itemName then

								thing:Clone().Parent = PlayerToGiveItemTo.Backpack

							end

						end

					end

				else

					warn("No player")

				end

			end

		end)

		if not success then

			warn(reponse)

		else

			print("Success")

		end

	end

end


return Commands
