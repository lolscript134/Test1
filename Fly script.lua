0)
hudFrame.BackgroundTransparency = 0.4
hudFrame.BorderSizePixel = 0
hudFrame.Position = UDim2.new(0.01, 0, 0.5, -60)
hudFrame.Size = UDim2.new(0, 160, 0, 120)
hudFrame.Visible = true

local hudCorner = Instance.new("UICorner")
hudCorner.Parent = hudFrame
hudCorner.CornerRadius = UDim.new(0, 8)

local function createHUDLabel(text, y, color)
    local label = Instance.new("TextLabel")
    label.Parent = hudFrame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0.05, 0, y, 0)
    label.Size = UDim2.new(0.9, 0, 0, 20)
    label.Font = Enum.Font.Gotham
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return label
end

local hudFlight = createHUDLabel("✈️ Полет: ВЫКЛ", 0.05, Color3.fromRGB(255, 100, 100))
local hudNoclip = createHUDLabel("🛡️ Noclip: ВЫКЛ", 0.3, Color3.fromRGB(255, 100, 100))
local hudSpeed = createHUDLabel("⚡ Скорость: 2.0", 0.55, Color3.fromRGB(100, 200, 255))
local hudControls = createHUDLabel("⌨️ F | N | H", 0.8, Color3.fromRGB(150, 150, 200))

-- Обновление HUD
game:GetService("RunService").RenderStepped:Connect(function()
    if not settings.showHUD then
        hudFrame.Visible = false
        return
    end
    
    hudFrame.Visible = true
    
    hudFlight.Text = settings.flight and "✈️ Полет: ВКЛ" or "✈️ Полет: ВЫКЛ"
    hudFlight.TextColor3 = settings.flight and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 100, 100)
    
    hudNoclip.Text = settings.noclip and "🛡️ Noclip: ВКЛ" or "🛡️ Noclip: ВЫКЛ"
    hudNoclip.TextColor3 = settings.noclip and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 100, 100)
    
    local currentSpeed = settings.speed
    if userInput:IsKeyDown(Enum.KeyCode.LeftShift) or userInput:IsKeyDown(Enum.KeyCode.RightShift) then
        currentSpeed = settings.sprintSpeed
    end
    hudSpeed.Text = "⚡ Скорость: " .. string.format("%.1f", currentSpeed)
end)

-- ========== АНИМАЦИЯ ОТКРЫТИЯ ==========
MainFrame.BackgroundTransparency = 1
MainFrame.Size = UDim2.new(0, 0, 0, 0)

local tweenService = game:GetService("TweenService")

local openTween = tweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0,
    Size = UDim2.new(0, 400, 0, 340)
})

local closeTween = tweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    BackgroundTransparency = 1,
    Size = UDim2.new(0, 0, 0, 0)
})

-- Показываем GUI с анимацией
wait(0.1)
openTween:Play()

-- Функция для переключения GUI
local function toggleGUI()
    if gui.Enabled then
        closeTween:Play()
        wait(0.2)
        gui.Enabled = false
    else
        gui.Enabled = true
        MainFrame.BackgroundTransparency = 1
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        openTween:Play()
    end
end

-- Открытие GUI по F1
userInput.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        toggleGUI()
    end
end)

print("✅ Скрипт полета и noclip загружен!")
print("📖 Управление:")
print("  F1 - Открыть/закрыть меню")
print("  F - Включить/выключить полет")
print("  N - Включить/выключить noclip")
print("  H - Показать/скрыть HUD")
print("  Space - Вверх (в режиме полета)")
print("  C - Вниз (в режиме полета)")
print("  Shift - Спринт (ускорение)")
