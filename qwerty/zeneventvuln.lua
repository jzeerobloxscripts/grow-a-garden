local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InfiniteZenEgg"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 150)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
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
titleText.Text = "Inf Zen Event Items Vuln"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextScaled = true
titleText.TextXAlignment = Enum.TextXAlignment.Center
titleText.Font = Enum.Font.FredokaOne
titleText.Parent = titleBar

local loadButton = Instance.new("TextButton")
loadButton.Name = "LoadButton"
loadButton.Size = UDim2.new(0, 200, 0, 40)
loadButton.Position = UDim2.new(0.5, -100, 0, 50)
loadButton.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
loadButton.Text = "Load Vuln"
loadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
loadButton.TextScaled = true
loadButton.Font = Enum.Font.FredokaOne
loadButton.BorderSizePixel = 2
loadButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
loadButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = loadButton

local noteText = Instance.new("TextLabel")
noteText.Name = "NoteText"
noteText.Size = UDim2.new(1, -20, 0, 30)
noteText.Position = UDim2.new(0, 10, 0, 95)
noteText.BackgroundTransparency = 1
noteText.Text = "Note: This will LAG A LOT because it will Spam Claim the Zen Items. Click Stop Vuln to stop the process."
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

loadButton.MouseEnter:Connect(function()
    TweenService:Create(loadButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 185, 255)}):Play()
end)

loadButton.MouseLeave:Connect(function()
    TweenService:Create(loadButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(85, 170, 255)}):Play()
end)

local isRunning = false
local notificationLoop = nil
local inventoryUpdateLoop = nil

local function checkZenInventory()
    local backpack = player.Backpack
    local character = player.Character
    
    local zenItems = {}
    local foundItems = {
        zenEgg = false,
        zenSeedPack = false,
        zenCrate = false,
        zenGnomeCrate = false
    }
    
    print("=== INVENTORY DEBUG ===")
    print("Backpack items:")
    for _, item in pairs(backpack:GetChildren()) do
        print("- " .. item.Name .. " (Type: " .. item.ClassName .. ")")
    end
    
    if character then
        print("Character items:")
        for _, item in pairs(character:GetChildren()) do
            if item:IsA("Tool") or item:IsA("Accessory") then
                print("- " .. item.Name .. " (Type: " .. item.ClassName .. ")")
            end
        end
    end
    print("=== END DEBUG ===")
    
    local function checkItem(item)
        local itemName = item.Name:lower()
        if itemName:find("zen") and itemName:find("egg") then
            foundItems.zenEgg = true
            print("Found Zen Egg: " .. item.Name)
        elseif itemName:find("zen") and itemName:find("seed") then
            foundItems.zenSeedPack = true
            print("Found Zen Seed Pack: " .. item.Name)
        elseif itemName:find("zen") and itemName:find("crate") and not itemName:find("gnome") then
            foundItems.zenCrate = true
            print("Found Zen Crate: " .. item.Name)
        elseif itemName:find("zen") and itemName:find("gnome") and itemName:find("crate") then
            foundItems.zenGnomeCrate = true
            print("Found Zen Gnome Crate: " .. item.Name)
        end
    end
    
    for _, item in pairs(backpack:GetChildren()) do
        checkItem(item)
    end
    
    if character then
        for _, item in pairs(character:GetChildren()) do
            if item:IsA("Tool") or item:IsA("Accessory") then
                checkItem(item)
            end
        end
    end
    
    if foundItems.zenEgg then
        table.insert(zenItems, "x1 Zen Egg Rewarded!")
    end
    if foundItems.zenSeedPack then
        table.insert(zenItems, "x1 Zen Seed Pack Rewarded!")
    end
    if foundItems.zenCrate then
        table.insert(zenItems, "x1 Zen Crate Rewarded!")
    end
    if foundItems.zenGnomeCrate then
        table.insert(zenItems, "x1 Zen Gnome Crate Rewarded!")
    end
    
    if foundItems.zenEgg or foundItems.zenSeedPack or foundItems.zenCrate or foundItems.zenGnomeCrate then
        table.insert(zenItems, "x20 Chi Rewarded!")
    end
    
    print("Total Zen items found: " .. #zenItems)
    return zenItems
end

local function updateInventoryQuantities()
    local backpack = player.Backpack
    local character = player.Character
    
    local function updateItem(item)
        local itemName = item.Name
        if itemName:lower():find("zen") and itemName:lower():find("egg") then
            local currentNum = tonumber(string.match(itemName, "x(%d+)")) or 1
            item.Name = string.gsub(itemName, "x%d+", "x" .. (currentNum + 1))
        elseif itemName:lower():find("zen") and itemName:lower():find("seed") then
            local currentNum = tonumber(string.match(itemName, "%[X(%d+)%]")) or 1
            item.Name = string.gsub(itemName, "%[X%d+%]", "[X" .. (currentNum + 1) .. "]")
        elseif itemName:lower():find("zen") and itemName:lower():find("crate") and not itemName:lower():find("gnome") then
            local currentNum = tonumber(string.match(itemName, "x(%d+)")) or 1
            item.Name = string.gsub(itemName, "x%d+", "x" .. (currentNum + 1))
        elseif itemName:lower():find("zen") and itemName:lower():find("gnome") and itemName:lower():find("crate") then
            local currentNum = tonumber(string.match(itemName, "x(%d+)")) or 1
            item.Name = string.gsub(itemName, "x%d+", "x" .. (currentNum + 1))
        end
    end
    
    for _, item in pairs(backpack:GetChildren()) do
        if item:IsA("Tool") or item:IsA("Accessory") then
            updateItem(item)
        end
    end
    
    if character then
        for _, item in pairs(character:GetChildren()) do
            if item:IsA("Tool") or item:IsA("Accessory") then
                updateItem(item)
            end
        end
    end
end

local function startVuln()
    local zenItems = checkZenInventory()
    
    if #zenItems == 0 or (#zenItems == 1 and zenItems[1] == "x20 Chi Rewarded!") then
        loadButton.Text = "Error: No Zen Items in Inventory"
        task.wait(2)
        loadButton.Text = "Load Vuln"
        return
    end
    
    isRunning = true
    loadButton.Text = "Loading Vuln..."
    
    task.wait(3)
    
    loadButton.Text = "Stop Vuln"
    
    notificationLoop = task.spawn(function()
        local Notification = game.ReplicatedStorage.GameEvents.Notification
        while isRunning do
            local currentZenItems = checkZenInventory()
            if #currentZenItems > 0 then
                local randomMessage = currentZenItems[math.random(1, #currentZenItems)]
                firesignal(Notification.OnClientEvent, randomMessage)
            end
            task.wait(0.01)
        end
    end)
    
    inventoryUpdateLoop = task.spawn(function()
        while isRunning do
            updateInventoryQuantities()
            task.wait(0.3)
        end
    end)
end

local function stopVuln()
    isRunning = false
    
    if notificationLoop then
        task.cancel(notificationLoop)
        notificationLoop = nil
    end
    
    if inventoryUpdateLoop then
        task.cancel(inventoryUpdateLoop)
        inventoryUpdateLoop = nil
    end
    
    loadButton.Text = "Load Vuln"
end

loadButton.MouseButton1Click:Connect(function()
    if not isRunning then
        startVuln()
    else
        stopVuln()
    end
end)
