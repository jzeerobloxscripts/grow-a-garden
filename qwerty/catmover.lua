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
followButton.Text = "Move All Cats to Me"
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

-- Add parse pets button
local parseButton = Instance.new("TextButton")
parseButton.Name = "ParseButton"
parseButton.Parent = contentFrame
parseButton.Size = UDim2.new(0, 120, 0, 30)
parseButton.Position = UDim2.new(0.5, -60, 0.1, 0)
parseButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
parseButton.Text = "Parse Pets"
parseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
parseButton.TextSize = 14
parseButton.Font = Enum.Font.SourceSansBold
parseButton.BorderSizePixel = 0

local parseButtonCorner = Instance.new("UICorner")
parseButtonCorner.CornerRadius = UDim.new(0, 6)
parseButtonCorner.Parent = parseButton

local noteLabel = Instance.new("TextLabel")
noteLabel.Name = "NoteLabel"
noteLabel.Parent = contentFrame
noteLabel.Size = UDim2.new(1, -20, 0, 80)
noteLabel.Position = UDim2.new(0, 10, 0.75, 0)
noteLabel.BackgroundTransparency = 1
noteLabel.Text = "Note: Parse Pets first to find your cats in inventory, then use Move All Cats to teleport them to you. Works by finding tools in your backpack with cat names."
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

-- Cat keywords to search for
local catKeywords = {"Moon Cat", "Orange Tabby", "Cat"}

-- Store found pets from inventory
local foundCatPets = {}

-- Improved pet finding function using inventory
local function findpet(petName)
    for _, tool in ipairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and string.match(tool.Name, petName) then
            local petUUID = tool:GetAttribute("PET_UUID")
            if petUUID then
                return tool, petUUID
            end
        end
    end
end

-- Function to check if a tool name contains cat keywords
local function isCatPet(petName)
    if not petName or type(petName) ~= "string" then
        return false
    end
    
    local lowerPetName = string.lower(petName)
    
    for _, keyword in ipairs(catKeywords) do
        local lowerKeyword = string.lower(keyword)
        if string.find(lowerPetName, lowerKeyword, 1, true) then
            return true
        end
    end
    return false
end

-- Parse pets from inventory
local function parsePetsFromInventory()
    foundCatPets = {} -- Reset found pets
    local totalCats = 0
    
    print("=== PARSING PETS FROM INVENTORY ===")
    
    for _, tool in ipairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local toolName = tool.Name
            print("Found tool:", toolName)
            
            if isCatPet(toolName) then
                local petUUID = tool:GetAttribute("PET_UUID")
                if petUUID then
                    table.insert(foundCatPets, {
                        tool = tool,
                        uuid = petUUID,
                        name = toolName
                    })
                    totalCats = totalCats + 1
                    print("✓ FOUND CAT:", toolName, "UUID:", petUUID)
                else
                    print("✗ Cat tool found but no UUID:", toolName)
                end
            end
        end
    end
    
    print("Total cats found in inventory:", totalCats)
    print("===================================")
    
    return totalCats
end

-- Find spawned pets in world using UUIDs from inventory
local function findSpawnedCatsByUUID()
    local spawnedCats = {}
    
    if #foundCatPets == 0 then
        print("No cats parsed from inventory yet!")
        return spawnedCats
    end
    
    -- Search in common pet spawn locations
    local searchLocations = {
        workspace:FindFirstChild("PetsPhysical"),
        workspace:FindFirstChild("Pets"),
        workspace:FindFirstChild("SpawnedPets"),
        workspace:FindFirstChild("ActivePets")
    }
    
    for _, location in ipairs(searchLocations) do
        if location then
            for _, spawnedPet in ipairs(location:GetChildren()) do
                local spawnedUUID = spawnedPet:GetAttribute("UUID") or 
                                  spawnedPet:GetAttribute("PET_UUID") or
                                  (spawnedPet:FindFirstChild("UUID") and spawnedPet.UUID.Value)
                
                if spawnedUUID then
                    -- Check if this spawned pet matches any of our inventory cats
                    for _, inventoryCat in ipairs(foundCatPets) do
                        if inventoryCat.uuid == spawnedUUID then
                            local humanoid = spawnedPet:FindFirstChildOfClass("Humanoid")
                            if humanoid then
                                table.insert(spawnedCats, {
                                    humanoid = humanoid,
                                    pet = spawnedPet,
                                    uuid = spawnedUUID,
                                    name = inventoryCat.name
                                })
                                print("✓ Found spawned cat:", inventoryCat.name, "UUID:", spawnedUUID)
                            end
                            break
                        end
                    end
                end
            end
        end
    end
    
    return spawnedCats
end

local function moveAllCatsToPlayer(target)
    if not target or not target.Character then
        print("No target or character")
        return false, 0
    end
    
    local targetHumanoidRootPart = target.Character:FindFirstChild("HumanoidRootPart")
    if not targetHumanoidRootPart then
        print("No HumanoidRootPart found")
        return false, 0
    end
    
    local playerPosition = targetHumanoidRootPart.Position
    local spawnedCats = findSpawnedCatsByUUID()
    local movedCount = 0
    
    print("=== MOVING CATS ===")
    print("Player position:", playerPosition)
    print("Spawned cats found:", #spawnedCats)
    
    for _, catData in ipairs(spawnedCats) do
        pcall(function()
            catData.humanoid:MoveTo(playerPosition)
            movedCount = movedCount + 1
            print("Moving cat:", catData.name, "UUID:", catData.uuid)
        end)
    end
    
    print("Successfully moved:", movedCount, "cats")
    print("==================")
    
    return movedCount > 0, movedCount
end

local function sendNotification(message)
    task.spawn(function() 
        -- Try multiple notification methods
        pcall(function()
            local Notification = game.ReplicatedStorage.GameEvents.Notification 
            firesignal(Notification.OnClientEvent, message)
        end)
        
        pcall(function()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Pet Follower";
                Text = message;
                Duration = 5;
            })
        end)
        
        print("NOTIFICATION:", message)
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

-- Parse pets button functionality
parseButton.MouseButton1Click:Connect(function()
    local catCount = parsePetsFromInventory()
    
    if catCount > 0 then
        parseButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
        parseButton.Text = catCount .. " Cats Found!"
        sendNotification("Found " .. catCount .. " cats in your inventory!")
        
        task.wait(2)
        parseButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
        parseButton.Text = "Parse Pets"
    else
        parseButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        parseButton.Text = "No Cats Found!"
        sendNotification("No cats found in inventory. Make sure you have cat tools in your backpack!")
        
        task.wait(2)
        parseButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
        parseButton.Text = "Parse Pets"
    end
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

followButton.MouseButton1Click:Connect(function()
    if #foundCatPets == 0 then
        sendNotification("Please parse pets first!")
        followButton.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
        followButton.Text = "Parse Pets First!"
        wait(2)
        followButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        followButton.Text = "Move All Cats to Me"
        return
    end
    
    local success, catCount = moveAllCatsToPlayer(player)
    
    if not success or catCount == 0 then
        sendNotification("Cats found in inventory but not spawned in world. Try spawning them first!")
        followButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        followButton.Text = "Cats Not Spawned!"
        wait(2)
        followButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        followButton.Text = "Move All Cats to Me"
        return
    end
    
    sendNotification("Moved " .. catCount .. " cats to your position!")
    followButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
    followButton.Text = catCount .. " Cats Moving!"
    
    -- Reset button text after a delay
    task.wait(3)
    followButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    followButton.Text = "Move All Cats to Me"
end)

stopButton.MouseButton1Click:Connect(function()
    followButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    followButton.Text = "Move All Cats to Me"
    sendNotification("Reset complete - ready to move cats again!")
end)
