local PickupPoint = workspace.Interactions.NPCs.ChickenJob["Interaction.Part"]
local proximityPrompt = PickupPoint:FindFirstChildWhichIsA("ProximityPrompt")
local GC = getconnections or get_signal_cons
	if GC then
		for i,v in pairs(GC(game.Players.LocalPlayer.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
end
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
    kfc.Position = Vector3.new(-230.136002, -5.29420757, 168.928955)
    kfc.Size = Vector3.new(5, 1, 5)
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-230.136002, -1.29420757, 168.928955)
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
