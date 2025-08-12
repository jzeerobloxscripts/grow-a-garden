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

-- Add debug button
local debugButton = Instance.new("TextButton")
debugButton.Name = "DebugButton"
debugButton.Parent = contentFrame
debugButton.Size = UDim2.new(0, 100, 0, 25)
debugButton.Position = UDim2.new(0, 10, 0.1, 0)
debugButton.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
debugButton.Text = "Debug Pets"
debugButton.TextColor3 = Color3.fromRGB(255, 255, 255)
debugButton.TextSize = 12
debugButton.Font = Enum.Font.SourceSans
debugButton.BorderSizePixel = 0

local debugButtonCorner = Instance.new("UICorner")
debugButtonCorner.CornerRadius = UDim.new(0, 4)
debugButtonCorner.Parent = debugButton

local noteLabel = Instance.new("TextLabel")
noteLabel.Name = "NoteLabel"
noteLabel.Parent = contentFrame
noteLabel.Size = UDim2.new(1, -20, 0, 80)
noteLabel.Position = UDim2.new(0, 10, 0.75, 0)
noteLabel.BackgroundTransparency = 1
noteLabel.Text = "Note: This will move ALL your cats to your current position when you press the button. Searches in multiple locations for pets. Uses Humanoid:MoveTo() for each cat found."
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

-- Cat keywords to search for (improved matching)
local catKeywords = {"Moon Cat", "Orange Tabby", "Cat"}

-- Improved cat detection function
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

-- Multiple search locations for pets
local function getAllPossiblePetLocations()
    local locations = {}
    
    -- Common pet locations in various Roblox games
    local possiblePaths = {
        "PetsPhysical",
        "Pets",
        "PetModels", 
        "PlayerPets",
        "SpawnedPets",
        "ActivePets",
        "WorldPets"
    }
    
    -- Search in workspace
    for _, pathName in ipairs(possiblePaths) do
        local folder = workspace:FindFirstChild(pathName)
        if folder then
            table.insert(locations, {folder = folder, path = "workspace." .. pathName})
        end
    end
    
    -- Search in player's character
    if player.Character then
        table.insert(locations, {folder = player.Character, path = "Player.Character"})
    end
    
    -- Search in ReplicatedStorage
    for _, pathName in ipairs(possiblePaths) do
        local folder = game.ReplicatedStorage:FindFirstChild(pathName)
        if folder then
            table.insert(locations, {folder = folder, path = "ReplicatedStorage." .. pathName})
        end
    end
    
    return locations
end

-- Enhanced function to find cats with better detection
local function findCatsInWorld()
    local foundCats = {}
    local searchLocations = getAllPossiblePetLocations()
    
    print("=== CAT SEARCH DEBUG ===")
    print("Searching in", #searchLocations, "locations...")
    
    for _, location in ipairs(searchLocations) do
        print("Searching in:", location.path)
        
        local function searchInFolder(folder, depth)
            if depth > 3 then return end -- Prevent infinite recursion
            
            for _, child in ipairs(folder:GetChildren()) do
                -- Check if this child is a pet
                if child:IsA("Model") or child:IsA("Part") or child:IsA("UnionOperation") then
                    local petName = child.Name
                    
                    -- Also check for DisplayName if it exists
                    local displayName = child:GetAttribute("DisplayName") or 
                                      (child:FindFirstChild("DisplayName") and child.DisplayName.Value) or
                                      petName
                    
                    print("Found object:", petName, "| Display:", displayName)
                    
                    if isCatPet(petName) or isCatPet(displayName) then
                        local uuid = child:GetAttribute("UUID") or 
                                   child:GetAttribute("PetID") or
                                   (child:FindFirstChild("UUID") and child.UUID.Value) or 
                                   (child:FindFirstChild("PetID") and child.PetID.Value) or
                                   (petName .. " (InstanceID: " .. child:GetDebugId() .. ")")
                        
                        table.insert(foundCats, {
                            pet = child,
                            uuid = uuid,
                            name = petName,
                            displayName = displayName,
                            location = location.path
                        })
                        
                        print("✓ FOUND CAT:", petName, "in", location.path)
                    end
                end
                
                -- Recursively search subfolders
                if child:IsA("Folder") or child:IsA("Model") then
                    searchInFolder(child, depth + 1)
                end
            end
        end
        
        searchInFolder(location.folder, 0)
    end
    
    print("Total cats found:", #foundCats)
    print("======================")
    
    return foundCats
end

local function getAllCatHumanoids()
    local catHumanoids = {}
    local cats = findCatsInWorld()
    
    for _, catData in ipairs(cats) do
        local humanoid = catData.pet:FindFirstChildOfClass("Humanoid")
        if humanoid then
            table.insert(catHumanoids, {
                humanoid = humanoid,
                pet = catData.pet,
                uuid = catData.uuid,
                name = catData.name,
                displayName = catData.displayName,
                location = catData.location
            })
            print("✓ Cat with Humanoid:", catData.name, "from", catData.location)
        else
            print("✗ Cat without Humanoid:", catData.name, "from", catData.location)
        end
    end
    
    return catHumanoids
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
    local catHumanoids = getAllCatHumanoids()
    local movedCount = 0
    
    print("=== MOVING CATS ===")
    print("Player position:", playerPosition)
    print("Cats to move:", #catHumanoids)
    
    for _, catData in ipairs(catHumanoids) do
        pcall(function()
            catData.humanoid:MoveTo(playerPosition)
            movedCount = movedCount + 1
            print("Moving cat:", catData.displayName or catData.name, "UUID:", catData.uuid)
        end)
    end
    
    print("Successfully moved:", movedCount, "cats")
    print("==================")
    
    return movedCount > 0, movedCount
end

local function debugPets()
    print("\n=== PET DEBUG INFORMATION ===")
    
    -- List all possible locations and their contents
    local locations = getAllPossiblePetLocations()
    
    for _, location in ipairs(locations) do
        print("\n--- " .. location.path .. " ---")
        local children = location.folder:GetChildren()
        print("Total children:", #children)
        
        for i, child in ipairs(children) do
            if i <= 10 then -- Limit output to first 10 items
                local childType = child.ClassName
                local childName = child.Name
                local displayName = child:GetAttribute("DisplayName") or "None"
                print(string.format("%d. %s (%s) - Display: %s", i, childName, childType, displayName))
                
                -- Check if it matches our cat keywords
                if isCatPet(childName) or isCatPet(displayName) then
                    print("   → THIS IS A CAT! ✓")
                end
            elseif i == 11 then
                print("... and " .. (#children - 10) .. " more items")
                break
            end
        end
    end
    
    print("\n=== Cat Keywords ===")
    for i, keyword in ipairs(catKeywords) do
        print(i .. ". " .. keyword)
    end
    
    print("=============================\n")
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

-- Debug button functionality
debugButton.MouseButton1Click:Connect(function()
    debugPets()
    sendNotification("Debug information printed to console (F9)")
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
    local success, catCount = moveAllCatsToPlayer(player)
    
    if not success or catCount == 0 then
        sendNotification("No cats found! Try the Debug button to see what pets are available.")
        followButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        followButton.Text = "No Cats Found!"
        wait(2)
        followButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        followButton.Text = "Move All Cats to Me"
        return
    end
    
    sendNotification("Found " .. catCount .. " cats and moved them to your position!")
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
