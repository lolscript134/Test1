
    hudGravity.Text = "🌎 Гравитация: " .. string.format("%.1f", settings.gravity)
    
    -- Авто-прыжок
    if settings.autoJump then
        hudControls.Text = "⌨️ J | X(ON) | H"
        hudControls.TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        hudControls.Text = "⌨️ J | X(OFF) | H"
        hudControls.TextColor3 = Color3.fromRGB(150, 150, 200)
    end
end)

-- ========== АНИМАЦИЯ ОТКРЫТИЯ ==========
MainFrame.BackgroundTransparency = 1
MainFrame.Size = UDim2.new(0, 0, 0, 0)

local tweenService = game:GetService("TweenService")

local openTween = tweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0,
    Size = UDim2.new(0, 440, 0, 400)
})

local closeTween = tweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    BackgroundTransparency = 1,
    Size = UDim2.new(0, 0, 0, 0)
})

-- Показываем GUI с анимацией
wait(0.2)
openTween:Play()

-- Функция переключения GUI
local function toggleGUI()
    if gui.Enabled then
        closeTween:Play()
        wait(0.3)
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

-- ========== СОХРАНЕНИЕ НАСТРОЕК ==========
local function saveSettings()
    local data = {}
    for key, value in pairs(settings) do
        data[key] = value
    end
    return data
end

local function loadSettings(data)
    if data then
        for key, value in pairs(data) do
            settings[key] = value
        end
    end
end

-- ========== ОБНОВЛЕНИЕ ПРИ ИЗМЕНЕНИИ ==========
-- Автоматическое обновление при изменении настроек
local function updateAll()
    updateJump()
    updateSpeed()
    updateGravity()
end

-- Вызываем при изменении
game:GetService("RunService").RenderStepped:Connect(updateAll)

print("✅ Скрипт кастомного прыжка и скорости загружен!")
print("📖 Управление:")
print("  F1 - Открыть/закрыть меню")
print("  J - Ручной прыжок (в режиме кастомного прыжка)")
print("  X - Включить/выключить авто-прыжок")
print("  H - Показать/скрыть HUD")
print("  Shift - Спринт (ускорение)")
print("  W A S D - Движение")
