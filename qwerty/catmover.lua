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
titleLabel.Text = "Pet Follower"
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

local followButton = Instance.new("TextButton")
followButton.Name = "FollowButton"
followButton.Parent = contentFrame
followButton.Size = UDim2.new(0, 200, 0, 50)
followButton.Position = UDim2.new(0.5, -100, 0.3, -25)
followButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
followButton.Text = "Move Cat to Me"
followButton.TextColor3 = Color3.fromRGB(0, 0, 0)
followButton.TextSize = 16
followButton.Font = Enum.Font.SourceSansBold
followButton.BorderSizePixel = 0

local followButtonCorner = Instance.new("UICorner")
followButtonCorner.CornerRadius = UDim.new(0, 8)
followButtonCorner.Parent = followButton

local stopButton = Instance.new("TextButton")
stopButton.Name = "StopButton"
stopButton.Parent = contentFrame
stopButton.Size = UDim2.new(0, 200, 0, 40)
stopButton.Position = UDim2.new(0.5, -100, 0.6, -20)
stopButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
stopButton.Text = "Reset"
stopButton.TextColor3 = Color3.fromRGB(0, 0, 0)
stopButton.TextSize = 14
stopButton.Font = Enum.Font.SourceSansBold
stopButton.BorderSizePixel = 0

local stopButtonCorner = Instance.new("UICorner")
stopButtonCorner.CornerRadius = UDim.new(0, 8)
stopButtonCorner.Parent = stopButton

local noteLabel = Instance.new("TextLabel")
noteLabel.Name = "NoteLabel"
noteLabel.Parent = contentFrame
noteLabel.Size = UDim2.new(1, -20, 0, 80)
noteLabel.Position = UDim2.new(0, 10, 0.75, 0)
noteLabel.BackgroundTransparency = 1
noteLabel.Text = "Note: This will move your cat to your current position when you press the button. Make sure you have a cat equipped or in your backpack. Uses Humanoid:MoveTo() for one-time movement."
noteLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
noteLabel.TextSize = 11
noteLabel.TextXAlignment = Enum.TextXAlignment.Center
noteLabel.TextYAlignment = Enum.TextYAlignment.Top
noteLabel.TextWrapped = true
noteLabel.Font = Enum.Font.SourceSans

local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Parent = contentFrame
watermark.Size = UDim2.new(1, -6, 0, 25)
watermark.Position = UDim2.new(0, 3, 1, -25)
watermark.BackgroundTransparency = 1
watermark.Text = "Jzee Scripts on YouTube | @notjzee on TikTok"
watermark.TextColor3 = Color3.fromRGB(150, 150, 150)
watermark.TextSize = 10
watermark.TextXAlignment = Enum.TextXAlignment.Center
watermark.Font = Enum.Font.SourceSans

local isMinimized = false
local entity = nil
local petTool = nil
local petUUID = nil

-- Cat keywords to search for
local catKeywords = {"Moon Cat", "Orange Tabby", "Cat"}

local function isCatPet(petName)
    local lowerPetName = string.lower(petName)
    for _, keyword in ipairs(catKeywords) do
        if string.find(lowerPetName, string.lower(keyword)) then
            return true
        end
    end
    return false
end

local function findEntityByUUID(uuid)
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") or obj:IsA("Part") then
            if obj:GetAttribute("PET_UUID") == uuid or obj:GetAttribute("UUID") == uuid then
                return obj
            end
            
            local uuidValue = obj:FindFirstChild("UUID")
            if uuidValue and uuidValue:IsA("StringValue") and uuidValue.Value == uuid then
                return obj
            end
        end
    end
    
    return nil
end

local function findCatInBackpack()
    for _, tool in pairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and isCatPet(tool.Name) then
            local uuid = tool:GetAttribute("PET_UUID")
            if uuid then
                return tool, uuid
            end
        end
    end
    return nil, nil
end

local function moveToPlayer(target)
    if not entity or not target or not target.Character then
        return false
    end
    
    local humanoid = entity:FindFirstChildOfClass("Humanoid")
    local targetHumanoidRootPart = target.Character:FindFirstChild("HumanoidRootPart")
    
    if humanoid and targetHumanoidRootPart then
        local playerPosition = targetHumanoidRootPart.Position
        humanoid:MoveTo(playerPosition)
        return true
    end
    
    return false
end

local function stopFollowing()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    
    targetPlayer = nil
end

local function sendNotification(message)
    task.spawn(function() 
        local Notification = game.ReplicatedStorage.GameEvents.Notification 
        firesignal(Notification.OnClientEvent, message) 
    end)
end

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

followButton.MouseButton1Click:Connect(function()
    petTool, petUUID = findCatInBackpack()
    
    if not petTool or not petUUID then
        sendNotification("You don't own a cat :(")
        followButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        followButton.Text = "No Cat Found!"
        wait(2)
        followButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        followButton.Text = "Move Cat to Me"
        return
    end
    
    entity = findEntityByUUID(petUUID)
    
    if not entity then
        followButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        followButton.Text = "Cat Not in World!"
        wait(2)
        followButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        followButton.Text = "Move Cat to Me"
        return
    end
    
    local success = moveToPlayer(player)
    if success then
        sendNotification("Parsed the cats in your Inventory and will now follow you.")
        followButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
        followButton.Text = "Cat Moving!"
        
        -- Reset button text after a delay
        task.wait(3)
        followButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        followButton.Text = "Move Cat to Me"
    else
        followButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        followButton.Text = "Failed to Move Cat!"
        wait(2)
        followButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        followButton.Text = "Move Cat to Me"
    end
end)

stopButton.MouseButton1Click:Connect(function()
    entity = nil
    petTool = nil
    petUUID = nil
    followButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    followButton.Text = "Move Cat to Me"
    sendNotification("Reset complete - ready to move cat again!")
end)
