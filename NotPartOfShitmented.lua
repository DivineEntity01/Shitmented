getgenv().Enabled = true
getgenv().Selling = false
local count = 0

function respawn(plr)
	if invisRunning then TurnVisible() end
	local char = plr.Character
	if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
	char:ClearAllChildren()
	local newChar = Instance.new("Model")
	newChar.Parent = workspace
	plr.Character = newChar
	wait()
	plr.Character = char
	newChar:Destroy()
end

function refresh(plr)
	refreshCmd = true
	local Human = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid", true)
	local pos = Human and Human.RootPart and Human.RootPart.CFrame
	local pos1 = workspace.CurrentCamera.CFrame
	respawn(plr)
	spawn(function()
		plr.CharacterAdded:Wait():WaitForChild("Humanoid").RootPart.CFrame, workspace.CurrentCamera.CFrame = pos, wait() and pos1
		refreshCmd = false
	end)
end

while Enabled do
if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart", 0.02) then
if not Enabled then
    break
end
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if i >= 2 then
    Selling = true
    count = 0
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace")["pawn shop button"].Position)
    local weapon = {[1] = {[1] = game.Players.LocalPlayer.Backpack[tostring(v)]}}
    game:GetService("ReplicatedStorage").SellWeapon:FireServer(unpack(weapon))
    elseif i <= 1 then
    Selling = false
end
end
for _,w in pairs(game.workspace:GetChildren()) do
    if w.Name == "WeaponSpawn" and not Selling then
        if w.WeaponLocation.WeaponTaken.Value == false then
            count = count + 0.001
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(w.WeaponLocation.Position) + Vector3.new(0, 0.1, 0)
        end
end
end
end
wait(0.003)
if count >= 1 then
    count = 0
    refresh(game.Players.LocalPlayer)
end
end
