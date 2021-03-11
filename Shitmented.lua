if game:GetService("CoreGui"):WaitForChild("Shitmented", 1) then
game:GetService("CoreGui")["Shitmented"]:Destroy()
end
if game.workspace:WaitForChild('KfcAndWatermelon', 1) then
game.workspace:WaitForChild('KfcAndWatermelon', 1):Destroy()
end
getgenv().KillAll = false

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
CreateTab("Combat")
CreateTab("Blatant")
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

CreateToggle(tabs['Combat'], "ReloadAmmo", "Reloads Ammo and Buys Medkits",function()
    if not getgenv().Reload then
        local StarterGui = game:GetService("StarterGui") 
        getgenv().Reload = true
        StarterGui:SetCore("SendNotification", {
	    Title = "RELOADING",
	    Text = ">>THIS TAKES LIKE 5 SECONDS<<",
	    Duration = 2})
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DivineEntity01/Shitmented/main/Reload%20Ammo", true))()
        wait(0.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.5984497, 3.96082091, -85.1608734)
        local args = {[1] = "RefillAmmo",[2] = "GunDealer",[3] = "EZI",[4] = workspace.Interactions.Vendors.GunDealer}
        local args = {[1] = "RefillAmmo",[2] = "GunDealer",[3] = "C-AKS",[4] = workspace.Interactions.Vendors.GunDealer}
        game:GetService("ReplicatedStorage")["_G.ShopConfig"].PurchaseEvent:FireServer(unpack(args))
        game:GetService("ReplicatedStorage")["_G.ShopConfig"].PurchaseEvent:FireServer(unpack(args))
    else
        getgenv().Reload = false
    end
end)

CreateToggle(tabs['Combat'], "Instant Use", "Uses Medkits/Bandages instantly, manually equip them",function()
    if not getgenv().Instant then
        getgenv().Instant = true
        function INSTANT()
game.Players.LocalPlayer.Character.ChildAdded:Connect(function(child)
    if child:IsA("Tool") and getgenv().Instant then
        if child.Name == 'Bandage' then
        wait()
local args = {
    [1] = "HealSelf",
    [2] = game:GetService("Players").LocalPlayer.Character.Bandage
}
        game:GetService("ReplicatedStorage")["Healing.Assets"]["Healing.Remote"]:FireServer(unpack(args))
        elseif child.Name == "Medkit" then
            wait()
local args = {
    [1] = "HealSelf",
    [2] = game:GetService("Players").LocalPlayer.Character.Medkit
}
game:GetService("ReplicatedStorage")["Healing.Assets"]["Healing.Remote"]:FireServer(unpack(args))
        end
    end
end)
end
        INSTANT()
        local function onCharacterAdded(character)
	if character.Name == game.Players.LocalPlayer.Name then
	wait(5)
    INSTANT()
    end
    end

    local function onPlayerAdded(player)
    game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
    end
    onPlayerAdded()
    else
        getgenv().Instant = false
    end
end)
CreateToggle(tabs['Blatant'], "Farm Cash", "Executes a modified version of Egg Salad's",function()
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
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-224.045609, 2.9000001, 164.001328)
    end
end)

CreateButton(tabs['Combat'], "GameSense", "Loads GameSense with my custom settings",function()
    if not getgenv().Aimbot then
        getgenv().Aimbot = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DivineEntity01/Shitmented/main/Custom%20GameSense.lua", true))()
    end
end)

CreateButton(tabs['Combat'], "Unnamed ESP", "Loads Unnamed ESP",function()
    if not getgenv().ESP then
        getgenv().ESP = true
        loadstring(game:HttpGet'https://ic3w0lf.xyz/rblx/protoesp.lua')()
    end
end)

CreateButton(tabs['Blatant'], "NoFall", "Kinda Works, i don't really know",function()
    if not getgenv().NoFall then
        getgenv().NoFall = true
        loadstring(game:HttpGet'https://raw.githubusercontent.com/DivineEntity01/Shitmented/main/NoFall')()
    end
end)

CreateButton(tabs['Blatant'], "HYPERMEGABASEPLATE", "Creates a Huge Baseplate, and destroys buildings",function()
if not getgenv().Baseplate then
loadstring(game:HttpGet'https://raw.githubusercontent.com/DivineEntity01/Shitmented/main/HYPERMEGABASEPLATE')()
end
end)

CreateToggle(tabs['Combat'], "No CombatLog", "Doesn't ensure you won't get logged when you leave",function()
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

CreateToggle(tabs['Blatant'], "Always Sprint", "Infinite sprint, but i would recommend using Always Sprint...",function()
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

CreateToggle(tabs['Blatant'], "Kill Aura", "Kinda works, shoot to someone close and you'll kill him/them",function()
    if not getgenv().KillAll then
    getgenv().KillAll = true
    while true do
        if not getgenv().KillAll then
            break
        end
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

CreateToggle(tabs['Blatant'], "Heal Low", "God damn it just update this game already, this works barely, but use it tho",function()
if not getgenv().HealLow then
    getgenv().HealLow = true
    wait(0.5)
    getgenv().d = false
local medkits
local bandages
function Detect()
game.Players.LocalPlayer.Character.ChildAdded:Connect(function(child)
if child:IsA("Tool") and getgenv().HealLow then
if child.Name == 'Bandage' then
    wait()
local args = {
    [1] = "HealSelf",
    [2] = game:GetService("Players").LocalPlayer.Character:WaitForChild("Bandage", 5)
}
        game:GetService("ReplicatedStorage")["Healing.Assets"]["Healing.Remote"]:FireServer(unpack(args))
        elseif child.Name == "Medkit" then
            wait()
local args = {
    [1] = "HealSelf",
    [2] = game:GetService("Players").LocalPlayer.Character:WaitForChild("Medkit", 5)
}
game:GetService("ReplicatedStorage")["Healing.Assets"]["Healing.Remote"]:FireServer(unpack(args))
        end
end
end)
end

Detect()

for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui["HP.UI"].Holder:GetChildren()) do
for _,V in pairs(v:GetChildren()) do
if V.Name == "Bar" and V.Parent.Name ~= "Stamina"  then
V:GetPropertyChangedSignal("Size"):Connect(function()
    if not getgenv().d and V.Size.Y.Scale <= 0.85 and getgenv().HealLow then
    --INITIAL DEBOUNCE
    getgenv().d = true
    if game.Players.LocalPlayer.Backpack:WaitForChild("Medkit",0.1) and not game.Players.LocalPlayer.Character:WaitForChild("Medkit",0.1) then
        medkits = true
        wait(0.01)
        if game.Players.LocalPlayer.Backpack:WaitForChild("Medkit",0.001) then
        game.Players.LocalPlayer.Backpack:WaitForChild("Medkit",0.001).Parent = game.Players.LocalPlayer.Character
        end
    else
        medkits = false
    end
    if not medkits and game.Players.LocalPlayer.Backpack:WaitForChild("Bandage",0.1) and not game.Players.LocalPlayer.Character:WaitForChild("Bandage",0.1) then
        wait(0.01)
        if game.Players.LocalPlayer.Backpack:WaitForChild("Bandage",0.001) then
        game.Players.LocalPlayer.Backpack:WaitForChild("Bandage",0.001).Parent = game.Players.LocalPlayer.Character
        end
    end
    wait(0.02)
    --DEBOUNCE END
    getgenv().d = false
    end
end)
end
end
end
else
    getgenv().HealLow = false
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

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local bindable = Instance.new("BindableFunction")
local str = "%s joined the game"
local str2 = "%s left the game"


if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Cook.UI", 10) then
    if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ModAlert", 0.01) then
        game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ModAlert",0.01):Destroy()
    end
    local sd = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Cook.UI"):Clone()
    sd.Name, sd.Parent = "ModAlert", game:GetService("Players").LocalPlayer.PlayerGui
    wait(0.005)
    sd.Enabled, sd.Frame.TextLabel.Text = false, "THERE'S A MOD IN GAME"
end







a = {
    "GucciGangHypebeast",
    "S_nnister",
    "1run_k",
    "grlkukbure",
    "mak_yIa",
    "edoghouston",
    "viamarss",
    "Chrisoski",
    "R_wanoski",
    "Erickoski",
    "ZeroCantAim",
    "azasincraft"
}
 
function bindable.OnInvoke(response)
    game.Players.LocalPlayer:Kick("You have been banned from the game")
end

function check()
for i,v in pairs(game.Players:GetChildren()) do
for _,e in pairs(a) do
    if string.lower(v.Name) == string.lower(e) then
    print(string.format(str, tostring(v)))
    game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ModAlert",5).Enabled = true
    StarterGui:SetCore("SendNotification", {
	Title = ">>MOD ALERT<<",
	Text = string.format(str, tostring(v)),
	Callback = bindable,
	Button1 = "PANIC",
	Duration = 5})
end
end
end
end

local function onCharacterAdded(character)
for _,v in pairs(a) do
    if tostring(string.lower(character.Name)) == string.lower(v) then
    game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ModAlert",5).Enabled = true
    print(string.format(str, tostring(v)))
    StarterGui:SetCore("SendNotification", {
	Title = ">>MOD ALERT<<",
	Text = string.format(str, tostring(v)),
	Callback = bindable,
	Button1 = "PANIC",
	Duration = 5})
end
end
end

local function onCharacterRemoving(character)
	for _,v in pairs(a) do
    if tostring(string.lower(character.Name)) == string.lower(v) then
    print(string.format(str2, tostring(v)))
    game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ModAlert",5).Enabled = false
    StarterGui:SetCore("SendNotification", {
	Title = "Enjoy while it lasts...",
	Text = string.format(str2, tostring(v)),
	Duration = 5})
end
end
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(onCharacterAdded)
	player.CharacterRemoving:Connect(onCharacterRemoving)
end

Players.PlayerAdded:Connect(onPlayerAdded)
check()


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
