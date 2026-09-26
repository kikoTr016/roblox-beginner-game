-- Put this script in ServerScriptService

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local coinsFolder = Workspace:FindFirstChild("Coins")

if not coinsFolder then
    warn("Create a folder named 'Coins' in Workspace and place coin parts inside it.")
end

local totalCoins = 0
local collectedCoins = {}

if coinsFolder then
    for _, child in ipairs(coinsFolder:GetChildren()) do
        if child:IsA("BasePart") then
            totalCoins += 1
        end
    end
end

local function setupPlayer(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local coinValue = Instance.new("IntValue")
    coinValue.Name = "Coins"
    coinValue.Value = 0
    coinValue.Parent = leaderstats

    local playerGui = player:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CoinHUD"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local coinLabel = Instance.new("TextLabel")
    coinLabel.Size = UDim2.new(0, 220, 0, 40)
    coinLabel.Position = UDim2.new(0, 20, 0, 20)
    coinLabel.BackgroundTransparency = 1
    coinLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    coinLabel.Font = Enum.Font.GothamBold
    coinLabel.TextSize = 22
    coinLabel.Text = "Coins: 0/0"
    coinLabel.Parent = screenGui

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(0, 260, 0, 50)
    statusLabel.Position = UDim2.new(0.5, -130, 0, 80)
    statusLabel.BackgroundTransparency = 1
    statusLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    statusLabel.Font = Enum.Font.GothamBlack
    statusLabel.TextSize = 30
    statusLabel.Text = ""
    statusLabel.Parent = screenGui

    local function updateHud()
        coinLabel.Text = "Coins: " .. coinValue.Value .. "/" .. totalCoins

        if totalCoins > 0 and coinValue.Value >= totalCoins then
            statusLabel.Text = "YOU WIN!"
        else
            statusLabel.Text = ""
        end
    end

    coinValue.Changed:Connect(updateHud)
    updateHud()
end

local function onCoinTouched(coin, player)
    if collectedCoins[coin] then
        return
    end

    collectedCoins[coin] = true

    local leaderstats = player:FindFirstChild("leaderstats")
    if not leaderstats then
        return
    end

    local coinCountValue = leaderstats:FindFirstChild("Coins")
    if not coinCountValue then
        return
    end

    coinCountValue.Value += 1
    coin.CanCollide = false
    coin.Transparency = 1

    task.delay(0.2, function()
        if coin and coin.Parent then
            coin:Destroy()
        end
    end)
end

for _, child in ipairs(coinsFolder:GetChildren()) do
    if child:IsA("BasePart") then
        child.Touched:Connect(function(hit)
            local character = hit.Parent
            if not character then
                return
            end

            local player = Players:GetPlayerFromCharacter(character)
            if not player then
                return
            end

            onCoinTouched(child, player)
        end)
    end
end

Players.PlayerAdded:Connect(function(player)
    setupPlayer(player)
end)

for _, player in ipairs(Players:GetPlayers()) do
    setupPlayer(player)
end
