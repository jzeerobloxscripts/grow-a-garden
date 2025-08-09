local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FreezeTradeGUI"
screenGui.Parent = playerGui

-- Minimized icon with animation
local minimizedIcon = Instance.new("TextButton")
minimizedIcon.Name = "MinimizedIcon"
minimizedIcon.Size = UDim2.new(0, 70, 0, 35)
minimizedIcon.Position = UDim2.new(0, 20, 0, 100)
minimizedIcon.BackgroundColor3 = Color3.fromRGB(52, 73, 94)
minimizedIcon.Text = "FT"
minimizedIcon.TextColor3 = Color3.fromRGB(236, 240, 241)
minimizedIcon.TextScaled = true
minimizedIcon.Font = Enum.Font.GothamBold
minimizedIcon.BorderSizePixel = 0
minimizedIcon.Visible = false
minimizedIcon.Parent = screenGui

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(0, 10)
iconCorner.Parent = minimizedIcon

local iconStroke = Instance.new("UIStroke")
iconStroke.Color = Color3.fromRGB(93, 109, 126)
iconStroke.Thickness = 2
iconStroke.Parent = minimizedIcon

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 420, 0, 280)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
mainFrame.BackgroundColor3 = Color3.fromRGB(44, 62, 80)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(93, 109, 126)
mainStroke.Thickness = 2
mainStroke.Parent = mainFrame

local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 8, 1, 8)
shadow.Position = UDim2.new(0, -4, 0, -4)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.8
shadow.ZIndex = mainFrame.ZIndex - 1
shadow.Parent = mainFrame

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 20)
shadowCorner.Parent = shadow

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(52, 73, 94)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 16)
titleCorner.Parent = titleBar

local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 16)
titleFix.Position = UDim2.new(0, 0, 1, -16)
titleFix.BackgroundColor3 = Color3.fromRGB(52, 73, 94)
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Size = UDim2.new(1, -90, 1, 0)
titleText.Position = UDim2.new(0, 20, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Freeze Trade"
titleText.TextColor3 = Color3.fromRGB(236, 240, 241)
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Font = Enum.Font.GothamBold
titleText.Parent = titleBar

-- Minimize button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Name = "MinimizeButton"
minimizeBtn.Size = UDim2.new(0, 35, 0, 35)
minimizeBtn.Position = UDim2.new(1, -80, 0, 7.5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(241, 196, 15)
minimizeBtn.Text = "—"
minimizeBtn.TextColor3 = Color3.fromRGB(52, 73, 94)
minimizeBtn.TextSize = 16
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Parent = titleBar

local minimizeBtnCorner = Instance.new("UICorner")
minimizeBtnCorner.CornerRadius = UDim.new(0, 8)
minimizeBtnCorner.Parent = minimizeBtn

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -40, 0, 7.5)
closeBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(236, 240, 241)
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 0
closeBtn.Parent = titleBar

local closeBtnCorner = Instance.new("UICorner")
closeBtnCorner.CornerRadius = UDim.new(0, 8)
closeBtnCorner.Parent = closeBtn

local dropdown = Instance.new("TextButton")
dropdown.Name = "Dropdown"
dropdown.Size = UDim2.new(0, 300, 0, 35)
dropdown.Position = UDim2.new(0.5, -150, 0, 65)
dropdown.BackgroundColor3 = Color3.fromRGB(52, 73, 94)
dropdown.Text = "Select Player ▼"
dropdown.TextColor3 = Color3.fromRGB(236, 240, 241)
dropdown.TextSize = 14
dropdown.Font = Enum.Font.GothamSemibold
dropdown.BorderSizePixel = 0
dropdown.ZIndex = 99
dropdown.Parent = mainFrame

local dropdownCorner = Instance.new("UICorner")
dropdownCorner.CornerRadius = UDim.new(0, 8)
dropdownCorner.Parent = dropdown

local dropdownStroke = Instance.new("UIStroke")
dropdownStroke.Color = Color3.fromRGB(93, 109, 126)
dropdownStroke.Thickness = 1
dropdownStroke.Parent = dropdown

local dropdownList = Instance.new("Frame")
dropdownList.Name = "DropdownList"
dropdownList.Size = UDim2.new(0, 300, 0, 0)
dropdownList.Position = UDim2.new(0.5, -150, 0, 100)
dropdownList.BackgroundColor3 = Color3.fromRGB(52, 73, 94)
dropdownList.BorderSizePixel = 0
dropdownList.ClipsDescendants = true
dropdownList.Visible = false
dropdownList.ZIndex = 100
dropdownList.Parent = mainFrame

local listCorner = Instance.new("UICorner")
listCorner.CornerRadius = UDim.new(0, 8)
listCorner.Parent = dropdownList

local listStroke = Instance.new("UIStroke")
listStroke.Color = Color3.fromRGB(93, 109, 126)
listStroke.Thickness = 1
listStroke.Parent = dropdownList

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 6
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(93, 109, 126)
scrollFrame.ZIndex = 101
scrollFrame.Parent = dropdownList

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = scrollFrame

local selectedPlayer = nil
local playerOptions = {}

-- Function to get player thumbnail
local function getPlayerThumbnail(userId)
    return "https://www.roblox.com/headshot-thumbnail/image?userId="..userId.."&width=60&height=60&format=png"
end

-- Function to update player list
local function updatePlayerList()
    -- Clear existing options
    for _, option in pairs(playerOptions) do
        if option and option.Parent then
            option:Destroy()
        end
    end
    playerOptions = {}
    
    local allPlayers = Players:GetPlayers()
    local otherPlayers = {}
    
    -- Filter out the local player
    for _, plr in pairs(allPlayers) do
        if plr ~= player and plr.Parent then
            table.insert(otherPlayers, plr)
        end
    end
    
    for i, plr in ipairs(otherPlayers) do
        local option = Instance.new("TextButton")
        option.Size = UDim2.new(1, -4, 0, 40)
        option.Position = UDim2.new(0, 2, 0, 0)
        option.BackgroundColor3 = Color3.fromRGB(44, 62, 80)
        option.Text = ""
        option.BorderSizePixel = 0
        option.ZIndex = 102
        option.LayoutOrder = i
        option.Parent = scrollFrame
        
        local optionCorner = Instance.new("UICorner")
        optionCorner.CornerRadius = UDim.new(0, 6)
        optionCorner.Parent = option
        
        -- Player thumbnail
        local thumbnail = Instance.new("ImageLabel")
        thumbnail.Size = UDim2.new(0, 30, 0, 30)
        thumbnail.Position = UDim2.new(0, 8, 0.5, -15)
        thumbnail.BackgroundColor3 = Color3.fromRGB(93, 109, 126)
        thumbnail.Image = getPlayerThumbnail(plr.UserId)
        thumbnail.Parent = option
        
        local thumbCorner = Instance.new("UICorner")
        thumbCorner.CornerRadius = UDim.new(0, 6)
        thumbCorner.Parent = thumbnail
        
        -- Player name text
        local nameText = Instance.new("TextLabel")
        nameText.Size = UDim2.new(1, -50, 1, 0)
        nameText.Position = UDim2.new(0, 45, 0, 0)
        nameText.BackgroundTransparency = 1
        nameText.Text = plr.DisplayName .. " (@" .. plr.Name .. ")"
        nameText.TextColor3 = Color3.fromRGB(236, 240, 241)
        nameText.TextSize = 12
        nameText.Font = Enum.Font.GothamMedium
        nameText.TextXAlignment = Enum.TextXAlignment.Left
        nameText.Parent = option
        
        option.MouseEnter:Connect(function()
            TweenService:Create(option, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
                {BackgroundColor3 = Color3.fromRGB(93, 109, 126)}):Play()
        end)
        
        option.MouseLeave:Connect(function()
            TweenService:Create(option, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
                {BackgroundColor3 = Color3.fromRGB(44, 62, 80)}):Play()
        end)
        
        option.MouseButton1Click:Connect(function()
            selectedPlayer = plr
            dropdown.Text = plr.DisplayName .. " (@" .. plr.Name .. ") ▼"
            
            -- Close dropdown with animation
            TweenService:Create(dropdownList, TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
                {Size = UDim2.new(0, 300, 0, 0)}):Play()
            
            wait(0.3)
            dropdownList.Visible = false
            updatePlayerInfo()
        end)
        
        table.insert(playerOptions, option)
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, #playerOptions * 42)
end

dropdown.MouseEnter:Connect(function()
    TweenService:Create(dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
        {BackgroundColor3 = Color3.fromRGB(93, 109, 126)}):Play()
end)

dropdown.MouseLeave:Connect(function()
    TweenService:Create(dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
        {BackgroundColor3 = Color3.fromRGB(52, 73, 94)}):Play()
end)

dropdown.MouseButton1Click:Connect(function()
    if dropdownList.Visible then
        TweenService:Create(dropdownList, TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
            {Size = UDim2.new(0, 300, 0, 0)}):Play()
        wait(0.3)
        dropdownList.Visible = false
    else
        updatePlayerList()
        dropdownList.Visible = true
        local maxHeight = math.min(#playerOptions * 42, 160)
        TweenService:Create(dropdownList, TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
            {Size = UDim2.new(0, 300, 0, maxHeight)}):Play()
    end
end)

-- Player info section (only target player)
local playerInfoFrame = Instance.new("Frame")
playerInfoFrame.Name = "PlayerInfoFrame"
playerInfoFrame.Size = UDim2.new(1, -30, 0, 90)
playerInfoFrame.Position = UDim2.new(0, 15, 0, 115)
playerInfoFrame.BackgroundColor3 = Color3.fromRGB(52, 73, 94)
playerInfoFrame.BorderSizePixel = 0
playerInfoFrame.Parent = mainFrame

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 12)
infoCorner.Parent = playerInfoFrame

local infoStroke = Instance.new("UIStroke")
infoStroke.Color = Color3.fromRGB(93, 109, 126)
infoStroke.Thickness = 1
infoStroke.Parent = playerInfoFrame

-- Target player info (centered)
local targetPlayerThumb = Instance.new("ImageLabel")
targetPlayerThumb.Size = UDim2.new(0, 65, 0, 65)
targetPlayerThumb.Position = UDim2.new(0.5, -32.5, 0, 12)
targetPlayerThumb.BackgroundColor3 = Color3.fromRGB(93, 109, 126)
targetPlayerThumb.Image = ""
targetPlayerThumb.Parent = playerInfoFrame

local targetThumbCorner = Instance.new("UICorner")
targetThumbCorner.CornerRadius = UDim.new(0, 10)
targetThumbCorner.Parent = targetPlayerThumb

-- Placeholder text for thumbnail
local placeholderText = Instance.new("TextLabel")
placeholderText.Size = UDim2.new(1, 0, 1, 0)
placeholderText.BackgroundTransparency = 1
placeholderText.Text = "?"
placeholderText.TextColor3 = Color3.fromRGB(149, 165, 166)
placeholderText.TextSize = 28
placeholderText.Font = Enum.Font.GothamBold
placeholderText.Parent = targetPlayerThumb

local targetDisplayName = Instance.new("TextLabel")
targetDisplayName.Size = UDim2.new(1, -20, 0, 10)
targetDisplayName.Position = UDim2.new(0, 10, 1, -20)
targetDisplayName.BackgroundTransparency = 1
targetDisplayName.Text = "No player selected"
targetDisplayName.TextColor3 = Color3.fromRGB(236, 240, 241)
targetDisplayName.TextSize = 11
targetDisplayName.Font = Enum.Font.GothamSemibold
targetDisplayName.TextXAlignment = Enum.TextXAlignment.Center
targetDisplayName.Parent = playerInfoFrame

local targetUsername = Instance.new("TextLabel")
targetUsername.Size = UDim2.new(1, -20, 0, 8)
targetUsername.Position = UDim2.new(0, 10, 1, -8)
targetUsername.BackgroundTransparency = 1
targetUsername.Text = "Select a player from dropdown"
targetUsername.TextColor3 = Color3.fromRGB(149, 165, 166)
targetUsername.TextSize = 9
targetUsername.Font = Enum.Font.GothamMedium
targetUsername.TextXAlignment = Enum.TextXAlignment.Center
targetUsername.Parent = playerInfoFrame

-- Function to update player info display with animation
function updatePlayerInfo()
    if selectedPlayer and selectedPlayer.Parent then
        -- Fade out animation
        TweenService:Create(targetPlayerThumb, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
            {ImageTransparency = 1}):Play()
        TweenService:Create(placeholderText, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
            {TextTransparency = 1}):Play()
        TweenService:Create(targetDisplayName, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
            {TextTransparency = 1}):Play()
        TweenService:Create(targetUsername, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
            {TextTransparency = 1}):Play()
        
        wait(0.2)
        
        -- Update content
        targetPlayerThumb.Image = getPlayerThumbnail(selectedPlayer.UserId)
        targetDisplayName.Text = selectedPlayer.DisplayName
        targetUsername.Text = "@" .. selectedPlayer.Name
        placeholderText.Visible = false
        
        -- Fade in animation
        TweenService:Create(targetPlayerThumb, TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
            {ImageTransparency = 0}):Play()
        TweenService:Create(targetDisplayName, TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
            {TextTransparency = 0}):Play()
        TweenService:Create(targetUsername, TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
            {TextTransparency = 0}):Play()
    else
        -- Reset to placeholder
        targetPlayerThumb.Image = ""
        targetDisplayName.Text = "No player selected"
        targetUsername.Text = "Select a player from dropdown"
        placeholderText.Visible = true
        
        TweenService:Create(placeholderText, TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
            {TextTransparency = 0}):Play()
    end
end

-- Toggle options
local optionsFrame = Instance.new("Frame")
optionsFrame.Name = "OptionsFrame"
optionsFrame.Size = UDim2.new(1, -30, 0, 70)
optionsFrame.Position = UDim2.new(0, 15, 0, 215)
optionsFrame.BackgroundColor3 = Color3.fromRGB(52, 73, 94)
optionsFrame.BorderSizePixel = 0
optionsFrame.Parent = mainFrame

local optionsCorner = Instance.new("UICorner")
optionsCorner.CornerRadius = UDim.new(0, 12)
optionsCorner.Parent = optionsFrame

local optionsStroke = Instance.new("UIStroke")
optionsStroke.Color = Color3.fromRGB(93, 109, 126)
optionsStroke.Thickness = 1
optionsStroke.Parent = optionsFrame

-- Toggle states
local freezeTargetTrade = false
local antiDetection = false
local bypassTradeFailed = false

-- Function to create toggle button with animations
local function createToggle(name, yPos)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, -20, 0, 20)
    toggleFrame.Position = UDim2.new(0, 10, 0, yPos)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Parent = optionsFrame
    
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Size = UDim2.new(0, 200, 1, 0)
    toggleLabel.Position = UDim2.new(0, 0, 0, 0)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = name .. ":"
    toggleLabel.TextColor3 = Color3.fromRGB(236, 240, 241)
    toggleLabel.TextSize = 11
    toggleLabel.Font = Enum.Font.GothamSemibold
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.Parent = toggleFrame
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 65, 0, 18)
    toggleButton.Position = UDim2.new(1, -65, 0.5, -9)
    toggleButton.BackgroundColor3 = Color3.fromRGB(192, 57, 43)
    toggleButton.Text = "OFF"
    toggleButton.TextColor3 = Color3.fromRGB(236, 240, 241)
    toggleButton.TextSize = 9
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.BorderSizePixel = 0
    toggleButton.Parent = toggleFrame
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 6)
    toggleCorner.Parent = toggleButton
    
    toggleButton.MouseEnter:Connect(function()
        local currentState = (name == "Freeze Target Trade" and freezeTargetTrade) or 
                           (name == "Anti Detection" and antiDetection) or 
                           (name == "Bypass Trade Failed" and bypassTradeFailed)
        
        if currentState then
            TweenService:Create(toggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
                {BackgroundColor3 = Color3.fromRGB(39, 174, 96)}):Play()
        else
            TweenService:Create(toggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
                {BackgroundColor3 = Color3.fromRGB(231, 76, 60)}):Play()
        end
    end)
    
    toggleButton.MouseLeave:Connect(function()
        local currentState = (name == "Freeze Target Trade" and freezeTargetTrade) or 
                           (name == "Anti Detection" and antiDetection) or 
                           (name == "Bypass Trade Failed" and bypassTradeFailed)
        
        if currentState then
            TweenService:Create(toggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
                {BackgroundColor3 = Color3.fromRGB(46, 204, 113)}):Play()
        else
            TweenService:Create(toggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
                {BackgroundColor3 = Color3.fromRGB(192, 57, 43)}):Play()
        end
    end)
    
    toggleButton.MouseButton1Click:Connect(function()
        -- Scale animation on click
        TweenService:Create(toggleButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad), 
            {Size = UDim2.new(0, 62, 0, 16)}):Play()
        wait(0.1)
        TweenService:Create(toggleButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad), 
            {Size = UDim2.new(0, 65, 0, 18)}):Play()
        
        if name == "Freeze Target Trade" then
            freezeTargetTrade = not freezeTargetTrade
        elseif name == "Anti Detection" then
            antiDetection = not antiDetection
        elseif name == "Bypass Trade Failed" then
            bypassTradeFailed = not bypassTradeFailed
        end
        
        local currentState = (name == "Freeze Target Trade" and freezeTargetTrade) or 
                           (name == "Anti Detection" and antiDetection) or 
                           (name == "Bypass Trade Failed" and bypassTradeFailed)
        
        if currentState then
            TweenService:Create(toggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
                {BackgroundColor3 = Color3.fromRGB(46, 204, 113)}):Play()
            toggleButton.Text = "ON"
        else
            TweenService:Create(toggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), 
                {BackgroundColor3 = Color3.fromRGB(192, 57, 43)}):Play()
            toggleButton.Text = "OFF"
        end
    end)
    
    return toggleButton
end

-- Create toggle buttons
createToggle("Freeze Target Trade", 8)
createToggle("Anti Detection", 28)
createToggle("Bypass Trade Failed", 48)

local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(1, 0, 0, 15)
watermark.Position = UDim2.new(0, 0, 1, -15)
watermark.BackgroundTransparency = 1
watermark.Text = "by @notjzee on TikTok"
watermark.TextColor3 = Color3.fromRGB(149, 165, 166)
watermark.TextSize = 8
watermark.TextXAlignment = Enum.TextXAlignment.Center
watermark.TextYAlignment = Enum.TextYAlignment.Center
watermark.Font = Enum.Font.GothamMedium
watermark.Parent = mainFrame

-- Button functionality with animations
minimizeBtn.MouseEnter:Connect(function()
    TweenService:Create(minimizeBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
        {BackgroundColor3 = Color3.fromRGB(243, 156, 18)}):Play()
end)

minimizeBtn.MouseLeave:Connect(function()
    TweenService:Create(minimizeBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
        {BackgroundColor3 = Color3.fromRGB(241, 196, 15)}):Play()
end)

closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
        {BackgroundColor3 = Color3.fromRGB(192, 57, 43)}):Play()
end)

closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
        {BackgroundColor3 = Color3.fromRGB(231, 76, 60)}):Play()
end)

minimizeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad), 
        {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
    wait(0.4)
    mainFrame.Visible = false
    minimizedIcon.Visible = true
    TweenService:Create(minimizedIcon, TweenInfo.new(0.3, Enum.EasingStyle.Back), 
        {Size = UDim2.new(0, 70, 0, 35)}):Play()
end)

minimizedIcon.MouseEnter:Connect(function()
    TweenService:Create(minimizedIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
        {BackgroundColor3 = Color3.fromRGB(93, 109, 126)}):Play()
end)

minimizedIcon.MouseLeave:Connect(function()
    TweenService:Create(minimizedIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad), 
        {BackgroundColor3 = Color3.fromRGB(52, 73, 94)}):Play()
end)

minimizedIcon.MouseButton1Click:Connect(function()
    minimizedIcon.Visible = false
    mainFrame.Visible = true
    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), 
        {Size = UDim2.new(0, 420, 0, 280), Position = UDim2.new(0.5, -210, 0.5, -140)}):Play()
end)

closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(
