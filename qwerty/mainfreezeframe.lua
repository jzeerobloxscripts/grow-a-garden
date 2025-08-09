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
screenGui.Parent = playerGui

-- Main Frame (4:3 aspect ratio)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 800, 0, 600)
mainFrame.Position = UDim2.new(0.5, -400, 0.5, -300)
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
headerFrame.Size = UDim2.new(1, 0, 0, 70)
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
profileFrame.Size = UDim2.new(0, 40, 0, 40)
profileFrame.Position = UDim2.new(0, 15, 0.5, -20)
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
animatedText.Size = UDim2.new(0, 120, 0, 40)
animatedText.Position = UDim2.new(0, 70, 0.5, -20)
animatedText.BackgroundTransparency = 1
animatedText.Text = "Welcome back!"
animatedText.TextColor3 = Color3.fromRGB(99, 102, 241)
animatedText.TextScaled = true
animatedText.Font = Enum.Font.Gotham
animatedText.Parent = headerFrame

-- Title (Center)
local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Size = UDim2.new(0, 300, 0, 40)
titleText.Position = UDim2.new(0.5, -150, 0.5, -20)
titleText.BackgroundTransparency = 1
titleText.Text = "Roblox Menu Game GUI"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextScaled = true
titleText.Font = Enum.Font.GothamBold
titleText.Parent = headerFrame

-- Control Buttons Frame (Top Right)
local controlsFrame = Instance.new("Frame")
controlsFrame.Name = "ControlsFrame"
controlsFrame.Size = UDim2.new(0, 80, 0, 40)
controlsFrame.Position = UDim2.new(1, -95, 0.5, -20)
controlsFrame.BackgroundTransparency = 1
controlsFrame.Parent = headerFrame

-- Minimize Button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Name = "MinimizeBtn"
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(0, 0, 0.5, -15)
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
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0, 40, 0.5, -15)
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
contentFrame.Size = UDim2.new(1, -40, 1, -160)
contentFrame.Position = UDim2.new(0, 20, 0, 90)
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
listLayout.Padding = UDim.new(0, 15)
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
    menuItem.Size = UDim2.new(1, 0, 0, 70)
    menuItem.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
    menuItem.BorderSizePixel = 0
    menuItem.LayoutOrder = i
    menuItem.Parent = scrollFrame
    
    local itemCorner = Instance.new("UICorner")
    itemCorner.CornerRadius = UDim.new(0, 12)
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
    iconFrame.Size = UDim2.new(0, 40, 0, 40)
    iconFrame.Position = UDim2.new(0, 20, 0.5, -20)
    iconFrame.BackgroundColor3 = item.color
    iconFrame.BorderSizePixel = 0
    iconFrame.Parent = menuItem
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 10)
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
    menuText.Size = UDim2.new(1, -120, 1, 0)
    menuText.Position = UDim2.new(0, 80, 0, 0)
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
    arrow.Size = UDim2.new(0, 30, 1, 0)
    arrow.Position = UDim2.new(1, -40, 0, 0)
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
watermark.Size = UDim2.new(1, 0, 0, 40)
watermark.Position = UDim2.new(0, 0, 1, -40)
watermark.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
watermark.BorderSizePixel = 0
watermark.Text = "by Jzee Scripts (@notjzee) YouTube & TikTok"
watermark.TextColor3 = Color3.fromRGB(102, 102, 102)
watermark.TextScaled = true
watermark.Font = Enum.Font.Gotham
watermark.Parent = mainFrame

-- Animated Text System
local textOptions = {
    "Welcome back!",
    "Ready to script?",
    "Let's get started",
    "System online",
    "Scripts loaded",
    "GUI active",
    "Menu ready",
    "All systems go"
}

local currentIndex = 1
local function updateAnimatedText()
    local tween = TweenService:Create(animatedText, TweenInfo.new(0.3), {
        TextTransparency = 1
    })
    tween:Play()
    
    tween.Completed:Connect(function()
        animatedText.Text = textOptions[currentIndex]
        currentIndex = currentIndex + 1
        if currentIndex > #textOptions then
            currentIndex = 1
        end
        
        local fadeIn = TweenService:Create(animatedText, TweenInfo.new(0.3), {
            TextTransparency = 0
        })
        fadeIn:Play()
    end)
end

-- Start text animation
spawn(function()
    while true do
        wait(2)
        updateAnimatedText()
    end
end)

-- Button Functions
local isMinimized = false

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    
    if isMinimized then
        local tween = TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 200, 0, 60)
        })
        tween:Play()
        
        contentFrame.Visible = false
        watermark.Visible = false
        titleText.TextScaled = false
        titleText.TextSize = 14
    else
        local tween = TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 800, 0, 600)
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
        Size = UDim2.new(0, 33, 0, 33)
    })
    tween:Play()
end)

minimizeBtn.MouseLeave:Connect(function()
    local tween = TweenService:Create(minimizeBtn, TweenInfo.new(0.2), {
        Size = UDim2.new(0, 30, 0, 30)
    })
    tween:Play()
end)

closeBtn.MouseEnter:Connect(function()
    local tween = TweenService:Create(closeBtn, TweenInfo.new(0.2), {
        Size = UDim2.new(0, 33, 0, 33)
    })
    tween:Play()
end)

closeBtn.MouseLeave:Connect(function()
    local tween = TweenService:Create(closeBtn, TweenInfo.new(0.2), {
        Size = UDim2.new(0, 30, 0, 30)
    })
    tween:Play()
end)

-- Update scroll frame size
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, (#menuItems * 85) + 50)

print("Jzee Menu GUI Loaded Successfully!")
