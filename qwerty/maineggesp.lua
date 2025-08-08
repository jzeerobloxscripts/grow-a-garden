local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create main GUI with enhanced visuals
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EggRandomizerGUI"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 350, 0, 450)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Modern gradient background
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(45, 45, 65)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 35, 55)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(25, 25, 45))
}
gradient.Rotation = 45
gradient.Parent = mainFrame

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 15)
mainCorner.Parent = mainFrame

-- Enhanced shadow effect
local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 8, 1, 8)
shadow.Position = UDim2.new(0, -4, 0, -4)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.6
shadow.ZIndex = mainFrame.ZIndex - 1
shadow.Parent = mainFrame

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 19)
shadowCorner.Parent = shadow

-- Modern title bar with gradient
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(120, 200, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(85, 170, 255)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(50, 140, 220))
}
titleGradient.Rotation = 90
titleGradient.Parent = titleBar

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 15)
titleCorner.Parent = titleBar

local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 15)
titleFix.Position = UDim2.new(0, 0, 1, -15)
titleFix.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

local titleFixGradient = Instance.new("UIGradient")
titleFixGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(120, 200, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(85, 170, 255)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(50, 140, 220))
}
titleFixGradient.Rotation = 90
titleFixGradient.Parent = titleFix

local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Size = UDim2.new(1, -60, 1, 0)
titleText.Position = UDim2.new(0, 15, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "🥚 Egg Randomizer Pro"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextScaled = true
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Font = Enum.Font.GothamBold
titleText.Parent = titleBar

-- Enhanced close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "✕"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -37, 0, 7.5)
closeButton.BorderSizePixel = 0

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

local closeGradient = Instance.new("UIGradient")
closeGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 100, 100)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(220, 60, 60))
}
closeGradient.Rotation = 90
closeGradient.Parent = closeButton

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

-- Helper functions (same as before)
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

-- Enhanced ESP functions (same logic as before but with better visuals)
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
    billboard.Size = UDim2.new(0, 270, 0, 30)
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
    label.TextSize = 20
    label.TextWrapped = false
    label.TextTruncate = Enum.TextTruncate.AtEnd
    label.Font = Enum.Font.GothamBold
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
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
contentFrame.Size = UDim2.new(1, -20, 1, -95)
contentFrame.Position = UDim2.new(0, 10, 0, 55)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- Real-time egg list frame
local eggListFrame = Instance.new("Frame")
eggListFrame.Name = "EggListFrame"
eggListFrame.Size = UDim2.new(1, -10, 0, 120)
eggListFrame.Position = UDim2.new(0, 5, 0, 5)
eggListFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
eggListFrame.BorderSizePixel = 0
eggListFrame.Parent = contentFrame

local eggListCorner = Instance.new("UICorner")
eggListCorner.CornerRadius = UDim.new(0, 10)
eggListCorner.Parent = eggListFrame

local eggListGradient = Instance.new("UIGradient")
eggListGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(40, 40, 60)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(30, 30, 50))
}
eggListGradient.Rotation = 45
eggListGradient.Parent = eggListFrame

-- Egg list title
local eggListTitle = Instance.new("TextLabel")
eggListTitle.Name = "EggListTitle"
eggListTitle.Size = UDim2.new(1, -10, 0, 25)
eggListTitle.Position = UDim2.new(0, 5, 0, 5)
eggListTitle.BackgroundTransparency = 1
eggListTitle.Text = "📍 Nearby Eggs (Updating...)"
eggListTitle.TextColor3 = Color3.fromRGB(120, 200, 255)
eggListTitle.TextSize = 14
eggListTitle.TextXAlignment = Enum.TextXAlignment.Left
eggListTitle.Font = Enum.Font.GothamBold
eggListTitle.Parent = eggListFrame

-- Scrolling frame for egg list
local eggScrollFrame = Instance.new("ScrollingFrame")
eggScrollFrame.Name = "EggScrollFrame"
eggScrollFrame.Size = UDim2.new(1, -10, 1, -35)
eggScrollFrame.Position = UDim2.new(0, 5, 0, 30)
eggScrollFrame.BackgroundTransparency = 1
eggScrollFrame.BorderSizePixel = 0
eggScrollFrame.ScrollBarThickness = 6
eggScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(120, 200, 255)
eggScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
eggScrollFrame.Parent = eggListFrame

local eggScrollCorner = Instance.new("UICorner")
eggScrollCorner.CornerRadius = UDim.new(0, 6)
eggScrollCorner.Parent = eggScrollFrame

-- List layout for eggs
local eggListLayout = Instance.new("UIListLayout")
eggListLayout.SortOrder = Enum.SortOrder.Name
eggListLayout.Padding = UDim.new(0, 2)
eggListLayout.Parent = eggScrollFrame

-- Function to update egg list
local function updateEggList()
    -- Clear existing labels
    for _, child in pairs(eggScrollFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    
    local eggs = getPlayerGardenEggs(60)
    local eggCounts = {}
    
    -- Count eggs by type
    for _, egg in ipairs(eggs) do
        local eggName = egg.Name
        if eggCounts[eggName] then
            eggCounts[eggName] = eggCounts[eggName] + 1
        else
            eggCounts[eggName] = 1
        end
    end
    
    -- Update title
    eggListTitle.Text = "📍 Nearby Eggs (" .. #eggs .. " total)"
    
    local yPos = 0
    for eggName, count in pairs(eggCounts) do
        local eggLabel = Instance.new("TextLabel")
        eggLabel.Name = eggName .. "Label"
        eggLabel.Size = UDim2.new(1, -10, 0, 20)
        eggLabel.Position = UDim2.new(0, 5, 0, yPos)
        eggLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
        eggLabel.BackgroundTransparency = 0.3
        eggLabel.Text = "• " .. eggName .. " x" .. count
        eggLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
        eggLabel.TextSize = 12
        eggLabel.TextXAlignment = Enum.TextXAlignment.Left
        eggLabel.Font = Enum.Font.Gotham
        eggLabel.Parent = eggScrollFrame
        
        local labelCorner = Instance.new("UICorner")
        labelCorner.CornerRadius = UDim.new(0, 4)
        labelCorner.Parent = eggLabel
        
        yPos = yPos + 22
    end
    
    -- Update canvas size
    eggScrollFrame.CanvasSize = UDim2.new(0, 0, 0, math.max(yPos, 80))
    
    if #eggs == 0 then
        local noEggsLabel = Instance.new("TextLabel")
        noEggsLabel.Name = "NoEggsLabel"
        noEggsLabel.Size = UDim2.new(1, -10, 0, 60)
        noEggsLabel.Position = UDim2.new(0, 5, 0, 10)
        noEggsLabel.BackgroundTransparency = 1
        noEggsLabel.Text = "🔍 No eggs found nearby\nMove closer to eggs!"
        noEggsLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        noEggsLabel.TextSize = 12
        noEggsLabel.TextXAlignment = Enum.TextXAlignment.Center
        noEggsLabel.TextYAlignment = Enum.TextYAlignment.Center
        noEggsLabel.Font = Enum.Font.Gotham
        noEggsLabel.Parent = eggScrollFrame
    end
end

-- Enhanced randomize button
local randomizeButton = Instance.new("TextButton")
randomizeButton.Name = "RandomizeButton"
randomizeButton.Size = UDim2.new(1, -10, 0, 45)
randomizeButton.Position = UDim2.new(0, 5, 0, 135)
randomizeButton.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
randomizeButton.Text = "🎲 Randomize Pets"
randomizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
randomizeButton.TextSize = 16
randomizeButton.Font = Enum.Font.GothamBold
randomizeButton.BorderSizePixel = 0
randomizeButton.Parent = contentFrame

local randomizeCorner = Instance.new("UICorner")
randomizeCorner.CornerRadius = UDim.new(0, 10)
randomizeCorner.Parent = randomizeButton

local randomizeGradient = Instance.new("UIGradient")
randomizeGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(120, 200, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(85, 170, 255)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(50, 140, 220))
}
randomizeGradient.Rotation = 45
randomizeGradient.Parent = randomizeButton

-- Enhanced ESP Toggle button
local espToggle = Instance.new("TextButton")
espToggle.Name = "ESPToggle"
espToggle.Size = UDim2.new(0.48, -2.5, 0, 40)
espToggle.Position = UDim2.new(0, 5, 0, 190)
espToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
espToggle.Text = "👁️ ESP: OFF"
espToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
espToggle.TextSize = 14
espToggle.Font = Enum.Font.GothamSemibold
espToggle.BorderSizePixel = 0
espToggle.Parent = contentFrame

local espCorner = Instance.new("UICorner")
espCorner.CornerRadius = UDim.new(0, 8)
espCorner.Parent = espToggle

-- Enhanced Auto Randomize button
local autoToggle = Instance.new("TextButton")
autoToggle.Name = "AutoToggle"
autoToggle.Size = UDim2.new(0.48, -2.5, 0, 40)
autoToggle.Position = UDim2.new(0.52, 2.5, 0, 190)
autoToggle.BackgroundColor3 = Color3.fromRGB(80, 150, 60)
autoToggle.Text = "⚡ Auto: OFF"
autoToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
autoToggle.TextSize = 14
autoToggle.Font = Enum.Font.GothamSemibold
autoToggle.BorderSizePixel = 0
autoToggle.Parent = contentFrame

local autoCorner = Instance.new("UICorner")
autoCorner.CornerRadius = UDim.new(0, 8)
autoCorner.Parent = autoToggle

-- Enhanced status label
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, -10, 0, 50)
statusLabel.Position = UDim2.new(0, 5, 0, 240)
statusLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
statusLabel.BackgroundTransparency = 0.5
statusLabel.Text = "✅ Ready to randomize!\nMove near eggs to get started."
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextSize = 12
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.TextYAlignment = Enum.TextYAlignment.Center
statusLabel.TextWrapped = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = contentFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 8)
statusCorner.Parent = statusLabel

-- Enhanced watermark with your requested text
local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(1, -10, 0, 30)
watermark.Position = UDim2.new(0, 5, 1, -40)
watermark.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
watermark.BackgroundTransparency = 0.3
watermark.Text = "by @notjyzee on TikTok | Jyzee Scripts on YouTube"
watermark.TextColor3 = Color3.fromRGB(120, 120, 140)
watermark.TextSize = 10
watermark.TextXAlignment = Enum.TextXAlignment.Center
watermark.TextYAlignment = Enum.TextYAlignment.Center
watermark.Font = Enum.Font.GothamSemibold
watermark.Parent = mainFrame

local watermarkCorner = Instance.new("UICorner")
watermarkCorner.CornerRadius = UDim.new(0, 6)
watermarkCorner.Parent = watermark

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

-- Enhanced button interactions with better animations
local function createButtonHoverEffect(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            BackgroundColor3 = hoverColor,
            Size = button.Size + UDim2.new(0, 2, 0, 1)
        }):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            BackgroundColor3 = normalColor,
            Size = button.Size - UDim2.new(0, 2, 0, 1)
        }):Play()
    end)
end

-- Apply hover effects
createButtonHoverEffect(randomizeButton, Color3.fromRGB(85, 170, 255), Color3.fromRGB(100, 185, 255))
createButtonHoverEffect(espToggle, Color3.fromRGB(60, 60, 80), Color3.fromRGB(75, 75, 95))
createButtonHoverEffect(autoToggle, Color3.fromRGB(80, 150, 60), Color3.fromRGB(95, 165, 75))

closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(255, 100, 100),
        Size = UDim2.new(0, 32, 0, 32)
    }):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(255, 80, 80),
        Size = UDim2.new(0, 30, 0, 30)
    }):Play()
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
    statusLabel.Text = "🎲 Starting randomization..."
    randomizeButton.Text = "🔄 Randomizing..."
    
    local count = randomizeNearbyEggs()
    randomizeButton.Text = "✅ Randomized "..count.." Pets!"
    statusLabel.Text = "✅ Randomized "..count.." pets!\nCheck your eggs now!"
    wait(2)
    
    randomizeButton.Text = "🎲 Randomize Pets"
    statusLabel.Text = "✅ Ready to randomize!\nMove near eggs to get started."
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
    espToggle.Text = espEnabled and "👁️ ESP: ON" or "👁️ ESP: OFF"
    espToggle.BackgroundColor3 = espEnabled and Color3.fromRGB(60, 150, 60) or Color3.fromRGB(60, 60, 80)
    
    if espEnabled then
        local eggs = getPlayerGardenEggs(60)
        for _, egg in pairs(eggs) do
            applyEggESP(egg)
        end
    else
        removeAllESP()
    end
    
    statusLabel.Text = "👁️ ESP " .. (espEnabled and "enabled" or "disabled") .. "!\n" .. (espEnabled and "Eggs are now highlighted." or "Highlights removed.")
    wait(1)
    statusLabel.Text = "✅ Ready to randomize!\nMove near eggs to get started."
    espToggle.Active = true
    isToggling = false
end)

autoToggle.MouseButton1Click:Connect(function()
    if isAutoProcessing then return end
    isAutoProcessing = true
    
    autoRunning = not autoRunning
    autoToggle.Text = autoRunning and "⚡ Auto: ON" or "⚡ Auto: OFF"
    autoToggle.BackgroundColor3 = autoRunning and Color3.fromRGB(150, 80, 60) or Color3.fromRGB(80, 150, 60)
    statusLabel.Text = autoRunning and "⚡ Auto-randomize started!\nSearching for rare pets..." or "⏹️ Auto-randomize stopped"

    if autoRunning then
        randomizeButton.Active = false
        espToggle.Active = false
        autoToggle.Active = false

        spawn(function()
            while autoRunning do
                statusLabel.Text = "⚡ Auto-randomizing...\nSearching for rare pets..."
                randomizeButton.Text = "🔄 Auto Randomizing..."
                local count = randomizeNearbyEggs()
                randomizeButton.Text = "✅ Randomized "..count.." Pets!"
                statusLabel.Text = "✅ Randomized "..count.." pets!\nChecking for rare pets..."

                local foundRare = false
                local rarePetFound = ""
                for _, petName in pairs(truePetMap) do
                    if rarePets[petName] then
                        foundRare = true
                        rarePetFound = petName
                        statusLabel.Text = "🌟 RARE PET FOUND: " .. petName .. "!\nAuto-randomize stopped!"
                        autoRunning = false
                        autoToggle.Text = "⚡ Auto: OFF"
                        autoToggle.BackgroundColor3 = Color3.fromRGB(80, 150, 60)
                        break
                    end
                end

                wait(2)
                if foundRare then
                    randomizeButton.Text = "🎲 Randomize Pets"
                else
                    randomizeButton.Text = "🎲 Randomize Pets"
                    if autoRunning then
                        statusLabel.Text = "⚡ Auto-randomize running...\nSearching for rare pets..."
                    end
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
    -- Smooth close animation
    TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    wait(0.3)
    screenGui:Destroy()
end)

-- Real-time egg list updater
local lastUpdateTime = 0
local updateConnection

updateConnection = RunService.Heartbeat:Connect(function()
    local currentTime = tick()
    if currentTime - lastUpdateTime >= 1 then -- Update every second
        updateEggList()
        lastUpdateTime = currentTime
    end
end)

-- Initialize with smooth entrance animation
spawn(function()
    -- Start small and grow
    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 350, 0, 450),
        Position = UDim2.new(0.5, -175, 0.5, -225)
    }):Play()
    
    wait(0.5)
    updateEggList()
    
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
    
    if #eggs == 0 then
        statusLabel.Text = "🔍 No eggs found nearby\nMove closer to some eggs!"
    else
        statusLabel.Text = "✅ Found " .. #eggs .. " eggs nearby!\nReady to randomize!"
    end
end)

-- Cleanup function
local function cleanup()
    if updateConnection then
        updateConnection:Disconnect()
    end
    removeAllESP()
end

-- Connect cleanup to GUI destruction
screenGui.AncestryChanged:Connect(function()
    if not screenGui.Parent then
        cleanup()
    end
end)
