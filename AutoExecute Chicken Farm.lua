getgenv().AutoExecuteFarm = true
if getgenv().AutoExecuteFarm then
repeat wait()
until game:IsLoaded()
local virtualUser = game:GetService('VirtualUser')
virtualUser:CaptureController()
if game.Players.LocalPlayer.PlayerGui:WaitForChild('Menu.UI', 0.02) then
while wait(5) do
    if game.Players.LocalPlayer.PlayerGui:WaitForChild('Menu.UI', 0.02) then
    if game.Players.LocalPlayer.PlayerGui["Menu.UI"].Frame.PlayButton.Transparency >= 0.51 then
        print('Waiting To Load')
    else 
        print('Menu Skipped')
        game.Players.LocalPlayer.PlayerGui["Menu.UI"].Frame.Size = UDim2.new(100, 100, 100)
        game.Players.LocalPlayer.PlayerGui["Menu.UI"].Frame.PlayButton.Text = "ayo george floyd"
        break
    end
    else
        break
    end
end
end

COREGUI = game:GetService("CoreGui")
local Dir = COREGUI:FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
	Dir.DescendantAdded:Connect(function(Err)
		if Err.Name == "ErrorTitle" then
			Err:GetPropertyChangedSignal("Text"):Connect(function()
				if Err.Text:sub(0, 12) == "Disconnected" then
					if #game.Players:GetPlayers() <= 1 then
						game.Players.LocalPlayer:Kick("\nRejoining...")
						wait()
						game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
					else
						game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
					end
				end
			end)
		end
end)
wait(1)
if game.Players.LocalPlayer.PlayerGui:WaitForChild('Menu.UI', 0.02) then
game.Players.LocalPlayer.PlayerGui["Menu.UI"]:Destroy()
game.Players.LocalPlayer.PlayerGui["HP.UI"].Enabled = true
else
end
--game:GetService("ReplicatedStorage").Play:FireServer()

local function onCharacterAdded(character)
	if character.Name == game.Players.LocalPlayer.Name then
	wait(5)
	local pos = Vector3.new(1, 1, 1)
    local lookAt = Vector3.new(-230.136383, -1.94987893, 168.935593)
    local cameraCFrame = CFrame.new(pos, lookAt)
    workspace.CurrentCamera.CFrame = cameraCFrame
	loadstring(game:HttpGet("https://raw.githubusercontent.com/DivineEntity01/Shitmented/main/Egg%20Salad's%20AutoFarm(Modified).lua", true))()
   end
end

local function onPlayerAdded(player)
	game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
end
if not getgenv().Loaded then
wait(15)
getgenv().Loaded = true
end
local camera = workspace.CurrentCamera
camera.CameraType = Enum.CameraType.Custom
local pos = Vector3.new(1, 1, 1)
local lookAt = Vector3.new(-230.136383, -1.94987893, 168.935593)
local cameraCFrame = CFrame.new(pos, lookAt)
workspace.CurrentCamera.CFrame = cameraCFrame
onPlayerAdded()

loadstring(game:HttpGet("https://raw.githubusercontent.com/DivineEntity01/Shitmented/main/Egg%20Salad's%20AutoFarm(Modified).lua", true))()

end
