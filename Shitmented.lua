
local HttpService = game:GetService("HttpService");
local SaveFileName = "Shitmented.lua"
local Configuration = {HideBind = 'Enum.KeyCode.RightAlt', PanicBind = ''}
if not pcall(function()
    readfile(SaveFileName)
end) then
writefile(SaveFileName, HttpService:JSONEncode(Configuration))
end
local Setting = HttpService:JSONDecode(readfile(SaveFileName))
local function SaveSettings()
   writefile(SaveFileName, HttpService:JSONEncode(Setting))
end
repeat wait()
until game:IsLoaded()

local UIS = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local gun = player.Character:FindFirstChildOfClass("Tool")
local event = game:GetService("ReplicatedStorage")["Gun.Assets"]["Gun.Event"]
getgenv().Walkspeed = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed
if game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08) then
wait()
elseif not game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08) then
loadstring(game:HttpGet("https://raw.githubusercontent.com/DivineEntity01/Shitmented/main/UI%20Library", true))()
wait()
CreateMain("Shitmented")
CreateTab("Scripts")
CreateTab("Settings")
end

local function IsShiftKeyDown()
	return UIS:IsKeyDown(Enum.KeyCode.LeftShift)
end

function onInputBegan(input,gameProcessed)
if input.UserInputType == Enum.UserInputType.Keyboard and Setting.HideBind:lower()==tostring(input.KeyCode):lower() and not gameProcessed and game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08) then
    if game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08).Top.Visible == false then 
        game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08).Top.Visible = true
    else 
        game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08).Top.Visible = false 
end
end

if input.UserInputType == Enum.UserInputType.Keyboard and Setting.PanicBind:lower()==tostring(input.KeyCode):lower() and not gameProcessed and game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08) then
    if not getgenv().Panic then 
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-226.137573, 4, -83.1992569)
        getgenv().Panic = true
    else
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-247.874359, 4, -82.8432465)
        getgenv().Panic = false
    end
end
--[[
if input.UserInputType == Enum.UserInputType.Keyboard and Enum.KeyCode.LeftShift and not gameProcessed and game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08) and getgenv().InfiniteRun then
    if not IsShiftKeyDown() then
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 16
    else
    local function WalkSpeedChange()
if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Humanoid and IsShiftKeyDown() then
game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 28
end
end
    game:GetService("Players").LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
end
end
]]--

end

game:GetService("UserInputService").InputBegan:connect(onInputBegan)


--[[


        SCRIPTS


]]
CreateToggle(tabs['Scripts'], "Farm Cash", "Executes a modified version of Egg Salad's",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DivineEntity01/Shitmented/main/Egg%20Salad's%20AutoFarm(Modified).lua", true))()
    if not getgenv().ChickenFarm then
    getgenv().ChickenFarm = true
    local function NoclipLoop()
		if getgenv().ChickenFarm then
			for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
		end
    end
    game:GetService('RunService').Stepped:Connect(NoclipLoop)
    else
    getgenv().ChickenFarm = false
    Noclipping:Disconnect()  
    end
end)

CreateButton(tabs['Scripts'], "GameSense", "Loads GameSense with my custom settings",function()
    if not getgenv().Aimbot then
        getgenv().Aimbot = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DivineEntity01/Shitmented/main/Custom%20GameSense.lua", true))()
    end
end)

CreateButton(tabs['Scripts'], "Unnamed ESP", "Loads Unnamed ESP",function()
    if not getgenv().ESP then
        getgenv().ESP = true
        loadstring(game:HttpGet'https://ic3w0lf.xyz/rblx/protoesp.lua')()
    end
end)

CreateButton(tabs['Scripts'], "Giant Ass Baseplate", "Creates a Huge Baseplate, and destroys buildings",function()
if not getgenv().Baseplate then
getgenv().Baseplate = true
game:GetService("Workspace").Props.StreetLamps.StreetLamps.Part.Size = Vector3.new(10000, 1, 10000)
game:GetService("Workspace").Props.StreetLamps.StreetLamps.Part.Position = Vector3.new(game:GetService("Workspace").Props.TrashDecal4.Position)
game:GetService("Workspace").Buildings:Destroy()
game:GetService("Workspace").YourStuff:Destroy()
end
end)

CreateToggle(tabs['Scripts'], "No CombatLog", "Doesn't ensure you won't get logged when you leave",function()
    if not getgenv().Combat then
    getgenv().Combat = true
        while true do
            if not getgenv().Combat then
                break
            end
            local d = false
            if not d then
            d = true
            game.Players.LocalPlayer.CombatLogged.Value = false
            end
            wait(0.2)
            d = false
        end
    else
        getgenv().Combat = false
    end
end)


--[[ CONTAINED CAUSE THIS SHIT IS LAGGY AS FUCK
CreateToggle(tabs['Scripts'], "Infinite Run", "Infinite sprint, but i would recommend using Always Sprint...",function()
    if not getgenv().InfiniteRun then
        getgenv().InfiniteRun = true
    else
        getgenv().InfiniteRun = false   
    end
end)
]]--

CreateToggle(tabs['Scripts'], "Always Sprint", "Infinite sprint, but i would recommend using Always Sprint...",function()
    if not getgenv().AlwaysSprint then
        getgenv().AlwaysSprint = true
        while getgenv().AlwaysSprint do
        if not getgenv().AlwaysSprint then
            break
        end
        local function WalkSpeedChange()
        if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Humanoid and getgenv().AlwaysSprint then
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 32
        end
        end
        game:GetService("Players").LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
        wait(20)
        end
    else
        getgenv().AlwaysSprint = false   
    end
end)

CreateToggle(tabs['Scripts'], "Kill Aura", "Kinda works, shoot to someone close and you'll kill him/them",function()
    if not getgenv().KillAll then
    getgenv().KillAll = true
    while getgenv().KillAll do
    local players = game.Players:GetPlayers()
    for i = 2, #players do local v = players[i]
        if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and not v.Character:FindFirstChild("ForceField") then
            event:FireServer("HitTarget", gun, v.Character.Head, v.Character.Head.Position+Vector3.new(0,5,0), v.Character.Head.position)
        end
    end
    wait(.1)
    event:FireServer("Reload", gun, 1e17, 1e17)
end
        else
            getgenv().KillAll = false
    end
end)

--[[



        Settings


]]


CreateTextBox(tabs['Settings'], "Panic Bind", "Click to set",function()
end)
CreateTextBox(tabs['Settings'], "GUI Bind", "Click to set",function()
end)

CreateToggle(tabs['Settings'], "Restaurant Music", "Removes chinese music from nigga restaurant",function()
    if not getgenv().Music then
        getgenv().Music = true
        game:GetService("Workspace").DecorationsMouseFilter.SoundHandler.Chken.Sounds.Sound.Playing = true
    else
        getgenv().Music = false
        game:GetService("Workspace").DecorationsMouseFilter.SoundHandler.Chken.Sounds.Sound.Playing = false
    end
end)
--[[


        Custom Scripts


]]

if game:GetService("Workspace"):WaitForChild('Buildings', 0.01) then
for _,v in pairs(game:GetService("Workspace").Buildings.KFCPlace:GetChildren()) do
    if v:IsA("BasePart") then
    if v.Size == Vector3.new(3.6, 20.5, 53.3) then
        v:Destroy()
    end
    end
end
end
game:GetService("Workspace").DecorationsMouseFilter.SoundHandler.Chken.Sounds.Sound.Playing = false
local PanicBindBox = game:GetService("CoreGui")["Shitmented"].Top.Container["Settings"].TabContainer["Panic Bind"].Side.Box
PanicBindBox.Text = string.sub(Setting.PanicBind, 14)
PanicBindBox.Focused:Connect(function()
    game:GetService("CoreGui")["Shitmented"].Top.Container["Settings"].TabContainer["Panic Bind"].Text = " Press a key"
	PanicBindBox.TextEditable = false
	local Enabled = true
	wait(0.03)
    UIS.InputBegan:Connect(function(Input , GPE)
    if Enabled == false then
        return
    end
    Setting.PanicBind = tostring(Input.KeyCode)
    SaveSettings()
    PanicBindBox.Text = string.sub(tostring(Input.KeyCode), 14)
    wait()
    Enabled = false
    PanicBindBox:ReleaseFocus()
    end)
end)
PanicBindBox.FocusLost:Connect(function()
    game:GetService("CoreGui")["Shitmented"].Top.Container["Settings"].TabContainer["Panic Bind"].Text = " Panic Bind"
end)
local GuiToggleBox = game:GetService("CoreGui")["Shitmented"].Top.Container["Settings"].TabContainer["GUI Bind"].Side.Box
GuiToggleBox.Text = string.sub(Setting.HideBind, 14)
GuiToggleBox.Focused:Connect(function()
    game:GetService("CoreGui")["Shitmented"].Top.Container["Settings"].TabContainer["GUI Bind"].Text = " Press a key"
	GuiToggleBox.TextEditable = false
	local Enabled = true
	wait(0.03)
    UIS.InputBegan:Connect(function(Input , GPE)
    if Enabled == false then
        return
    end
    Setting.HideBind = tostring(Input.KeyCode)
    SaveSettings()
    GuiToggleBox.Text = string.sub(tostring(Input.KeyCode), 14)
    wait()
    Enabled = false
    GuiToggleBox:ReleaseFocus()
    end)
end)
GuiToggleBox.FocusLost:Connect(function()
    game:GetService("CoreGui")["Shitmented"].Top.Container["Settings"].TabContainer["GUI Bind"].Text = " GUI Bind"
end)
