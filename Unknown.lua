loadstring(game:HttpGet("https://raw.githubusercontent.com/puuror/Puurs/main/puurs.lua"))()

local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = Library:MakeWindow({Name = "Puurs", HidePremium = true, SaveConfig = true, ConfigFolder = "Puurs"})
local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
})
local Settings = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998",
})
local CombatS = Main:AddSection({
	Name = "Combat"
})
local PotionsS = Main:AddSection({
	Name = "Potions"
})
local LocalS = Main:AddSection({
	Name = "Local"
})
local AutoFarmsS = Main:AddSection({
	Name = "AutoFarms"
})
local PlayersS = Settings:AddSection({
	Name = "Settings"
})
local CodesS = Settings:AddSection({
	Name = "Codes/Feedbacks"
})
local AutoBuildsS = Main:AddSection({
	Name = "AutoBuilds"
})
Library:MakeNotification({
	Name = "Puurs",
	Content = "Thanks For Using Puurs",
	Time = 5
})
CombatS:AddToggle({
	Name = "Kill Aura",
	Default = false,
	Callback = function(arg)
	if arg then
    	_G.kill = true
	while _G.kill == true do
		task.wait(0)
    		for int, value in pairs(game:GetService("Players"):GetPlayers()) do
        		if value and value.Character and value ~= game:GetService("Players").LocalPlayer and value.Character:FindFirstChild("Left Arm") then
							value.Character["Left Arm"]:BreakJoints()
                       		value.Character["Left Arm"].CanCollide = false
                       		value.Character["Left Arm"].CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -1.5)
                       		value.Character["Left Arm"].Transparency = 1
                       		pcall(function()
                       		value.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -1.5)
                   		end)
                	end
            	end
        	end
    	end
    	if not arg then
        _G.kill = false
    end
end
})
CombatS:AddButton({
	Name = "Shield GodMode",
	Callback = function()
      	   local plr = game.Players.LocalPlayer
   if plr.Backpack:FindFirstChild("Shield") then
   plr.Backpack:WaitForChild("Shield").Parent = plr.Character
   plr.Character.Shield:Activate()
   plr.Character.Shield:Destroy()
   plr.Character.Shield.ShieldPotion:Destroy()
end
  	end    
})
AutoBuildsS:AddDropdown({
	Name = "AutoBuilds",
	Options = {"Mid Castle"},
	Callback = function(value)
		if value == "Mid Castle" then
			loadstring(game:HttpGet("https://pastebin.com/raw/ibxqcs8s"))()
        end
	end 
})
PotionsS:AddDropdown({
	Name = "Potions",
	Options = {"SpeedPotion", "JumpPotion"},
	Callback = function(value)
		if value == "SpeedPotion" then
            local plr = game:GetService("Players").LocalPlayer
            local rep = game:GetService("ReplicatedStorage")
            local toolfolder = rep.Tools
            local powerfolder = toolfolder.PowerUps
            local potion = powerfolder.Speed:Clone()
 
            potion.Parent = plr.Backpack
 
            plr.Backpack.Speed.Activated:Connect(function()
                plr.Character.Humanoid.WalkSpeed = 25
                wait(0.1)
                plr.Character.Speed:Destroy()
            end)
        end
        if value == "JumpPotion" then
            local plr = game:GetService("Players").LocalPlayer
            local rep = game:GetService("ReplicatedStorage")
            local toolfolder = rep.Tools
            local powerfolder = toolfolder.PowerUps
            local potion = powerfolder.HighJump:Clone()
 
            potion.Parent = plr.Backpack
 
            plr.Backpack.HighJump.Activated:Connect(function()
                plr.Character.Humanoid.JumpPower = 65
                wait(0.1)
                plr.Character.HighJump:Destroy()
            end)
        end
	end    
})

CodesS:AddTextbox({
	Name = "Codes",
	TextDisappear = true,
	Callback = function(value)
		game:GetService("ReplicatedStorage").Events.PromoRewards:FireServer(value)
	end	  
})
AutoFarmsS:AddButton({
	Name = "AutoFarm Coins",
	Default= false,
	Callback = function()
		local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.Character:Wait()
local pos = char.HumanoidRootPart.CFrame

local descendants = workspace:GetDescendants()

function auto()
	for int = 1, #descendants do
		if descendants[int].Name == "Block" and descendants[int].Parent.Name == "Ores" then
			repeat
				wait()
				char.HumanoidRootPart.CFrame = descendants[int].CFrame
				local nuke = Instance.new("Part", workspace)
				nuke.Transparency = 1
				nuke.CanCollide = false
				nuke.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,9,0)
				nuke.Size = Vector3.new(15,30,15)

				local farm = nuke.Touched:Connect(function(target)
					if target.Parent.Name == "Ores" then
						if target.Name == "Block" then
							game:GetService("Players").LocalPlayer.Backpack.Axe.RemoteEvent:FireServer(target)
						end
					end
				end)
			wait()
        	farm:Disconnect()
        	nuke:Destroy()
        	wait()
			until descendants[int].Name ~= "Block" or not game.Players.LocalPlayer.Backpack:FindFirstChild("Axe")
		end
	end
	char.HumanoidRootPart.CFrame = pos
	char.HumanoidRootPart.CFrame = CFrame.new(0.192286551, 189.000229, -0.367993951, 0.997344673, -1.06113726e-13, 0.0728256479, 1.14777247e-13, 1, -1.14777586e-13, -0.0728256479, 1.22831541e-13, 0.997344673)
end

if char:FindFirstChild("Role") then
	auto()
end
	end	  
})
LocalS:AddToggle({
	Name = "Infinite Jump",
	Default = false,
	Callback = function(state)
		if state == true then
getgenv().Jump = true
local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()
mouse.KeyDown:Connect(function(state)
        if getgenv().Jump then
        if state:byte() == 32 then
        local humanoid =          plr.Character:FindFirstChildOfClass("Humanoid")
        humanoid:ChangeState("Jumping")
    end
    end
end)
end
if state == false then
  getgenv().Jump = false
end
	end    
})
LocalS:AddToggle({
	Name = "Collect Coins",
	Default = false,
	Callback = function(value)
		if value == true then
			_G.Coins = true
			while _G.Coins == true do
				task.wait(0)
				for int, value in pairs(workspace.GameStorage.Coins:GetChildren()) do
					value.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				end	
			end
		end
		if value == false then
			_G.Coins = false
		end
	end
})
LocalS:AddToggle({
	Name = "Scaffolding",
	Default = false,
	Callback = function(value)
if value then
	_G.scaff = true
	while _G.scaff do
		task.wait(0.2)
		if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude  > 0 then
			local part = Instance.new("Part", game.Players.LocalPlayer.Character)
			part.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -2, 0)
			part.Anchored = true
		end
	end
end		
		if not value then
			_G.scaff = false
		end
	end
})
LocalS:AddButton({
	Name = "Player Esp",
	Default = false,
	Callback = function()
	game:GetService("RunService").RenderStepped:Connect(function()
		for int, value in pairs(game:GetService("Players"):GetPlayers()) do
			if value.Character:FindFirstChild("Puurs") == nil then
				local e = Instance.new("Highlight", value.Character)
				e.FillTransparency = 1 e.OutlineTransparency = 0
				e.Name = "Puurs" e.OutlineColor = Color3.new("218, 133, 65")
			end
		end
	end)
end
})
PlayersS:AddToggle({
	Name = "Spectate",
	Default = false,
	Callback = function(value)
	if value then
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Spectate.Visible = true
		end
		if not value then
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Spectate.Visible = false
		end
	end    
})
PlayersS:AddSlider({
	Name = "WalkSpeed",
	Min = 16,
	Max = 25,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "WalkSpeed",
	Callback = function(value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
	end    
})
PlayersS:AddSlider({
	Name = "JumpPower",
	Min = 50,
	Max = 65,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "JumpPower",
	Callback = function(value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = value
	end    
})

game:GetService("RunService").RenderStepped:Connect(function()
    for k,v in pairs(game.Players.LocalPlayer.PlayerGui.Extra:GetDescendants()) do
        if v.ClassName == "LocalScript" and v ~= script then
                v.Disabled = true
            end
        end
    end)
    game:GetService("Workspace").Lobby:FindFirstChild("KillPlates"):Destroy()
    game:GetService("Workspace").Borders:FindFirstChild("InvisibleBorder"):Destroy()
