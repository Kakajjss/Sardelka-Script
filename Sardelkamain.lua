-- Создаем интерфейс
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SardelkaUI"
ScreenGui.ResetOnSpawn = false
if gethui then ScreenGui.Parent = gethui() else ScreenGui.Parent = game.CoreGui end

-- Основное окно
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Size = UDim2.new(0, 220, 0, 230)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -115)
MainFrame.Active = true
MainFrame.Draggable = true 

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.Antique
Title.Text = "Sardelka Script"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20

-- Большая иконка/баннер (Здесь будет текст предупреждения)
local Banner = Instance.new("ImageLabel")
Banner.Name = "Banner"
Banner.Parent = MainFrame
Banner.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Темно-серый фон
Banner.Size = UDim2.new(0, 200, 0, 90)
Banner.Position = UDim2.new(0, 10, 0, 35)
-- Если хотите вернуть картинку с собакой, раскомментируйте строку ниже и вставьте свой ID:
-- Banner.Image = "rbxassetid://1234567890" 
Banner.ScaleType = Enum.ScaleType.Crop

local BannerCorner = Instance.new("UICorner")
BannerCorner.CornerRadius = UDim.new(0, 6)
BannerCorner.Parent = Banner

-- Текст предупреждения внутри баннера
local WarningText = Instance.new("TextLabel")
WarningText.Name = "WarningText"
WarningText.Parent = Banner
WarningText.BackgroundTransparency = 1
WarningText.Size = UDim2.new(1, -10, 1, -10)
WarningText.Position = UDim2.new(0, 5, 0, 5)
WarningText.Font = Enum.Font.Antique -- Тот же шрифт
WarningText.Text = "This script is not legitimate and we cannot vouch for your actions, the script may also lag, so check your inventory immediately"
WarningText.TextColor3 = Color3.fromRGB(255, 255, 255)
WarningText.TextSize = 11 -- Уменьшенный размер, чтобы весь текст влез
WarningText.TextWrapped = true -- Перенос текста на новые строки
WarningText.ZIndex = 2 -- Чтобы текст был поверх картинки (если вы её добавите)

-- Функция создания кнопок с логикой таймера
local function CreateButton(text, posY, successText, callback)
    local button = Instance.new("TextButton")
    button.Parent = MainFrame
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    button.Size = UDim2.new(0, 200, 0, 35)
    button.Position = UDim2.new(0, 10, 0, posY)
    button.Font = Enum.Font.Antique
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 16
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = button
    
    -- Анимация при наведении
    button.MouseEnter:Connect(function()
        if button.Active then button.BackgroundColor3 = Color3.fromRGB(60, 60, 60) end
    end)
    button.MouseLeave:Connect(function()
        if button.Active then button.BackgroundColor3 = Color3.fromRGB(45, 45, 45) end
    end)
    
    -- Обработчик нажатия
    button.MouseButton1Click:Connect(function()
        if not button.Active then return end -- Защита от спама
        button.Active = false
        button.Text = "Duplicating..."
        button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        
        task.spawn(function()
            -- Здесь выполняется ваш скрипт дублирования (если он есть)
            callback() 
            
            task.wait(40)
            
            button.Text = successText
            button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            
            task.wait(10)
            
            button.Text = text
            button.Active = true
        end)
    end)
end

-- 1-я кнопка
CreateButton("Duplicate Adopt Me", 135, "Duplicated Adopt Me", function()
    print("Выполняется скрипт для Adopt Me...")
end)

-- 2-я кнопка
CreateButton("Duplicate MM2", 180, "Duplicated MM2", function()
    print("Выполняется скрипт для MM2...")
end)
