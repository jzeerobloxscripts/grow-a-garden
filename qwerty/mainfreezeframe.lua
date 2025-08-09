local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local userId = player.UserId
local thumbnailUrl = "https://www.roblox.com/headshot-thumbnail/image?userId="..userId.."&width=150&height=150&format=png"

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JzeeMenuGUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 9999999
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 480, 0, 320)
mainFrame.Position = UDim2.new(0.5, -240, 0.5, -160)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 20)
mainCorner.Parent = mainFrame

local mainGradient = Instance.new("UIGradient")
mainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(38, 38, 38)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 28, 28))
}
mainGradient.Rotation = 145
mainGradient.Parent = mainFrame

local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 6, 1, 6)
shadow.Position = UDim2.new(0, -3, 0, -3)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.7
shadow.ZIndex = -1
shadow.Parent = mainFrame

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 23)
shadowCorner.Parent = shadow

local headerFrame = Instance.new("Frame")
headerFrame.Name = "HeaderFrame"
headerFrame.Size = UDim2.new(1, 0, 0, 60)
headerFrame.Position = UDim2.new(0, 0, 0, 0)
headerFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
headerFrame.BorderSizePixel = 0
headerFrame.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 20)
headerCorner.Parent = headerFrame

local headerCornerFix = Instance.new("Frame")
headerCornerFix.Size = UDim2.new(1, 0, 0, 20)
headerCornerFix.Position = UDim2.new(0, 0, 1, -20)
headerCornerFix.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
headerCornerFix.BorderSizePixel = 0
headerCornerFix.Parent = headerFrame

local profileFrame = Instance.new("ImageLabel")
profileFrame.Name = "ProfileFrame"
profileFrame.Size = UDim2.new(0, 50, 0, 50)
profileFrame.Position = UDim2.new(0, 10, 0.5, -25)
profileFrame.BackgroundColor3 = Color3.fromRGB(99, 102, 241)
profileFrame.BorderSizePixel = 0
profileFrame.Image = thumbnailUrl
profileFrame.Parent = headerFrame

local profileCorner = Instance.new("UICorner")
profileCorner.CornerRadius = UDim.new(1, 0)
profileCorner.Parent = profileFrame

local profileText = Instance.new("TextLabel")
profileText.Name = "ProfileText"
profileText.Size = UDim2.new(1, 0, 1, 0)
profileText.Position = UDim2.new(0, 0, 0, 0)
profileText.BackgroundTransparency = 1
profileText.Text = string.sub(player.Name, 1, 2):upper()
profileText.TextColor3 = Color3.fromRGB(255, 255, 255)
profileText.TextScaled = true
profileText.Font = Enum.Font.GothamBold
profileText.Visible = false
profileText.Parent = profileFrame

profileFrame.ImageFailed:Connect(function()
    profileText.Visible = true
end)

local animatedText = Instance.new("TextLabel")
animatedText.Name = "AnimatedText"
animatedText.Size = UDim2.new(0, 100, 0, 30)
animatedText.Position = UDim2.new(0, 70, 0.5, -15)
animatedText.BackgroundTransparency = 1
animatedText.Text = "asjfhdjsdjfsadfks"
animatedText.TextColor3 = Color3.fromRGB(99, 102, 241)
animatedText.TextScaled = true
animatedText.Font = Enum.Font.Gotham
animatedText.Parent = headerFrame

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

local controlsFrame = Instance.new("Frame")
controlsFrame.Name = "ControlsFrame"
controlsFrame.Size = UDim2.new(0, 60, 0, 30)
controlsFrame.Position = UDim2.new(1, -70, 0.5, -15)
controlsFrame.BackgroundTransparency = 1
controlsFrame.Parent = headerFrame

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Name = "MinimizeBtn"
minimizeBtn.Size = UDim2.new(0, 25, 0, 25)
minimizeBtn.Position = UDim2.new(0, 0, 0.5, -12.5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Text = "−"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.TextScaled = true
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.Parent = controlsFrame

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 5)
minimizeCorner.Parent = minimizeBtn

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(0, 30, 0.5, -12.5)
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = controlsFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = closeBtn

local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -20, 1, -100)
contentFrame.Position = UDim2.new(0, 10, 0, 70)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(1, 0, 0, 30)
watermark.Position = UDim2.new(0, 0, 1, -30)
watermark.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
watermark.BorderSizePixel = 0
watermark.Text = "by Jzee Scripts (@notjzee) YouTube & TikTok"
watermark.TextColor3 = Color3.fromRGB(120, 120, 120)
watermark.TextSize = 12
watermark.Font = Enum.Font.Gotham
watermark.Parent = mainFrame

local watermarkCorner = Instance.new("UICorner")
watermarkCorner.CornerRadius = UDim.new(0, 20)
watermarkCorner.Parent = watermark

local watermarkCornerFix = Instance.new("Frame")
watermarkCornerFix.Size = UDim2.new(1, 0, 0, 20)
watermarkCornerFix.Position = UDim2.new(0, 0, 0, 0)
watermarkCornerFix.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
watermarkCornerFix.BorderSizePixel = 0
watermarkCornerFix.Parent = watermark

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

spawn(function()
    while true do
        wait(0.1)
        updateGlitchText()
    end
end)

local isMinimized = false

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    
    if isMinimized then
        local tween = TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 300, 0, 60)
        })
        tween:Play()
        
        contentFrame.Visible = false
        watermark.Visible = false
        titleText.Visible = false
        animatedText.Visible = false
    else
        local tween = TweenService:Create(mainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 480, 0, 320)
        })
        tween:Play()
        
        tween.Completed:Connect(function()
            contentFrame.Visible = true
            watermark.Visible = true
            titleText.Visible = true
            animatedText.Visible = true
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

minimizeBtn.MouseEnter:Connect(function()
    local tween = TweenService:Create(minimizeBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    })
    tween:Play()
end)

minimizeBtn.MouseLeave:Connect(function()
    local tween = TweenService:Create(minimizeBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    })
    tween:Play()
end)

closeBtn.MouseEnter:Connect(function()
    local tween = TweenService:Create(closeBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(220, 60, 60)
    })
    tween:Play()
end)

closeBtn.MouseLeave:Connect(function()
    local tween = TweenService:Create(closeBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    })
    tween:Play()
end)

print("Jzee Menu GUI Loaded Successfully!")
