local OrionLib = loadstring(game:HttpGet(('https://githubusercontent.com')))()

local Window = OrionLib:MakeWindow({
    Name = "Block Tales: Mudroads Hub 🚗", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "BlockTalesCarGame",
    IntroText = "Đang tải Menu Lái Xe..."
})

local InfiniteLives = false
local AutoDrive = false

local CarTab = Window:MakeTab({
    Name = "Mudroads Mod",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

CarTab:AddToggle({
    Name = "Tự động né vật cản (Auto Dodge)",
    Default = false,
    Callback = function(Value)
        AutoDrive = Value
        task.spawn(function()
            while AutoDrive do
                task.wait(0.1)
                pcall(function()
                    local workspace = game:GetService("Workspace")
                    local minigameFolder = workspace:FindFirstChild("MudroadsMinigame")
                    
                    if minigameFolder then
                        for _, obstacle in pairs(minigameFolder:GetChildren()) do
                            if obstacle:IsA("Part") and obstacle.Name == "Obstacle" then
                                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - obstacle.Position).Magnitude
                                if distance < 15 then
                                    game:GetService("ReplicatedStorage").Events.CarMove:FireServer("Left") 
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end    
})

OrionLib:Init()
