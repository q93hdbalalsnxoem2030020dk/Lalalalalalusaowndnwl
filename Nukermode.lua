local ServiceID = "NukerMode"
local PandaAuth = loadstring(game:HttpGet('https://api.luable.top/panda.lua'))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Allvideo1/Nukermode/main/Bannedxd.lua"))()
if not PandaAuth:Authenticate_Keyless(ServiceID) then
setclipboard(PandaAuth:GetKey(ServiceID))
end

while true do
    if PandaAuth:Authenticate_Keyless(ServiceID) then
        print('Successfully Authorized') ]]
        for k,v in getgc(true) do
    if pcall(function() return rawget(v,"indexInstance") end) and type(rawget(v,"indexInstance")) == "table" and (rawget(v,"indexInstance"))[1] == "kick" then
        v.tvk = {"kick",function()
            return workspace:WaitForChild("")
        end}
    end
end
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Stats = game:GetService("Stats")
local Shop = workspace:FindFirstChild("Shop",true) or workspace:FindFirstChild("Shops",true) or workspace:FindFirstChild("Pads",true) or workspace:FindFirstChild("BuyPads",true)
local MarketplaceService = game:GetService("MarketplaceService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInput = game:GetService("VirtualInputManager")	
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Heartbeat = RunService.Heartbeat
local Ignored = workspace:FindFirstChild("Ignored")
local MainEvent = ReplicatedStorage:FindFirstChild("MainEvent",true) or ReplicatedStorage:FindFirstChild("MAINEVENT",true)
local Ping = Stats:WaitForChild("Network"):WaitForChild("ServerStatsItem"):WaitForChild("Data Ping")

if not MainEvent then
    return
end


local MessageSent = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local SayMessageRequest = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local Request = (syn and syn.request) or (http and http.request) or http_request or request or function() end
local MiddleScreen = Camera.ViewportSize / 2
local FindFirstChild = game.FindFirstChild
local FindFirstChildOfClass = game.FindFirstChildOfClass
local WaitForChild = game.WaitForChild
local GetChildren = game.GetChildren
local GetDescendants = game.GetDescendants
local IsDescendantOf = game.IsDescendantOf
local GetPlayers = Players.GetPlayers
local IsA = game.IsA
local Destroy = game.Destroy
local FireServer = MainEvent.FireServer
local RenderStepped = RunService.RenderStepped
local Raycast = workspace.Raycast
local WorldToViewportPoint = Camera.WorldToViewportPoint
local GetMouseLocation = UserInputService.GetMouseLocation
local Params = RaycastParams.new()
local Instance = Instance.new
local UD2 = UDim2.new
local CF = CFrame.new
local V2 = Vector2.new
local V3 = Vector3.new
local HSV = Color3.fromHSV
local remove = table.remove
local sort = table.sort
local insert = table.insert
local find = table.find
local concat = table.concat
local lower = string.lower
local match = string.match
local gsub = string.gsub
local byte = string.byte
local sub = string.sub
local split = string.split
local random = math.random
local clamp = math.clamp
local min = math.min
local max = math.max
local floor = math.floor
local round = math.round
local inf = math.huge
local Lerp = CF().Lerp


local Variables = {
    Connections = {},
    Drawings = {
        AimbotCircle = Drawing.new("Circle"),
        AimbotLine = Drawing.new("Line"),
        SilentAimDot = Drawing.new("Circle")
    },
    FOV = 120,
    Prediction = V3(0,0,0),
    AutoPrediction = false,
    AutoPrediction2 = false,
    AutoPrediction21 = false,
    AutoPrediction22 = false,
    AutoPredictionLegit = false,
    Aimlock = false,
    Camlock = false,
    SilentAim = false,
    HideFOV = false,
    AimPart = "HumanoidRootPart",
    OldAimPart = "HumanoidRootPart",
    SMOOTHNESS = 0.07283,
    Shake = false,
    Macro = false,
    unlock = false,
    Target,
    ViewingTarget = false,
    Multiple = 0,
    Test,
    killbot = false,
  antilock = false,
    Fakelag = false,
    Speed = 16,
    CFrame = false,
    AimView = false,
    GunFunction = false,
    Rightclick = false,
    ShootAir = false,
    AutoSetCam = false,
    ArmorBuy = false,
    Legit = false,
    XValue = 0,
    YValue = 0,
    FriendCheck = false,
    DelayShoot = 0.2,
    NoCurve = false,
    OptionDot = 0.97,
    Idle = nil,
    Walk = nil,
    Run = nil,
    Jump = nil,
    Fall = nil,
    OldFov = 120,
    Style = false,
    EasingStyle = "Sine",  
    lockedcam = false,
    SilentCam = false,
    HealthKnock =  2,
    AutoPredDelay = 0,
    AutoPredY = 0,
    AutoPredX = 0
}


local playerHealth = {}

local function AutoSetCam(Value) -- suck
    if Variables.AutoPrediction or Variables.AutoPrediction21 then
        Variables.AutoPrediction = false







        Variables.AutoPrediction21 = false







        Variables.Connections.AutoSetCam:Disconnect()







        Variables.Connections.AutoSetCam = nil







        Variables.Connections.AutoSetCam:Disconnect()







        Variables.Connections.AutoSetCam = nil







    end







    







    Variables.AutoSetCam = Value







    







    if Variables.AutoSetCam then







        Variables.Connections.AutoSetCam = RenderStepped:Connect(function(FrameTime)


local campredictions = {
    [300] = 0.434,
    [290] = 0.422,
    [280] = 0.44,
    [270] = 0.4385,
    [260] = 0.4158,
    [250] = 0.3148,
    [240] = 0.34,
    [230] = 0.33,
    [220] = 0.30,
    [210] = 0.295, -- shitty pred
    [200] = 0.2915,
    [190] = 0.2911,
    [180] = 0.28291198328, -- Duplicate condition, keeping the first occurrence
    [170] = 0.28,
    [160] = 0.2754,
    [150] = 0.271,
    [140] = 0.25,
    [130] = 0.12057,
    [120] = 0.1966,
    [110] = 0.18642271,
    [100] = 0.48533,
    [90] = 0.3749573,
    [80] = 0.2745,
    [70] = 0.2642,
    [50] = 0.24267,
    [40] = 0.142,
    [30] = 0.1312,
    [20] = 0.1312,
    [10] = 0.1287
}



local PING = round(Ping:GetValue()) -- yk


local PREDY =  campredictions[clamp(floor(PING * 0.1) * 10,10,190)]
Variables.Prediction = V3(1/ PREDY,1/ 0.05,1/PREDY)




   








       end)







    else







        Variables.Prediction = 0







        Variables.Connections.AutoSetCam:Disconnect()







        Variables.Connections.AutoSetCam = nil






end

    end



local function AutoPrediction(Value)







    if Variables.AutoPrediction or Variables.AutoPrediction21 then







        Variables.AutoPrediction = false







        Variables.AutoPrediction21 = false







        Variables.Connections.AutoPrediction:Disconnect()







        Variables.Connections.AutoPrediction = nil







        Variables.Connections.AutoPrediction21:Disconnect()







        Variables.Connections.AutoPrediction21 = nil







    end







    







    Variables.AutoPrediction = Value







    







    if Variables.AutoPrediction then







        Variables.Connections.AutoPrediction = RenderStepped:Connect(function(FrameTime)



local num = 1/ Ping:GetValue() * FrameTime



        Variables.Prediction =    V3(num, num, num)



        end)







    else







        Variables.Prediction = 0







        Variables.Connections.AutoPrediction:Disconnect()







        Variables.Connections.AutoPrediction = nil















    end







end















--[[local function AutoPrediction2(Value)







    if Variables.AutoPrediction then







        Variables.AutoPrediction = false







        Variables.Connections.AutoPrediction:Disconnect()







        Variables.Connections.AutoPrediction = nil







    end







    







    Variables.AutoPrediction2 = Value







    







    if Variables.AutoPrediction2 then







        Variables.Connections.AutoPrediction2 = RenderStepped:Connect(function()







            Variables.Prediction =  Ping:GetValue()  







        end)







    else







        Variables.Prediction = 0







        Variables.Connections.AutoPrediction2:Disconnect()







        Variables.Connections.AutoPrediction2 = nil







    end







end]]














--High Ping? idk
local function AutoPrediction21(Value)







    if Variables.AutoPrediction then







        Variables.AutoPrediction = false







        Variables.Connections.AutoPrediction:Disconnect()







        Variables.Connections.AutoPrediction = nil







    end







    







    Variables.AutoPrediction21 = Value







    







    if Variables.AutoPrediction21   then







        Variables.Connections.AutoPrediction21 = RenderStepped:Connect(function(FrameTime)






      local Y =  0.1 + 0.000287 * Ping:GetValue()
      local X =  0.1 + 0.000287 * Ping:GetValue()
      local AutoPredX = Variables.AutoPredX + Variables.AutoPredDelay * Ping:GetValue()
      local AutoPredY = Variables.AutoPredY + Variables.AutoPredDelay * Ping:GetValue()
wait(2)
Variables.Prediction = V3(1/AutoPredX,1/AutoPredY,1/AutoPredX)
wait(2)

        end)







    else







        Variables.Prediction = 0







        Variables.Connections.AutoPrediction21:Disconnect()







        Variables.Connections.AutoPrediction21 = nil







    end







end














--Blatant
local function AutoPrediction22(Value)
    if Variables.AutoPrediction or Variables.AutoPrediction21 then
        Variables.AutoPrediction = false
        Variables.AutoPrediction21 = false
        Variables.Connections.AutoPrediction:Disconnect()
        Variables.Connections.AutoPrediction = nil
        Variables.Connections.AutoPrediction21:Disconnect()
        Variables.Connections.AutoPrediction21 = nil
    end
    Variables.AutoPrediction22 = Value
    if Variables.AutoPrediction22 then
        Variables.Connections.AutoPrediction22 = RenderStepped:Connect(function(FrameTime)


local SETS = {
    [5] = 0.087452777777778,
    [10] = 0.092055555555556,
    [15] = 0.096658333333333,
    [20] = 0.10126111111111,
    [25] = 0.10586388888889,
    [30] = 0.11046666666667,
    [35] = 0.11506944444444,
    [40] = 0.11967222222222,
    [45] = 0.124275,
    [50] = 0.12887777777778,
    [55] = 0.13348055555556,
    [60] = 0.13808333333333,
    [65] = 0.14268611111111,
    [70] = 0.14728888888889,
    [75] = 0.15189166666667,
    [80] = 0.15649444444444,
    [85] = 0.16109722222222,
    [90] = 0.1657,
    [95] = 0.17030277777778,
    [100] = 0.17490555555556,
    [105] = 0.17950833333333,
    [110] = 0.18411111111111,
    [115] = 0.18871388888889,
    [120] = 0.19331666666667,
    [125] = 0.19791944444444,
    [130] = 0.20252222222222,
    [135] = 0.207125,
    [140] = 0.21172777777778,
    [145] = 0.21633055555556,
    [150] = 0.22093333333333,
    [155] = 0.22553611111111,
    [160] = 0.23013888888889,
    [165] = 0.23474166666667,
    [170] = 0.23934444444444,
    [175] = 0.24394722222222,
    [180] = 0.24855,
    [185] = 0.25315277777778,
    [190] = 0.25775555555556,
    [195] = 0.26235833333333,
    [200] = 0.26696111111111,
    [205] = 0.27156388888889,
    [210] = 0.27616666666667,
    [215] = 0.28076944444444,
    [220] = 0.28537222222222,
    [225] = 0.289975,
    [230] = 0.29457777777778,
    [235] = 0.29918055555556,
    [240] = 0.30378333333333,
    [245] = 0.30838611111111,
    [250] = 0.31298888888889,
    [255] = 0.31759166666667,
    [260] = 0.32219444444444,
    [265] = 0.32679722222222,
    [270] = 0.3314,
    [275] = 0.33600277777778,
    [280] = 0.34060555555556,
    [285] = 0.34520833333333,
    [290] = 0.34981111111111,
    [295] = 0.35441388888889,
    [300] = 0.35901666666667
}

local SETSX = {
    [190] = 5.272,
   
    [180] = 5.240,
    
    [170] = 5.751,
    
    [160] = 5.694,
    
    [150] = 5.970,
    
    [140] = 6.095,
    
    [130] = 6.203,
    
    [120] = 6.453,
    
    [110] = 6.588,
    
    [100] = 6.712,
    
    [90] = 6.734,--
    
    [80] = 6.632,--
    
    [70] = 6.639,--
    
    [60] = 6.815, --
    
    [50] = 6.839, ---
 
    [40] = 7.026,---stat
    
    [30] = 7.278,
    
    [20] = 7.481,
    
    [10] = 7.709
}

local SETSY = {
 [10] = 8.768,
 [20] = 8.819, 
 [30] = 8.761,
 [40] = 8.738,
 
 [50] = 8.144,
 
 [60] = 8.189,
 
 [70] = 8.345,
 
 [80] = 7.924,
 
 [90] = 7.509,
 
 [100] = 7.331,
 
 [110] = 6.183,
 
 [120] = 6.136,
 
 [130] = 5.975,
 
 [140] = 5.716,
 
 [150] = 5.710,
 
 [160] = 4.917,
 
 [170] = 4.615,
 
 [180] = 3.919,
 
 [190] = 3.255
 }

local function createPingTable()
    local results = {}
    for i = 10, 360,10 do
        local pingResult = 0.07 + 0.0007 * i
        results[i] = pingResult
        
    end
    return results
end

local pingTable = createPingTable()


local PING = Ping:GetValue() -- yk

local PREDX = SETSX[clamp(floor(PING* 0.1) * 10,10,190)]

local PREDY =  SETSY[clamp(floor(PING * 0.1) * 10,10,190)]
Variables.Prediction = V3(PREDX,PREDY,PREDX) 

wait(4)


        end)







    else







        Variables.Prediction = 0







        Variables.Connections.AutoPrediction22:Disconnect()







        Variables.Connections.AutoPrediction22 = nil







    end







end















local function Predict(Velocity)
    return V3(Velocity.X,math.max(Velocity.Y, 0),Velocity.Z)
end

local function GetPrediction(Part)
    if Variables.AntiAntiLock then
        return Part.CFrame + Variables.VELOCITIES[Part.Parent.Name] / Variables.Prediction
    end
    return Part.CFrame + Part.Velocity / Variables.Prediction
    
end



local MT = getrawmetatable(game)
local __namecall = MT.__namecall
setreadonly(MT,false)
MT.__namecall = newcclosure(function(self,...)
    if Variables.Aimlock or Variables.SilentAim or Variables.killbot  then    
        if not checkcaller() and self == MainEvent  and Variables.locked and Variables.locked.Character and FindFirstChild(Variables.locked.Character,Variables.AimPart)  then
            local Args = {...}

            if  Args[1] == "UpdateMousePos" or Args[1] == "MOUSE" then

                if typeof(Args[2]) == "table" and Args[2][2] == "MousePos" and not Args[2][1] == "Camera" then
                    Args[2].MousePos = GetPrediction(Variables.locked.Character[Variables.AimPart]).Position
                    elseif typeof(Args[2]) == "table" and Args[2]["Camera"]  and Args[2]["MousePos"] then
                    Args[2].Camera = GetPrediction(Variables.locked.Character[Variables.AimPart]).Position
                    Args[2].MousePos = GetPrediction(Variables.locked.Character[Variables.AimPart]).Position
                elseif typeof(Args[2]) == "table" then       
       Args[2][1] = GetPrediction(Variables.locked.Character[Variables.AimPart]).Position
      

       Args[2][2] = GetPrediction(Variables.locked.Character[Variables.AimPart]).Position
             
 else
                    Args[2] = GetPrediction(Variables.locked.Character[Variables.AimPart]).Position
                    
                end
                return __namecall(self,unpack(Args))
            end
        end
    end
    if self == MainEvent then
        local Args = {...}
        if Args[1] == "TeleportDetect" then
            return
        end
    end
    return __namecall(self,...)
end)







local function Comma(Number)
    local Number,Changed = gsub(Number,"^(-?%d+)(%d%d%d)","%1,%2")
    while Changed > 0 do
        Number,Changed = gsub(Number,"^(-?%d+)(%d%d%d)","%1,%2")
    end
    return Number
end





local function GetPlayer()
    local Distance,Closest = math.huge
    
    for i,v in next,Players:GetPlayers() do
        if LocalPlayer.Character and v ~= LocalPlayer and FindFirstChild(LocalPlayer.Character,Variables.AimPart) and not FindFirstChild(LocalPlayer.Character,"GRABBING_CONSTRAINT") and ((FindFirstChild(LocalPlayer.Character,"BodyEffects") and FindFirstChild(LocalPlayer.Character.BodyEffects,"K.O") and not LocalPlayer.Character.BodyEffects["K.O"].Value) or (FindFirstChild(LocalPlayer.Character,"Humanoid") and LocalPlayer.Character.Humanoid.Health > 0)) and v.Character and FindFirstChild(v.Character,Variables.AimPart) then

            local CamPos = workspace.CurrentCamera.CFrame.Position
            local Result = workspace:Raycast(CamPos,(v.Character[Variables.AimPart].Position - CamPos).Unit * 1000,Params)
            
            if not Result or not Result.Instance or not Result.Instance:IsDescendantOf(v.Character) then
                continue
            end
            
            local Position,OnScreen = workspace.CurrentCamera:WorldToViewportPoint(v.Character[Variables.AimPart].Position)
            
            if OnScreen then
                local Magnitude = (V2(Position.X,Position.Y) - UserInputService:GetMouseLocation()).Magnitude
                
                if Magnitude < Distance and Magnitude <= 150 then
                    Distance,Closest,Pos= Magnitude,v
                end
            end
        end
    end
    
    return Closest
end






    







  







local Tool = Instance("Tool")







local camlock = Instance("Tool")







local killtool = Instance("Tool")







local Selection = Instance("Highlight") 















Tool.Name = "Aimlock"







Tool.RequiresHandle = false







Tool.TextureId = "rbxassetid://5998624778"















camlock.Name = "Camlock"







camlock.RequiresHandle = false











killtool.Name = "killbot"







killtool.RequiresHandle = false











Selection.FillColor = Color3.new(1,1,1)







Selection.OutlineTransparency = 1







Selection.Parent = CoreGui















Tool.Activated:Connect(function()







    if Variables.Aimlock then







        local Player = GetPlayer()







        







        if Player and Variables.locked == nil then







            Variables.locked = Player







        else







            Selection.Adornee = nil







            Variables.locked = nil







        end







    end







end)















camlock.Activated:Connect(function()







    if Variables.Camlock then







        local Player = GetPlayer()







        







        if Player and Variables.locked == nil then







            Variables.locked = Player







        else







            Selection.Adornee = nil







            Variables.locked = nil







        end







    end







end)







killtool.Activated:Connect(function()







    if Variables.killbot then







        local Player = GetPlayer()







        







        if Player and Variables.locked == nil then







    Variables.locked = Player







        else







            Selection.Adornee = nil



 workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid



            Variables.locked = nil







        end







    end







end)











LocalPlayer.CharacterAdded:Connect(function(Character)







    Params.FilterDescendantsInstances = {Character,Ignored}







    







    if Variables.Aimlock then







        Tool.Parent = LocalPlayer.Backpack







    end







    







    if Variables.Camlock then







        camlock.Parent = LocalPlayer.Backpack







    end



    if Variables.killbot then







        killtool.Parent = LocalPlayer.Backpack







    end







end)















local function Aimlock(Value)







    Variables.Aimlock = Value







    







    if Variables.Aimlock then







        Tool.Parent = LocalPlayer.Backpack







        







        Variables.Connections.Aimlock = RenderStepped:Connect(function()







            if Variables.locked and playerHealth[Variables.locked.Name] ~= true and playerHealth[LocalPlayer.Name] ~= true  then







                local Char = Variables.locked.Character







                







                if Char and FindFirstChild(Char,"HumanoidRootPart") and FindFirstChild(Char,Variables.AimPart) and not FindFirstChild(Char,"GRABBING_CONSTRAINT") and ((FindFirstChild(Char,"BodyEffects") and FindFirstChild(Char.BodyEffects,"K.O") and not Char.BodyEffects["K.O"].Value) or (FindFirstChild(Char,"Humanoid") and Char.Humanoid.Health > 0)) and playerHealth[Variables.locked.Name] ~= true then






                    Selection.Adornee = Char







                end







            end







        end)







    else







        Variables.locked = nil







        Tool.Parent = nil







        Variables.Connections.Aimlock:Disconnect()







        Variables.Connections.Aimlock = nil







    end







end















local function Camlock(Value)







    Variables.Camlock = Value







    







    if Variables.Camlock then







        camlock.Parent = LocalPlayer.Backpack







        







        Variables.Connections.Camlock = RenderStepped:Connect(function()







            if Variables.locked and playerHealth[Variables.locked.Name] ~= true and playerHealth[LocalPlayer.Name] ~= true then







                local Char = Variables.locked.Character







                







                if Char and FindFirstChild(Char,"HumanoidRootPart") and FindFirstChild(Char,Variables.AimPart) and not FindFirstChild(Char,"GRABBING_CONSTRAINT") and ((FindFirstChild(Char,"BodyEffects") and FindFirstChild(Char.BodyEffects,"K.O") and not Char.BodyEffects["K.O"].Value) or (FindFirstChild(Char,"Humanoid") and Char.Humanoid.Health > 0)) then







                    Selection.Adornee = Char







                    







                    if LocalPlayer.Character then







                        local Gun = FindFirstChildOfClass(LocalPlayer.Character,"Tool")







                        







                     







                            local CameraCF = Camera.CFrame






Predicted = GetPrediction(Char[Variables.AimPart]) 






                            





local style = TweenInfo.new(0.1,Enum.EasingStyle[Variables.EasingStyle],Enum.EasingDirection.InOut)

 if Variables.GunFunction and Gun and (FindFirstChild(Gun,"GunScript") or FindFirstChild(Gun,"AMMO")) and not Variables.Style then                
   Camera.CFrame = CF(CameraCF.Position,Lerp(CameraCF,Predicted,Variables.SMOOTHNESS).Position)
elseif not Variables.GunFunction and not Variables.Style then
Camera.CFrame = CF(CameraCF.Position,Lerp(CameraCF,Predicted,Variables.SMOOTHNESS).Position)
elseif Variables.Style and not Variables.GunFunction then
game:GetService("TweenService"):Create(Camera, style, {CFrame = CF(CameraCF.Position,Predicted.Position)}):Play()
elseif Variables.Style and Variables.GunFunction and Gun and (FindFirstChild(Gun,"GunScript") or FindFirstChild(Gun,"AMMO")) then
game:GetService("TweenService"):Create(Camera, style, {CFrame = CF(CameraCF.Position,Predicted.Position)}):Play()
end

                       







                    end







                end







            end







        end)







    else







        Variables.locked = nil







        camlock.Parent = nil







        Variables.Connections.Camlock:Disconnect()







        Variables.Connections.Camlock = nil







    end







end







local function killbot(Value)







    Variables.killbot = Value







    







    if Variables.killbot then







        killtool.Parent = LocalPlayer.Backpack







        







        Variables.Connections.killbot = RenderStepped:Connect(function()







            if Variables.locked and playerHealth[Variables.locked.Name] ~= true then







                local Char = Variables.locked.Character







                







                if Char and FindFirstChild(Char,"HumanoidRootPart") and FindFirstChild(Char,Variables.AimPart) and not FindFirstChild(Char,"GRABBING_CONSTRAINT") and ((FindFirstChild(Char,"BodyEffects") and FindFirstChild(Char.BodyEffects,"K.O") and not Char.BodyEffects["K.O"].Value) or (FindFirstChild(Char,"Humanoid") and Char.Humanoid.Health > 0)) then







     LocalPlayer.Character.HumanoidRootPart.CFrame = Char.HumanoidRootPart.CFrame + V3(random(-8,8),random(-8,8),random(-8,8))  



     workspace.CurrentCamera.CameraSubject = Char.Humanoid             Selection.Adornee = Char







                end







            end







        end)







    else







        Variables.locked = nil







        killtool.Parent = nil



workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid



        Variables.Connections.killbot:Disconnect()







        Variables.Connections.killbot = nil







    end







end















-- TOO LAZY TO FIX 3 --


















local function unlockgui(Value)















Variables.unlock = Value















if Variables.unlock then















local ScreenGui = Instance("ScreenGui")















local unlock = Instance("TextButton")































ScreenGui.Parent = game.CoreGui















ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling















ScreenGui.Name = "unlockgui"































unlock.Name = "unlock"















unlock.Parent = ScreenGui















unlock.Draggable = true















unlock.BackgroundColor3 = Color3.fromRGB(116, 116, 116)















unlock.BackgroundTransparency = 0















unlock.BorderColor3 = Color3.fromRGB(62, 62, 62)















unlock.Position = UD2(0.8,0,0,0)















unlock.Size = UD2(0, 60, 0, 36)















unlock.Font = Enum.Font.GothamSemibold















unlock.Text = "Unlock"















unlock.TextColor3 = Color3.fromRGB(255, 255, 255)















unlock.TextSize = 12.000































unlock.MouseButton1Down:Connect(function()















Variables.locked = nil







if Variables.killbot  then



workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid



end



end) 































else















CoreGui.unlockgui:Destroy()















end















end















-- END TOO LAZY TO FIX 3 --















Variables.Drawings.AimbotCircle.Color = Color3.new(255,255,255)







Variables.Drawings.AimbotCircle.Radius = Variables.FOV







Variables.Drawings.AimbotCircle.Thickness = 1







Variables.Drawings.AimbotCircle.Filled = false







Variables.Drawings.AimbotCircle.Visible = false















Variables.Drawings.AimbotLine.Color = Color3.new(1,1,1)







Variables.Drawings.AimbotLine.Visible = false















Variables.Drawings.SilentAimDot.Color = Color3.new(1,0,0)







Variables.Drawings.SilentAimDot.Radius = 3







Variables.Drawings.SilentAimDot.Filled = true







Variables.Drawings.SilentAimDot.Visible = false















local function GetPlayer2()







    local Distance,Closest,Pos = inf







    







    for i,v in GetPlayers(Players) do







        if v ~= LocalPlayer then







            local Char = v.Character







            







            if Char and FindFirstChild(Char,Variables.AimPart) and not FindFirstChild(Char,"GRABBING_CONSTRAINT") and ((FindFirstChild(Char,"BodyEffects") and FindFirstChild(Char.BodyEffects,"K.O") and not Char.BodyEffects["K.O"].Value) or (FindFirstChild(Char,"Humanoid") and Char.Humanoid.Health > 0)) then







                local CamPos = Camera.CFrame.Position







                local Result = Raycast(workspace,CamPos,(Char[Variables.AimPart].Position - CamPos).Unit * 1000,Params)







                







                if not Result or not Result.Instance or not IsDescendantOf(Result.Instance,Char) then







                    continue







                end

                local Position,OnScreen = WorldToViewportPoint(Camera,Char[Variables.AimPart].Position)
                if OnScreen then
local Magnitude = (V2(Position.X,Position.Y) - MiddleScreen).Magnitude
if   Magnitude < Distance and Magnitude <= Variables.FOV then
  Distance,Closest,Pos = Magnitude,v,Position
                    end
                end
            end
        end
    end
    return Closest,Pos
end




local function SilentCam(Value)
    Variables.SilentCam = Value
  
    Variables.Drawings.AimbotLine.Visible = false
    Variables.Drawings.SilentAimDot.Visible = false
    
    if Variables.SilentCam then
    Variables.Drawings.AimbotCircle.Visible = true
        local function Loop()
            MiddleScreen = Camera.ViewportSize * 0.5
            
            local Player,Position = GetPlayer2()
            
             if not  Variables.lockedcam  then
             Variables.locked = Player
        
        
       
             elseif playerHealth[Variables.locked.Name] ~= true  and Camera:WorldToViewportPoint(Variables.locked.Character[Variables.AimPart].Position)  then
             local CameraCF = Camera.CFrame
             local Predicted = GetPrediction(Variables.locked.Character[Variables.AimPart]) 
             Camera.CFrame = CF(CameraCF.Position,Lerp(CameraCF,Predicted,Variables.SMOOTHNESS).Position)
             end
             
            
            
            Variables.Drawings.AimbotLine.Visible = Player ~= nil
            Variables.Drawings.SilentAimDot.Visible = false
            
            if Player then
                local Part = Player.Character[Variables.AimPart]
                local Pos,OnScreen = workspace.CurrentCamera:WorldToViewportPoint(GetPrediction(Part).Position)
                
                if OnScreen then
                    Variables.Drawings.SilentAimDot.Visible = true
                    Variables.Drawings.SilentAimDot.Position = V2(Pos.X,Pos.Y)
                end
                
                
                Variables.Drawings.AimbotLine.From = MiddleScreen
                Variables.Drawings.AimbotLine.To = V2(Position.X,Position.Y)
            end
            
            
            Variables.Drawings.AimbotCircle.Position = MiddleScreen
            if not FindFirstChild(CoreGui,"camlock") and Variables.SilentCam then
local screenGui = Instance("ScreenGui")
screenGui.Parent = CoreGui
screenGui.Name = "camlock"
-- Create the TextButton
local button = Instance("TextButton")

-- Set the button's properties
button.Size = UD2(0, 100, 0, 50)  -- Width: 100 pixels, Height: 50 pixels
button.Position = UD2(0, 10, 0, 10)  -- Top left corner with 10 pixels padding
button.Text = "Off"
button.BackgroundColor3 = Color3.fromRGB(76, 175, 80)  -- Green background color
button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text color
button.Font = Enum.Font.SourceSansBold
button.TextSize = 18

-- Make the button's corners curved
local uiCorner = Instance("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)  -- 12 pixels corner radius
uiCorner.Parent = button

-- Parent the button to the ScreenGui
button.Parent = screenGui

-- Optional: Add a click event to the button
button.MouseButton1Click:Connect(function()
    if button.Text == "Off"  and Variables.locked then
    button.Text = "Locked: "..Variables.locked.DisplayName
    Variables.lockedcam = true
    else
    button.Text = "Off"
    Variables.lockedcam = false
    end
end)

end
        end
        
        Variables.Connections.SilentAim = Heartbeat:Connect(Loop)
    else
    Variables.lockedcam = false
CoreGui.camlock:Destroy()
    Variables.Drawings.AimbotCircle.Visible = false
    Variables.Drawings.AimbotLine.Visible = false
    Variables.Drawings.SilentAimDot.Visible = false
        if Variables.Connections.SilentCam then
            Variables.Connections.SilentCam:Disconnect()
            Variables.Connections.SilentCam = nil
        end
    end
end







function GetDot(Target)
if Target.Character and FindFirstChild(Target.Character,"HumanoidRootPart") and LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"HumanoidRootPart") then
local characterPosition = LocalPlayer.Character.HumanoidRootPart.Position
local personPosition = Target.Character.HumanoidRootPart.Position
local direction = (personPosition - characterPosition).unit
local characterForward = LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector
local dotcheck = characterForward:Dot(direction)
   local playerHeight = Target.Character.HumanoidRootPart.Position.Y
    local localPlayerHeight = LocalPlayer.Character.HumanoidRootPart.Position.Y
    local verticalDistance = math.abs(playerHeight - localPlayerHeight)
local characterUp = V3(0, 1, 0) -- Up vector
local dotProductUp = verticalDistance
return dotcheck,dotProductUp
     end
end


local function SilentAim(Value)
    Variables.SilentAim = Value
    Variables.Drawings.AimbotLine.Visible = false
    Variables.Drawings.SilentAimDot.Visible = false
    if Variables.SilentAim then
        if not Variables.HideFOV then
            Variables.Drawings.AimbotCircle.Visible = true
        end


        local function Loop()
            local Player,Position = GetPlayer2()        
if Player ~= nil and LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"HumanoidRootPart")  then

local dotcheck,dotProductUp = GetDot(Player)
            if Variables.FriendCheck and Variables.NoCurve and Player and not  Player:IsFriendsWith(LocalPlayer.UserId)  and dotcheck >= tonumber(Variables.OptionDot)  and playerHealth[Player.Name] ~= true then
            Variables.locked = Player
            elseif  Variables.FriendCheck and Player and not  Player:IsFriendsWith(LocalPlayer.UserId) then
            Variables.locked = Player
            elseif Variables.NoCurve and dotcheck >= tonumber(Variables.OptionDot) then
            Variables.locked = Player
            elseif Variables.NoCurve and (Player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 and dotcheck >= 0.84 and playerHealth[Player.Name] ~= true then
            Variables.locked = Player
            elseif Player and not Variables.NoCurve and not Variables.FriendCheck and playerHealth[Player.Name] ~= true then
             Variables.locked = Player
             else 
             Variables.locked = nil
            end
            else
            Variables.locked = nil
end





            







            if not Variables.HideFOV then
                Variables.Drawings.AimbotCircle.Visible = true
       if Variables.NoCurve  and Player then
      local dotcheck,dotProductUp = GetDot(Player)
 if Player and  not Variables.FriendCheck  and dotcheck >= tonumber(Variables.OptionDot) and playerHealth[Player.Name] ~= true then
                Variables.Drawings.AimbotLine.Visible = true
                elseif Variables.FriendCheck and Player and not  Player:IsFriendsWith(LocalPlayer.UserId)  and dotcheck >= tonumber(Variables.OptionDot) and playerHealth[Player.Name] ~= true  then
                Variables.Drawings.AimbotLine.Visible = true
                else 
                Variables.Drawings.AimbotLine.Visible = false
end
elseif Player and  not Variables.FriendCheck then
Variables.Drawings.AimbotLine.Visible = true
elseif Player == nil then
Variables.Drawings.AimbotLine.Visible = false
Variables.Drawings.SilentAimDot.Visible = false
end
                
                Variables.Drawings.SilentAimDot.Visible = false
                if Player then
                    local Part = Player.Character[Variables.AimPart]
                    local Pos,OnScreen = workspace.CurrentCamera:WorldToViewportPoint(GetPrediction(Part).Position)
              
         if Variables.NoCurve then     
         local dotcheck,dotProductUp = GetDot(Player)
         if OnScreen and Variables.FriendCheck  and not  Player:IsFriendsWith(LocalPlayer.UserId)  and dotcheck >= tonumber(Variables.OptionDot) and playerHealth[Player.Name] ~= true then
                        Variables.Drawings.SilentAimDot.Visible = true
                        Variables.Drawings.SilentAimDot.Position = V2(Pos.X,Pos.Y)
                        elseif  OnScreen and not Variables.FriendCheck and dotcheck >= tonumber(Variables.OptionDot)    then
                        Variables.Drawings.SilentAimDot.Visible = true
                        Variables.Drawings.SilentAimDot.Position = V2(Pos.X,Pos.Y)
                        else
                        Variables.Drawings.SilentAimDot.Visible = false
                    end
              
                    elseif OnScreen and  Variables.FriendCheck  and   Player:IsFriendsWith(LocalPlayer.UserId)   then
                    Variables.Drawings.SilentAimDot.Visible = false
                        elseif OnScreen and playerHealth[Player.Name] ~= true then
                        Variables.Drawings.SilentAimDot.Visible = true              
                        Variables.Drawings.SilentAimDot.Position = V2(Pos.X,Pos.Y)
                     else
                     Variables.Drawings.SilentAimDot.Visible = false
                     Variables.Drawings.AimbotLine.Visible = false
                    end
                    Variables.Drawings.AimbotLine.From = Camera.ViewportSize * 0.5                    
                    Variables.Drawings.AimbotLine.To = V2(Position.X,Position.Y)
                    
                    Variables.Drawings.AimbotCircle.Position = Camera.ViewportSize * 0.5
                end
                
            
                
            end
        end
        Variables.Connections.SilentAim = Heartbeat:Connect(Loop)
    else
        Variables.Drawings.AimbotCircle.Visible = false
Variables.Drawings.AimbotLine.Visible = false
Variables.Drawings.SilentAimDot.Visible = false
        if Variables.Connections.SilentAim then
            Variables.Connections.SilentAim:Disconnect()
            Variables.Connections.SilentAim = nil
        end
    end
end















local function Hidefov(Value)







    Variables.HideFOV = Value







    







    if Value then







        Variables.Drawings.AimbotCircle.Visible = false







        Variables.Drawings.SilentAimDot.Visible = false







        Variables.Drawings.AimbotLine.Visible = false







    else







        Variables.Drawings.AimbotCircle.Visible = true







        Variables.Drawings.SilentAimDot.Visible = true



        Variables.Drawings.AimbotLine.Visible = true







    end







end







local function Goto()



if LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"Humanoid")  then



LocalPlayer.Character.HumanoidRootPart.CFrame = Players[Variables.Target].Character.HumanoidRootPart.CFrame



   end



end



local function ViewTarget(Value)



    Variables.ViewingTarget = Value



    



    if Variables.Connections.ViewTarget then



        Variables.Connections.ViewTarget:Disconnect()



        Variables.Connections.ViewTarget = nil



    end



    



    if Variables.ViewingTarget then



        Variables.Connections.ViewTarget = RunService.RenderStepped:Connect(function()



            if  Players[Variables.Target].Character and FindFirstChild(Players[Variables.Target].Character,"Humanoid") then



                if FindFirstChild(Players[Variables.Target].Character,"BodyEffects") and FindFirstChild(LocalPlayer.PlayerGui,"MainScreenGui") then



                    if FindFirstChild(Players[Variables.Target].Character.BodyEffects,"Defense") then



                        LocalPlayer.PlayerGui.MainScreenGui.Bar.Energy.bar.Size = UD2(Players[Variables.Target].Character.BodyEffects.Defense.Value / 100 * 0.95,0,0.83,0)



                    end



                    



                    if FindFirstChild(Players[Variables.Target].Character.BodyEffects,"Armor") then



                        LocalPlayer.PlayerGui.MainScreenGui.Bar.Armor.bar.Size = UD2(Players[Variables.Target].Character.BodyEffects.Armor.Value / 100 * 0.95,0,0.83,0)



                    end



                    



                    LocalPlayer.PlayerGui.MainScreenGui.Bar.HP.bar.Size = UD2(Players[Variables.Target].Character.Humanoid.Health / Players[Variables.Target].Character.Humanoid.MaxHealth * 0.95,0,0.83,0)



                end



                



                workspace.CurrentCamera.CameraSubject = Players[Variables.Target].Character.Humanoid



            else



                if LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"Humanoid") then



                    workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
                end



            end



        end)



    else



        if  LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"Humanoid") then



            workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid



        end


    end



end







local function Fakelag(Value)



Variables.Fakelag = Value



while Variables.Fakelag do wait()



if LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"Humanoid") and FindFirstChild(LocalPlayer.Character,"HumanoidRootPart") then
LocalPlayer.Character.HumanoidRootPart.Anchored = true
wait(0.3)
LocalPlayer.Character.HumanoidRootPart.Anchored = false
         end
    end



end



local function Chatlogs()



if LocalPlayer.Character and FindFirstChild(LocalPlayer,"PlayerGui") then



LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = true 



LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Position = UD2(0,0,-0.008,0)



LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Size = UD2(1, 0, 1, 0)



 LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Position = LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Position + UD2(UDim.new(),LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Size.Y)



    end



end





local Beams = {}

local BeamConnections = {}

local Attachments = {}

local Colors = {

    At = ColorSequence.new(Color3.new(1,0,0),Color3.new(1,0,0)),

    Away = ColorSequence.new(Color3.new(0,1,0),Color3.new(0,1,0))

}



local function IsBeamHit(Beam,MousePos)

    local Character = LocalPlayer.Character

    local Attachment = Beam.Attachment1

    

    local Origin = Beam.Attachment0.WorldPosition

    local Direction = MousePos - Origin

    

    local Params = RaycastParams.new()

    

    Params.FilterDescendantsInstances = {Beam.Attachment0.Parent.Parent,workspace,CurrentCamera}

    

    local RaycastResult = Raycast(workspace,Origin,Direction * 2,Params)

    

    if not RaycastResult then

        Beam.Color = Colors.Away

        Attachment.WorldPosition = MousePos

        return

    end

    

    if Character then

        Beam.Color = IsDescendantOf(RaycastResult.Instance,Character) and Colours.At or Colours.Away

    end

    

    Attachment.WorldPosition = RaycastResult.Position

end



local function CreateBeam(Character)

    local Beam = Instance("Beam",Character)

    

    Beam.Attachment0 = WaitForChild(Character,"Head").FaceCenterAttachment

    Beam.Enabled = FindFirstChild(Character,"GunScript",true) ~= nil

    

    Beam.Width0 = 0.1

    Beam.Width1 = 0.1

    

    insert(Beams,Beam)

    

    return Beam

end



local function OnCharacter(Character)

    if not Character then

        return

    end

    

    local MousePos = FindFirstChild(Character,"MousePos",true)

    local Beam = CreateBeam(Character)

    

    local Attachment = Instance("Attachment",workspace.Terrain)

    

    Beam.Attachment1 = Attachment

    

    IsBeamHit(Beam,MousePos.Value)

    

    BeamConnections[Beam] = {}

    Attachments[Beam] = Attachment

    

    BeamConnections[Beam][1] = MousePos.Changed:Connect(function()

        IsBeamHit(Beam,MousePos.Value)

    end)

    

    BeamConnections[Beam][2] = Character.DescendantAdded:Connect(function(Descendant)

        if Descendant.Name == "GunScript" then

            Beam.Enabled = true

        end

    end)

    

    BeamConnections[Beam][3] = Character.DescendantRemoving:Connect(function(Descendant)

        if Descendant.Name == "GunScript" then

            Beam.Enabled = false

        end

    end)

end



local function OnPlayer(Player)

    if Player ~= LocalPlayer then

        OnCharacter(Player.Character)

        

        return Player.CharacterAdded:Connect(OnCharacter)

    end

end



local function AimView(Value)
print("yes")
    Variables.AimView = Value

    

    if Variables.AimView and Variables.Target then

        Variables.Connections.AimView = OnPlayer(Players[Variables.Target])

    else

        Variables.Connections.AimView:Disconnect()

        Variables.Connections.AimView = nil

        

        for i,v in Beams do

            v:Destroy()

            

            for i2,v2 in BeamConnections[v] do

                v2:Disconnect()

            end

            

            Attachments[v]:Destroy()

        end

    end

end

local function updatePlayerHealth(player, health)
    if health <= tonumber(Variables.HealthKnock) and playerHealth[player] ~= true then
        playerHealth[player] = true
        print("succefuly"..player)
    elseif health >= 15 and playerHealth[player] ~= false then
        playerHealth[player] = false
    end
end


local previousPositions = {}  -- Table to store previous positions for each player

local previousTimes = {}      -- Table to store previous times for each player



Variables.VELOCITIES = {}



-- Function to calculate velocity

local function calculateVelocity(currentPosition, previousPosition, currentTime, previousTime)

    local deltaTime = currentTime - previousTime

    if deltaTime == 0 then

        return V3()

    end

    local deltaPosition = currentPosition - previousPosition

    return deltaPosition / deltaTime

end



-- Function to update velocity for a specific player

local function updateVelocity(player)

    local currentTime = tick()

    local currentPosition = player.Character and FindFirstChild(player.Character,"HumanoidRootPart") and player.Character.HumanoidRootPart.Position



    if not previousPositions[player] or not previousTimes[player] then

        previousPositions[player] = currentPosition

        previousTimes[player] = currentTime

        return V3()  -- Return zero velocity if there's no previous data

    end



    local previousPosition = previousPositions[player]

    local previousTime = previousTimes[player]

    local velocity = calculateVelocity(currentPosition, previousPosition, currentTime, previousTime)



    previousPositions[player] = currentPosition

    previousTimes[player] = currentTime



    return velocity

end



-- Update velocity for all players periodically

RunService.RenderStepped:Connect(function()

    for i,v in GetPlayers(Players) do

        if v.Character and FindFirstChild(v.Character,"HumanoidRootPart") then

            Variables.VELOCITIES[v.Name] = updateVelocity(v)

        end
        if v.Character and FindFirstChild(v.Character,"Humanoid") then
         updatePlayerHealth(v.Name,v.Character.Humanoid.Health)
        end
    end

end)

local function rightclick(Value)
Variables.Rightclick = Value
if Variables.Rightclick then 
VirtualInput:SendKeyEvent(true,Enum.KeyCode.ButtonL2,false,game)

Variables.Connections.Rightclick = LocalPlayer.CharacterAdded:Connect(function()
wait(2)
        VirtualInput:SendKeyEvent(true,Enum.KeyCode.ButtonL2,false,game)        
end)
 
else
VirtualInput:SendKeyEvent(false,Enum.KeyCode.ButtonL2,false,game)

Variables.Connections.Rightclick:Disconnect()
Variables.Connections.Rightclick = nil
   end
end


local function HasTool(Name)
    return FindFirstChild(LocalPlayer.Backpack,Name) or FindFirstChild(LocalPlayer.Character,Name)
end


local function ActivateTool(Name)
    if LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"Humanoid") then
        local Tool = HasTool(Name)
        
        if Tool then
            if Tool.Parent == LocalPlayer.Backpack then
                LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
            
            if Tool.Parent == LocalPlayer.Character then
                Tool:Activate()
            end
        end
    end
end
local function GetOffset(HipHeight,RootPart,Part)
    return V3(0,HipHeight + RootPart.Size.Y * 0.5 + Part.Size.Y * 0.5,0)
end
local function DeActivateTool(Name)
    if LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"Humanoid") then
        local Tool = HasTool(Name)
        
        if Tool then
            if Tool.Parent == LocalPlayer.Backpack then
                LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
            
            if Tool.Parent == LocalPlayer.Character then
                Tool:Deactivate()
            end
        end
    end
end
local Items = {}

local Done = {}


for i,v in next,GetChildren(Shop) do
    local Name,Price = v.Name
    local Ammo = v.Name:find("Ammo") ~= nil
    if Name and Price and Price > 0 and not Ammo and not find(Done,v.Name) then
        insert(Done,v.Name)
        insert(Items,{
            Name = Name,
            Price = Price
        })
    end
end
sort(Items,function(a,b)
    if a.Price == b.Price then
      return a.Name < b.Name
    end
    return a.Price < b.Price
end)
local function BuyItem(Item,Price)
local OldCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
local ItemSpawn = FindFirstChild(Shop,"["..Item.."] - $"..Price)
local Owned = HasTool("["..Item.."]")
while not Owned  do
        if  not Item:match("Mask") then
        Owned = HasTool("["..Item.."]")
        elseif Item:match("Armor") then
        Owned = LocalPlayer.Character.BodyEffects.Armor.Value < 100
        else 
        Owned = HasTool("[Mask]")
        end
        LocalPlayer.Character.HumanoidRootPart.CFrame = ItemSpawn.Head.CFrame + GetOffset(LocalPlayer.Character.Humanoid.HipHeight,LocalPlayer.Character.HumanoidRootPart,ItemSpawn.Head)
        fireclickdetector(ItemSpawn.ClickDetector)
       
        Heartbeat:Wait()
    end
    LocalPlayer.Character.HumanoidRootPart.CFrame = OldCFrame
     return Owned
end

local ArmorNames = {}
for i,v in next, workspace:GetDescendants() do if v.ClassName == "Model" and string.find(v.Name,"Armor") then  insert(ArmorNames,v) end end
local function ArmorBuy(Value)
Variables.ArmorBuy = Value
if Variables.ArmorBuy then
Variables.Connections.ArmorBuy = RenderStepped:connect(function()
for i,v in ArmorNames do
if LocalPlayer and LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"HumanoidRootPart") and    (LocalPlayer.Character.HumanoidRootPart.Position - v.Head.Position).magnitude     <= 12  then
  fireclickdetector(v.ClickDetector)
  wait(0.25)
              end 
         end
    end)
    else
    Variables.Connections.ArmorBuy:Disconnect()
    Variables.Connections.ArmorBuy = nil
    end
end

local function CreateAnimation(Idle,Walk,Run,Jump,Fall)
if LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"Animate") then
local Animate = LocalPlayer.Character.Animate
local idle = Animate.idle
local walk = Animate.walk
local run = Animate.run
local jump = Animate.jump
local fall = Animate.fall
local Old = idle.Animation1
local Old2 = idle.Animation2
local Old3 = run.RunAnim
local Old4 = jump.JumpAnim
local Old5 = walk.WalkAnim
local Old6 = fall.FallAnim
idle.Parent = nil
run.Parent = nil
walk.Parent = nil
jump.Parent = nil
fall.Parent = nil
wait(2)
    Old.AnimationId = "http://www.roblox.com/asset/?id="..Idle
    Old2.AnimationId = "http://www.roblox.com/asset/?id="..Idle
    Old3.AnimationId = "http://www.roblox.com/asset/?id="..Run
   Old5.AnimationId = "http://www.roblox.com/asset/?id="..Walk
    Old4.AnimationId = "http://www.roblox.com/asset/?id="..Jump
    Old6.AnimationId = "http://www.roblox.com/asset/?id="..Fall

idle.Parent = Animate
run.Parent = Animate
walk.Parent = Animate
jump.Parent = Animate
fall.Parent = Animate
      end
end


local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Allvideo1/Nukermode/main/LIBRARY%20(1).txt"))()
local Win = Window("NukerHub","Aimbot")
local Library = CoreGui.Library

if FindFirstChild(CoreGui,"LibraryOpen") then
    CoreGui.LibraryOpen:Destroy()
end

local Gui = Instance("ScreenGui")
local Button = Instance("ImageButton")
local Rounding = Instance("UICorner")
local Shadow = Instance("ImageLabel")


Gui.IgnoreGuiInset = true
Gui.Name = "LibraryOpen"
Gui.Parent = CoreGui


Button.AnchorPoint = V2(0.5,0)
Button.BackgroundTransparency = 1
Button.Image = "rbxassetid://17329820770"
Button.Name = "Open"
Button.Parent = Gui
Button.Position = UD2(0.03,0,0,100)
Button.Size = UD2(0,40,0,40)
Button.ZIndex = 2


Rounding.CornerRadius = UDim.new(0,6)
Rounding.Parent = Button
Rounding.Name = "Rounding"

Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://9098469826"
Shadow.ImageColor3 = Color3.fromRGB(24,24,24)
Shadow.Parent = Button
Shadow.Position = UD2(0,-12,0,-12)
Shadow.ScaleType = "Slice"
Shadow.Size = UD2(1,24,1,24)
Shadow.SliceCenter = Rect.new(20,20,492,492)

Button.MouseButton1Click:Connect(function()
    if Library.MainFrame.Visible then
        Library.MainFrame.Visible = false
    else
        Library.MainFrame.Visible = true
    end
end) 

local main = Win:Tab("Main")
local autobuy = Win:Tab("AutoBuy")
local target = Win:Tab("Target")
local mobile = Win:Tab("Mobile Tool")
local animation = Win:Tab("FE animation")
local set = Win:Tab("Settings")
local AutoPreaim = Win:Tab("AutoPred Aimlock")
local AutoPrecam = Win:Tab("AutoPred camlock")

local AnimationList = {
       Stylish = {
     Idle = 616136790,
     Walk = 616146177,
     Run = 616140816,
     Jump = 616139451,
     Fall = 616134815
     },
       Robot = {
     Idle = 616088211,
     Walk = 616095330,
     Run = 616091570,
     Jump = 616090535,
     Fall = 616087089
     },
       Pirate = {
     Idle = 750781874,
     Walk = 750785693,
     Run = 750783738,
     Jump = 750782230,
     Fall = 750780242
     },
       Ninja = {
     Idle = 656117400,
     Walk = 656121766,
     Run = 656118852,
     Jump = 656117878,
     Fall = 656115606
     },
       Mage = {
     Idle = 707742142,
     Walk = 707897309,
     Run = 707861613,
     Jump = 707853694,
     Fall = 707829716
     },
       Levitation = {
     Idle = 616006778,
     Walk = 616013216,
     Run = 616010382,
     Jump = 616008936,
     Fall = 616005863
     },
      Knight = {
     Idle = 657595757,
     Walk = 657552124,
     Run = 657564596,
     Jump = 658409194,
     Fall = 657600338
     },
      Elder = {
     Idle = 845397899,
     Walk = 845403856,
     Run = 845386501,
     Jump = 845398858,
     Fall = 845396048
     },
     Cartoony = {
     Idle = 742637544,
     Walk = 742640026,
     Run = 742638842,
     Jump = 742637942,
     Fall = 742637151
     },
     Bubbly = {
     Idle = 910004836,
     Walk = 910034870,
     Run = 910025107,
     Jump = 910016857,
     Fall = 910001910
     },
     Astronaut = {
     Idle = 891621366,
     Walk = 891667138,
     Run = 891636393,
     Jump = 891627522,
     Fall = 891617961
     },
     Toy = {
     Idle = 782841498,
     Walk = 782843345,
     Run = 782842708,
     Jump = 782847020,
     Fall = 782846423
     },
     ["Super-Hero"]= {
     Idle = 616111295,
     Walk = 616122287,
     Run = 616117076,
     Jump = 616115533,
     Fall = 616108001
     },
    Vampire = {
    Idle = 1083445855,
    Walk = 1083473930,
    Run = 1083462077,
    Jump = 1083455352,
    Fall = 1083443587
    },
   Werewolf = {
   Idle = 1083195517,
   Walk = 1083178339,
   Run = 1083216690,
   Jump = 1083218792,
   Fall = 1083189019
   },
   Zombie = {
   Idle = 616158929,
   Walk = 616168032,
   Run = 616163682,
   Jump = 616161997,
   Fall = 616157476
   },
   Tryhard = {
   Idle = 782841498,
   Walk = 616168032,
   Run = 616163682,
   Jump = 1083218792,
   Fall = 1083189019
   }
}

main:Toggle("RightClick",false,rightclick)
main:Textbox("Prediction: Default(0)", false,function(Value) 
if tonumber(Value) < 1 then
  Variables.Prediction = V3(1/Value,1/Value,1/Value)
  else
  Variables.Prediction = V3(Value,Value,Value)
  end
end)


main:Textbox("X pred:", false,function(Value)
 if tonumber(Value) < 1 then
  Variables.XValue =  1 / Value 
  Variables.Prediction = V3(Variables.XValue,Variables.YValue,Variables.XValue)
  else
  Variables.XValue =   Value 
  Variables.Prediction = V3(Variables.XValue,Variables.YValue,Variables.XValue)
  end
end)


main:Textbox("Y pred:", false,function(Value)
if tonumber(Value) < 1 then
  Variables.YValue = 1 / Value  
  Variables.Prediction = V3(Variables.XValue,Variables.YValue,Variables.XValue)
  else
  Variables.YValue =   Value 
  Variables.Prediction = V3(Variables.XValue,Variables.YValue,Variables.XValue)
  end
end)


do
local BodyParts = {
        "Head",
        "UpperTorso",
        "HumanoidRootPart",
        "LowerTorso"
    }
    local Table = table.clone(BodyParts)
    local Len = #Table + 1
    local All = false
    insert(Table,"All")
    main:Dropdown("AimPart",Table,function(Value)
        if Value == "All" then
            if not All then
                All = true 
                while All do
                    Variables.AimPart = BodyParts[random(Len)]
                    Variables.OldAimPart = BodyParts[random(Len)]
wait()
                end
            end
            return
        end
        All = false
        Variables.AimPart = Value
        Variables.OldAimPart = Value
    end)
end


main:Toggle("Auto-Prediction based on ping 1[Old high ping too?]",false,AutoPrediction)-- high ping


main:Toggle("Auto-Prediction based on ping 2[High ping ? idk try]",false,AutoPrediction21) -- close/mid/far


main:Toggle("Auto-Prediction based on ping 3[blatant  for some device i guess] 10-190 ping",false,AutoPrediction22)-- idk


main:Toggle("Legit AutoPred",false,function(Value)
Variables.AutoPredictionLegit = Value
if Variables.AutoPredictionLegit then
       Variables.Connections.AutoPredictionLegit = RunService.RenderStepped:connect(function()
     local Auto4 = min(0.2077+ 0.00059* Ping:GetValue(),1)
        local Auto3 = min(0.2077+ 0.00058* Ping:GetValue(),1)
       local Auto2 = min(0.2077+ 0.00057* Ping:GetValue(),1)
       local Y = 0.1045285714285714* Ping:GetValue()
       local X = 0.1125142857142857* Ping:GetValue()
       
       wait(2)
      Variables.Prediction =  V3(X,X,X)
      
        end)
        else
        Variables.Prediction = 0
        Variables.Connections.AutoPredictionLegit:Disconnect()
        Variables.Connections.AutoPredictionLegit = nil
    end

end)


main:Toggle("Silent Aim",false,SilentAim)
main:Toggle("silent camlock [Gui Toggle]",false,SilentCam)
main:Toggle("Friend Check",false,function(Value)
  Variables.FriendCheck = Value
end)

main:Toggle("Aimlock[Tool]",false,Aimlock)


main:Toggle("Killbot[Tool]",false,killbot)


main:Label("↓ Cam Lock ↓")


main:Toggle("Auto-Prediction based on ping [CamLock]",false,AutoSetCam)

local Ease = {
   "Linear",
   "Sine",
   "Back",
   "Quad",
   "Quart",
   "Quint",
   "Bounce",
   "Elastic",
   "Exponential",
   "Circular",
   "Cubic"
   }
main:Dropdown("Easing Style:",Ease,function(Value)
Variables.EasingStyle = Value
end)
main:Toggle("Style",false, function(Value)
Variables.Style = Value
end)

main:Toggle("Aimlock[Camlock tool]",false,Camlock)


main:Toggle("lock when gun",false, function(Value) 
  Variables.GunFunction = Value
end)
main:Button("Bypass Hood custom", function()
for _, con in next, getconnections(workspace.CurrentCamera.Changed) do
  task.wait()
    con:Disable()
end
for _, con in next, getconnections(workspace.CurrentCamera:GetPropertyChangedSignal("CFrame")) do
   task.wait()
    con:Disable()
    end
end)

mobile:Toggle("Antilock Desync", false, function(Value)
Variables.antilock = Value

Heartbeat:Connect(function()
if Variables.antilock and LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"HumanoidRootPart") then
local c=LocalPlayer.Character.HumanoidRootPart.Velocity 
  LocalPlayer.Character.HumanoidRootPart.Velocity=V3(0,200,0)
  RenderStepped:Wait()   
  LocalPlayer.Character.HumanoidRootPart.Velocity=c
      end
   end)
end)


mobile:Toggle("Fake Lag", false, Fakelag)


mobile:Textbox("Speed:", false, function(Value)
  Variables.Speed = Value
end)


mobile:Toggle("CFrame-Speed", false, function(Value)
Variables.CFrame = Value

Heartbeat:Connect(function(FrameTime)
if Variables.CFrame and LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"HumanoidRootPart") then 
  LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + LocalPlayer.Character.Humanoid.MoveDirection * (Variables.Speed - LocalPlayer.Character.Humanoid.WalkSpeed) *  FrameTime
           end
     end)
end)


mobile:Toggle("Armor-Aura",false,ArmorBuy)


mobile:Toggle("Swim Mode[Water In map]",false,function(Value)
local SwimMode = Value
if SwimMode and LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,"HumanoidRootPart") then
  workspace.Terrain:FillBlock(CF(LocalPlayer.Character.HumanoidRootPart.Position),V3(1400,1400,1400),Enum.Material.Water)
else
  workspace.Terrain:Clear()
      end
end)


mobile:Button("Chat-logs",Chatlogs)


mobile:Toggle("Macro Gui",false,MacroGui)


mobile:Toggle("unlock gui",false,unlockgui)


set:Textbox("Smoothness camlock: Default(0.07283)",false,function(Value)
    local Num = tonumber(Value)
    
    if Num then
        Variables.SMOOTHNESS = Num
    end
end)

--[[set:Slider("Jump Offset",0.01,0.1,0.09,function(Value)
Variables.JumpOffset = Value
end)]]

set:Toggle("AirPart",false,function(Value)
Variables.Airshot = Value
Variables.JumpOffsetToggle = Value
if Variables.Airshot then
Variables.Connections.Airshot = RenderStepped:Connect(function()
            if Variables.locked then
                local Char = Variables.locked.Character
                if Char and FindFirstChild(Char,"LowerTorso") and FindFirstChild(Char,Variables.AimPart) and FindFirstChild(Char,"Humanoid") and Char.Humanoid.FloorMaterial == Enum.Material.Air then
                    Variables.AimPart = "LowerTorso"
                    
                else
                    Variables.AimPart = Variables.OldAimPart
                end
            end
        end)
    else
        Variables.Connections.Airshot:Disconnect()
        Variables.Connections.Airshot = nil
    end
end)


set:Textbox("Delay before shooting (default is 0.2)", false, function(Value)
Variables.DelayShoot = Value
end)


set:Toggle("Shoot Air ",false,function(Value)
Variables.ShootAir = Value
    
if Variables.ShootAir then
  Variables.Connections.ShootAir = RenderStepped:Connect(function()
if Variables.locked then
local Char = Variables.locked.Character           
local Gun = FindFirstChildOfClass(LocalPlayer.Character,"Tool")

if Char and FindFirstChild(Char,"LowerTorso") and FindFirstChild(Char,Variables.AimPart) and FindFirstChild(Char,"Humanoid") and  Char.Humanoid:GetState() == Enum.HumanoidStateType.Freefall    and Gun and (FindFirstChild(Gun,"GunScript") or FindFirstChild(Gun,"AMMO")) then           
    wait(Variables.DelayShoot)
  Gun:Activate()              
  wait()
                end
            end
        end)
    else
        Variables.Connections.ShootAir:Disconnect()
        Variables.Connections.ShootAir = nil
    end
end)


set:Toggle("Hide-silentAim",false,Hidefov)

set:Dropdown("Options:",{"Legit","little curve"}, function(Value)
local Choosed = Value
if Choosed == "Legit" then
Variables.OptionDot = 0.99
else
Variables.OptionDot = 0.98
      end
end)
set:Toggle("NoCurve",false, function(Value)
Variables.NoCurve = Value
end)
local Table = {
    ["rev"] = 30,
    ["barrel"]  = 40,
    ["db"] = 40
    }
    local function checkgun(character)
    if character then
     for i,v in Table do
      
            if character:FindFirstChildOfClass("Tool") and string.find(character:FindFirstChildOfClass("Tool").Name,string.lower(i)) then 
                     Variables.FOV = v
          Variables.Drawings.AimbotCircle.Radius = v
          elseif not character:FindFirstChildOfClass("Tool")  then
           Variables.FOV = Variables.OldFov
          Variables.Drawings.AimbotCircle.Radius = Variables.OldFov
                end
                
          end
          
    end
    
end
--[[set:Toggle("AutoFov",false,function(Value)
local ToggleFov = Value
RenderStepped:connect(function()
if ToggleFov and  LocalPlayer.Character then
checkgun(LocalPlayer.Character)
 end
  end)
end)]]

set:Textbox("FOV",false,function(Value)
    local Num = tonumber(Value)
    
    if Num then
        Num = clamp(Num,1,999)
        Variables.FOV = Num
    end
end)
set:Textbox("Circle-Size: Default(120)",false,function(Value)
    local Num = tonumber(Value)
    
    if Num then
        Num = clamp(Num,1,999)
        Variables.FOV = Num
        Variables.Drawings.AimbotCircle.Radius = Num
        Variables.OldFov = Num
    end
end)

--[[local a = set:Label("Pred")
local b = set:Label("Multiply")

set:Textbox("multiply:",false, function(Value)
  Variables.Multiple = Value
end)

task.spawn(function()
RenderStepped:connect(function()
  a:Refresh(Variables.Prediction.x .. " " .. Variables.Prediction.y .. " " .. Variables.Prediction.z)
  b:Refresh(tostring(Variables.Multiple))
    end)
end)]]


--[[set:Toggle("Rainbow Circle",false,function(Value)
    if Value then
        Variables.Connections.RainbowCircle = RenderStepped:Connect(function()
            Variables.Drawings.AimbotCircle.Color = HSV(tick() % 5 / 5,1,1)
        end)
    else
        Variables.Connections.RainbowCircle:Disconnect()
        Variables.Connections.RainbowCircle = nil
        Variables.Drawings.AimbotCircle.Color = Color3.new(1,0,0)
    end
end)]]

set:Colorpicker("Circle color", Color3.fromRGB(255, 255, 255), function(Value)
Variables.Drawings.AimbotCircle.Color = Value
end)

set:Button("Rejoin",function()
  TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)


set:Button("Find Good Server", function()
local placeId = game.PlaceId
local function fetchServersData(placeId, limit)
    local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?limit=%d", placeId, limit)
    local success, response = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)

    if success and response and response.data then
        return response.data
    end

    return nil
end

local placeId = game.PlaceId
local serverLimit = 100
local servers = fetchServersData(placeId, serverLimit)

if not servers then
    return
end

local lowestPingServer = servers[1]

for _, server in pairs(servers) do
    if server["ping"] < lowestPingServer["ping"] then
        lowestPingServer = server
    end
end

if Ping:GetValue() >= 100 then
    TeleportService:TeleportToPlaceInstance(placeId, lowestPingServer.id)
else
    Notification("You already Have Good ping")
end
end)


local Tools = {}
for i,v in next,Players:GetPlayers() do
    insert(Tools,v.DisplayName.." (@"..v.Name..")")
end

local Dropdown = target:Dropdown("Players",Tools,function(Option)
    Variables.Target = Option:split("@")[2]:sub(1,-2)
end)

target:Button("Refresh Players",function()
    Dropdown:Clear()
    local Tools = {} 
    for i,v in next,game:GetService("Players"):GetPlayers() do
        insert(Tools,v.DisplayName.." (@"..v.Name..")")
    end
    for i,v in next,Tools do
        Dropdown:Add(v)
    end
end)

target:Textbox("Player:",false,function(Value)
Variables.Target = Value
end)



target:Button("Goto",Goto)
local GOTO = false

target:Toggle("Goto",false,function(Value)
    GOTO = Value
    while GOTO do
        Goto()
        Heartbeat:Wait()
    end
end)

target:Toggle("View", false, ViewTarget)

--target:Toggle("AimView", false, AimView)

target:Toggle("Anti lock resolver",false,function(Value)
    Variables.AntiAntiLock = Value
end) 


for i,v in next,Items do
    autobuy:Button(v.Name.." - $"..Comma(v.Price),function()     
         BuyItem(v.Name,v.Price)
    end)
end

set:Textbox("Knock check health: Default(1.5)", false, function(Value)
Variables.HealthKnock = Value
end)


set:Toggle("Hide nukermode logo", false, function(Value)
local hide = Value

if hide then
CoreGui.LibraryOpen.Open.ImageTransparency = 1
else
CoreGui.LibraryOpen.Open.ImageTransparency = 0
     end
end)

--[[set:Slider("AutoPred X ", 0,1000,0,function(Value)
Variables.AutoPredX = Value
end)

set:Slider("AutoPred Y ", 0,1000,0,function(Value)
Variables.AutoPredY = Value
end)
set:Textbox("Y string", false, function(Value)
Variables.AutoPredY = Value
end)
set:Textbox("X string", false, function(Value)
Variables.AutoPredX = Value
end)
set:Textbox("both string", false, function(Value)
Variables.AutoPredX = Value
Variables.AutoPredY = Value
end)
set:Textbox("Delay", false, function(Value)
Variables.AutoPredDelay = Value
end)]]


set:Toggle("Hide Arceus x and delta", false, function(Value)
local ExecutorHide = Value
for i,v in CoreGui:GetChildren() do
if v:IsA("ScreenGui") and v.DisplayOrder == 1999999999 or v.Name == "DeltaIcon"  then
if ExecutorHide then
CoreGui[v.Name].Enabled  = false 
else
CoreGui[v.Name].Enabled = true
                  end
           end
     end
end)

for i,v in next,AnimationList do
animation:Button(i,function()
CreateAnimation(v.Idle,v.Walk,v.Run,v.Jump,v.Fall)
end)
end
local ListGame = {
    ["Da Downhill"] = {
        AutoPredX = 0.1,
        AutoPredY = 0.1,
        AutoPredDelay = 0.000287
    },
    ["Da Strike"] = {
        AutoPredX = 0.15,
        AutoPredY = 0.15,
        AutoPredDelay = 0.000292
    },
    ["Da UpHill"] = {
        AutoPredX = 0.15,
        AutoPredY = 0.15,
        AutoPredDelay = 0.000292
    }
}
local ListGame2 = {
    ["Da Downhill"] = {
        AutoPredX = 0.15,
        AutoPredY = 0.15,
        AutoPredDelay = 0.000287
    },
    ["Da Strike"] = {
        AutoPredX = 0.15,
        AutoPredY = 0.15,
        AutoPredDelay = 0.000292
    },
    ["Da Uphill"] = {
        AutoPredX = 0.15,
        AutoPredY = 0.15,
        AutoPredDelay = 0.000292
    }
}

for i, v in ListGame do
    local Toggled = false
    
    AutoPreaim:Toggle("AutoPred: "..i, Toggled, function(Value)
        Toggled = Value
        
        while Toggled do
            local AutoPred = v.AutoPredDelay * Ping:GetValue()
            local InverseX = 1 / (v.AutoPredX + AutoPred)
            
            Variables.Prediction = V3(InverseX, 1 / (v.AutoPredY + AutoPred), InverseX)
            task.wait(4) -- kinda slow idk
        end
        
        Variables.Prediction = V3(0, 0, 0)
    end)
end
for i, v in ListGame2 do
    local Toggled = false
    
    AutoPrecam:Toggle("AutoPred: "..i, Toggled, function(Value)
        Toggled = Value
        
        while Toggled do
            local AutoPred = v.AutoPredDelay * Ping:GetValue()
            local InverseX = 1 / (v.AutoPredX + AutoPred)
            
            Variables.Prediction = V3(InverseX, 1 / (v.AutoPredY + AutoPred), InverseX)
            task.wait(4) -- kinda slow idk
        end
        
        Variables.Prediction = V3(0, 0, 0)
    end)
end
--[[
break -- Exit the loop if authorization is successful
    else
        warn('Hardware ID not Successfully Authorized')
    end  
    wait(2) -- Pause execution for 5 seconds before the next iteration
end]]