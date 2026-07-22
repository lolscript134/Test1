-- MURDER MYSTERY 2 SCRIPT (Roblox Lua)
-- ИСПОЛЬЗУЙТЕ ТОЛЬКО В ПРИВАТНЫХ СЕРВЕРАХ!
-- Создано в образовательных целях

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- ========== 1. ВИЗУАЛЬНАЯ ЧАСТЬ ==========
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player.PlayerGui
ScreenGui.Name = "MM2_Script"

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -300)
MainFrame.Size = UDim2.new(0, 400, 0, 600)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Active = true
MainFrame.Draggable = true

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "⚡ MM2 СКРИПТ ⚡"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22

-- ========== 2. СКОРОСТЬ/ПРЫЖОК ==========
local SpeedFrame = Instance.new("Frame")
SpeedFrame.Parent = MainFrame
SpeedFrame.Position = UDim2.new(0, 10, 0, 50)
SpeedFrame.Size = UDim2.new(0.95, 0, 0, 140)
SpeedFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
SpeedFrame.BorderSizePixel = 0

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Parent = SpeedFrame
SpeedLabel.Size = UDim2.new(1, 0, 0, 30)
SpeedLabel.Text = "🏃 Скорость: 16"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Font = Enum.Font.GothamBold
SpeedLabel.TextSize = 16

local SpeedSlider = Instance.new("Slider")
SpeedSlider.Parent = SpeedFrame
SpeedSlider.Position = UDim2.new(0, 10, 0, 35)
SpeedSlider.Size = UDim2.new(0.9, 0, 0, 20)
SpeedSlider.MinValue = 5
SpeedSlider.MaxValue = 100
SpeedSlider.Value = 16
SpeedSlider.Changed:Connect(function(val)
    humanoid.WalkSpeed = val
    SpeedLabel.Text = "🏃 Скорость: " .. math.floor(val)
end)

local JumpLabel = Instance.new("TextLabel")
JumpLabel.Parent = SpeedFrame
JumpLabel.Position = UDim2.new(0, 0, 0, 70)
JumpLabel.Size = UDim2.new(1, 0, 0, 30)
JumpLabel.Text = "🦘 Прыжок: 50"
JumpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpLabel.BackgroundTransparency = 1
JumpLabel.Font = Enum.Font.GothamBold
JumpLabel.TextSize = 16

local JumpSlider = Instance.new("Slider")
JumpSlider.Parent = SpeedFrame
JumpSlider.Position = UDim2.new(0, 10, 0, 105)
JumpSlider.Size = UDim2.new(0.9, 0, 0, 20)
JumpSlider.MinValue = 30
JumpSlider.MaxValue = 200
JumpSlider.Value = 50
JumpSlider.Changed:Connect(function(val)
    humanoid.JumpPower = val
    JumpLabel.Text = "🦘 Прыжок: " .. math.floor(val)
end)

-- ========== 3. ESP ==========
local ESPFrame = Instance.new("Frame")
ESPFrame.Parent = MainFrame
ESPFrame.Position = UDim2.new(0, 10, 0, 200)
ESPFrame.Size = UDim2.new(0.95, 0, 0, 120)
ESPFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
ESPFrame.BorderSizePixel = 0

local ESPTitle = Instance.new("TextLabel")
ESPTitle.Parent = ESPFrame
ESPTitle.Size = UDim2.new(1, 0, 0, 30)
ESPTitle.Text = "👁️ ESP (Показать игроков)"
ESPTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPTitle.BackgroundTransparency = 1
ESPTitle.Font = Enum.Font.GothamBold
ESPTitle.TextSize = 16

local ESPToggle = Instance.new("TextButton")
ESPToggle.Parent = ESPFrame
ESPToggle.Position = UDim2.new(0.3, 0, 0, 40)
ESPToggle.Size = UDim2.new(0.4, 0, 0, 40)
ESPToggle.Text = "ВКЛ"
ESPToggle.TextColor3 = Color3.fromRGB(0, 255, 0)
ESPToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
ESPToggle.Font = Enum.Font.GothamBold
ESPToggle.TextSize = 18
ESPToggle.BorderSizePixel = 0

local espActive = false
local espObjects = {}

ESPToggle.MouseButton1Click:Connect(function()
    espActive = not espActive
    ESPToggle.Text = espActive and "ВЫКЛ" or "ВКЛ"
    ESPToggle.TextColor3 = espActive and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
    if espActive then
        CreateESP()
    else
        ClearESP()
    end
end)

function CreateESP()
    ClearESP()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
            local head = plr.Character.Head
            local billboard = Instance.new("BillboardGui")
            billboard.Parent = head
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            billboard.AlwaysOnTop = true
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Parent = billboard
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = plr.Name .. " [" .. (plr.Team and plr.Team.Name or "Нет команды") .. "]"
            nameLabel.TextColor3 = plr.Team and plr.Team.TeamColor.Color or Color3.fromRGB(255, 255, 255)
            nameLabel.Font = Enum.Font.GothamBold
            nameLabel.TextSize = 16
            nameLabel.TextStrokeTransparency = 0.3
            nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            
            table.insert(espObjects, billboard)
        end
    end
end

function ClearESP()
    for _, obj in pairs(espObjects) do
        if obj and obj.Parent then
            obj:Destroy()
        end
    end
    espObjects = {}
end

game.Players.PlayerAdded:Connect(function()
    if espActive then CreateESP() end
end)

game.Players.PlayerRemoving:Connect(function()
    if espActive then CreateESP() end
end)

-- ========== 4. ПОЛЁТ ==========
local FlyFrame = Instance.new("Frame")
FlyFrame.Parent = MainFrame
FlyFrame.Position = UDim2.new(0, 10, 0, 330)
FlyFrame.Size = UDim2.new(0.95, 0, 0, 120)
FlyFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
FlyFrame.BorderSizePixel = 0

local FlyTitle = Instance.new("TextLabel")
FlyTitle.Parent = FlyFrame
FlyTitle.Size = UDim2.new(1, 0, 0, 30)
FlyTitle.Text = "✈️ Полет (F)"
FlyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyTitle.BackgroundTransparency = 1
FlyTitle.Font = Enum.Font.GothamBold
FlyTitle.TextSize = 16

local FlySpeedLabel = Instance.new("TextLabel")
FlySpeedLabel.Parent = FlyFrame
FlySpeedLabel.Position = UDim2.new(0, 0, 0, 40)
FlySpeedLabel.Size = UDim2.new(1, 0, 0, 30)
FlySpeedLabel.Text = "Скорость полета: 20"
FlySpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FlySpeedLabel.BackgroundTransparency = 1
FlySpeedLabel.Font = Enum.Font.GothamBold
FlySpeedLabel.TextSize = 14

local FlySlider = Instance.new("Slider")
FlySlider.Parent = FlyFrame
FlySlider.Position = UDim2.new(0, 10, 0, 75)
FlySlider.Size = UDim2.new(0.9, 0, 0, 20)
FlySlider.MinValue = 5
FlySlider.MaxValue = 100
FlySlider.Value = 20

local flying = false
local flySpeed = 20
local bodyVelocity = nil

FlySlider.Changed:Connect(function(val)
    flySpeed = val
    FlySpeedLabel.Text = "Скорость полета: " .. math.floor(val)
    if bodyVelocity then
        bodyVelocity.MaxForce = Vector3.new(0, 0, 0)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    end
end)

-- Функция полета
local function toggleFly()
    flying = not flying
    
    if flying then
        if not character:FindFirstChild("BodyVelocity") then
            bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Parent = character
            bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        end
        
        humanoid.PlatformStand = true
        
        -- Обновление полета каждый кадр
        game:GetService("RunService").Heartbeat:Connect(function()
            if not flying then return end
            if not character or not character.Parent then return end
            
            local moveDirection = Vector3.new(0, 0, 0)
            local camera = workspace.CurrentCamera
            
            -- WASD управление
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                moveDirection = moveDirection + camera.CFrame.LookVector * Vector3.new(1, 0, 1)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                moveDirection = moveDirection - camera.CFrame.LookVector * Vector3.new(1, 0, 1)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                moveDirection = moveDirection - camera.CFrame.RightVector * Vector3.new(1, 0, 1)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                moveDirection = moveDirection + camera.CFrame.RightVector * Vector3.new(1, 0, 1)
            end
            
            -- Подъем/спуск
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                moveDirection = moveDirection + Vector3.new(0, 1, 0)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                moveDirection = moveDirection - Vector3.new(0, 1, 0)
            end
            
            if moveDirection.Magnitude > 0 then
                moveDirection = moveDirection.Unit * flySpeed
            end
            
            if bodyVelocity then
                bodyVelocity.Velocity = moveDirection
            end
        end)
    else
        if bodyVelocity then
            bodyVelocity:Destroy()
            bodyVelocity = nil
        end
        humanoid.PlatformStand = false
    end
end

-- Горячая клавиша F
game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.F then
        toggleFly()
    end
end)

-- Кнопка полета
local FlyButton = Instance.new("TextButton")
FlyButton.Parent = FlyFrame
FlyButton.Position = UDim2.new(0.35, 0, 0, 40)
FlyButton.Size = UDim2.new(0.3, 0, 0, 30)
FlyButton.Text = "Активировать"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 100)
FlyButton.Font = Enum.Font.GothamBold
FlyButton.TextSize = 16
FlyButton.BorderSizePixel = 0

FlyButton.MouseButton1Click:Connect(function()
    toggleFly()
    FlyButton.Text = flying and "Деактивировать" or "Активировать"
    FlyButton.TextColor3 = flying and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(255, 255, 255)
end)

-- ========== ДОПОЛНИТЕЛЬНО: Кнопка закрытия ==========
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = MainFrame
CloseBtn.Position = UDim2.new(0.9, 0, 0, 5)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 20

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Открытие по нажатию на правый Shift
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

print("✅ MM2 скрипт загружен! Нажмите Правый Shift для открытия меню")
