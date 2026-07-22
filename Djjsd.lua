
```lua
-- Murder Mystery 2 Script (Roblox Lua)
-- GUI Menu with ESP, Speed/Jump, Noclip/Flight
-- Created for educational purposes

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local gui = Instance.new("ScreenGui")
gui.Name = "MM2Script"
gui.Parent = player.PlayerGui

-- Main Menu Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 450)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Murder Mystery 2 Script"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.Parent = titleBar

-- Collapse Button
local collapseBtn = Instance.new("TextButton")
collapseBtn.Size = UDim2.new(0, 25, 0, 25)
collapseBtn.Position = UDim2.new(1, -30, 0, 2)
collapseBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
collapseBtn.Text = "-"
collapseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
collapseBtn.Font = Enum.Font.SourceSansBold
collapseBtn.TextSize = 16
collapseBtn.Parent = titleBar

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -60, 0, 2)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 16
closeBtn.Parent = titleBar

-- Content Container (collapsible)
local content = Instance.new("Frame")
content.Size = UDim2.new(1, 0, 1, -30)
content.Position = UDim2.new(0, 0, 0, 30)
content.BackgroundTransparency = 1
content.Parent = mainFrame

-- Scrollable container
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, 0, 1, 0)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 600)
scroll.ScrollBarThickness = 4
scroll.Parent = content

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 5)
listLayout.Parent = scroll

-- Section creation helper
local function createSection(titleText, order)
    local section = Instance.new("Frame")
    section.Size = UDim2.new(1, -10, 0, 100)
    section.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    section.BorderSizePixel = 0
    section.LayoutOrder = order
    section.Parent = scroll
    
    local header = Instance.new("TextLabel")
    header.Size = UDim2.new(1, 0, 0, 25)
    header.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
    header.Text = titleText
    header.TextColor3 = Color3.fromRGB(255, 255, 255)
    header.Font = Enum.Font.SourceSansBold
    header.TextSize = 14
    header.Parent = section
    
    local body = Instance.new("Frame")
    body.Size = UDim2.new(1, 0, 1, -25)
    body.Position = UDim2.new(0, 0, 0, 25)
    body.BackgroundTransparency = 1
    body.Parent = section
    
    return section, body
end

-- Movement Section
local moveSection, moveBody = createSection("Movement Settings", 1)
moveSection.Size = UDim2.new(1, -10, 0, 120)

-- Speed Slider
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0.5, 0, 0, 20)
speedLabel.Position = UDim2.new(0, 5, 0, 5)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed: 16"
speedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
speedLabel.Font = Enum.Font.SourceSans
speedLabel.TextSize = 13
speedLabel.Parent = moveBody

local speedSlider = Instance.new("TextBox")
speedSlider.Size = UDim2.new(0.4, 0, 0, 25)
speedSlider.Position = UDim2.new(0.5, 5, 0,

Ярослав Уранов, сегодня в 1:10
5)
speedSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
speedSlider.Text = "16"
speedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
speedSlider.Font = Enum.Font.SourceSans
speedSlider.TextSize = 13
speedSlider.Parent = moveBody

-- Jump Slider
local jumpLabel = Instance.new("TextLabel")
jumpLabel.Size = UDim2.new(0.5, 0, 0, 20)
jumpLabel.Position = UDim2.new(0, 5, 0, 35)
jumpLabel.BackgroundTransparency = 1
jumpLabel.Text = "Jump: 50"
jumpLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
jumpLabel.Font = Enum.Font.SourceSans
jumpLabel.TextSize = 13
jumpLabel.Parent = moveBody

local jumpSlider = Instance.new("TextBox")
jumpSlider.Size = UDim2.new(0.4, 0, 0, 25)
jumpSlider.Position = UDim2.new(0.5, 5, 0, 35)
jumpSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
jumpSlider.Text = "50"
jumpSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpSlider.Font = Enum.Font.SourceSans
jumpSlider.TextSize = 13
jumpSlider.Parent = moveBody

-- Noclip Toggle
local noclipToggle = Instance.new("TextButton")
noclipToggle.Size = UDim2.new(0.4, 0, 0, 25)
noclipToggle.Position = UDim2.new(0.5, 5, 0, 65)
noclipToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
noclipToggle.Text = "Noclip: OFF"
noclipToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipToggle.Font = Enum.Font.SourceSans
noclipToggle.TextSize = 13
noclipToggle.Parent = moveBody

local noclipEnabled = false

-- ESP Section
local espSection, espBody = createSection("ESP Settings", 2)
espSection.Size = UDim2.new(1, -10, 0, 120)

local espToggle = Instance.new("TextButton")
espToggle.Size = UDim2.new(0.4, 0, 0, 30)
espToggle.Position = UDim2.new(0.3, 0, 0, 10)
espToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
espToggle.Text = "ESP: OFF"
espToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
espToggle.Font = Enum.Font.SourceSans
espToggle.TextSize = 14
espToggle.Parent = espBody

local espEnabled = false
local espObjects = {}

-- Flight Section
local flightSection, flightBody = createSection("Flight Settings", 3)
flightSection.Size = UDim2.new(1, -10, 0, 150)

local flightToggle = Instance.new("TextButton")
flightToggle.Size = UDim2.new(0.4, 0, 0, 30)
flightToggle.Position = UDim2.new(0.3, 0, 0, 5)
flightToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
flightToggle.Text = "Flight: OFF"
flightToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
flightToggle.Font = Enum.Font.SourceSans
flightToggle.TextSize = 14
flightToggle.Parent = flightBody

-- Flight Speed
local flightSpeedLabel = Instance.new("TextLabel")
flightSpeedLabel.Size = UDim2.new(0.5, 0, 0, 20)
flightSpeedLabel.Position = UDim2.new(0, 5, 0, 40)
flightSpeedLabel.BackgroundTransparency = 1
flightSpeedLabel.Text = "Flight Speed: 50"
flightSpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
flightSpeedLabel.Font = Enum.Font.SourceSans
flightSpeedLabel.TextSize = 13
flightSpeedLabel.Parent = flightBody

local flightSpeedBox = Instance.new("TextBox")
flightSpeedBox.Size = UDim2.new(0.3, 0, 0, 25)
flightSpeedBox.Position = UDim2.new(0.5, 5, 0, 40)
flightSpeedBox.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
flightSpeedBox.Text = "50"
flightSpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
flightSpeedBox.Font = Enum.Font.SourceSans
flightSpeedBox.TextSize = 13
flightSpeedBox.Parent = flightBody

-- Flight Noclip
local flightNoclipToggle = Instance.new("TextButton")
flightNoclipToggle.Size = UDim2.new(0.4, 0, 0, 25)
flightNoclipToggle.Position = UDim2.new(0.3, 0, 0, 75)
flightNoclipToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
flightNoclipToggle.Text = "Noclip: OFF"
flightNoclipToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
flightNoclipToggle.Font = Enum.Font.SourceSans
flightNoclipToggle.TextSize = 13
flightNoclipToggle.Parent = flightBody

local flying = false
local flightNoclip = false
local flySpeed = 50

-- Toggle Menu Collapse
local collapsed = false
collapseBtn.MouseButton1Click:Connect(function()
    collapsed = not collapsed
    content.Visible = not collapsed
    collapseBtn.Text = collapsed and "+" or "-"
    mainFrame.Size = collapsed and UDim2.new(0, 350, 0, 30) or UDim2.new(0,

Ярослав Уранов, сегодня в 1:10
350, 0, 450)
end)

-- Close Menu
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Speed & Jump Functions
local function updateSpeed(val)
    local num = tonumber(val) or 16
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = num
    end
    speedLabel.Text = "Speed: " .. num
end

local function updateJump(val)
    local num = tonumber(val) or 50
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = num
    end
    jumpLabel.Text = "Jump: " .. num
end

speedSlider.FocusLost:Connect(function(enter)
    if enter then
        updateSpeed(speedSlider.Text)
    end
end)

jumpSlider.FocusLost:Connect(function(enter)
    if enter then
        updateJump(jumpSlider.Text)
    end
end)

-- Noclip (Movement section)
noclipToggle.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    noclipToggle.Text = noclipEnabled and "Noclip: ON" or "Noclip: OFF"
    noclipToggle.BackgroundColor3 = noclipEnabled and Color3.fromRGB(30, 120, 30) or Color3.fromRGB(60, 60, 75)
    
    if noclipEnabled then
        game:GetService("RunService").Stepped:Connect(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
                player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            end
        end)
    end
end)

-- ESP System
local function getPlayerRole(playerObj)
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= playerObj then
            if v.Character and v.Character:FindFirstChild("murderer") then
                return "Murderer"
            elseif v.Character and v.Character:FindFirstChild("sheriff") then
                return "Sheriff"
            elseif v.Character and v.Character:FindFirstChild("innocent") then
                return "Innocent"
            end
        end
    end
    return "Unknown"
end

local function getRoleColor(role)
    if role == "Murderer" then
        return Color3.fromRGB(255, 0, 0)
    elseif role == "Sheriff" then
        return Color3.fromRGB(0, 150, 255)
    elseif role == "Innocent" then
        return Color3.fromRGB(0, 255, 0)
    else
        return Color3.fromRGB(255, 255, 255)
    end
end

local function createESP()
    if espObjects then
        for _, v in pairs(espObjects) do
            if v and v.Parent then
                v:Destroy()
            end
        end
        espObjects = {}
    end
    
    if not espEnabled then return end
    
    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
            local role = getPlayerRole(plr)
            local color = getRoleColor(role)
            
            local espBox = Instance.new("BoxHandleAdornment")
            espBox.Adornee = plr.Character
            espBox.ZIndex = 0
            espBox.Size = Vector3.new(4, 5, 2)
            espBox.AlwaysOnTop = true
            espBox.Color3 = color
            espBox.Parent = plr.Character
            
            local espLine = Instance.new("SelectionBox")
            espLine.Adornee = plr.Character
            espLine.Color3 = color
            espLine.Transparency = 0.5
            espLine.Parent = plr.Character
            
            local nameTag = Instance.new("BillboardGui")
            nameTag.Size = UDim2.new(0, 200, 0, 30)
            nameTag.Adornee = plr.Character.Head
            nameTag.StudsOffset = Vector3.new(0, 3, 0)
            nameTag.Parent = plr.Character
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = plr.Name .. " (" .. role .. ")"
            nameLabel.TextColor3 = color
            nameLabel.TextScaled = true

Ярослав Уранов, сегодня в 1:10
nameLabel.Font = Enum.Font.SourceSansBold
            nameLabel.Parent = nameTag
            
            table.insert(espObjects, espBox)
            table.insert(espObjects, espLine)
            table.insert(espObjects, nameTag)
        end
    end
end

espToggle.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    espToggle.Text = espEnabled and "ESP: ON" or "ESP: OFF"
    espToggle.BackgroundColor3 = espEnabled and Color3.fromRGB(30, 120, 30) or Color3.fromRGB(60, 60, 75)
    
    if not espEnabled then
        for _, v in pairs(espObjects) do
            if v and v.Parent then
                v:Destroy()
            end
        end
        espObjects = {}
    else
        createESP()
    end
end)

-- Flight System
local function startFlight()
    flying = true
    local char = player.Character
    if not char then return end
    local humanoid = char:FindFirstChild("Humanoid")
    if not humanoid then return end
    
    if flightNoclip then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    end
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    bodyVelocity.Parent = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
    
    while flying and player.Character do
        local rootPart = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
        if rootPart then
            local direction = Vector3.new()
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                direction = direction + char:FindFirstChild("HumanoidRootPart").CFrame.LookVector
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                direction = direction - char:FindFirstChild("HumanoidRootPart").CFrame.LookVector
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                direction = direction - char:FindFirstChild("HumanoidRootPart").CFrame.RightVector
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                direction = direction + char:FindFirstChild("HumanoidRootPart").CFrame.RightVector
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                direction = direction + Vector3.new(0, 1, 0)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                direction = direction - Vector3.new(0, 1, 0)
            end
            
            if direction.Magnitude > 0 then
                bodyVelocity.Velocity = direction.Unit * flySpeed
            else
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end
        end
        game:GetService("RunService").Heartbeat:Wait()
    end
    
    if bodyVelocity then
        bodyVelocity:Destroy()
    end
end

flightToggle.MouseButton1Click:Connect(function()
    flying = not flying
    flightToggle.Text = flying and "Flight: ON" or "Flight: OFF"
    flightToggle.BackgroundColor3 = flying and Color3.fromRGB(30, 120, 30) or Color3.fromRGB(60, 60, 75)
    
    if flying then
        startFlight()
    end
end)

flightSpeedBox.FocusLost:Connect(function(enter)
    if enter then
        local num = tonumber(flightSpeedBox.Text) or 50
        flySpeed = num
        flightSpeedLabel.Text = "Flight Speed: " .. num
    end
end)

flightNoclipToggle.MouseButton1Click:Connect(function()
    flightNoclip = not flightNoclip
    flightNoclipToggle.Text = flightNoclip and "Noclip: ON" or "Noclip: OFF"
    flightNoclipToggle.BackgroundColor3 = flightNoclip and Color3.fromRGB(30, 120, 30) or Color3.fromRGB(60, 60, 75)
end)

-- Auto-update ESP when players join/leave
game:GetService("Players").PlayerAdded:Connect(function()
    if espEnabled then
        createESP()
    end
end)

game:GetService("Players").PlayerRemoving:Connect(function()
    if espEnabled then
        createESP()

Ярослав Уранов, сегодня в 1:10
end
end)

-- Update ESP when roles change (simple check)
game:GetService("RunService").Heartbeat:Connect(function()
    if espEnabled then
        createESP()
    end
end)

-- Character respawn handling
player.CharacterAdded:Connect(function(char)
    wait(0.5)
    local humanoid = char:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = tonumber(speedSlider.Text) or 16
        humanoid.JumpPower = tonumber(jumpSlider.Text) or 50
    end
    if espEnabled then
        createESP()
    end
end)

-- Initial setup
wait(1)
if player.Character and player.Character:FindFirstChild("Humanoid") then
    player.Character.Humanoid.WalkSpeed = 16
    player.Character.Humanoid.JumpPower = 50
end

print("Murder Mystery 2 Script loaded!")
```
