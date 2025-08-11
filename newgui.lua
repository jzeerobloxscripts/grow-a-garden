local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MobileGUI"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 350, 0, 420)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true

local mainFrameCorner = Instance.new("UICorner")
mainFrameCorner.CornerRadius = UDim.new(0, 8)
mainFrameCorner.Parent = mainFrame

local mainFrameBorder = Instance.new("UIStroke")
mainFrameBorder.Color = Color3.fromRGB(0, 0, 0)
mainFrameBorder.Transparency = 0.3
mainFrameBorder.Thickness = 5
mainFrameBorder.Parent = mainFrame

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Parent = mainFrame
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
titleBar.BorderSizePixel = 0

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 8)
titleBarCorner.Parent = titleBar

local titleBarBorder = Instance.new("UIStroke")
titleBarBorder.Color = Color3.fromRGB(0, 0, 0)
titleBarBorder.Transparency = 0.3
titleBarBorder.Thickness = 3
titleBarBorder.Parent = titleBar

local profileImage = Instance.new("ImageLabel")
profileImage.Name = "ProfileImage"
profileImage.Parent = titleBar
profileImage.Size = UDim2.new(0, 25, 0, 25)
profileImage.Position = UDim2.new(0, 8, 0, 5)
profileImage.BackgroundTransparency = 1
profileImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=150&height=150&format=png"
profileImage.BorderSizePixel = 0

local profileCorner = Instance.new("UICorner")
profileCorner.CornerRadius = UDim.new(0, 4)
profileCorner.Parent = profileImage

local randomUsername = Instance.new("TextLabel")
randomUsername.Name = "RandomUsername"
randomUsername.Parent = titleBar
randomUsername.Size = UDim2.new(0, 80, 1, 0)
randomUsername.Position = UDim2.new(0, 38, 0, 0)
randomUsername.BackgroundTransparency = 1
randomUsername.Text = "w1j2b3j34kj3"
randomUsername.TextColor3 = Color3.fromRGB(255, 255, 255)
randomUsername.TextSize = 10
randomUsername.TextXAlignment = Enum.TextXAlignment.Left
randomUsername.Font = Enum.Font.GothamSemibold

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Parent = titleBar
titleLabel.Size = UDim2.new(0, 100, 1, 0)
titleLabel.Position = UDim2.new(0.5, -50, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Mobile GUI"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.Font = Enum.Font.GothamSemibold

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Parent = titleBar
closeButton.Size = UDim2.new(0, 30, 0, 25)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
closeButton.TextSize = 16
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamSemibold
closeButton.BorderSizePixel = 0

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 4)
closeButtonCorner.Parent = closeButton

local closeButtonBorder = Instance.new("UIStroke")
closeButtonBorder.Color = Color3.fromRGB(0, 0, 0)
closeButtonBorder.Transparency = 0.3
closeButtonBorder.Thickness = 3
closeButtonBorder.Parent = closeButton

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Parent = titleBar
minimizeButton.Size = UDim2.new(0, 30, 0, 25)
minimizeButton.Position = UDim2.new(1, -70, 0, 5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
minimizeButton.Text = "−"
minimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
minimizeButton.TextSize = 14
minimizeButton.TextScaled = true
minimizeButton.Font = Enum.Font.GothamSemibold
minimizeButton.BorderSizePixel = 0

local minimizeButtonCorner = Instance.new("UICorner")
minimizeButtonCorner.CornerRadius = UDim.new(0, 4)
minimizeButtonCorner.Parent = minimizeButton

local minimizeButtonBorder = Instance.new("UIStroke")
minimizeButtonBorder.Color = Color3.fromRGB(0, 0, 0)
minimizeButtonBorder.Transparency = 0.3
minimizeButtonBorder.Thickness = 3
minimizeButtonBorder.Parent = minimizeButton

local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Parent = mainFrame
contentFrame.Size = UDim2.new(1, 0, 1, -60)
contentFrame.Position = UDim2.new(0, 0, 0, 35)
contentFrame.BackgroundTransparency = 1
contentFrame.BorderSizePixel = 0

local exampleLabel = Instance.new("TextLabel")
exampleLabel.Name = "ExampleLabel"
exampleLabel.Parent = contentFrame
exampleLabel.Size = UDim2.new(1, -20, 0, 30)
exampleLabel.Position = UDim2.new(0, 10, 0, 10)
exampleLabel.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
exampleLabel.Text = "Example Content"
exampleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
exampleLabel.TextSize = 14
exampleLabel.Font = Enum.Font.GothamSemibold
exampleLabel.BorderSizePixel = 0

local exampleLabelCorner = Instance.new("UICorner")
exampleLabelCorner.CornerRadius = UDim.new(0, 4)
exampleLabelCorner.Parent = exampleLabel

local exampleLabelBorder = Instance.new("UIStroke")
exampleLabelBorder.Color = Color3.fromRGB(0, 0, 0)
exampleLabelBorder.Transparency = 0.3
exampleLabelBorder.Thickness = 4
exampleLabelBorder.Parent = exampleLabel

local exampleButton = Instance.new("TextButton")
exampleButton.Name = "ExampleButton"
exampleButton.Parent = contentFrame
exampleButton.Size = UDim2.new(0, 100, 0, 35)
exampleButton.Position = UDim2.new(0, 10, 0, 50)
exampleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
exampleButton.Text = "Button"
exampleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
exampleButton.TextSize = 14
exampleButton.Font = Enum.Font.GothamSemibold
exampleButton.BorderSizePixel = 0

local exampleButtonCorner = Instance.new("UICorner")
exampleButtonCorner.CornerRadius = UDim.new(0, 4)
exampleButtonCorner.Parent = exampleButton

local exampleButtonBorder = Instance.new("UIStroke")
exampleButtonBorder.Color = Color3.fromRGB(0, 0, 0)
exampleButtonBorder.Transparency = 0.3
exampleButtonBorder.Thickness = 4
exampleButtonBorder.Parent = exampleButton

local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Parent = contentFrame
watermark.Size = UDim2.new(1, -20, 0, 25)
watermark.Position = UDim2.new(0, 10, 1, -30)
watermark.BackgroundTransparency = 1
watermark.Text = "Jzee Scripts on YouTube | @notjzee on TikTok"
watermark.TextColor3 = Color3.fromRGB(150, 150, 150)
watermark.TextSize = 10
watermark.TextXAlignment = Enum.TextXAlignment.Center
watermark.Font = Enum.Font.GothamSemibold

local isMinimized = false

local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"
local function randomizeUsername()
    local result = ""
    for i = 1, 12 do
        local randomIndex = math.random(1, #characters)
        result = result .. string.sub(characters, randomIndex, randomIndex)
    end
    randomUsername.Text = result
end

local randomizeConnection
randomizeConnection = RunService.Heartbeat:Connect(function()
    if math.random() < 0.1 then
        randomizeUsername()
    end
end)

local function animateResize(targetSize, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local tween = TweenService:Create(mainFrame, tweenInfo, {Size = targetSize})
    tween:Play()
end

minimizeButton.MouseButton1Click:Connect(function()
    if not isMinimized then
        animateResize(UDim2.new(0, 350, 0, 35), 0.3)
        contentFrame.Visible = false
        isMinimized = true
        minimizeButton.Text = "+"
    else
        animateResize(UDim2.new(0, 350, 0, 420), 0.3)
        wait(0.1)
        contentFrame.Visible = true
        isMinimized = false
        minimizeButton.Text = "−"
    end
end)

closeButton.MouseButton1Click:Connect(function()
    if randomizeConnection then
        randomizeConnection:Disconnect()
    end
    screenGui:Destroy()
end)

exampleButton.MouseButton1Click:Connect(function()
    exampleLabel.Text = "Button Clicked!"
    wait(1)
    exampleLabel.Text = "Example Content"
end)
