if game.PlaceId == 6131548149 then
local HttpService = game:GetService("HttpService");
local SaveFileName = "AutoFarmingKFCandWatermelon.lua"
local Configuration = {AutoEnabled = false}
if not pcall(function()
    readfile(SaveFileName)
end) then
writefile(SaveFileName, HttpService:JSONEncode(Configuration))
end
local Setting = HttpService:JSONDecode(readfile(SaveFileName))
local function SaveSettings()
   writefile(SaveFileName, HttpService:JSONEncode(Setting))
end

if not Setting.AutoDestroy then
    writefile(SaveFileName, HttpService:JSONEncode({AutoEnabled = Setting.AutoEnabled, AutoDestroy = Setting.AutoDestroy}))
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/stitchTheElite/Rodus-V1.0/main/lib.lua", true))()
CreateMain("Chicken AutoFarm")
CreateTab("Enable/Disable")
CreateTab("AutoDestroy")

CreateToggle(tabs['Enable/Disable'], "Enabled", "",function()
    if not Setting.AutoEnabled then
        Setting.AutoEnabled = true
        SaveSettings()
        print("AutoExecuting:",Setting.AutoEnabled)
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/DivineEntity01/Shitmented/main/AutoExecute%20Chicken%20Farm.lua')))()
    else
        Setting.AutoEnabled = false
        SaveSettings()
        print("AutoExecuting:",Setting.AutoEnabled)
        wait(1)
        if #game.Players:GetPlayers() <= 1 then
		game.Players.LocalPlayer:Kick("\nRejoining...")
        wait()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
		else
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
		end
    end
end)
CreateToggle(tabs['AutoDestroy'], "Enabled", "",function()
    if not Setting.AutoDestroy then
        local times = 0
        Setting.AutoDestroy = true
        SaveSettings()
        game:GetService("CoreGui")["Chicken AutoFarm"].Top.Container["AutoDestroy"].TabContainer.Enabled.Text = "Destroying..."
        while wait(1) do
        if not Setting.AutoDestroy then
            break
        end
    if not game:GetService("CoreGui"):WaitForChild("Chicken AutoFarm", 0.03) then
        break
    end
    times = times + 1
    print("Destroying in", 6 - times)
    if times >= 6 then
        if game:GetService("CoreGui"):WaitForChild("Chicken AutoFarm", 0.03) then
            game:GetService("CoreGui")["Chicken AutoFarm"]:Destroy()
        else
            break
        end
    elseif times < 6 then
        if not Setting.AutoDestroy then
            break
        end
    end
    end
    else
        game:GetService("CoreGui")["Chicken AutoFarm"].Top.Container["AutoDestroy"].TabContainer.Enabled.Text = "Disabled"
        Setting.AutoDestroy = false
        SaveSettings()
    end
end)
game:GetService("CoreGui")["Chicken AutoFarm"].Top.Container["AutoDestroy"].TabContainer.Enabled.Text = "Disabled"
if Setting.AutoEnabled then
    game:GetService("CoreGui")["Chicken AutoFarm"].Top.Container["Enable/Disable"].TabContainer.Enabled.TextColor3 = Color3.new(0, 255, 0)
    game:GetService("CoreGui")["Chicken AutoFarm"].Top.Container["Enable/Disable"].TabContainer.Enabled.Toggled.Value = true
    print("AutoExecuting:",Setting.AutoEnabled)
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/DivineEntity01/Shitmented/main/AutoExecute%20Chicken%20Farm.lua')))()
    game:GetService("Workspace").DecorationsMouseFilter.SoundHandler.Chken.Sounds.Sound.Playing = false
else
    print("AutoExecuting:",Setting.AutoEnabled)
    game:GetService("CoreGui")["Chicken AutoFarm"].Top.Container["Enable/Disable"].TabContainer.Enabled.TextColor3 = Color3.new(255, 255, 255)
    game:GetService("CoreGui")["Chicken AutoFarm"].Top.Container["Enable/Disable"].TabContainer.Enabled.Toggled.Value = false
end
if Setting.AutoDestroy then
local times = 0
game:GetService("CoreGui")["Chicken AutoFarm"].Top.Container["AutoDestroy"].TabContainer.Enabled.Text = "Destroying..."
game:GetService("CoreGui")["Chicken AutoFarm"].Top.Container["AutoDestroy"].TabContainer.Enabled.TextColor3 = Color3.new(0, 255, 0)
while wait(1) do
    if not Setting.AutoDestroy then
            break
    end
    if not game:GetService("CoreGui"):WaitForChild("Chicken AutoFarm", 0.03) then
        break
    end
    times = times + 1
    print("Destroying in", 6 - times)
    if times >= 6 then
        if game:GetService("CoreGui"):WaitForChild("Chicken AutoFarm", 0.03) then
            game:GetService("CoreGui")["Chicken AutoFarm"]:Destroy()
        else
            break
        end
    elseif times < 6 then
        if not Setting.AutoDestroy then
            break
        end
    end
end
else
    wait(1)
    game:GetService("CoreGui")["Chicken AutoFarm"].Top.Container["AutoDestroy"].TabContainer.Enabled.Text = "Disabled"
end
end
