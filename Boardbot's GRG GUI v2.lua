-- **IF YOU USE ANY OF THIS CODE IN YOUR SCRIPT, CREDIT ME.**
-- Boardbot#7385
-- https://v3rmillion.net/member.php?action=profile&uid=1389477
-- enjoy



--[[
Boardbot's Generic Roleplay Gaem GUI v2.3

Contact me here: Boardbot#7385
Join the discord: discord.gg/BgaWVXUduZ

when will he learn!
--]]







local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)


-- predefine some vars
local UserInputService = game:GetService('UserInputService')
sprintSpeed = 24
walkSpeed = 16
farmTime = 0.35
killHeight = -7
swordToUse = nil
back = CFrame.Angles(0, math.rad(0), 0)
front = CFrame.Angles(0, math.rad(180), 0)
right  = CFrame.Angles(0, math.rad(90), 0)
left  = CFrame.Angles(0, math.rad(270), 0)
isViewing = false

function ServerHopz(Decision)
    rejoining = true
    
    local GUIDs = {}
    local maxPlayers = 0
    local pagesToSearch = 100
    if Decision == "fast" then pagesToSearch = 5 end
    local Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="))
    for i = 1,pagesToSearch do
        for i,v in pairs(Http.data) do
            if v.playing ~= v.maxPlayers and v.id ~= game.JobId then
                maxPlayers = v.maxPlayers
                table.insert(GUIDs, {id = v.id, users = v.playing})
            end
        end
        
        if Http.nextPageCursor ~= null then Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..Http.nextPageCursor)) else break end
    end
    
    if Decision == "any" or Decision == "fast" then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[math.random(1,#GUIDs)].id, game.Players.LocalPlayer)
    elseif Decision == "smallest" then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[#GUIDs].id, game.Players.LocalPlayer)
    elseif Decision == "largest" then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[1].id, game.Players.LocalPlayer)
    else
        
    end
    wait(3)
    rejoining = false
end

local function tpToLocation(location)
	game.Players.LocalPlayer.Character.Humanoid.Sit = false
	wait(0.1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location)
	wait(0.5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location)
	wait(0.5)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location)
	
	
end

local function buyFromShop(storeName, itemName)
	
plr1 = game.Players.LocalPlayer.Character
workPlr = workspace[game.Players.LocalPlayer.Name]    
	--check if team is not spectator
	if storeName == "Kart" then
	
		if itemName == "RegularKart" then
			tpToLocation(Vector3.new(403.231384, 0.760007024, -128.842789))
		elseif itemName == "DoubleKart" then
			tpToLocation(Vector3.new(409.595337, 0.760007024, -76.0248718))
		elseif itemName == "RaceKart" then
			tpToLocation(Vector3.new(372.777405, 0.760007024, -69.6609116))
		elseif itemName == "BusKart" then
			tpToLocation(Vector3.new(371, 0.750000119, -129.5))
		elseif itemName == "FarmKart" then
			tpToLocation(Vector3.new(318.595337, 0.760007024, 144.975128))
			end
		end
		
	if storeName == "SwordStore" then
		
		if itemName == "BasicSword" then
			tpToLocation(Vector3.new(56, 20.8300018, 346))
		elseif itemName == "GoodSword" then
			tpToLocation(Vector3.new(61.5, 20.8300018, 346))
		elseif itemName == "BestSword" then
			tpToLocation(Vector3.new(50.5, 20.8300018, 346))
		end
	end
	--needs completion
	if storeName == "WeaponStore" then
		if itemName == "Musket" then
			tpToLocation(Vector3.new(75, 20.8300018, 346))
		elseif itemName == "Gun" then
			tpToLocation(Vector3.new(80.5, 20.8300018, 346))
		elseif itemName == "Rocket" then
			tpToLocation(Vector3.new(69.5, 20.8300018, 346))
		end
	end
	
	if storeName == "AxeStore" then
		if itemName == "BasicAxe" then
			tpToLocation(Vector3.new(89, 20.7900009, 279))
		elseif itemName == "GoodAxe" then
			tpToLocation(Vector3.new(89, 20.7900009, 273.5))
		elseif itemName == "BestAxe" then
			tpToLocation(Vector3.new(89, 20.7900009, 284.5))
		end
	end
	
	if storeName == "SickleStore" then
		if itemName == "BasicSickle" then
			tpToLocation(Vector3.new(89, 20.7900009, 298))
		elseif itemName == "GoodSickle" then
			tpToLocation(Vector3.new(89, 20.7900009, 292.5))
		elseif itemName == "BestSickle" then
			tpToLocation(Vector3.new(89, 20.7900009, 303.5))
		end
	end
	
	if storeName == "HammerStore" then
		if itemName == "BasicHammer" then
			tpToLocation(Vector3.new(89, 20.7900009, 317))
		elseif itemName == "GoodHammer" then
			tpToLocation(Vector3.new(89, 20.7900009, 311.5))
		elseif itemName == "BestHammer" then
			tpToLocation(Vector3.new(89, 20.7900009, 322.5))
		end
	end
		
	if storeName == "FoodStore" then
		if itemName == "BasicFood" then
			tpToLocation(Vector3.new(-8.99998474, 20.7900009, 317))
		elseif itemName == "GoodFood" then
			tpToLocation(Vector3.new(-8.99998474, 20.7900009, 322.5))
		elseif itemName == "BestFood" then
			tpToLocation(Vector3.new(-8.99998474, 20.7900009, 311.5))
		end
	end
	
	if storeName == "FishingNet" then
		if itemName == "BasicNet" then
			tpToLocation(Vector3.new(-8.99998474, 20.7900009, 279))
		elseif itemName == "GoodNet" then
			tpToLocation(Vector3.new(-8.99998474, 20.7900009, 284.5))
		elseif itemName == "BestNet" then
			tpToLocation(Vector3.new(-8.99998474, 20.7900009, 273.5))
		end
	end
	
	if storeName == "DoctorsOffice" then
		if itemName == "Heal" then
			tpToLocation(Vector3.new(-3, 20.8300018, 346))
		elseif itemName == "Limbs" then
			tpToLocation(Vector3.new(2.5, 20.8300018, 346))
		elseif itemName == "Wheelchair" then
			tpToLocation(Vector3.new(-8.5, 20.8300018, 346))
		end
	end

end


-- Find da player 
local function GetPlayer(Input)
    for _, Player in ipairs(game.Players:GetPlayers()) do
    	if (string.lower(Input) == string.sub(string.lower(Player.Name), 1, #Input)) or (string.lower(Input) == string.sub(string.lower(Player.DisplayName), 1, #Input))then
    		return Player;
    	end
    end
end

-- Kill player function

local function killPlayer(playerToKill, swordToUse)
		
	for i,v in pairs(game.Workspace.Houses:GetChildren()) do
        if v:FindFirstChild("Boundary") then
            v.Boundary:Destroy()
        end
    end
        
    

	
	
	players = game.Players:GetChildren()
	wasPlayerKilled = false
	workPlr = workspace[game.Players.LocalPlayer.Name]
	poopyFrame = Vector3.new(0,-4,1.5)
	
	if swordToUse and swordToUse ~= "Autoselect" then
	    tool = swordToUse
	elseif swordToUse == nil or not swordToUse or swordToUse == "Autoselect" then
	
    	if game.Players.LocalPlayer.Backpack:FindFirstChild("Best Sword") then
    		tool = game.Players.LocalPlayer.Backpack["Best Sword"]
    	elseif workPlr:FindFirstChild("Best Sword") then 
    		tool = workPlr["Best Sword"]
    	elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Good Sword") then
    		tool = game.Players.LocalPlayer.Backpack["Good Sword"]
    	elseif workPlr:FindFirstChild("Good Sword") then 
    		tool = workPlr["Good Sword"]
    	elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Sword") then
    		tool = game.Players.LocalPlayer.Backpack["Sword"]
    	elseif workPlr:FindFirstChild("Sword") then 
    		tool = workPlr["Sword"]
    	elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Guard Sword") then
    		tool = game.Players.LocalPlayer.Backpack["Guard Sword"]
    	elseif workPlr:FindFirstChild("Guard Sword") then 
    		tool = workPlr["Guard Sword"]
    	elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Basic Sword") then
    		tool = game.Players.LocalPlayer.Backpack["Basic Sword"]
    	elseif workPlr:FindFirstChild("Basic Sword") then 
    		tool = workPlr["Basic Sword"]
    	else
    	    Notify("Autokill", "You need a sword! (recommended to become a Barbarian)", 5)
    	end
    end
	
	
	killFuncPlayer = game.Workspace:WaitForChild(playerToKill)
	playerinPlayers = game.Players:WaitForChild(playerToKill)
	
	if tool ~= nil then
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
		
		for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA("Tool") then

				currentToolSize = v.Handle.Size
				currentGripPos = v.GripPos
			
				
		
				v.Handle.Massless = true
				v.Handle.Size = Vector3.new(0.5,0.5,60)
				v.GripPos = Vector3.new(0,0,0)
				game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
			
			end
		end
		wait(0.1)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
		
		noclip = false
				
		game:GetService('RunService').Stepped:connect(function()
			if noclip then
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)
		
		
		noclip = true
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
	
		game.Workspace.Camera.CameraSubject = playerinPlayers.Character.Humanoid
		
		while wasPlayerKilled == false do
			wait()
			
			if game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
			end
			
			poopyPlayerFrame = Vector3.new(0,killHeight,1.5)
			targetPlayerLocation = Vector3.new(killFuncPlayer.Torso.Position.x, killFuncPlayer.Torso.Position.y, killFuncPlayer.Torso.Position.z)
			newtargetPlayerLocation = targetPlayerLocation + poopyPlayerFrame

			rotateAngle = Vector3.new(0,999999,0)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(newtargetPlayerLocation, rotateAngle)
			
			tool.Equipped:Connect(function()    
				tool:Activate()
			end)
			
			if killFuncPlayer.Humanoid.Health == 0 or workPlr.Humanoid.Health == 0 then -- stop when ded
				wasPlayerKilled = true
				
				noclip = false
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(-81, 29, -952) -- change this later to be dependent on team
				game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			end            
		end
	end
end

-- Notify
function Notify(titletxt, text, time)
    local GUI = Instance.new("ScreenGui")
    local Main = Instance.new("Frame", GUI)
    local title = Instance.new("TextLabel", Main)
    local message = Instance.new("TextLabel", Main)
    GUI.Name = "NotificationOof"
    GUI.Parent = game.CoreGui
    Main.Name = "MainFrame"
    Main.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(1, 5, 0, 50)
    Main.Size = UDim2.new(0, 330, 0, 110)
    Main.BackgroundTransparency = 0.1

    title.BackgroundColor3 = Color3.new(0, 0, 0)
    title.BackgroundTransparency = 0.9
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Font = Enum.Font.SourceSansSemibold
    title.Text = titletxt
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 17
    
    message.BackgroundColor3 = Color3.new(0, 0, 0)
    message.BackgroundTransparency = 1
    message.Position = UDim2.new(0, 0, 0, 30)
    message.Size = UDim2.new(1, 0, 1, -30)
    message.Font = Enum.Font.SourceSans
    message.Text = text
    message.TextColor3 = Color3.new(1, 1, 1)
    message.TextSize = 16

    wait(0.1)
    Main:TweenPosition(UDim2.new(1, -330, 0, 50), "Out", "Sine", 0.5)
    wait(time)
    Main:TweenPosition(UDim2.new(1, 5, 0, 50), "Out", "Sine", 0.5)
    wait(0.6)
    GUI:Destroy();
end

function WeaponsGUI(titletxt, text)
    
    local GUI = Instance.new("ScreenGui")

    local Main = Instance.new("Frame", GUI)
    local title = Instance.new("TextLabel", Main)
    local message = Instance.new("TextLabel", Main)
    local rounded = Instance.new("UICorner", Main)
    local titleRounded = Instance.new("UICorner", title)
    rounded.CornerRadius = UDim.new(0.05, 0)
    titleRounded.CornerRadius = UDim.new(0.05, 0)
    GUI.Name = "NotificationOof"
    GUI.Parent = game.CoreGui
    Main.Name = "MainFrame"
    Main.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(1, 5, 0, 50)
    Main.Size = UDim2.new(0, 400, 0, 200 + numLines * 6)
    Main.BackgroundTransparency = 0.2

    title.BackgroundColor3 = Color3.new(0, 0, 0)
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Font = Enum.Font.GothamSemibold
    title.Text = titletxt
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 17
    
    message.BackgroundColor3 = Color3.new(0, 0, 0)
    message.BackgroundTransparency = 1
    message.Position = UDim2.new(0, 0, 0, 30)
    message.Size = UDim2.new(1, 0, 1, -30)
    message.Font = Enum.Font.Gotham
    message.Text = text
    message.TextColor3 = Color3.new(1, 1, 1)
    message.TextSize = 12

    
    Main:TweenPosition(UDim2.new(1, -400, 0, 520), "Out", "Sine", 0)

 local UserInputService = game:GetService("UserInputService")

    local gui = game.CoreGui.NotificationOof.MainFrame

    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
    	local delta = input.Position - dragStart
    	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(function(input)
    	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
    		dragging = true
    		dragStart = input.Position
    		startPos = gui.Position
    		
    		input.Changed:Connect(function()
    			if input.UserInputState == Enum.UserInputState.End then
    				dragging = false
    			end
    		end)
    	end
    end)

    gui.InputChanged:Connect(function(input)
    	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
    		dragInput = input
    	end
    end)

    UserInputService.InputChanged:Connect(function(input)
    	if input == dragInput and dragging then
    		update(input)
    	end
    end)

  
    
end

function getWeaponString()
    
    bestStr = ""
    goodStr= ""
    basicStr= ""
    miscStr= ""
    str = "2"
    numLines = 50
    numLines = numLines + 1
    
    for i, player in pairs(game.Players:GetChildren()) do 
    					
    	bp = player.Backpack
    	workspacePlayer = game.Workspace:FindFirstChild(player.Name)
    	
    	if workspacePlayer ~= nil then
        
        	if bp:FindFirstChild("Best Sword") or workspacePlayer:FindFirstChild("Best Sword") then
        		bestStr = bestStr .. player.Name .. " (" .. tostring(player.Team) .. ") " .. "has a Best Sword!\n\n"
        		numLines = numLines + 1
        	end    
        	if bp:FindFirstChild("Rocket") or workspacePlayer:FindFirstChild("Rocket") then
        		bestStr = bestStr .. player.Name .. " (" .. tostring(player.Team) .. ") " .. "has a Rocket Launcher!\n\n"
        		numLines = numLines + 1
        	end     
        	if bp:FindFirstChild("Gun") or workspacePlayer:FindFirstChild("Gun") then
        		bestStr = bestStr .. player.Name .. " (" .. tostring(player.Team) .. ") " .. "has a Gun!\n\n"
        		numLines = numLines + 1
        	   end  
        	if bp:FindFirstChild("Good Sword") or workspacePlayer:FindFirstChild("Good Sword") then
        		goodStr = goodStr .. player.Name .. " (" .. tostring(player.Team) .. ") " .. "has a Good Sword\n\n"
        		numLines = numLines + 1
        	   end  
        	if bp:FindFirstChild("Basic Sword") or workspacePlayer:FindFirstChild("Basic Sword") then
        		basicStr = basicStr .. player.Name .. " (" .. tostring(player.Team) .. ") " .. "has a Basic Sword\n\n"
        		numLines = numLines + 1
        		end 
        	if bp:FindFirstChild("Musket") or workspacePlayer:FindFirstChild("Musket") then
        		goodStr = goodStr .. player.Name .. " (" .. tostring(player.Team) .. ") " .. "has a Musket\n\n"
        		numLines = numLines + 1
        	   end  
        	if bp:FindFirstChild("Sword") or workspacePlayer:FindFirstChild("Sword") then
        		miscStr = miscStr .. player.Name .. " (" .. tostring(player.Team) .. ") " .. "has a Barbarian Sword\n\n"
        		numLines = numLines + 1
        		end 
        	if bp:FindFirstChild("Bow") or workspacePlayer:FindFirstChild("Bow") then
        		miscStr = miscStr .. player.Name .. " (" .. tostring(player.Team) .. ") " .. "has a Bow\n\n"
        		numLines = numLines + 1
        		end 
        	if bp:FindFirstChild("Bomb") or workspacePlayer:FindFirstChild("Bomb") then
        		miscStr = miscStr .. player.Name .. " (" .. tostring(player.Team) .. ") " .. "has a Bomb\n\n"
        		numLines = numLines + 1
        	end
        end
    
    end
    finalStr = bestStr .. "\n\n" .. goodStr .. "\n\n" .. basicStr .. "\n\n" .. miscStr .. "\n\n"
    return finalStr
end

-- Setup Autofarm function 

function setUpCarAutofarm(bla)
        if bla ~= false then
            
            finishedSetUp = false
            
            
            workPlr = game.Workspace[game.Players.LocalPlayer.Name]
            plr1 = game.Players.LocalPlayer.Character
            
            if game.Players.LocalPlayer.Team == game:GetService("Teams").Spectating then
               fireproximityprompt(game:GetService("Workspace").SpawnArea.PeasantSpawnArea.PeasantTP.ProximityPrompt, 1)
            end
            
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
           
            
            plr1.Humanoid:UnequipTools()
            wait()
            
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Kart") == nil then
            	wait(0.1)
            	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(403.231384, 0.760007024, -128.842789)
            	wait(0.5)
            	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(403.231384, 0.760007024, -128.842789)
            	wait(0.5)
            	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(403.231384, 0.760007024, -128.842789)
            	Notify("Autofarm", "Setting up. Please wait...", 6.5)
            end
            
            wait(1)
            plr1 = game.Players.LocalPlayer.Character
        	plr1.HumanoidRootPart.CFrame = CFrame.new(335, 36, -133)
        	plr1.Humanoid:UnequipTools()
        	wait(1)
        	kartTool = game.Players.LocalPlayer.Backpack["Kart"]
        	game.Players.LocalPlayer.Character.Humanoid:EquipTool(kartTool)
        	  
        	kartTool:Activate()
        	
        	wait(3)
        	daSeat = game.Workspace.Karts[game.Players.LocalPlayer.Name].VehicleSeat
            plr1.HumanoidRootPart.CFrame = CFrame.new(daSeat.Position.x, daSeat.Position.y + 17, daSeat.Position.z)
            wait(1)
            
            if plr1.Humanoid:GetState() ~= Enum.HumanoidStateType.Seated then
                
                for count = 1, 4 do
                    daSeat = game.Workspace.Karts[game.Players.LocalPlayer.Name].VehicleSeat
                    plr1.HumanoidRootPart.CFrame = CFrame.new(daSeat.Position.x, daSeat.Position.y + 17, daSeat.Position.z)
                    wait(0.5)
                end
            end
            
            seat = game.Players.LocalPlayer.Character.Humanoid.SeatPart
            vehicleModel = seat.Parent
            
            vehicleModel.FR:Destroy()
            vehicleModel.BR:Destroy()
            vehicleModel.FL:Destroy()
            vehicleModel.BL:Destroy()
            
            
            repeat
                if vehicleModel.ClassName ~= "Model" then
                	vehicleModel = vehicleModel.Parent
                end
            until vehicleModel.ClassName == "Model"
            wait(0.1)
            
            wholeTrack = game.Workspace.KartTrack.Nodes
        
            for i, v in pairs(wholeTrack:GetDescendants()) do
                if v:IsA("Part") then 
                    v.Transparency = 0.5
                end
            end
            
            wait(1)
            if plr1.Humanoid:GetState() == Enum.HumanoidStateType.Seated then
                finishedSetUp = true
            end
            plr1.Humanoid:UnequipTools()
            return finishedSetUp
        else
            finishedSetUp = false
            return finishedSetUp
        end
    
end

function teleportVehicle(vehicleModel, location)
    vehicleModel:SetPrimaryPartCFrame(location)
end

-- Autofarm function 
function carAutofarm(time)
    

    
    
    local seat = game.Players.LocalPlayer.Character.Humanoid.SeatPart
    local vehicleModel = seat.Parent
    
    
    
    repeat
        if vehicleModel.ClassName ~= "Model" then
        	vehicleModel = vehicleModel.Parent
        end
    until vehicleModel.ClassName == "Model"
    
    canRunFarm()
    
    if notSeated == false and floodActive == false and isDead == false then
        wait(time)
        if game.Workspace.Karts:FindFirstChild(game.Players.LocalPlayer.Name) then
            vehicleModel:SetPrimaryPartCFrame(CFrame.new(314, 35.5, -108) * front)
        end
        wait(time)
        if game.Workspace.Karts:FindFirstChild(game.Players.LocalPlayer.Name) then
        vehicleModel:SetPrimaryPartCFrame(CFrame.new(364, 43, -58) * left)
        end
        wait(time)
        if game.Workspace.Karts:FindFirstChild(game.Players.LocalPlayer.Name) then
        vehicleModel:SetPrimaryPartCFrame(CFrame.new(412.5, 30.5, -58) * left)
        end
        wait(time)
        if game.Workspace.Karts:FindFirstChild(game.Players.LocalPlayer.Name) then
        vehicleModel:SetPrimaryPartCFrame(CFrame.new(475.5, 30.5, -64.5)* back)
        end
        wait(time)
        if game.Workspace.Karts:FindFirstChild(game.Players.LocalPlayer.Name) then
        vehicleModel:SetPrimaryPartCFrame(CFrame.new(459.5, 30.5, -94)*right)
        end
        wait(time)
        if game.Workspace.Karts:FindFirstChild(game.Players.LocalPlayer.Name) then
        vehicleModel:SetPrimaryPartCFrame(CFrame.new(439, 34.5, -136.5)*back)
        end
        wait(time)
        if game.Workspace.Karts:FindFirstChild(game.Players.LocalPlayer.Name) then
        vehicleModel:SetPrimaryPartCFrame(CFrame.new(411, 33, -161.5)*right)
        end
        wait(time)
        if game.Workspace.Karts:FindFirstChild(game.Players.LocalPlayer.Name) then
        vehicleModel:SetPrimaryPartCFrame(CFrame.new(355.5, 34.5, -182)*right)
        end
        wait(time)
        if game.Workspace.Karts:FindFirstChild(game.Players.LocalPlayer.Name) then
        vehicleModel:SetPrimaryPartCFrame(CFrame.new(313.5, 34.5, -166)*front)
        end
    elseif isDead == true then 
        finishedSetUp = false
            repeat 
                
                wait(2) 
                game.ReplicatedStorage.RemoteEvent:FireServer("Respawn")
            until game.Players.LocalPlayer.Character.Humanoid.Health > 0
    elseif floodActive == true then
        
        finishedSetUp = false
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
        plr1 = game.Players.LocalPlayer.Character
    	plr1.HumanoidRootPart.CFrame = CFrame.new(335, 39, -133)
    	plr1.Humanoid:UnequipTools()
        repeat wait() until game.Workspace.TopOfWater.Position.y < -5
    elseif notSeated == true and floodActive == false then
        
        finishedSetUp = false
        repeat 
            
            
    
            wait(1)
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(334, 39, -130)
            game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
            setUpCarAutofarm(true)
            wait(1)
        until game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated

    
    
    end
    return finishedSetUp
end

function canRunFarm()
    
    function canRunFarm()
    
    floodActive = false
    notSeated = false
    isDead = false
    kartExists = false
    
    if game.Workspace.TopOfWater.Position.y > -5 then
        floodActive = true

    end
    
    if game.Players.LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Seated then
        notSeated = true
    end
    
    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
        isDead = true
    end
    
    if game.Workspace.Karts:FindFirstChild(game.Players.LocalPlayer.Name) then
        kartExists = true
    end
    
    return floodActive, notSeated, isDead, kartExists
    
end
    
    
    
end

-- UI here we are!
local Finity = loadstring(game:HttpGet("https://raw.githubusercontent.com/Boardbot/grg/main/ui.lua"))()



-- Create Window
local FinityWindow = Finity.new(true)
FinityWindow.ChangeToggleKey(Enum.KeyCode.RightControl)

-- Create categories
local PlayerCategory = FinityWindow:Category("Player")
local FunctionsCategory = FinityWindow:Category("Functions")
local AutofarmCategory = FinityWindow:Category("Autofarm")
local TeleportsCategory = FinityWindow:Category("Teleports")
local CreditsCategory = FinityWindow:Category("Credits & Info")


-- Create sectors for categories

-- PlayerCategory Sectors
local SpeedSettings = PlayerCategory:Sector("Speed Settings")
local SpoofSettings = PlayerCategory:Sector("Spoofing")
local MiscSector = PlayerCategory:Sector("Miscellaneous")
local DiscordSector = PlayerCategory:Sector("")

-- FunctionsCategory Sectors
local SelectPlayer = FunctionsCategory:Sector("Autokill")
local ScanWeapons = FunctionsCategory:Sector("Scan for Player Weapons")
local ServerHop = FunctionsCategory:Sector("Serverhop")
local miscPlayer = FunctionsCategory:Sector("Miscellaneous")


-- TeleportsCategory Sectors
local TPSector = TeleportsCategory:Sector("Teleports")
local ShopSector2 = TeleportsCategory:Sector("")
local ShopSector1 = TeleportsCategory:Sector("Shops")

--AutofarmCategory Sectors
local Autofarm1 = AutofarmCategory:Sector("Autofarm 1")
local Autofarm2 = AutofarmCategory:Sector("")

-- CreditsCategory Sectors
local DiscordCredits = CreditsCategory:Sector("Discord")
local CreditsCredits = CreditsCategory:Sector("Credits")
-- Speed
SpeedSettings:Cheat("Slider", "Sprint Speed (Q)", function(sliderSprint)
	
	sprintSpeed = sliderSprint
end, {min = 24, max = 100, suffix = ""})

SpeedSettings:Cheat("Slider", "Walkspeed", function(sliderWalk)
   
	walkSpeed = sliderWalk
end, {min = 16, max = 100, suffix = ""})

UserInputService.InputBegan:Connect(function(inputObject, gameProcessedEvent) 
				
    
	local isQHeld = UserInputService:IsKeyDown(Enum.KeyCode.Q)
	local isWHeld = UserInputService:IsKeyDown(Enum.KeyCode.W)
	local isAHeld = UserInputService:IsKeyDown(Enum.KeyCode.A)
	local isSHeld = UserInputService:IsKeyDown(Enum.KeyCode.S)
	local isDHeld = UserInputService:IsKeyDown(Enum.KeyCode.D)
	
	
	if gameProcessedEvent == true then
		
		if isQHeld == true then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = sprintSpeed
		end
		wait(0.5) -- WHY IS WAIT HERE??
	end
	
	if isQHeld == false and gameProcessedEvent == false then 
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeed
		wait(0.5)
		
	end
end)

-- Spoofing
SpoofSettings:Cheat("Textbox", "Player to Spoof", function(playerToSpoofTextbox)
	playerToSpoof = GetPlayer(playerToSpoofTextbox).Name
	
end, {
	placeholder = "Enter Player Name"
})

SpoofSettings:Cheat("Textbox", "Spoof Name", function(desiredName)
	game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Title.Text = desiredName
	game.Players.LocalPlayer.PlayerGui.SpectateGui.Bar.Title.Text = desiredName
end, {
	placeholder = "Enter Desired Name"
})

SpoofSettings:Cheat("Dropdown", "Spoof Status", function(statusOption)
	
	if statusOption == "VIP" then
	    game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Status.Text = "VIP"
        game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Status.TextColor3 = Color3.new(239/256, 184/256, 56/256)
	elseif statusOption == "None" then 
	    game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Status.Text = ""
    elseif statusOption == "Fan" then
        game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Status.Text = "fan"
        game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Status.TextColor3 = Color3.new(99/256, 95/256, 98/256)
    end
	
end, {
	options = {
	    "None",
		"VIP",
		"Fan",
	}
})

SpoofSettings:Cheat("Dropdown", "Spoof Team", function(spoofedTeam)
	
	game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Team.Text = spoofedTeam
		
		if spoofedTeam == "Council Member" then
			game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Team.TextColor3 = Color3.new(107/256, 50/256, 124/256)
			game.Workspace[playerToSpoof].Torso.Color = Color3.new(107/256, 50/256, 124/256)
		elseif spoofedTeam == "Leader" then
			game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Team.TextColor3 = Color3.new(255/256, 0/256, 0/256)
			game.Workspace[playerToSpoof].Torso.Color =Color3.new(255/256, 0/256, 0/256)
		elseif spoofedTeam == "Landlord" then
			game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Team.TextColor3 = Color3.new(218/256, 133/256, 65/256)
			game.Workspace[playerToSpoof].Torso.Color =Color3.new(218/256, 133/256, 65/256)
		elseif spoofedTeam == "Guard" then
			game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Team.TextColor3 = Color3.new(39/256, 70/256, 45/256)
			game.Workspace[playerToSpoof].Torso.Color =Color3.new(39/256, 70/256, 45/256)
		elseif spoofedTeam == "Doctor" then
			game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Team.TextColor3 = Color3.new(248/256, 248/256, 248/256)
			game.Workspace[playerToSpoof].Torso.Color =Color3.new(248/256, 248/256, 248/256)
		elseif spoofedTeam == "Jester" then
			game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Team.TextColor3 = Color3.new(245/256, 205/256, 48/256)
			game.Workspace[playerToSpoof].Torso.Color =Color3.new(245/256, 205/256, 48/256)
		elseif spoofedTeam == "Civilian" then
			game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Team.TextColor3 = Color3.new(33/256, 84/256, 185/256)
			game.Workspace[playerToSpoof].Torso.Color =Color3.new(33/256, 84/256, 185/256)
			
		elseif spoofedTeam == "Peasant" then
				game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Team.TextColor3 = Color3.new(106/256, 57/256, 9/256)
				game.Workspace[playerToSpoof].Torso.Color =Color3.new(106/256, 57/256, 9/256)
		elseif spoofedTeam == "Barbarian" then
			game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Team.TextColor3 = Color3.new(86/256, 36/256, 36/256/256)
			game.Workspace[playerToSpoof].Torso.Color =Color3.new(86/256, 36/256, 36/256/256)
		elseif spoofedTeam == "Criminal" then
			game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Team.TextColor3 = Color3.new(27/256, 42/256, 53/256)
			game.Workspace[playerToSpoof].Torso.Color =Color3.new(27/256, 42/256, 53/256)
		elseif spoofedTeam == "Spectating" then
			game.Workspace[playerToSpoof].HumanoidRootPart.HeadGui.Team.TextColor3 = Color3.new(27/255, 42/255, 53/255)
			game.Workspace[playerToSpoof].Torso.Color =Color3.new(27/255, 42/255, 53/255)
		end
	
end, {
	options = {
	    "Leader",
		"Council Member",
		"Landlord",
		"Guard",
		"Doctor",
		"Jester",
		"Civilian",
		"Peasant",
		"Criminal",
		"Spectating",
	}
})

-- Misc Settings


MiscSector:Cheat(
	"Checkbox", -- Type
	"Kick on Mod Join", -- Name
	function(antiModToggle) -- Callback function
		if antiModToggle == true then
    		game.Players.PlayerAdded:Connect(function(player)
    		  if player:GetRoleInGroup(5574524) == "trial mod." or player:GetRoleInGroup(5574524) == "mod." or player:GetRoleInGroup(5574524) == "admin." or player:GetRoleInGroup(5574524) == "hunger boi." then 
    			game.Players.LocalPlayer:Kick("(Anti-mod) A moderator joined.")
    		  end
    		end)
    
    		for i,v in pairs(game.Players:GetPlayers()) do
    			if v:GetRoleInGroup(5574524) == "trial mod." or v:GetRoleInGroup(5574524) == "mod." or v:GetRoleInGroup(5574524) == "admin." or v:GetRoleInGroup(5574524) == "hunger boi." then 
    				game.Players.LocalPlayer:Kick("(Anti-mod) A moderator is here.")
    			end
    		 end
    	end
	end
)

MiscSector:Cheat(
	"Checkbox", -- Type
	"Spam Sounds (may break game)", -- Name
	function(State) -- Callback function
	    shouldSpamSounds = State
    	while shouldSpamSounds == true do
    		for i,v in pairs(game.Workspace:GetDescendants()) do
    			if v:IsA("Sound") then
    				v:Play()
    			end
    		end
    		
    		wait(0.75)
    		State = false
    	end
	    shouldSpamSounds = State		
	end
)

MiscSector:Cheat("Label", "")

MiscSector:Cheat("Button", "", function()
	game.Workspace.Gate.Door:Destroy()
	game.Workspace.Gate.Exit:Destroy()
end, "Remove Gate")

MiscSector:Cheat("Button", "", function()
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
	wait(0.01)
	
	game.ReplicatedStorage.RemoteEvent:FireServer("Respawn")
	wait(0.49)    
	game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	
	noclip = false
	game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end, "Instant Respawn")

MiscSector:Cheat("Button", "", function()
	game.Players.LocalPlayer.Character.Head.face:Destroy()
	
	local Player = game.Players.LocalPlayer

	for i,v in pairs(Player.Character:GetDescendants())do
			if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
				v:Destroy()
			end
	end
	
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
	if v:IsA("Hat") or v:IsA("Accessory") then
		v.Handle:Destroy()
	end
    end
end, "Hide Identity")

-- Discord
DiscordSector:Cheat("Label", "\n\nHave problems? Want updates? Join the Discord!\n\ndiscord.gg/BgaWVXUduZ")
DiscordSector:Cheat("Button", "Discord", function()
    setclipboard("discord.gg/BgaWVXUduZ")
end, "Copy Discord Invite")

DiscordSector:Cheat("Label", "")
DiscordSector:Cheat("Label", "Hide menu: Right CTRL")
-- FunctionsCategory Category

-- Select Player Textbox
SelectPlayer:Cheat("Textbox", "Player to Kill", function(killPlrText)
	playerToKill = GetPlayer(killPlrText).Name
	
end, {
	placeholder = "Enter Player Name"
})

-- Kill Height Slider 
SelectPlayer:Cheat("Slider", "Kill Height", function(h)
	killHeight = h
end, {min = -12, max = 0, suffix = " studs"})

SelectPlayer:Cheat("Dropdown", "Select Sword", function(Option)
    
    
	if Option == "Autoselect Sword" then
	    swordToUse = "Autoselect"
	elseif Option == "Barbarian Sword" then
	    if game.Players.LocalPlayer.Backpack:FindFirstChild("Sword") then
    		swordToUse = game.Players.LocalPlayer.Backpack["Sword"]
    	elseif workPlr:FindFirstChild("Sword") then 
    		swordToUse = workPlr["Sword"]
    	else Notify("Autokill", "You do not have this sword!", 5)
    	end 
	elseif Option == "Guard Sword" then
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Guard Sword") then
    		swordToUse = game.Players.LocalPlayer.Backpack["Guard Sword"]
    	elseif workPlr:FindFirstChild("Guard Sword") then 
    		swordToUse = workPlr["Guard Sword"]
    	else Notify("Autokill", "You do not have this sword!", 5)
    	end
	elseif Option == "Best Sword" then
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Best Sword") then
    		swordToUse = game.Players.LocalPlayer.Backpack["Best Sword"]
    	elseif workPlr:FindFirstChild("Best Sword") then 
    		swordToUse = workPlr["Best Sword"]
    	else Notify("Autokill", "You do not have this sword!", 5)
    	end
	elseif Option == "Good Sword" then
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Good Sword") then
    		swordToUse = game.Players.LocalPlayer.Backpack["Good Sword"]
    	elseif workPlr:FindFirstChild("Good Sword") then 
    		swordToUse = workPlr["Good Sword"]
    	else Notify("Autokill", "You do not have this sword!", 5)
    	end
	elseif Option == "Basic Sword" then
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Basic Sword") then
    		swordToUse = game.Players.LocalPlayer.Backpack["Basic Sword"]
    	elseif workPlr:FindFirstChild("Basic Sword") then 
    		swordToUse = workPlr["Basic Sword"]
    	else Notify("Autokill", "You do not have this sword!", 5)
    	end
    end
	    
end, {
	options = {
		"Autoselect Sword",
    	"Barbarian Sword",
    	"Guard Sword",
    	"Best Sword",
    	"Good Sword",
    	"Basic Sword"
	}
})

SelectPlayer:Cheat("Button", "", function()
	killPlayer(playerToKill, swordToUse)
end, "Autokill Selected Player")

-- Scan for player Weapons

bruhMomento = nil

ScanWeapons:Cheat(
	"Checkbox", -- Type
	"Scan Enabled", -- Name
	function(scanEnabled) -- Callback function
	    bruhMomento = scanEnabled
	   if scanEnabled == true then
    	   getWeaponString()
    	   WeaponsGUI("Player Weapon Scan", finalStr)
	   elseif scanEnabled == false then
	       game.CoreGui.NotificationOof:Destroy()
	   end
end)

ScanWeapons:Cheat("Button", "", function()
    if bruhMomento == true then
        game.CoreGui.NotificationOof:Destroy()
    	getWeaponString()
        WeaponsGUI("Player Weapon Scan", finalStr)
    end
end, "Refresh Scan")

miscPlayer:Cheat("Textbox", "Select Player", function(selectedPlayerTextbox)
    
    selectedPlayer1 = GetPlayer(selectedPlayerTextbox)    
    end, {
	placeholder = "Enter Player Name"
})


--awesex
miscPlayer:Cheat("Button", "", function()
    
    isViewing = not isViewing
    if isViewing == true then
        game.Workspace.Camera.CameraSubject = selectedPlayer1.Character.Humanoid
    else
        game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
   end
    
end, "View / Unview")


miscPlayer:Cheat("Button", "", function()
    
    plr1 = game.Players.LocalPlayer.Character
    plr1.HumanoidRootPart.CFrame = CFrame.new(selectedPlayer1.Character.HumanoidRootPart.Position)
	
    
end, "Teleport to Player")

TPSector:Cheat("Dropdown", "Town Locations", function(Option)
	if Option == "Beach" then
	    plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(-182, -5, 455)
	elseif Option == "Council Area" then
	    plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(344, 51, 430)
	elseif Option == "Gate Scaffold" then
       	plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(17, 43, 261)
	elseif Option == "Leader Tower" then
       plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(40, 42, 301)
	elseif Option == "Jail Gate" then
       plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(190, 11, 300)
	elseif Option == "Rice Field" then
       plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(15, 3, 160)
	elseif Option == "Town Plaza" then
          plr1 = game.Players.LocalPlayer.Character
			plr1.HumanoidRootPart.CFrame = CFrame.new(38, 23, 321)
    end
end, {
	options = {
		"Beach",
		"Council Area",
		"Gate Scaffold",
		"Leader Tower",
		"Jail Gate",
		"Rice Field",
		"Town Plaza"
	}
})

TPSector:Cheat("Dropdown", "Barbarian Locations", function(Option)
    if Option == "Barb Admissions" then
        plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(25, 3, -903)
    elseif Option == "Barb Base" then
        plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(-81, 29, -952)
    elseif Option == "Secret Barb Path" then
        plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(539, -5, 246)
    
    end
end, {
options = {
	"Barb Admissions",
	"Barb Base",
	"Secret Barb Path"
}
})

TPSector:Cheat("Dropdown", "Misc Locations", function(Option)
if Option == "Server Portals" then
plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(-354, 11, -201)
elseif Option == "Northern Wall" then
    plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(64, 109, 1008)
elseif Option == "Karl's Karts" then
    plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(346, 29, -143)
elseif Option == "Farm Karts" then
    plr1 = game.Players.LocalPlayer.Character
				plr1.HumanoidRootPart.CFrame = CFrame.new(294, 3, 129)
			end
end, {
options = {
	"Server Portals",
	"Northern Wall",
	"Karl's Karts",
	"Farm Karts"
}
})

-- Shops
ShopSector1:Cheat("Dropdown", "Axes", function(Option)
	if Option == "Basic Axe" then
	    if game:GetService("Workspace").Stores.Axe.CustomerSeats["1"] then
					buyFromShop("AxeStore", "BasicAxe")
					
				end
	elseif Option == "Good Axe" then
	    if game:GetService("Workspace").Stores.Axe.CustomerSeats["2"] then
					buyFromShop("AxeStore", "GoodAxe")
				end
	elseif Option == "Best Axe" then
	    if game:GetService("Workspace").Stores.Axe.CustomerSeats["3"] then
					buyFromShop("AxeStore", "BestAxe")
				end
	end
end, {
	options = {
		"Basic Axe",
		"Good Axe",
		"Best Axe"
	}
})

ShopSector1:Cheat("Dropdown", "Sickles", function(Option)
	if Option == "Basic Sickle" then
	    if game:GetService("Workspace").Stores.Sickle.CustomerSeats["1"] then
					buyFromShop("SickleStore", "BasicSickle")
				end
	elseif Option == "Good Sickle" then
	    if game:GetService("Workspace").Stores.Sickle.CustomerSeats["2"] then
					buyFromShop("SickleStore", "GoodSickle")
				end
	elseif Option == "Best Sickle" then
	if game:GetService("Workspace").Stores.Sickle.CustomerSeats["3"] then
					buyFromShop("SickleStore", "BestSickle")
				end
	end
end, {
	options = {
		"Basic Sickle",
		"Good Sickle",
		"Best Sickle"
	}
})


ShopSector1:Cheat("Dropdown", "Hammers", function(Option)
	if Option == "Basic Hammer" then
	    if game:GetService("Workspace").Stores.Hammer.CustomerSeats["1"] then
					buyFromShop("HammerStore", "BasicHammer")
				end
	elseif Option == "Good Hammer" then
	    if game:GetService("Workspace").Stores.Hammer.CustomerSeats["2"] then
					buyFromShop("HammerStore", "GoodHammer")
				end
	elseif Option == "Best Hammer" then
	if game:GetService("Workspace").Stores.Hammer.CustomerSeats["3"] then
					buyFromShop("HammerStore", "BestHammer")
				end
	end
end, {
	options = {
		"Basic Hammer",
		"Good Hammer",
		"Best Hammer"
	}
})

ShopSector2:Cheat("Dropdown", "Swords", function(Option)
	if Option == "Basic Sword" then
	    if game:GetService("Workspace").Stores.Sword.CustomerSeats["1"] then
					buyFromShop("SwordStore", "BasicSword")
				end
	elseif Option == "Good Sword" then
	    if game:GetService("Workspace").Stores.Sword.CustomerSeats["2"] then
					buyFromShop("SwordStore", "GoodSword")
				end
	elseif Option == "Best Sword" then
	if game:GetService("Workspace").Stores.Sword.CustomerSeats["3"] then
					buyFromShop("SwordStore", "BestSword")
				end
	end
end, {
	options = {
		"Basic Sword",
		"Good Sword",
		"Best Sword"
	}
})

ShopSector2:Cheat("Dropdown", "Ranged Weapons", function(Option)
	if Option == "Musket" then
	    if game:GetService("Workspace").Stores.Weapons.CustomerSeats["1"] then
					buyFromShop("WeaponStore","Musket")
				end
	elseif Option == "Gun" then
	    if game:GetService("Workspace").Stores.Weapons.CustomerSeats["2"] then
					buyFromShop("WeaponStore","Gun")
				end
	elseif Option == "Rocket Launcher" then
	if game:GetService("Workspace").Stores.Weapons.CustomerSeats["3"] then
					buyFromShop("WeaponStore","Rocket")
				end
	end
end, {
	options = {
		"Musket",
		"Gun",
		"Rocket Launcher"
	}
})

ShopSector2:Cheat("Dropdown", "Food", function(Option)
	if Option == "Basic Food" then
	    if game:GetService("Workspace").Stores.Food.CustomerSeats["1"] then
					buyFromShop("FoodStore", "BasicFood")
				end
	elseif Option == "Good Food" then
	    if game:GetService("Workspace").Stores.Food.CustomerSeats["2"] then
					buyFromShop("FoodStore", "GoodFood")
				end
	elseif Option == "Best Food" then
	if game:GetService("Workspace").Stores.Food.CustomerSeats["3"] then
					buyFromShop("FoodStore", "BestFood")
				end
	end
end, {
	options = {
		"Basic Food",
		"Good Food",
		"Best Food"
	}
})

ShopSector2:Cheat("Dropdown", "Fishing Nets", function(Option)
	if Option == "Basic Net" then
	    if game:GetService("Workspace").Stores.FishingNet.CustomerSeats["1"] then
					buyFromShop("FishingNet", "BasicNet")
				end
	elseif Option == "Good Net" then
	    if game:GetService("Workspace").Stores.FishingNet.CustomerSeats["2"] then
					buyFromShop("FishingNet", "GoodNet")
				end
	elseif Option == "Best Net" then
	if game:GetService("Workspace").Stores.FishingNet.CustomerSeats["3"] then
					buyFromShop("FishingNet", "BestNet")
				end
	end
end, {
	options = {
		"Basic Net",
		"Good Net",
		"Best Net"
	}
})


ShopSector2:Cheat("Dropdown", "Doctor's Office", function(Option)
	if Option == "Heal" then
	    if game:GetService("Workspace").Stores.Doctor.CustomerSeats["1"] then
					buyFromShop("DoctorsOffice", "Heal")
				end
	elseif Option == "Limbs" then
	    if game:GetService("Workspace").Stores.Doctor.CustomerSeats["2"] then
					buyFromShop("DoctorsOffice", "Limbs")
				end
	elseif Option == "Wheelchair" then
	if game:GetService("Workspace").Stores.Doctor.CustomerSeats["3"] then
					buyFromShop("DoctorsOffice", "Wheelchair")
				end
	end
end, {
	options = {
		"Heal",
		"Limbs",
		"Wheelchair"
	}
})

ShopSector2:Cheat("Dropdown", "Kart Shops", function(Option)
	if Option == "Kart" then
	    if game:GetService("Workspace").BarbarianVillage.Stores.Kart.CustomerSeat then
					buyFromShop("Kart", "RegularKart")
				end
	elseif Option == "Doublekart" then
	    if game:GetService("Workspace").BarbarianVillage.Stores.Kart.CustomerSeat then
					buyFromShop("Kart", "DoubleKart")
				end
	elseif Option == "Farmkart" then
	    if game:GetService("Workspace").BarbarianVillage.Stores.Kart.CustomerSeat then
					buyFromShop("Kart", "FarmKart")
				end
	elseif Option == "Racekart" then
	    if game:GetService("Workspace").BarbarianVillage.Stores.Kart.CustomerSeat then
					buyFromShop("Kart", "RaceKart")
				end
	elseif Option == "Buskart" then
	if game:GetService("Workspace").BarbarianVillage.Stores.Kart.CustomerSeat then
					buyFromShop("Kart", "BusKart")
				end
	end
end, {
	options = {
		"Kart",
		"Doublekart",
		"Farmkart",
		"Racekart",
		"Buskart"
	}
})
ShopSector1:Cheat("Label", "\n\nLeader must have bought tool stores for them to work.")

-- Serverhopping

settin = nil

ServerHop:Cheat("Dropdown", "Serverhop Setting", function(Option)
    settin = Option
end, {
    options = {
        "Random Server",
        "Most Players",
        "Least Players",
        "Highest Leader Time"
        
    }
})

ServerHop:Cheat("Button", "", function()
    if settin == "Random Server" then
        ServerHopz("any")
        Notify("Serverhop", "Serverhopping to random server. Please wait...", 10)
    elseif settin == "Most Players" then
        ServerHopz("largest")
        Notify("Serverhop", "Serverhopping to largest server. Please wait...", 10)
    elseif settin == "Least Players" then
        ServerHopz("smallest")
        Notify("Serverhop", "Serverhopping to smallest server. Please wait...", 10)
    elseif settin  == "Highest Leader Time" then
        
        portal1 = tonumber(game.Workspace.ServerPortals["1"].BillboardGui.Frame.Days.Amount.Text)
        portal2 = tonumber(game.Workspace.ServerPortals["2"].BillboardGui.Frame.Days.Amount.Text)
        portal3 = tonumber(game.Workspace.ServerPortals["3"].BillboardGui.Frame.Days.Amount.Text)
        
        local values = {portal1, portal2, portal3}
        local highest = nil

        for _, value in pairs(values) do
        	if not highest then
        		highest = value
        		continue
        	end
        	
        	if value > highest then
        		highest = value
        	end
        end

        if highest == portal1 then
            plr1 = game.Players.LocalPlayer.Character
			plr1.HumanoidRootPart.CFrame = CFrame.new(-375.000122, 13.0600309, -255.998352)
			wait(6)
			Notify("Serverhop", "Serverhop failed. Please try a different setting or walk through a portal manually.", 10)
        elseif highest == portal2 then
            plr1 = game.Players.LocalPlayer.Character
			plr1.HumanoidRootPart.CFrame = CFrame.new(-370.000092, 13.06003, -232.338058)
			wait(6)
			Notify("Serverhop", "Serverhop failed. Please try a different setting or walk through a portal manually.", 10)
        elseif highest == portal3 then
            plr1 = game.Players.LocalPlayer.Character
			plr1.HumanoidRootPart.CFrame = CFrame.new(-370.000092, 13.06003, -279.65863)
			wait(6)
			Notify("Serverhop", "Serverhop failed. Please try a different setting or walk through a portal manually.", 10)
        end
    elseif settin == nil then
        ServerHopz("any")
        Notify("Serverhop", "Serverhopping to random server. Please wait...", 10)
    end
end, "Serverhop")

ServerHop:Cheat("Button", "", function()
    rejoining = true
    game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players"))
	wait(3)
	rejoining = false
    
end, "Rejoin Server")
--AutofarmCategory stuff

Autofarm1:Cheat(
	"Checkbox", -- Type
	"Autofarm Enabled", -- Name
	
	function(autofarmEnabled) -- Callback function EZWAYTO
	   
	    bla = autofarmEnabled
	    
	    
	    autofarmEnabled = autofarmEnabled
	    if autofarmEnabled == true then
	       
    		if game.Players.LocalPlayer.leaderstats.Money.Value < 100 then
    		    
    		    Notify("Autofarm", "You need at least $100 starting cash for this!", 5)
    		else
                setUpCarAutofarm(bla)
        	
        		
        		if finishedSetUp == true then
                   
                    repeat
                        canRunFarm()
                        if notSeated == false and floodActive == false and isDead == false and kartExists == true then
                            carAutofarm(farmTime)
                        elseif isDead == true then 
                            finishedSetUp = false
                                repeat 
                                  
                                    wait(2) 
                                    game.ReplicatedStorage.RemoteEvent:FireServer("Respawn")
                                until game.Players.LocalPlayer.Character.Humanoid.Health > 0
                        
                        elseif floodActive == true then
                            
                            finishedSetUp = false
                            game.Players.LocalPlayer.Character.Humanoid.Sit = false
                            plr1 = game.Players.LocalPlayer.Character
                        	plr1.HumanoidRootPart.CFrame = CFrame.new(335, 39, -133)
                        	plr1.Humanoid:UnequipTools()
                            repeat wait() until game.Workspace.TopOfWater.Position.y < -5
                            
                        elseif notSeated == true and floodActive == false then
                          
                            finishedSetUp = false
                            repeat 
                               
                                
                                wait(1)
                                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(334, 39, -130)
                                game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                                setUpCarAutofarm(true)
                                wait(1)
                            until game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated
                        
                        elseif kartExists == false then
                            finishedSetUp = false
                        
                        end
                        
                        
                        
                        
                        
                        if finishedSetUp == false then
                            setUpCarAutofarm(bla)
                            wait(1)
                        end
                    until autofarmEnabled == false or bla == false
                    
                else
                   
                    Notify("Autofarm", "Autofarm setup failed, please try again.", 5)
                
        		end
        	
    		end
       
	    elseif autofarmEnabled == false and finishedSetUp == true then 
           
            finishedSetUp = false
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        	wait(0.01)
        	
        	game.ReplicatedStorage.RemoteEvent:FireServer("Respawn")
        	wait(0.49)    
        	game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        	
        	noclip = false
        	game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    
end
		
		
	
)

Autofarm1:Cheat("Slider", "Autofarm Speed", function(laTime)
	farmTime = 1 / laTime
end, {min = 1, max = 11, suffix = ""})

Autofarm2:Cheat("Label", "")
Autofarm2:Cheat("Label", "Recommended Autofarm Speed: 8.5-9\nThe autofarm is ping-dependent, so speeds above 9\nmay not register for some users.\n\nPlay around with the speed\nto see what works best.")

Autofarm2:Cheat("Label", "")
Autofarm2:Cheat("Label", "\n\n\nHighly recommended to use on VIP servers.\nVIP servers are FREE.")
Autofarm2:Cheat("Label", "")
Autofarm2:Cheat("Label", "\n\n\n\nJoin the Discord!")

Autofarm2:Cheat("Button", "", function()
    setclipboard("discord.gg/BgaWVXUduZ")
end, "Copy Discord Invite")

-- Credits category
DiscordCredits:Cheat("Label", "Bugs? Issues? Want to see the changelog?\nWant to contact me? Join the Discord!")
DiscordCredits:Cheat("Label", "")
DiscordCredits:Cheat("Button", "", function()
    setclipboard("discord.gg/BgaWVXUduZ")
end, "Copy Discord Invite")

CreditsCredits:Cheat("Label", "Everything in this menu is\ncreated by Boardbot")
CreditsCredits:Cheat("Label", "")
CreditsCredits:Cheat("Label", "Contact me on Discord: Boardbot#7385")






game.Workspace.CouncilHouse.COUNCILONLY:Destroy()
game.Workspace.LeaderTower.LEADERONLY:Destroy()


