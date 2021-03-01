local PickupPoint = workspace.Interactions.NPCs.ChickenJob["Interaction.Part"]
local proximityPrompt = PickupPoint:FindFirstChildWhichIsA("ProximityPrompt")
function fireproximityprompt(ProximityPrompt, Amount, Skip)
    assert(ProximityPrompt, "Argument #1 Missing or nil")
    assert(typeof(ProximityPrompt) == "Instance" and ProximityPrompt:IsA("ProximityPrompt"), "Attempted to fire a Value that is not a ProximityPrompt")

    local HoldDuration = ProximityPrompt.HoldDuration
    if Skip then
        ProximityPrompt.HoldDuration = 0
    end

    for i = 1, Amount or 1 do
        ProximityPrompt:InputHoldBegin()
        if Skip then
            local RunService = game:GetService("RunService")
            local Start = time()
            repeat
                RunService.Heartbeat:Wait(0.1)
            until time() - Start > HoldDuration
        end
        ProximityPrompt:InputHoldEnd()
    end
    ProximityPrompt.HoldDuration = HoldDuration
end
if not game.workspace:WaitForChild('KfcAndWatermelon', 1) then
    kfc = Instance.new('Part')
    kfc.Anchored = true
    kfc.Parent = workspace
    kfc.Name = 'KfcAndWatermelon'
    kfc.Position = Vector3.new(-227.376862, 0.791749, 171.235703)
    kfc.Size = Vector3.new(5, 1, 5)
end
if game:GetService("Workspace"):WaitForChild('Buildings', 1) then
for _,v in pairs(game:GetService("Workspace").Buildings.KFCPlace:GetChildren()) do
    if v:IsA("BasePart") then
    if v.Size == Vector3.new(3.6, 20.5, 53.3)  then
        v.CanCollide = false
    end
    end
end
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-227.376862, 4.791749, 171.235703)
local cock = game.ReplicatedStorage.CookingRemote
cock.OnClientEvent:Connect(function(femboy, ...)
    local eggs = {...}
    if femboy == "Add" and eggs[3]>=eggs[2]-0.07 then
        cock:FireServer("Finish", eggs[1])
    elseif femboy == "Stop" or femboy == "Hide" then
        fireproximityprompt(workspace.Interactions.NPCs.ChickenJob["Interaction.Part"].ChickenJob,1,true)
    end
end)
wait(0.3)
proximityPrompt:InputHoldBegin()
wait()
proximityPrompt:InputHoldEnd()
