local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EggRandomizerGUI"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 380, 0, 320) -- Increased size
mainFrame.Position = UDim2.new(0.5, -190, 0.5, -175) -- Adjusted position for bigger frame
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
titleText.Text = "Egg Randomizer"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextScaled = true
titleText.TextXAlignment = Enum.TextXAlignment.Center
titleText.Font = Enum.Font.FredokaOne
titleText.Parent = titleBar

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

local rareChancePercentage = 0.1
local espEnabled = false
local kgEnabled = false
local autoRandomize = false
local truePetMap = {}
local kgPredictions = {}
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

local function generateKGPrediction()
    local rand = math.random()
    if rand < 0.6 then
        return math.random(90, 190) / 100
    elseif rand < 0.85 then
        return math.random(191, 260) / 100
    elseif rand < 0.95 then
        return math.random(261, 390) / 100
    elseif rand < 0.99 then
        return math.random(391, 599) / 100
    elseif rand < 0.999 then
        return math.random(600, 799) / 100
    else
        return math.random(800, 987) / 100
    end
end

local function getKGLabel(kg)
    if kg >= 0.80 and kg <= 1.90 then
        return "Tiny"
    elseif kg >= 1.91 and kg <= 2.60 then
        return "Normal"
    elseif kg >= 2.61 and kg <= 3.90 then
        return "Good"
    elseif kg >= 3.91 and kg <= 5.99 then
        return "Semi-Huge"
    elseif kg >= 6.00 and kg <= 7.99 then
        return "Huge"
    elseif kg >= 8.00 and kg <= 9.87 then
        return "Titanic"
    else
        return "Unknown"
    end
end

local function applyEggESP(eggModel)
    if not eggModel then return end
    if trackedEggs[eggModel] then return end
    
    local existingLabel = eggModel:FindFirstChild("PetBillboard", true)
    if existingLabel then existingLabel:Destroy() end
    local existingHighlight = eggModel:FindFirstChild("ESPHighlight")
    if existingHighlight then existingHighlight:Destroy() end
    
    if not espEnabled and not kgEnabled then return end
    
    local basePart = eggModel:FindFirstChildWhichIsA("BasePart")
    if not basePart then return end
    
    local hatchReady = getHatchState(eggModel)
    
    -- Calculate billboard height based on enabled features
    local billboardHeight = 0
    if espEnabled then billboardHeight = billboardHeight + 25 end
    if kgEnabled then billboardHeight = billboardHeight + 25 end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "PetBillboard"
    billboard.Size = UDim2.new(0, 270, 0, billboardHeight)
    billboard.StudsOffset = Vector3.new(0, 4.5, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 500
    billboard.Parent = basePart
    
    local currentYPos = 0
    
    -- Pet ESP Label (Top)
    if espEnabled then
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 0, 25)
        label.Position = UDim2.new(0, 0, 0, currentYPos)
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
        label.TextStrokeColor3 = Color3.new(0, 0, 0)
        label.TextScaled = false
        label.TextSize = 18
        label.TextWrapped = false
        label.TextTruncate = Enum.TextTruncate.AtEnd
        label.Font = Enum.Font.FredokaOne
        label.Parent = billboard
        currentYPos = currentYPos + 25
    end
    
    -- KG ESP Label (Bottom)
    if kgEnabled then
        if not kgPredictions[eggModel] then
            kgPredictions[eggModel] = generateKGPrediction()
        end
        
        local kgLabel = Instance.new("TextLabel")
        kgLabel.Size = UDim2.new(1, 0, 0, 25)
        kgLabel.Position = UDim2.new(0, 0, 0, currentYPos)
        kgLabel.BackgroundTransparency = 1
        local kg = kgPredictions[eggModel]
        local kgType = getKGLabel(kg)
        kgLabel.Text = "["..kgType.." | "..string.format("%.2f", kg).."kg]"
        kgLabel.TextColor3 = Color3.new(1, 1, 1) -- Changed to white
        kgLabel.TextStrokeTransparency = 0
        kgLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        kgLabel.TextScaled = false
        kgLabel.TextSize = 14
        kgLabel.TextWrapped = false
        kgLabel.TextTruncate = Enum.TextTruncate.AtEnd
        kgLabel.Font = Enum.Font.GothamSemibold
        kgLabel.Parent = billboard
    end
    
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
        if espEnabled or kgEnabled then
            if not trackedEggs[egg] then
                applyEggESP(egg)
            end
            if trackedEggs[egg] and espEnabled then
                spawn(function()
                    animateEggESP(egg, 5, finalPet)
                end)
            end
        end
    end
    return #eggs
end

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "ScrollingFrame"
scrollingFrame.Size = UDim2.new(1, -20, 1, -60)
scrollingFrame.Position = UDim2.new(0, 10, 0, 50)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(85, 170, 255)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 230) -- Increased canvas size
scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
scrollingFrame.Parent = mainFrame

local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, 0, 0, 230) -- Increased content size
contentFrame.Position = UDim2.new(0, 0, 0, 0)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = scrollingFrame

local randomizeButton = Instance.new("TextButton")
randomizeButton.Name = "RandomizeButton"
randomizeButton.Size = UDim2.new(0, 300, 0, 40) -- Increased width
randomizeButton.Position = UDim2.new(0.5, -150, 0, 10)
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

local espContainer = Instance.new("Frame")
espContainer.Name = "ESPContainer"
espContainer.Size = UDim2.new(0, 300, 0, 30) -- Increased width
espContainer.Position = UDim2.new(0.5, -150, 0, 60)
espContainer.BackgroundTransparency = 1
espContainer.Parent = contentFrame

local espLabel = Instance.new("TextLabel")
espLabel.Name = "ESPLabel"
espLabel.Size = UDim2.new(0, 60, 1, 0)
espLabel.Position = UDim2.new(0, 0, 0, 0)
espLabel.BackgroundTransparency = 1
espLabel.Text = "ESP:"
espLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
espLabel.TextSize = 14
espLabel.Font = Enum.Font.GothamSemibold
espLabel.TextXAlignment = Enum.TextXAlignment.Left
espLabel.Parent = espContainer

local espSwitch = Instance.new("Frame")
espSwitch.Name = "ESPSwitch"
espSwitch.Size = UDim2.new(0, 50, 0, 25)
espSwitch.Position = UDim2.new(0, 70, 0, 2.5)
espSwitch.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
espSwitch.BorderSizePixel = 1
espSwitch.BorderColor3 = Color3.fromRGB(85, 170, 255)
espSwitch.Parent = espContainer

local espSwitchCorner = Instance.new("UICorner")
espSwitchCorner.CornerRadius = UDim.new(0, 12)
espSwitchCorner.Parent = espSwitch

local espSwitchButton = Instance.new("TextButton")
espSwitchButton.Name = "ESPSwitchButton"
espSwitchButton.Size = UDim2.new(0, 20, 0, 20)
espSwitchButton.Position = UDim2.new(0, 2.5, 0, 2.5)
espSwitchButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
espSwitchButton.Text = ""
espSwitchButton.BorderSizePixel = 0
espSwitchButton.Parent = espSwitch

local espButtonCorner = Instance.new("UICorner")
espButtonCorner.CornerRadius = UDim.new(0, 10)
espButtonCorner.Parent = espSwitchButton

local kgContainer = Instance.new("Frame")
kgContainer.Name = "KGContainer"
kgContainer.Size = UDim2.new(0, 300, 0, 30) -- Increased width
kgContainer.Position = UDim2.new(0.5, -150, 0, 95)
kgContainer.BackgroundTransparency = 1
kgContainer.Parent = contentFrame

local kgLabel = Instance.new("TextLabel")
kgLabel.Name = "KGLabel"
kgLabel.Size = UDim2.new(0, 120, 1, 0)
kgLabel.Position = UDim2.new(0, 0, 0, 0)
kgLabel.BackgroundTransparency = 1
kgLabel.Text = "Predict KG (beta):"
kgLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
kgLabel.TextSize = 14
kgLabel.Font = Enum.Font.GothamSemibold
kgLabel.TextXAlignment = Enum.TextXAlignment.Left
kgLabel.Parent = kgContainer

local kgSwitch = Instance.new("Frame")
kgSwitch.Name = "KGSwitch"
kgSwitch.Size = UDim2.new(0, 50, 0, 25)
kgSwitch.Position = UDim2.new(0, 130, 0, 2.5)
kgSwitch.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
kgSwitch.BorderSizePixel = 1
kgSwitch.BorderColor3 = Color3.fromRGB(85, 170, 255)
kgSwitch.Parent = kgContainer

local kgSwitchCorner = Instance.new("UICorner")
kgSwitchCorner.CornerRadius = UDim.new(0, 12)
kgSwitchCorner.Parent = kgSwitch

local kgSwitchButton = Instance.new("TextButton")
kgSwitchButton.Name = "KGSwitchButton"
kgSwitchButton.Size = UDim2.new(0, 20, 0, 20)
kgSwitchButton.Position = UDim2.new(0, 2.5, 0, 2.5)
kgSwitchButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
kgSwitchButton.Text = ""
kgSwitchButton.BorderSizePixel = 0
kgSwitchButton.Parent = kgSwitch

local kgButtonCorner = Instance.new("UICorner")
kgButtonCorner.CornerRadius = UDim.new(0, 10)
kgButtonCorner.Parent = kgSwitchButton

local autoContainer = Instance.new("Frame")
autoContainer.Name = "AutoContainer"
autoContainer.Size = UDim2.new(0, 300, 0, 30) -- Increased width
autoContainer.Position = UDim2.new(0.5, -150, 0, 130)
autoContainer.BackgroundTransparency = 1
autoContainer.Parent = contentFrame

local autoLabel = Instance.new("TextLabel")
autoLabel.Name = "AutoLabel"
autoLabel.Size = UDim2.new(0, 120, 1, 0)
autoLabel.Position = UDim2.new(0, 0, 0, 0)
autoLabel.BackgroundTransparency = 1
autoLabel.Text = "Auto Randomize:"
autoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
autoLabel.TextSize = 14
autoLabel.Font = Enum.Font.GothamSemibold
autoLabel.TextXAlignment = Enum.TextXAlignment.Left
autoLabel.Parent = autoContainer

local autoSwitch = Instance.new("Frame")
autoSwitch.Name = "AutoSwitch"
autoSwitch.Size = UDim2.new(0, 50, 0, 25)
autoSwitch.Position = UDim2.new(0, 130, 0, 2.5)
autoSwitch.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
autoSwitch.BorderSizePixel = 1
autoSwitch.BorderColor3 = Color3.fromRGB(85, 170, 255)
autoSwitch.Parent = autoContainer

local autoSwitchCorner = Instance.new("UICorner")
autoSwitchCorner.CornerRadius = UDim.new(0, 12)
autoSwitchCorner.Parent = autoSwitch

local autoSwitchButton = Instance.new("TextButton")
autoSwitchButton.Name = "AutoSwitchButton"
autoSwitchButton.Size = UDim2.new(0, 20, 0, 20)
autoSwitchButton.Position = UDim2.new(0, 2.5, 0, 2.5)
autoSwitchButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
autoSwitchButton.Text = ""
autoSwitchButton.BorderSizePixel = 0
autoSwitchButton.Parent = autoSwitch

local autoButtonCorner = Instance.new("UICorner")
autoButtonCorner.CornerRadius = UDim.new(0, 10)
autoButtonCorner.Parent = autoSwitchButton

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

randomizeButton.MouseEnter:Connect(function()
    TweenService:Create(randomizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 185, 255)}):Play()
end)

randomizeButton.MouseLeave:Connect(function()
    TweenService:Create(randomizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(85, 170, 255)}):Play()
end)

closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(220, 80, 100)}):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 60, 80)}):Play()
end)

local isRandomizing = false

local function toggleSwitch(switchFrame, switchButton, enabled, onColor, offColor)
    if enabled then
        TweenService:Create(switchButton, TweenInfo.new(0.2), {Position = UDim2.new(0, 27.5, 0, 2.5)}):Play()
        TweenService:Create(switchFrame, TweenInfo.new(0.2), {BackgroundColor3 = onColor}):Play()
        TweenService:Create(switchButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    else
        TweenService:Create(switchButton, TweenInfo.new(0.2), {Position = UDim2.new(0, 2.5, 0, 2.5)}):Play()
        TweenService:Create(switchFrame, TweenInfo.new(0.2), {BackgroundColor3 = offColor}):Play()
        TweenService:Create(switchButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 200, 200)}):Play()
    end
end

espSwitchButton.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    toggleSwitch(espSwitch, espSwitchButton, espEnabled, Color3.fromRGB(85, 170, 255), Color3.fromRGB(60, 60, 70))
    
    if espEnabled then
        local eggs = getPlayerGardenEggs(60)
        for _, egg in pairs(eggs) do
            applyEggESP(egg)
        end
    else
        if not kgEnabled then
            removeAllESP()
        else
            -- Refresh ESP for KG-only display
            for eggModel, _ in pairs(trackedEggs) do
                removeEggESP(eggModel)
                applyEggESP(eggModel)
            end
        end
    end
end)

kgSwitchButton.MouseButton1Click:Connect(function()
    kgEnabled = not kgEnabled
    toggleSwitch(kgSwitch, kgSwitchButton, kgEnabled, Color3.fromRGB(255, 215, 0), Color3.fromRGB(60, 60, 70))
    
    if kgEnabled then
        local eggs = getPlayerGardenEggs(60)
        for _, egg in pairs(eggs) do
            applyEggESP(egg)
        end
    else
        if not espEnabled then
            removeAllESP()
        else
            -- Refresh ESP for pet-only display
            for eggModel, _ in pairs(trackedEggs) do
                removeEggESP(eggModel)
                applyEggESP(eggModel)
            end
        end
    end
end)

autoSwitchButton.MouseButton1Click:Connect(function()
    autoRandomize = not autoRandomize
    toggleSwitch(autoSwitch, autoSwitchButton, autoRandomize, Color3.fromRGB(80, 150, 60), Color3.fromRGB(60, 60, 70))
end)

randomizeButton.MouseButton1Click:Connect(function()
    if isRandomizing then return end
    isRandomizing = true
    randomizeButton.Active = false
    randomizeButton.Text = "Randomizing..."
    
    if autoRandomize then
        spawn(function()
            while autoRandomize and isRandomizing do
                local count = randomizeNearbyEggs()
                randomizeButton.Text = "Randomized "..count.." Pets!"
                
                local foundRare = false
                for _, petName in pairs(truePetMap) do
                    if rarePets[petName] then
                        foundRare = true
                        randomizeButton.Text = "Found Rare: "..petName
                        autoRandomize = false
                        toggleSwitch(autoSwitch, autoSwitchButton, false, Color3.fromRGB(80, 150, 60), Color3.fromRGB(60, 60, 70))
                        break
                    end
                end
                
                if foundRare then break end
                wait(2)
            end
            randomizeButton.Text = "Randomize Pets"
            randomizeButton.Active = true
            isRandomizing = false
        end)
    else
        local count = randomizeNearbyEggs()
        randomizeButton.Text = "Randomized "..count.." Pets!"
        wait(1.5)
        randomizeButton.Text = "Randomize Pets"
        randomizeButton.Active = true
        isRandomizing = false
    end
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

spawn(function()
    wait(1)
    local eggs = getPlayerGardenEggs(60)
    for _, egg in pairs(eggs) do
        if not truePetMap[egg] then
            truePetMap[egg] = selectPetForEgg(egg.Name)
        end
        if espEnabled or kgEnabled then
            applyEggESP(egg)
        end
    end
end)
