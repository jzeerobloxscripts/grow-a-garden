local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MobileGUI"
screenGui.DisplayOrder = 999999999
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 400, 0, 280)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -140)
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
randomUsername.Font = Enum.Font.SourceSans

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Parent = titleBar
titleLabel.Size = UDim2.new(0, 150, 1, 0)
titleLabel.Position = UDim2.new(0.5, -75, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Moon Cat Vuln"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.Font = Enum.Font.SourceSansBold

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
closeButton.Font = Enum.Font.SourceSansBold
closeButton.BorderSizePixel = 0

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 4)
closeButtonCorner.Parent = closeButton

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
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.BorderSizePixel = 0

local minimizeButtonCorner = Instance.new("UICorner")
minimizeButtonCorner.CornerRadius = UDim.new(0, 4)
minimizeButtonCorner.Parent = minimizeButton

local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Parent = mainFrame
contentFrame.Size = UDim2.new(1, 0, 1, -35)
contentFrame.Position = UDim2.new(0, 0, 0, 35)
contentFrame.BackgroundTransparency = 1
contentFrame.BorderSizePixel = 0

local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Parent = contentFrame
statusLabel.Size = UDim2.new(1, -40, 0, 40)
statusLabel.Position = UDim2.new(0, 20, 0, 20)
statusLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
statusLabel.Text = "Ready to activate Moon Cat Aura"
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextSize = 14
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.Font = Enum.Font.SourceSans
statusLabel.BorderSizePixel = 0

local statusLabelCorner = Instance.new("UICorner")
statusLabelCorner.CornerRadius = UDim.new(0, 6)
statusLabelCorner.Parent = statusLabel

local activateButton = Instance.new("TextButton")
activateButton.Name = "ActivateButton"
activateButton.Parent = contentFrame
activateButton.Size = UDim2.new(0, 200, 0, 50)
activateButton.Position = UDim2.new(0.5, -100, 0, 80)
activateButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
activateButton.Text = "Activate"
activateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
activateButton.TextSize = 18
activateButton.Font = Enum.Font.SourceSansBold
activateButton.BorderSizePixel = 0

local activateButtonCorner = Instance.new("UICorner")
activateButtonCorner.CornerRadius = UDim.new(0, 8)
activateButtonCorner.Parent = activateButton

local noteLabel = Instance.new("TextLabel")
noteLabel.Name = "NoteLabel"
noteLabel.Parent = contentFrame
noteLabel.Size = UDim2.new(1, -20, 0, 80)
noteLabel.Position = UDim2.new(0, 10, 0, 150)
noteLabel.BackgroundTransparency = 1
noteLabel.Text = "Note: Moon Cat Aura expands hitboxes of collectible items making them easier to collect. Toggle the button to enable/disable the aura effect."
noteLabel.TextColor3 = Color3.fromRGB(200, 200, 100)
noteLabel.TextSize = 12
noteLabel.TextXAlignment = Enum.TextXAlignment.Center
noteLabel.TextYAlignment = Enum.TextYAlignment.Top
noteLabel.TextWrapped = true
noteLabel.Font = Enum.Font.SourceSansItalic

local isMinimized = false
local mooncatAuraEnabled = false
local mooncatOriginalSizes = {}
local auraConnection = nil

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

local function mooncatAuraScan()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") 
            and obj.Color.G > 0.5
            and obj.Size.Y < 2
            and obj.Transparency > 0.1
        then
            if mooncatAuraEnabled then
                if not mooncatOriginalSizes[obj] then
                    mooncatOriginalSizes[obj] = obj.Size
                end
                obj.Size = Vector3.new(100, obj.Size.Y, 100)
            else
                if mooncatOriginalSizes[obj] then
                    obj.Size = mooncatOriginalSizes[obj]
                end
            end
        end
    end
end

local function animateResize(targetSize, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local tween = TweenService:Create(mainFrame, tweenInfo, {Size = targetSize})
    tween:Play()
end

activateButton.MouseButton1Click:Connect(function()
    mooncatAuraEnabled = not mooncatAuraEnabled
    
    if mooncatAuraEnabled then
        activateButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        activateButton.Text = "Deactivate"
        statusLabel.Text = "Moon Cat Aura: ENABLED"
        statusLabel.TextColor3 = Color3.fromRGB(50, 255, 50)
        
        if not auraConnection then
            auraConnection = RunService.RenderStepped:Connect(mooncatAuraScan)
        end
    else
        activateButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        activateButton.Text = "Activate"
        statusLabel.Text = "Moon Cat Aura: DISABLED"
        statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        for obj, originalSize in pairs(mooncatOriginalSizes) do
            if obj and obj.Parent then
                obj.Size = originalSize
            end
        end
        mooncatOriginalSizes = {}
        
        if auraConnection then
            auraConnection:Disconnect()
            auraConnection = nil
        end
    end
end)

minimizeButton.MouseButton1Click:Connect(function()
    if not isMinimized then
        animateResize(UDim2.new(0, 400, 0, 35), 0.3)
        contentFrame.Visible = false
        isMinimized = true
        minimizeButton.Text = "+"
    else
        animateResize(UDim2.new(0, 400, 0, 280), 0.3)
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
    if auraConnection then
        auraConnection:Disconnect()
    end
    screenGui:Destroy()
end)
