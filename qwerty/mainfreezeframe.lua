-- Roblox Menu GUI Script
-- by Jzee Scripts (@notjzee)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JzeeMenuGUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 9999999
screenGui.Parent = playerGui

-- Main Frame (Mobile landscape optimized)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 480, 0, 320)
mainFrame.Position = UDim2.new(0.5, -240, 0.5, -160)
mainFrame.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Add corner radius
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 15)
mainCorner.Parent = mainFrame

-- Add gradient
local mainGradient = Instance.new("UIGradient")
mainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(42, 42, 42)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
}
mainGradient.Rotation = 145
mainGradient.Parent = mainFrame

-- Add shadow effect
local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.Position = UDim2.new(0, -10, 0, -10)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.5
shadow.ZIndex = -1
shadow.Parent = mainFrame

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 25)
shadowCorner.Parent = shadow

-- Header Frame
local headerFrame = Instance.new("Frame")
headerFrame.Name = "HeaderFrame"
headerFrame.Size = UDim2.new(1, 0, 0, 50)
headerFrame.Position = UDim2.new(0, 0, 0, 0)
headerFrame.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
headerFrame.BorderSizePixel = 0
headerFrame.Parent = mainFrame

local headerGradient = Instance.new("UIGradient")
headerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(51, 51, 51)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(42, 42, 42))
}
headerGradient.Rotation = 90
headerGradient.Parent = headerFrame

-- Profile Frame (Top Left)
local profileFrame = Instance.new("Frame")
profileFrame.Name = "ProfileFrame"
profileFrame.Size = UDim2.new(0, 30, 0, 30)
profileFrame.Position = UDim2.new(0, 10, 0.5, -15)
profileFrame.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
profileFrame.BorderSizePixel = 0
profileFrame.Parent = headerFrame

local profileCorner = Instance.new("UICorner")
profileCorner.CornerRadius = UDim.new(1, 0)
profileCorner.Parent = profileFrame

local profileGradient = Instance.new("UIGradient")
profileGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(99, 102, 241)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 92, 246))
}
profileGradient.Rotation = 45
profileGradient.Parent = profileFrame

local profileText = Instance.new("TextLabel")
profileText.Name = "ProfileText"
profileText.Size = UDim2.new(1, 0, 1, 0)
profileText.Position = UDim2.new(0, 0, 0, 0)
profileText.BackgroundTransparency = 1
profileText.Text = "JZ"
profileText.TextColor3 = Color3.fromRGB(255, 255, 255)
profileText.TextScaled = true
profileText.Font = Enum.Font.GothamBold
profileText.Parent = profileFrame

-- Animated Text (Beside Profile)
local animatedText = Instance.new("TextLabel")
animatedText.Name = "AnimatedText"
animatedText.Size = UDim2.new(0, 80, 0, 30)
animatedText.Position = UDim2.new(0, 50, 0.5, -15)
animatedText.BackgroundTransparency = 1
animatedText.Text = "asjfhdjsdjfsadfks"
animatedText.TextColor3 = Color3.fromRGB(99, 102, 241)
animatedText.TextScaled = true
animatedText.Font = Enum.Font.Gotham
animatedText.Parent = headerFrame

-- Title (Center)
local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Size = UDim2.new(0, 200, 0, 30)
titleText.Position = UDim2.new(0.5, -100, 0.5, -15)
titleText.BackgroundTransparency = 1
titleText.Text = "Roblox Menu Game GUI"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextScaled = true
titleText.Font = Enum.Font.GothamBold
titleText.Parent = headerFrame

-- Control Buttons Frame (Top Right)
local controlsFrame = Instance.new("Frame")
controlsFrame.Name = "ControlsFrame"
controlsFrame.Size = UDim2.new(0, 60, 0, 30)
controlsFrame.Position = UDim2.new(1, -70, 0.5, -15)
controlsFrame.BackgroundTransparency = 1
controlsFrame.Parent = headerFrame

-- Minimize Button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Name = "MinimizeBtn"
minimizeBtn.Size = UDim2.new(0, 25, 0, 25)
minimizeBtn.Position = UDim2.new(0, 0, 0.5, -12.5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(251, 191, 36)
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Text = "−"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.TextScaled = true
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.Parent = controlsFrame

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(1, 0)
minimizeCorner.Parent = minimizeBtn

local minimizeGradient = Instance.new("UIGradient")
minimizeGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 191, 36)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(245, 158, 11))
}
minimizeGradient.Rotation = 45
minimizeGradient.Parent = minimizeBtn

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(0, 30, 0.5, -12.5)
closeBtn.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = controlsFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeBtn

local closeGradient = Instance.new("UIGradient")
closeGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(239, 68, 68)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 38, 38))
}
closeGradient.Rotation = 45
closeGradient.Parent = closeBtn

-- Content Frame
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -20, 1, -90)
contentFrame.Position = UDim2.new(0, 10, 0, 60)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- Scrolling Frame for menu items
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ScrollFrame"
scrollFrame.Size = UDim2.new(1, 0, 1, 0)
scrollFrame.Position = UDim2.new(0, 0, 0, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 6
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(99, 102, 241)
scrollFrame.Parent = contentFrame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 8)
listLayout.Parent = scrollFrame

-- Menu Items Data
local menuItems = {
    {text = "Read 'The Lean Startup'", icon = "📘", color = Color3.fromRGB(59, 130, 246)},
    {text = "Fix landing page", icon = "🌐", color = Color3.fromRGB(16, 185, 129)},
    {text = "Share prototype with team", icon = "👥", color = Color3.fromRGB(139, 92, 246)},
    {text = "Reply to Richard", icon = "📧", color = Color3.fromRGB(249, 115, 22)},
    {text = "Finalize pitch deck", icon = "📊", color = Color3.fromRGB(236, 72, 153)},
    {text = "Settings", icon = "⚙️", color = Color3.fromRGB(239, 68, 68)}
}

-- Create Menu Items
for i, item in pairs(menuItems) do
    local menuItem = Instance.new("Frame")
    menuItem.Name = "MenuItem" .. i
    menuItem.Size = UDim2.new(1, 0, 0, 50)
    menuItem.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
    menuItem.BorderSizePixel = 0
    menuItem.LayoutOrder = i
    menuItem.Parent = scrollFrame
    
    local itemCorner = Instance.new("UICorner")
    itemCorner.CornerRadius = UDim.new(0, 8)
    itemCorner.Parent = menuItem
    
    local itemGradient = Instance.new("UIGradient")
    itemGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(51, 51, 51))
    }
    itemGradient.Rotation = 90
    itemGradient.Parent = menuItem
    
    -- Icon Frame
    local iconFrame = Instance.new("Frame")
    iconFrame.Name = "IconFrame"
    iconFrame.Size = UDim2.new(0, 30, 0, 30)
    iconFrame.Position = UDim2.new(0, 10, 0.5, -15)
    iconFrame.BackgroundColor3 = item.color
    iconFrame.BorderSizePixel = 0
    iconFrame.Parent = menuItem
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 6)
    iconCorner.Parent = iconFrame
    
    local iconText = Instance.new("TextLabel")
    iconText.Name = "IconText"
    iconText.Size = UDim2.new(1, 0, 1, 0)
    iconText.Position = UDim2.new(0, 0, 0, 0)
    iconText.BackgroundTransparency = 1
    iconText.Text = item.icon
    iconText.TextColor3 = Color3.fromRGB(255, 255, 255)
    iconText.TextScaled = true
    iconText.Font = Enum.Font.Gotham
    iconText.Parent = iconFrame
    
    -- Menu Text
    local menuText = Instance.new("TextLabel")
    menuText.Name = "MenuText"
    menuText.Size = UDim2.new(1, -80, 1, 0)
    menuText.Position = UDim2.new(0, 50, 0, 0)
    menuText.BackgroundTransparency = 1
    menuText.Text = item.text
    menuText.TextColor3 = Color3.fromRGB(255, 255, 255)
    menuText.TextScaled = true
    menuText.TextXAlignment = Enum.TextXAlignment.Left
    menuText.Font = Enum.Font.Gotham
    menuText.Parent = menuItem
    
    -- Arrow
    local arrow = Instance.new("TextLabel")
    arrow.Name = "Arrow"
    arrow.Size = UDim2.new(0, 20, 1, 0)
    arrow.Position = UDim2.new(1, -25, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = "›"
    arrow.TextColor3 = Color3.fromRGB(136, 136, 136)
    arrow.TextScaled = true
    arrow.Font = Enum.Font.Gotham
    arrow.Parent = menuItem
    
    -- Menu Item Button
    local menuBtn = Instance.new("TextButton")
    menuBtn.Name = "MenuBtn"
    menuBtn.Size = UDim2.new(1, 0, 1, 0)
    menuBtn.Position = UDim2.new(0, 0, 0, 0)
    menuBtn.BackgroundTransparency = 1
    menuBtn.Text = ""
    menuBtn.Parent = menuItem
    
    -- Hover Effects
    menuBtn.MouseEnter:Connect(function()
        local tween = TweenService:Create(menuItem, TweenInfo.new(0.3), {
            Position = UDim2.new(0, 0, menuItem.Position.Y.Scale, -2)
        })
        tween:Play()
    end)
    
    menuBtn.MouseLeave:Connect(function()
        local tween = TweenService:Create(menuItem, TweenInfo.new(0.3), {
            Position = UDim2.new(0, 0, menuItem.Position.Y.Scale, 0)
        })
        tween:Play()
    end)
    
    menuBtn.MouseButton1Click:Connect(function()
        print("Clicked: " .. item.text)
    end)
end

-- Watermark
local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(1, 0, 0, 30)
watermark.Position = UDim2.new(0, 0, 1, -30)
watermark.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
watermark.BorderSizePixel = 0
watermark.Text = "by Jzee Scripts (@notjzee) YouTube & TikTok"
watermark.TextColor3 = Color3.fromRGB(102, 102, 102)
watermark.TextScaled = true
watermark.Font = Enum.Font.Gotham
watermark.Parent = mainFrame

-- Animated Text System (Glitch Effect)
local glitchChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{}|;:,.<>?"
local targetLength = 15

local function generateGlitchText()
    local result = ""
    for i = 1, targetLength do
        local randomIndex = math.random(1, #glitchChars)
        result = result .. string.sub(glitchChars, randomIndex, randomIndex)
    end
    return result
end

local function updateGlitchText()
    animatedText.Text = generateGlitchText()
end

-- Start glitch animation (faster updates for glitch effect)
spawn(function()
    while true do
        wait(0.1) -- Update every 0.1 seconds for rapid glitching
        updateGlitchText()
    end
end)

-- Button Functions
local isMinimized = false

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    
    if isMinimized then
        local tween = TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 150, 0, 40)
        })
        tween:Play()
        
        contentFrame.Visible = false
        watermark.Visible = false
        titleText.TextScaled = false
        titleText.TextSize = 12
    else
        local tween = TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 480, 0, 320)
        })
        tween:Play()
        
        tween.Completed:Connect(function()
            contentFrame.Visible = true
            watermark.Visible = true
            titleText.TextScaled = true
        end)
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    local tween = TweenService:Create(mainFrame, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    })
    tween:Play()
    
    tween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end)

-- Button Hover Effects
minimizeBtn.MouseEnter:Connect(function()
    local tween = TweenService:Create(minimizeBtn, TweenInfo.new(0.2), {
        Size = UDim2.new(0, 28, 0, 28)
    })
    tween:Play()
end)

minimizeBtn.MouseLeave:Connect(function()
    local tween = TweenService:Create(minimizeBtn, TweenInfo.new(0.2), {
        Size = UDim2.new(0, 25, 0, 25)
    })
    tween:Play()
end)

closeBtn.MouseEnter:Connect(function()
    local tween = TweenService:Create(closeBtn, TweenInfo.new(0.2), {
        Size = UDim2.new(0, 28, 0, 28)
    })
    tween:Play()
end)

closeBtn.MouseLeave:Connect(function()
    local tween = TweenService:Create(closeBtn, TweenInfo.new(0.2), {
        Size = UDim2.new(0, 25, 0, 25)
    })
    tween:Play()
end)

-- Update scroll frame size
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, (#menuItems * 58) + 30)

print("Jzee Menu GUI Loaded Successfully!")
