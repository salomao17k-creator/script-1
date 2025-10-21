local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local function createESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = Color3.new(1, 0, 0) -- vermelho
    box.Thickness = 2
    box.Transparency = 1

    RunService.RenderStepped:Connect(function()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local pos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            if onScreen then
                box.Size = Vector2.new(50, 50)
                box.Position = Vector2.new(pos.X - 25, pos.Y - 25)
                box.Visible = true
            else
                box.Visible = false
            end
        end
    end)
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= Players.LocalPlayer then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= Players.LocalPlayer then
        createESP(player)
    end
end)
