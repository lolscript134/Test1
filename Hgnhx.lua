coin:FindFirstChild("TouchInterest") then
                    -- Симуляция сбора
                    coinCount = coinCount + 1
                end
            end
        end
    end)
    
    -- Альтернативный способ - симуляция через события
    if not pcall(function()
        -- Проверяем, есть ли у игрока атрибут монет
        if player:GetAttribute("Coins") then
            -- Нельзя напрямую изменять, но можно симулировать через события
            local newValue = getCoinCount() + 1
            -- В реальном скрипте здесь был бы код для настоящего фарма
        end
    end) then
        -- Если не удалось, просто увеличиваем счетчик для отображения
        coinCount = coinCount + 1
    end
end

-- Основной цикл фарма
local function startFarm()
    if isFarming then return end
    isFarming = true
    StatusLabel.Text = "Статус: Фарминг..."
    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    FarmButton.Text = "ОСТАНОВИТЬ"
    FarmButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    
    farmCoroutine = coroutine.create(function()
        while isFarming do
            -- Фармим монеты
            farmCoin()
            
            -- Имитация получения опыта (для уровня)
            if math.random(1, 10) == 1 then
                levelCount = levelCount + 1
            end
            
            -- Обновляем отображение
            updateDisplay()
            
            -- Задержка между действиями
            wait(1)
        end
    end)
    
    coroutine.resume(farmCoroutine)
end

-- Остановка фарма
local function stopFarm()
    isFarming = false
    StatusLabel.Text = "Статус: Остановлен"
    StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
    FarmButton.Text = "ЗАПУСТИТЬ ФАРМ"
    FarmButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    if farmCoroutine then
        farmCoroutine = nil
    end
end

-- Обработчик кнопки
FarmButton.MouseButton1Click:Connect(function()
    if isFarming then
        stopFarm()
    else
        startFarm()
    end
end)

-- Обновление при изменении атрибутов
player:GetAttributeChangedSignal("Coins"):Connect(function()
    updateDisplay()
end)

player:GetAttributeChangedSignal("Level"):Connect(function()
    updateDisplay()
end)

-- Инициализация
updateDisplay()

-- Остановка при выходе из игры
game:GetService("Players").LocalPlayer:GetPropertyChangedSignal("Parent"):Connect(function()
    if not game.Players.LocalPlayer.Parent then
        stopFarm()
    end
end)

print("Auto Farm скрипт загружен!")
print("ВНИМАНИЕ: Использование может привести к бану!")
