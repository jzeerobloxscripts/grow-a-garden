local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FreezeTradeGUI"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 380)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -190)
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(85, 170, 255)
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 6, 1, 6)
shadow.Position = UDim2.new(0, -3, 0, -3)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.7
shadow.ZIndex = mainFrame.ZIndex - 1
shadow.Parent = mainFrame

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 15)
shadowCorner.Parent = shadow

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 12)
titleFix.Position = UDim2.new(0, 0, 1, -12)
titleFix.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Size = UDim2.new(1, -20, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Freeze Trade"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextScaled = true
titleText.TextXAlignment = Enum.TextXAlignment.Center
titleText.Font = Enum.Font.FredokaOne
titleText.Parent = titleBar

local dropdown = Instance.new("TextButton")
dropdown.Name = "Dropdown"
dropdown.Size = UDim2.new(0, 280, 0, 25)
dropdown.Position = UDim2.new(0.5, -140, 0, 50)
dropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
dropdown.Text = "Select Player ▼"
dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
dropdown.TextSize = 14
dropdown.Font = Enum.Font.FredokaOne
dropdown.BorderSizePixel = 1
dropdown.BorderColor3 = Color3.fromRGB(85, 170, 255)
dropdown.ZIndex = 99
dropdown.Parent = mainFrame

local dropdownCorner = Instance.new("UICorner")
dropdownCorner.CornerRadius = UDim.new(0, 4)
dropdownCorner.Parent = dropdown

local dropdownList = Instance.new("Frame")
dropdownList.Name = "DropdownList"
dropdownList.Size = UDim2.new(0, 280, 0, 0)
dropdownList.Position = UDim2.new(0.5, -140, 0, 75)
dropdownList.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
dropdownList.BorderSizePixel = 1
dropdownList.BorderColor3 = Color3.fromRGB(85, 170, 255)
dropdownList.ClipsDescendants = true
dropdownList.Visible = false
dropdownList.ZIndex = 100
dropdownList.Parent = mainFrame

local listCorner = Instance.new("UICorner")
listCorner.CornerRadius = UDim.new(0, 4)
listCorner.Parent = dropdownList

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 4
scrollFrame.ZIndex = 101
scrollFrame.Parent = dropdownList

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = scrollFrame

local selectedPlayer = nil
local playerOptions = {}

-- Function to get player thumbnail
local function getPlayerThumbnail(userId)
    local thumbnailUrl = "https://www.roblox.com/headshot-thumbnail/image?userId="..userId.."&width=60&height=60&format=png"
    return thumbnailUrl
end

-- Function to update player list
local function updatePlayerList()
    -- Clear existing options
    for _, option in pairs(playerOptions) do
        option:Destroy()
    end
    playerOptions = {}
    
    local players = Players:GetPlayers()
    for i, plr in ipairs(players) do
        if plr ~= player then -- Don't include local player
            local option = Instance.new("TextButton")
            option.Size = UDim2.new(1, 0, 0, 30)
            option.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            option.Text = ""
            option.BorderSizePixel = 0
            option.ZIndex = 102
            option.Parent = scrollFrame
            
            -- Player thumbnail
            local thumbnail = Instance.new("ImageLabel")
            thumbnail.Size = UDim2.new(0, 25, 0, 25)
            thumbnail.Position = UDim2.new(0, 5, 0.5, -12.5)
            thumbnail.BackgroundTransparency = 1
            thumbnail.Image = getPlayerThumbnail(plr.UserId)
            thumbnail.Parent = option
            
            local thumbCorner = Instance.new("UICorner")
            thumbCorner.CornerRadius = UDim.new(0, 4)
            thumbCorner.Parent = thumbnail
            
            -- Player name text
            local nameText = Instance.new("TextLabel")
            nameText.Size = UDim2.new(1, -40, 1, 0)
            nameText.Position = UDim2.new(0, 35, 0, 0)
            nameText.BackgroundTransparency = 1
            nameText.Text = plr.DisplayName .. " (@" .. plr.Name .. ")"
            nameText.TextColor3 = Color3.fromRGB(255, 255, 255)
            nameText.TextSize = 12
            nameText.Font = Enum.Font.FredokaOne
            nameText.TextXAlignment = Enum.TextXAlignment.Left
            nameText.Parent = option
            
            option.MouseEnter:Connect(function()
                option.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
            end)
            
            option.MouseLeave:Connect(function()
                option.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            end)
            
            option.MouseButton1Click:Connect(function()
                selectedPlayer = plr
                dropdown.Text = plr.DisplayName .. " ▼"
                dropdownList.Visible = false
                TweenService:Create(dropdownList, TweenInfo.new(0.2), {Size = UDim2.new(0, 280, 0, 0)}):Play()
                updatePlayerInfo()
            end)
            
            table.insert(playerOptions, option)
        end
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, #playerOptions * 30)
end

dropdown.MouseButton1Click:Connect(function()
    if dropdownList.Visible then
        dropdownList.Visible = false
        TweenService:Create(dropdownList, TweenInfo.new(0.2), {Size = UDim2.new(0, 280, 0, 0)}):Play()
    else
        updatePlayerList()
        dropdownList.Visible = true
        TweenService:Create(dropdownList, TweenInfo.new(0.2), {Size = UDim2.new(0, 280, 0, math.min(#playerOptions * 30, 120))}):Play()
    end
end)

-- Player info section
local playerInfoFrame = Instance.new("Frame")
playerInfoFrame.Name = "PlayerInfoFrame"
playerInfoFrame.Size = UDim2.new(1, -20, 0, 80)
playerInfoFrame.Position = UDim2.new(0, 10, 0, 85)
playerInfoFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
playerInfoFrame.BorderSizePixel = 1
playerInfoFrame.BorderColor3 = Color3.fromRGB(85, 170, 255)
playerInfoFrame.Parent = mainFrame

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 6)
infoCorner.Parent = playerInfoFrame

-- Local player info (left side)
local localPlayerThumb = Instance.new("ImageLabel")
localPlayerThumb.Size = UDim2.new(0, 50, 0, 50)
localPlayerThumb.Position = UDim2.new(0, 10, 0, 5)
localPlayerThumb.BackgroundTransparency = 1
localPlayerThumb.Image = getPlayerThumbnail(player.UserId)
localPlayerThumb.Parent = playerInfoFrame

local localThumbCorner = Instance.new("UICorner")
localThumbCorner.CornerRadius = UDim.new(0, 6)
localThumbCorner.Parent = localPlayerThumb

local localDisplayName = Instance.new("TextLabel")
localDisplayName.Size = UDim2.new(0, 120, 0, 12)
localDisplayName.Position = UDim2.new(0, 10, 0, 58)
localDisplayName.BackgroundTransparency = 1
localDisplayName.Text = "Display Name: " .. player.DisplayName
localDisplayName.TextColor3 = Color3.fromRGB(255, 255, 255)
localDisplayName.TextSize = 10
localDisplayName.Font = Enum.Font.GothamSemibold
localDisplayName.TextXAlignment = Enum.TextXAlignment.Left
localDisplayName.Parent = playerInfoFrame

local localUsername = Instance.new("TextLabel")
localUsername.Size = UDim2.new(0, 120, 0, 12)
localUsername.Position = UDim2.new(0, 10, 0, 68)
localUsername.BackgroundTransparency = 1
localUsername.Text = "Username: @" .. player.Name
localUsername.TextColor3 = Color3.fromRGB(200, 200, 200)
localUsername.TextSize = 10
localUsername.Font = Enum.Font.GothamSemibold
localUsername.TextXAlignment = Enum.TextXAlignment.Left
localUsername.Parent = playerInfoFrame

-- Target player info (right side)
local targetPlayerThumb = Instance.new("ImageLabel")
targetPlayerThumb.Size = UDim2.new(0, 50, 0, 50)
targetPlayerThumb.Position = UDim2.new(1, -60, 0, 5)
targetPlayerThumb.BackgroundTransparency = 1
targetPlayerThumb.Image = ""
targetPlayerThumb.Parent = playerInfoFrame

local targetThumbCorner = Instance.new("UICorner")
targetThumbCorner.CornerRadius = UDim.new(0, 6)
targetThumbCorner.Parent = targetPlayerThumb

local targetDisplayName = Instance.new("TextLabel")
targetDisplayName.Size = UDim2.new(0, 120, 0, 12)
targetDisplayName.Position = UDim2.new(1, -180, 0, 58)
targetDisplayName.BackgroundTransparency = 1
targetDisplayName.Text = "Other player display name:"
targetDisplayName.TextColor3 = Color3.fromRGB(255, 255, 255)
targetDisplayName.TextSize = 10
targetDisplayName.Font = Enum.Font.GothamSemibold
targetDisplayName.TextXAlignment = Enum.TextXAlignment.Right
targetDisplayName.Parent = playerInfoFrame

local targetUsername = Instance.new("TextLabel")
targetUsername.Size = UDim2.new(0, 120, 0, 12)
targetUsername.Position = UDim2.new(1, -180, 0, 68)
targetUsername.BackgroundTransparency = 1
targetUsername.Text = "Other player username:"
targetUsername.TextColor3 = Color3.fromRGB(200, 200, 200)
targetUsername.TextSize = 10
targetUsername.Font = Enum.Font.GothamSemibold
targetUsername.TextXAlignment = Enum.TextXAlignment.Right
targetUsername.Parent = playerInfoFrame

-- Function to update player info display
function updatePlayerInfo()
    if selectedPlayer then
        targetPlayerThumb.Image = getPlayerThumbnail(selectedPlayer.UserId)
        targetDisplayName.Text = "Other player display name: " .. selectedPlayer.DisplayName
        targetUsername.Text = "Other player username: @" .. selectedPlayer.Name
    else
        targetPlayerThumb.Image = ""
        targetDisplayName.Text = "Other player display name:"
        targetUsername.Text = "Other player username:"
    end
end

-- Toggle options
local optionsFrame = Instance.new("Frame")
optionsFrame.Name = "OptionsFrame"
optionsFrame.Size = UDim2.new(1, -20, 0, 90)
optionsFrame.Position = UDim2.new(0, 10, 0, 175)
optionsFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
optionsFrame.BorderSizePixel = 1
optionsFrame.BorderColor3 = Color3.fromRGB(85, 170, 255)
optionsFrame.Parent = mainFrame

local optionsCorner = Instance.new("UICorner")
optionsCorner.CornerRadius = UDim.new(0, 6)
optionsCorner.Parent = optionsFrame

-- Toggle states
local freezeTargetTrade = false
local antiDetection = false
local bypassTradeFailed = false

-- Function to create toggle button
local function createToggle(name, yPos, toggleVar)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, -20, 0, 25)
    toggleFrame.Position = UDim2.new(0, 10, 0, yPos)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Parent = optionsFrame
    
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Size = UDim2.new(0, 200, 1, 0)
    toggleLabel.Position = UDim2.new(0, 0, 0, 0)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = name .. ":"
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.TextSize = 12
    toggleLabel.Font = Enum.Font.FredokaOne
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.Parent = toggleFrame
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 60, 0, 20)
    toggleButton.Position = UDim2.new(1, -60, 0.5, -10)
    toggleButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    toggleButton.Text = "OFF"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.TextSize = 10
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.BorderSizePixel = 0
    toggleButton.Parent = toggleFrame
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 4)
    toggleCorner.Parent = toggleButton
    
    toggleButton.MouseButton1Click:Connect(function()
        if name == "Freeze Target Trade" then
            freezeTargetTrade = not freezeTargetTrade
            toggleVar = freezeTargetTrade
        elseif name == "Anti Detection" then
            antiDetection = not antiDetection
            toggleVar = antiDetection
        elseif name == "Bypass Trade Failed" then
            bypassTradeFailed = not bypassTradeFailed
            toggleVar = bypassTradeFailed
        end
        
        if (name == "Freeze Target Trade" and freezeTargetTrade) or 
           (name == "Anti Detection" and antiDetection) or 
           (name == "Bypass Trade Failed" and bypassTradeFailed) then
            toggleButton.BackgroundColor3 = Color3.fromRGB(50, 180, 50)
            toggleButton.Text = "ON"
        else
            toggleButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
            toggleButton.Text = "OFF"
        end
    end)
    
    return toggleButton
end

-- Create toggle buttons
createToggle("Freeze Target Trade", 5)
createToggle("Anti Detection", 32)
createToggle("Bypass Trade Failed", 59)

local startButton = Instance.new("TextButton")
startButton.Name = "StartButton"
startButton.Size = UDim2.new(0, 100, 0, 35)
startButton.Position = UDim2.new(0.5, -50, 0, 275)
startButton.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
startButton.Text = "Start"
startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
startButton.TextScaled = true
startButton.Font = Enum.Font.FredokaOne
startButton.BorderSizePixel = 2
startButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
startButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = startButton

local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(1, 0, 0, 15)
watermark.Position = UDim2.new(0, 0, 1, -15)
watermark.BackgroundTransparency = 1
watermark.Text = "by @notjzee on TikTok"
watermark.TextColor3 = Color3.fromRGB(120, 120, 120)
watermark.TextSize = 8
watermark.TextXAlignment = Enum.TextXAlignment.Center
watermark.TextYAlignment = Enum.TextYAlignment.Center
watermark.Font = Enum.Font.GothamSemibold
watermark.Parent = mainFrame

mainFrame.Active = true
mainFrame.Draggable = true

local dragging = false
local dragStart = nil
local startPos = nil

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        mainFrame.Draggable = false
    end
end)

titleBar.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
        mainFrame.Draggable = true
    end
end)

startButton.MouseEnter:Connect(function()
    TweenService:Create(startButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 185, 255)}):Play()
end)

startButton.MouseLeave:Connect(function()
    TweenService:Create(startButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(85, 170, 255)}):Play()
end)

startButton.MouseButton1Click:Connect(function()
    -- Freeze Trade functionality goes here
    print("Freeze Trade Started!")
    print("Target Player:", selectedPlayer and selectedPlayer.Name or "None")
    print("Freeze Target Trade:", freezeTargetTrade)
    print("Anti Detection:", antiDetection)
    print("Bypass Trade Failed:", bypassTradeFailed)
end)

-- Auto-update player list when players join/leave
Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)
