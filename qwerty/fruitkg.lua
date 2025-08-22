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
mainFrame.Size = UDim2.new(0, 400, 0, 320)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -160)
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
titleLabel.Text = "Unlimited Fruit KG"
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
statusLabel.Text = "Ready to activate Unlimited Fruit KG"
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextSize = 14
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.Font = Enum.Font.SourceSans
statusLabel.BorderSizePixel = 0

local statusLabelCorner = Instance.new("UICorner")
statusLabelCorner.CornerRadius = UDim.new(0, 6)
statusLabelCorner.Parent = statusLabel

local objectTextBox = Instance.new("TextBox")
objectTextBox.Name = "ObjectTextBox"
objectTextBox.Parent = contentFrame
objectTextBox.Size = UDim2.new(1, -40, 0, 35)
objectTextBox.Position = UDim2.new(0, 20, 0, 80)
objectTextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
objectTextBox.PlaceholderText = "Enter object name (Case Sensitive!)"
objectTextBox.Text = ""
objectTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
objectTextBox.TextSize = 12
objectTextBox.Font = Enum.Font.SourceSans
objectTextBox.BorderSizePixel = 0

local objectTextBoxCorner = Instance.new("UICorner")
objectTextBoxCorner.CornerRadius = UDim.new(0, 6)
objectTextBoxCorner.Parent = objectTextBox

local activateButton = Instance.new("TextButton")
activateButton.Name = "ActivateButton"
activateButton.Parent = contentFrame
activateButton.Size = UDim2.new(0, 200, 0, 50)
activateButton.Position = UDim2.new(0.5, -100, 0, 130)
activateButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
activateButton.Text = "Enter Object Name First"
activateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
activateButton.TextSize = 16
activateButton.Font = Enum.Font.SourceSansBold
activateButton.BorderSizePixel = 0

local activateButtonCorner = Instance.new("UICorner")
activateButtonCorner.CornerRadius = UDim.new(0, 8)
activateButtonCorner.Parent = activateButton

local noteLabel = Instance.new("TextLabel")
noteLabel.Name = "NoteLabel"
noteLabel.Parent = contentFrame
noteLabel.Size = UDim2.new(1, -20, 0, 80)
noteLabel.Position = UDim2.new(0, 10, 0, 195)
noteLabel.BackgroundTransparency = 1
noteLabel.Text = "WARNING: Object names are CASE SENSITIVE! Double check your spelling or the function will fail. Click on objects to enlarge them 10x."
noteLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
noteLabel.TextSize = 12
noteLabel.TextXAlignment = Enum.TextXAlignment.Center
noteLabel.TextYAlignment = Enum.TextYAlignment.Top
noteLabel.TextWrapped = true
noteLabel.Font = Enum.Font.SourceSansBold

local isMinimized = false
local isActivated = false

local SIZE_MULTIPLIER = 10
local CLICK_COOLDOWN = 0.5

local mouse = player:GetMouse()
local enlargedObjects = {}
local lastClickTime = 0
local currentHoverText = ""
local targetObjectName = ""

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

local function isObjectText(text)
    if not text then return false end
    
    local lowerText = text:lower()
    local targetLower = targetObjectName:lower()
    
    return string.find(lowerText, targetLower) ~= nil
end

local function findHoverText()
    local function searchForText(gui)
        if gui:IsA("TextLabel") or gui:IsA("TextButton") then
            if gui.Visible and gui.Text and gui.Text ~= "" then
                local mousePos = UserInputService:GetMouseLocation()
                local guiPos = gui.AbsolutePosition
                local guiSize = gui.AbsoluteSize
                
                local distance = math.sqrt((mousePos.X - (guiPos.X + guiSize.X/2))^2 + (mousePos.Y - (guiPos.Y + guiSize.Y/2))^2)
                
                if distance < 300 then
                    return gui.Text
                end
            end
        end
        
        for _, child in pairs(gui:GetChildren()) do
            local result = searchForText(child)
            if result then return result end
        end
        
        return nil
    end
    
    for _, gui in pairs(playerGui:GetChildren()) do
        local text = searchForText(gui)
        if text then return text end
    end
    
    return nil
end

local function findObjectModel(part)
    local current = part
    
    while current and current.Parent do
        if current.Parent == workspace or 
           current:FindFirstChild("Humanoid") or 
           current.ClassName == "Model" then
            return current
        end
        current = current.Parent
    end
    
    return part
end

local function scaleModel(model, scaleFactor)
    if not model then return end
    
    local referencePart = nil
    if model:IsA("Model") then
        referencePart = model.PrimaryPart or model:FindFirstChildOfClass("BasePart")
    elseif model:IsA("BasePart") then
        referencePart = model
    end
    
    if not referencePart then return end
    
    local originalCFrame = referencePart.CFrame
    
    local parts = {}
    if model:IsA("Model") then
        for _, obj in pairs(model:GetDescendants()) do
            if obj:IsA("BasePart") then
                table.insert(parts, obj)
            end
        end
    else
        table.insert(parts, model)
    end
    
    for _, part in pairs(parts) do
        part.Size = part.Size * scaleFactor
        
        if part ~= referencePart then
            local relativePos = originalCFrame:Inverse() * part.CFrame
            local scaledPos = relativePos.Position * scaleFactor
            part.CFrame = originalCFrame * CFrame.new(scaledPos) * (relativePos - relativePos.Position)
        end
    end
end

local function enlargeObject(objectModel, objectName)
    if not objectModel then return end
    
    if enlargedObjects[objectModel] then
        return
    end
    
    enlargedObjects[objectModel] = true
    
    scaleModel(objectModel, SIZE_MULTIPLIER)
end

local function onMouseClick()
    if not isActivated or targetObjectName == "" then return end
    
    local currentTime = tick()
    
    if currentTime - lastClickTime < CLICK_COOLDOWN then
        return
    end
    lastClickTime = currentTime
    
    local target = mouse.Target
    
    if target and target:IsA("BasePart") then
        local hoverText = findHoverText()
        
        if hoverText and isObjectText(hoverText) then
            local objectModel = findObjectModel(target)
            enlargeObject(objectModel, hoverText)
            return
        end
        
        local objectName = target.Name:lower()
        local targetLower = targetObjectName:lower()
        if string.find(objectName, targetLower) then
            local objectModel = findObjectModel(target)
            enlargeObject(objectModel, targetObjectName)
            return
        end
        
        if target.Parent then
            local parentName = target.Parent.Name:lower()
            if string.find(parentName, targetLower) then
                local objectModel = findObjectModel(target)
                enlargeObject(objectModel, targetObjectName)
                return
            end
        end
    end
end

local function monitorHoverText()
    if not isActivated or targetObjectName == "" then return end
    
    local hoverText = findHoverText()
    
    if hoverText ~= currentHoverText then
        currentHoverText = hoverText
    end
end

local function cleanupDestroyedObjects()
    for model, data in pairs(enlargedObjects) do
        if not model or not model.Parent then
            enlargedObjects[model] = nil
        end
    end
end

local function animateResize(targetSize, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local tween = TweenService:Create(mainFrame, tweenInfo, {Size = targetSize})
    tween:Play()
end

local function updateButtonState()
    if objectTextBox.Text ~= "" then
        activateButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        activateButton.Text = "Activate"
    else
        activateButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        activateButton.Text = "Enter Object Name First"
    end
end

objectTextBox:GetPropertyChangedSignal("Text"):Connect(updateButtonState)

activateButton.MouseButton1Click:Connect(function()
    if isActivated or objectTextBox.Text == "" then return end
    
    isActivated = true
    targetObjectName = objectTextBox.Text
    
    activateButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    activateButton.Text = "Activated - Click Objects!"
    
    statusLabel.Text = "Script Active! Click on '" .. targetObjectName .. "' objects to enlarge them!"
    
    mouse.Button1Down:Connect(onMouseClick)
    
    RunService.Heartbeat:Connect(function()
        monitorHoverText()
        cleanupDestroyedObjects()
    end)
end)

minimizeButton.MouseButton1Click:Connect(function()
    if not isMinimized then
        animateResize(UDim2.new(0, 400, 0, 35), 0.3)
        contentFrame.Visible = false
        isMinimized = true
        minimizeButton.Text = "+"
    else
        animateResize(UDim2.new(0, 400, 0, 320), 0.3)
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
