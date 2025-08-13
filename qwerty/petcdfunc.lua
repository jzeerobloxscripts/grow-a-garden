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
mainFrame.Size = UDim2.new(0, 350, 0, 320)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -160)
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
titleLabel.Size = UDim2.new(0, 100, 1, 0)
titleLabel.Position = UDim2.new(0.5, -50, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Pet Cooldown Bugger"
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
contentFrame.Size = UDim2.new(1, 0, 1, -60)
contentFrame.Position = UDim2.new(0, 0, 0, 35)
contentFrame.BackgroundTransparency = 1
contentFrame.BorderSizePixel = 0

local cooldownInput = Instance.new("TextBox")
cooldownInput.Name = "CooldownInput"
cooldownInput.Parent = contentFrame
cooldownInput.Size = UDim2.new(1, -20, 0, 40)
cooldownInput.Position = UDim2.new(0, 10, 0, 20)
cooldownInput.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
cooldownInput.PlaceholderText = "Type Desired Cooldown (must be equal or greater than 15s)"
cooldownInput.Text = ""
cooldownInput.TextColor3 = Color3.fromRGB(0, 0, 0)
cooldownInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
cooldownInput.TextSize = 12
cooldownInput.Font = Enum.Font.SourceSans
cooldownInput.BorderSizePixel = 0
cooldownInput.TextWrapped = true

local cooldownInputCorner = Instance.new("UICorner")
cooldownInputCorner.CornerRadius = UDim.new(0, 4)
cooldownInputCorner.Parent = cooldownInput

local bugButton = Instance.new("TextButton")
bugButton.Name = "BugButton"
bugButton.Parent = contentFrame
bugButton.Size = UDim2.new(1, -20, 0, 35)
bugButton.Position = UDim2.new(0, 10, 0, 70)
bugButton.BackgroundColor3 = Color3.fromRGB(85, 170, 85)
bugButton.Text = "Bug Pets' Cooldown"
bugButton.TextColor3 = Color3.fromRGB(255, 255, 255)
bugButton.TextSize = 14
bugButton.Font = Enum.Font.SourceSansBold
bugButton.BorderSizePixel = 0

local bugButtonCorner = Instance.new("UICorner")
bugButtonCorner.CornerRadius = UDim.new(0, 4)
bugButtonCorner.Parent = bugButton

local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Parent = contentFrame
statusLabel.Size = UDim2.new(1, -20, 0, 80)
statusLabel.Position = UDim2.new(0, 10, 0, 115)
statusLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
statusLabel.Text = "Ready to bug cooldown..."
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextSize = 12
statusLabel.Font = Enum.Font.SourceSans
statusLabel.BorderSizePixel = 0
statusLabel.TextWrapped = true

local statusLabelCorner = Instance.new("UICorner")
statusLabelCorner.CornerRadius = UDim.new(0, 4)
statusLabelCorner.Parent = statusLabel

local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Parent = contentFrame
watermark.Size = UDim2.new(1, -6, 0, 25)
watermark.Position = UDim2.new(0, 3, 1, -30)
watermark.BackgroundTransparency = 1
watermark.Text = "Jzee Scripts on YouTube | @notjzee on TikTok"
watermark.TextColor3 = Color3.fromRGB(150, 150, 150)
watermark.TextSize = 10
watermark.TextXAlignment = Enum.TextXAlignment.Center
watermark.Font = Enum.Font.SourceSans

local isMinimized = false
local isProcessing = false

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

cooldownInput:GetPropertyChangedSignal("Text"):Connect(function()
    local filtered = string.gsub(cooldownInput.Text, "[^%d]", "")
    if cooldownInput.Text ~= filtered then
        cooldownInput.Text = filtered
    end
end)

local function formatTime(seconds)
    local minutes = math.floor(seconds / 60)
    local remainingSeconds = seconds % 60
    return string.format("%d:%02d", minutes, remainingSeconds)
end

local function startCooldownScript(cooldownValue)
    local userCooldown = formatTime(cooldownValue)
    task.spawn(function()
        while true do
            for _, v in ipairs(game:GetDescendants()) do
                if v:IsA("TextLabel") and v.Text:find("^Every%s%d+:%d+m") then
                    local after = v.Text:match("m(.*)")
                    local desiredText = "Every " .. userCooldown .. "m" .. after
                    if v.Text ~= desiredText then
                        v.Text = desiredText
                    end
                end
            end
            task.wait(0)
        end
    end)
end

bugButton.MouseButton1Click:Connect(function()
    if isProcessing then return end
    
    local cooldownText = cooldownInput.Text
    if cooldownText == "" then
        statusLabel.Text = "Please enter a cooldown value!"
        return
    end
    
    local cooldownValue = tonumber(cooldownText)
    if not cooldownValue then
        statusLabel.Text = "Invalid number format!"
        return
    end
    
    if cooldownValue < 15 then
        cooldownValue = 15
        cooldownInput.Text = "15"
        statusLabel.Text = "Cooldown set to minimum value (15s)"
        task.wait(1)
    end
    
    isProcessing = true
    bugButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    bugButton.Text = "Processing..."
    
    statusLabel.Text = "Parsing Pets..."
    task.wait(10)
    
    statusLabel.Text = "Pets Successfully Parsed!"
    task.wait(0.5)
    
    statusLabel.Text = "Fetching Set Cooldown Value..."
    task.wait(14)
    
    statusLabel.Text = "Cooldown Value Fetched!"
    task.wait(0.5)
    
    statusLabel.Text = "Fetching World Data..."
    task.wait(20)
    
    statusLabel.Text = "World Data Fetched!"
    task.wait(0.5)
    
    statusLabel.Text = "Applying Changes in the Server..."
    task.wait(18)
    
    statusLabel.Text = "Uh-Oh! It Seems Your Pets are Duplicated and is Conflicting Against the Server! If you think this is a mistake, Please Restart your Roblox Executor and the Script."
    
    startCooldownScript(cooldownValue)
    
    isProcessing = false
    bugButton.BackgroundColor3 = Color3.fromRGB(85, 170, 85)
    bugButton.Text = "Bug Placed Pets' Cooldown"
end)

minimizeButton.MouseButton1Click:Connect(function()
    if not isMinimized then
        animateResize(UDim2.new(0, 350, 0, 35), 0.3)
        contentFrame.Visible = false
        isMinimized = true
        minimizeButton.Text = "+"
    else
        animateResize(UDim2.new(0, 350, 0, 320), 0.3)
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
