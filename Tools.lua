Tools
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- 1. Включаем стандартный чат (если он был отключён через SetCoreGuiEnabled)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)

-- 2. Ждём появления PlayerGui
local playerGui = player:WaitForChild("PlayerGui")

-- 3. Ищем объект чата в PlayerGui (может называться "Chat" или "TextChatService")
local chatGui = playerGui:FindFirstChild("Chat") or playerGui:FindFirstChild("TextChatService")
if chatGui then
    chatGui.Enabled = true
    
    -- Пытаемся найти основной Frame и сделать его видимым
    local frame = chatGui:FindFirstChild("Frame") or chatGui:FindFirstChild("MainFrame")
    if frame then
        frame.Visible = true
        frame.Active = true
        
        -- Ищем поле ввода текста и активируем его
        local textBox = frame:FindFirstChild("ChatBar", true) or frame:FindFirstChild("TextBox", true)
        if textBox then
            textBox.Active = true
            textBox.Visible = true
            textBox:CaptureFocus()  -- Фокусируемся, чтобы можно было сразу печатать
        end
    end
end

print("Чат включён!")
