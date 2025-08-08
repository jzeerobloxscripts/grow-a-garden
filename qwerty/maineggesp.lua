local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EggRandomizerGUI"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 320, 0, 250)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(85, 170, 255)
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

-- Shadow effect
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

-- Title bar
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
titleText.Text = "Egg Randomizer"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextScaled = true
titleText.TextXAlignment = Enum.TextXAlignment.Center
titleText.Font = Enum.Font.FredokaOne
titleText.Parent = titleBar

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "×"
closeButton.Font = Enum.Font.GothamSemibold
closeButton.TextSize = 20
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 60, 80)
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 7.5)
closeButton.BorderSizePixel = 0

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton
closeButton.Parent = titleBar

-- Egg randomizer data
local rareChancePercentage = 0.1
local espEnabled = false
local truePetMap = {}
local trackedEggs = {}

local petTable = {
    ["Common Egg"] = { "Dog", "Bunny", "Golden Lab" },
    ["Uncommon Egg"] = { "Chicken", "Black Bunny", "Cat", "Deer" },
    ["Rare Egg"] = { "Pig", "Monkey", "Rooster", "Orange Tabby", "Spotted Deer" },
    ["Legendary Egg"] = { "Cow", "Sea Otter", "Turtle", "Silver Monkey", "Polar Bear" },
    ["Mythical Egg"] = { "Grey Mouse", "Brown Mouse", "Squirrel", "Red Giant Ant", "Red Fox" },
    ["Bug Egg"] = { "Snail", "Caterpillar", "Giant Ant", "Praying Mantis", "Dragonfly" },
    ["Night Egg"] = { "Frog", "Hedgehog", "Mole", "Echo Frog", "Night Owl", "Raccoon" },
    ["Bee Egg"] = { "Bee", "Honey Bee", "Bear Bee", "Petal Bee", "Queen Bee" },
    ["Anti Bee Egg"] = { "Wasp", "Moth", "Tarantula Hawk", "Butterfly", "Disco Bee" },
    ["Oasis Egg"] = { "Meerkat", "Sand Snake", "Axolotl", "Hyacinth Macaw", "Fennec Fox" },
    ["Paradise Egg"] = { "Ostrich", "Peacock", "Capybara", "Scarlet Macaw", "Mimic Octopus" },
    ["Dinosaur Egg"] = { "Raptor", "Triceratops", "Stegosaurus", "Pterodactyl", "Brontosaurus", "T-Rex" },
    ["Primal Egg"] = { "Parasaurolophus", "Iguanodon", "Pachycephalosaurus", "Dilophosaurus", "Ankylosaurus", "Spinosaurus" },
    ["Zen Egg"] = { "Shiba Inu", "Nihonzaru", "Tanuki", "Tanchozuru", "Kappa", "Kitsune" },
    ["Gourmet Egg"] = { "Bagel Bunny", "Pancake Mole", "Sushi Bear", "Spaghetti Sloth", "French Fry Ferret" }
}

local rarePets = {
    ["Kitsune"] = "Zen Egg",
    ["T-Rex"] = "Dinosaur Egg",
    ["Spinosaurus"] = "Primal Egg",
    ["Dragonfly"] = "Bug Egg",
    ["Butterfly"] = "Anti Bee Egg",
    ["Disco Bee"] = "Anti Bee Egg",
    ["Queen Bee"] = "Bee Egg",
    ["Red Fox"] = "Mythical Egg",
    ["Fennec Fox"] = "Oasis Egg",
    ["Mimic Octopus"] = "Paradise Egg",
    ["Polar Bear"] = "Legendary Egg",
    ["French Fry Ferret"] = "Gourmet Egg"
}

-- Helper functions
local function rainbowEffect(label)
    if not label or not label:IsDescendantOf(game) then return end
    spawn(function()
        local hue = 0
        while wait(0.03) and label and label:IsDescendantOf(game) do
            hue = (hue + 0.01) % 1
            pcall(function()
                label.TextColor3 = Color3.fromHSV(hue, 1, 1)
            end)
        end
    end)
end

local function glitchLabelEffect(label)
    if not label then return end
    spawn(function()
        local original = label.TextColor3
        for i = 1, 2 do
            pcall(function()
                label.TextColor3 = Color3.new(1, 0, 0)
            end)
            wait(0.07)
            pcall(function()
                label.TextColor3 = original
            end)
            wait(0.07)
        end
    end)
end

local function getHatchState(eggModel)
    if not eggModel then return false end
    local hatchReady = true
    local hatchTime = eggModel:FindFirstChild("HatchTime")
    local readyFlag = eggModel:FindFirstChild("ReadyToHatch")
    if hatchTime and hatchTime:IsA("NumberValue") and hatchTime.Value > 0 then
        hatchReady = false
    elseif readyFlag and readyFlag:IsA("BoolValue") and not readyFlag.Value then
        hatchReady = false
    end
    return hatchReady
end

local function selectPetForEgg(eggName)
    local pets = petTable[eggName]
    if not pets then return "Unknown" end
    if math.random(1, 100) <= rareChancePercentage then
        for petName, requiredEgg in pairs(rarePets) do
            if requiredEgg == eggName then
                return petName
            end
        end
    end
    return pets[math.random(1, #pets)]
end

local function applyEggESP(eggModel)
    if not eggModel then return end
    if trackedEggs[eggModel] then return end
    
    local existingLabel = eggModel:FindFirstChild("PetBillboard", true)
    if existingLabel then existingLabel:Destroy() end
    local existingHighlight = eggModel:FindFirstChild("ESPHighlight")
    if existingHighlight then existingHighlight:Destroy() end
    
    if not espEnabled then return end
    
    local basePart = eggModel:FindFirstChildWhichIsA("BasePart")
    if not basePart then return end
    
    local hatchReady = getHatchState(eggModel)
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "PetBillboard"
    billboard.Size = UDim2.new(0, 270, 0, 25)
    billboard.StudsOffset = Vector3.new(0, 4.5, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 500
    billboard.Parent = basePart
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "["..eggModel.Name.."] ???"
    if not hatchReady then
        label.Text = "["..eggModel.Name.."] ??? (Not Ready)"
        label.TextColor3 = Color3.fromRGB(160, 160, 160)
        label.TextStrokeTransparency = 0.5
    else
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextStrokeTransparency = 0
    end
    label.TextScaled = false
    label.TextSize = 18
    label.TextWrapped = false
    label.TextTruncate = Enum.TextTruncate.AtEnd
    label.Font = Enum.Font.FredokaOne
    label.Parent = billboard
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESPHighlight"
    highlight.FillColor = Color3.fromRGB(255, 200, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.7
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Adornee = eggModel
    highlight.Parent = eggModel
    
    trackedEggs[eggModel] = {billboard, highlight}
end

local function removeEggESP(eggModel)
    if not eggModel or not trackedEggs[eggModel] then return end
    for _, obj in ipairs(trackedEggs[eggModel]) do
        if obj and obj.Parent then
            obj:Destroy()
        end
    end
    trackedEggs[eggModel] = nil
end

local function removeAllESP()
    for eggModel, espObjects in pairs(trackedEggs) do
        for _, obj in ipairs(espObjects) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
    end
    trackedEggs = {}
end

local function getPlayerGardenEggs(radius)
    local eggs = {}
    local char = player.Character
    if not char then return eggs end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return eggs end
    
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and petTable[obj.Name] then
            pcall(function()
                local modelCFrame = obj:GetModelCFrame()
                if modelCFrame then
                    local dist = (modelCFrame.Position - root.Position).Magnitude
                    if dist <= (radius or 60) then
                        if not truePetMap[obj] then
                            truePetMap[obj] = selectPetForEgg(obj.Name)
                        end
                        table.insert(eggs, obj)
                    end
                end
            end)
        end
    end
    return eggs
end

local function animateEggESP(eggModel, duration, finalPet)
    if not eggModel or not duration or not finalPet then return end
    local billboard = trackedEggs[eggModel] and trackedEggs[eggModel][1]
    if not billboard then return end
    local label = billboard:FindFirstChild("TextLabel")
    if not label then return end
    
    local eggName = eggModel.Name
    local pets = petTable[eggName] or {}
    local allPets = {}
    for _, pet in ipairs(pets) do
        table.insert(allPets, pet)
    end
    for petName, eggType in pairs(rarePets) do
        if eggType == eggName then
            table.insert(allPets, petName)
        end
    end
    
    local hatchReady = getHatchState(eggModel)
    local hatchString = hatchReady and "" or " (Not Ready)"
    local startTime = tick()
    local endTime = startTime + duration
    local lastUpdate = startTime
    local interval = 0.05
    
    while tick() < endTime do
        local elapsed = tick() - startTime
        local progress = elapsed / duration
        interval = 0.05 + (0.5 - 0.05) * progress
        if tick() - lastUpdate >= interval then
            lastUpdate = tick()
            pcall(function()
                if #allPets > 0 then
                    label.Text = "["..eggName.."] "..allPets[math.random(1, #allPets)]..hatchString
                end
            end)
        end
        wait()
    end
    
    pcall(function()
        label.Text = "["..eggName.."] "..finalPet..hatchString
        if rarePets[finalPet] then
            rainbowEffect(label)
        elseif hatchReady then
            glitchLabelEffect(label)
        end
    end)
end

local function randomizeNearbyEggs()
    local eggs = getPlayerGardenEggs(60)
    for _, egg in ipairs(eggs) do
        local finalPet = selectPetForEgg(egg.Name)
        truePetMap[egg] = finalPet
        if espEnabled then
            if not trackedEggs[egg] then
                applyEggESP(egg)
            end
            if trackedEggs[egg] then
                spawn(function()
                    animateEggESP(egg, 5, finalPet)
                end)
            end
        end
    end
    return #eggs
end

-- Main content area
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -20, 1, -60)
contentFrame.Position = UDim2.new(0, 10, 0, 50)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- Randomize button
local randomizeButton = Instance.new("TextButton")
randomizeButton.Name = "RandomizeButton"
randomizeButton.Size = UDim2.new(0, 250, 0, 40)
randomizeButton.Position = UDim2.new(0.5, -125, 0, 10)
randomizeButton.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
randomizeButton.Text = "Randomize Pets"
randomizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
randomizeButton.TextSize = 18
randomizeButton.Font = Enum.Font.FredokaOne
randomizeButton.BorderSizePixel = 2
randomizeButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
randomizeButton.Parent = contentFrame

local randomizeCorner = Instance.new("UICorner")
randomizeCorner.CornerRadius = UDim.new(0, 8)
randomizeCorner.Parent = randomizeButton

-- ESP Toggle button
local espToggle = Instance.new("TextButton")
espToggle.Name = "ESPToggle"
espToggle.Size = UDim2.new(0, 250, 0, 35)
espToggle.Position = UDim2.new(0.5, -125, 0, 60)
espToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
espToggle.Text = "ESP: OFF"
espToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
espToggle.TextSize = 16
espToggle.Font = Enum.Font.FredokaOne
espToggle.BorderSizePixel = 1
espToggle.BorderColor3 = Color3.fromRGB(85, 170, 255)
espToggle.Parent = contentFrame

local espCorner = Instance.new("UICorner")
espCorner.CornerRadius = UDim.new(0, 6)
espCorner.Parent = espToggle

-- Auto Randomize button
local autoToggle = Instance.new("TextButton")
autoToggle.Name = "AutoToggle"
autoToggle.Size = UDim2.new(0, 250, 0, 35)
autoToggle.Position = UDim2.new(0.5, -125, 0, 105)
autoToggle.BackgroundColor3 = Color3.fromRGB(80, 150, 60)
autoToggle.Text = "Auto Randomize: OFF"
autoToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
autoToggle.TextSize = 16
autoToggle.Font = Enum.Font.FredokaOne
autoToggle.BorderSizePixel = 1
autoToggle.BorderColor3 = Color3.fromRGB(120, 180, 90)
autoToggle.Parent = contentFrame

local autoCorner = Instance.new("UICorner")
autoCorner.CornerRadius = UDim.new(0, 6)
autoCorner.Parent = autoToggle

-- Status label
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, -20, 0, 25)
statusLabel.Position = UDim2.new(0, 10, 0, 150)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Ready to randomize!"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextSize = 14
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.TextYAlignment = Enum.TextYAlignment.Top
statusLabel.TextWrapped = true
statusLabel.Font = Enum.Font.GothamSemibold
statusLabel.Parent = contentFrame

-- Watermark
local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(1, 0, 0, 15)
watermark.Position = UDim2.new(0, 0, 1, -15)
watermark.BackgroundTransparency = 1
watermark.Text = "Egg Randomizer v1.0"
watermark.TextColor3 = Color3.fromRGB(120, 120, 120)
watermark.TextSize = 10
watermark.TextXAlignment = Enum.TextXAlignment.Center
watermark.TextYAlignment = Enum.TextYAlignment.Center
watermark.Font = Enum.Font.GothamSemibold
watermark.Parent = mainFrame

-- Drag functionality
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

-- Button interactions
randomizeButton.MouseEnter:Connect(function()
    TweenService:Create(randomizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 185, 255)}):Play()
end)

randomizeButton.MouseLeave:Connect(function()
    TweenService:Create(randomizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(85, 170, 255)}):Play()
end)

espToggle.MouseEnter:Connect(function()
    TweenService:Create(espToggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(75, 75, 85)}):Play()
end)

espToggle.MouseLeave:Connect(function()
    TweenService:Create(espToggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 70)}):Play()
end)

autoToggle.MouseEnter:Connect(function()
    TweenService:Create(autoToggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(95, 165, 75)}):Play()
end)

autoToggle.MouseLeave:Connect(function()
    TweenService:Create(autoToggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 150, 60)}):Play()
end)

closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(220, 80, 100)}):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 60, 80)}):Play()
end)

-- Button functionality
local isRandomizing = false
local isToggling = false
local autoRunning = false
local isAutoProcessing = false

randomizeButton.MouseButton1Click:Connect(function()
    if isRandomizing then return end
    isRandomizing = true
    randomizeButton.Active = false
    espToggle.Active = false
    autoToggle.Active = false
    statusLabel.Text = "Starting randomization..."
    randomizeButton.Text = "Randomizing..."
    
    local count = randomizeNearbyEggs()
    randomizeButton.Text = "Randomized "..count.." Pets!"
    statusLabel.Text = "Randomized "..count.." pets!"
    wait(1.5)
    
    randomizeButton.Text = "Randomize Pets"
    statusLabel.Text = "Ready to randomize!"
    randomizeButton.Active = true
    espToggle.Active = true
    autoToggle.Active = true
    isRandomizing = false
end)

espToggle.MouseButton1Click:Connect(function()
    if isToggling then return end
    isToggling = true
    espToggle.Active = false
    
    espEnabled = not espEnabled
    espToggle.Text = espEnabled and "ESP: ON" or "ESP: OFF"
    
    if espEnabled then
        local eggs = getPlayerGardenEggs(60)
        for _, egg in pairs(eggs) do
            applyEggESP(egg)
        end
    else
        removeAllESP()
    end
    
    statusLabel.Text = "ESP " .. (espEnabled and "enabled" or "disabled")
    wait(0.5)
    espToggle.Active = true
    isToggling = false
end)

autoToggle.MouseButton1Click:Connect(function()
    if isAutoProcessing then return end
    isAutoProcessing = true
    
    autoRunning = not autoRunning
    autoToggle.Text = autoRunning and "Auto Randomize: ON" or "Auto Randomize: OFF"
    statusLabel.Text = autoRunning and "Auto-randomize started!" or "Auto-randomize stopped"

    if autoRunning then
        randomizeButton.Active = false
        espToggle.Active = false
        autoToggle.Active = false

        spawn(function()
            while autoRunning do
                statusLabel.Text = "Auto-randomizing..."
                randomizeButton.Text = "Randomizing..."
                local count = randomizeNearbyEggs()
                randomizeButton.Text = "Randomized "..count.." Pets!"
                statusLabel.Text = "Randomized "..count.." pets!"

                local foundRare = false
                for _, petName in pairs(truePetMap) do
                    if rarePets[petName] then
                        foundRare = true
                        statusLabel.Text = "Found rare pet: " .. petName
                        autoRunning = false
                        autoToggle.Text = "Auto Randomize: OFF"
                        break
                    end
                end

                wait(1.5)
                if foundRare then
                    randomizeButton.Text = "Randomize Pets"
                    statusLabel.Text = "Found rare pet! Stopped."
                else
                    randomizeButton.Text = "Randomize Pets"
                    statusLabel.Text = "Ready to randomize!"
                end
                wait(1)
            end
            randomizeButton.Active = true
            espToggle.Active = true
            autoToggle.Active = true
            isAutoProcessing = false
        end)
    else
        isAutoProcessing = false
    end
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Initialize
spawn(function()
    wait(1)
    local eggs = getPlayerGardenEggs(60)
    for _, egg in pairs(eggs) do
        if not truePetMap[egg] then
            truePetMap[egg] = selectPetForEgg(egg.Name)
        end
        if espEnabled then
            applyEggESP(egg)
        end
    end
    
    statusLabel.Text = #eggs == 0 and "No eggs found nearby" or "Found "..#eggs.." eggs nearby"
end)
