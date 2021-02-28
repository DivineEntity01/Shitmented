local HttpService = game:GetService("HttpService");
local SaveFileName = "Shitmented.pp"
local Configuration = {HideBind = 'Enum.KeyCode.RightAlt'}
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



if game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08) then
wait()
elseif not game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08) then
loadstring(game:HttpGet("https://raw.githubusercontent.com/DivineEntity01/BSS-01/main/Rodus%20%7C%20UI-Library", true))()
wait()
CreateMain("Shitmented")
CreateTab("Scripts")
CreateTab("Settings")
end

function onInputBegan(input,gameProcessed)
if input.UserInputType == Enum.UserInputType.Keyboard and Setting.HideBind:lower()==tostring(input.KeyCode):lower() and not gameProcessed and game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08) then
    if game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08).Top.Visible == false then 
        game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08).Top.Visible = true
    else 
        game:GetService('CoreGui'):WaitForChild('Shitmented', 0.08).Top.Visible = false 
end
end
end
game:GetService("UserInputService").InputBegan:connect(onInputBegan)


--[[


        SCRIPTS


]]
CreateButton(tabs['Scripts'], "Farm Cash", "Executes a modified version of Egg Salad's",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DivineEntity01/Shitmented/main/Egg%20Salad's%20AutoFarm(Modified).lua", true))()
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

local function onCharacterAdded(character)
	if character.Name == game.Players.LocalPlayer then
	    wait(1)
	    character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Props.TrashDecal4.Position)
    end
end
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

--[[


        Settings


]]
