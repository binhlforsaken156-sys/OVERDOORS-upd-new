--[[ 
OVERDOORS HARD MODE - FULL ENTITIES + CRUCIFIX
Hardcore V4 + Custom Entities (ALL)
Delta / Fluxus / KRNL Safe
One File
by chu be te liet
]]

if getgenv().OVERDOORS_LOADED then return end
getgenv().OVERDOORS_LOADED = true

--------------------------------------------------
-- SERVICES
--------------------------------------------------
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local RS = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local P = Players.LocalPlayer

--------------------------------------------------
-- INTRO : THE OVERDOORS
--------------------------------------------------
task.spawn(function()
	task.wait(0.5)

	local gui = Instance.new("ScreenGui")
	gui.ResetOnSpawn = false
	gui.Parent = P:WaitForChild("PlayerGui")

	local txt = Instance.new("TextLabel", gui)
	txt.Size = UDim2.fromScale(1,1)
	txt.BackgroundTransparency = 1
	txt.Text = "THE OVERDOORS"
	txt.Font = Enum.Font.GothamBlack
	txt.TextScaled = true
	txt.TextColor3 = Color3.fromRGB(255,0,0)
	txt.TextTransparency = 1

	for i=1,12 do
		txt.TextTransparency -= 0.08
		task.wait(0.04)
	end

	task.wait(1.5)

	for i=1,12 do
		txt.TextTransparency += 0.08
		task.wait(0.04)
	end

	gui:Destroy()
end)

--------------------------------------------------
-- BOTTOM NOTIFY
--------------------------------------------------
task.spawn(function()
	task.wait(3)

	local gui = Instance.new("ScreenGui", P.PlayerGui)
	gui.ResetOnSpawn = false

	local msg = Instance.new("TextLabel", gui)
	msg.Size = UDim2.fromScale(1,0.07)
	msg.Position = UDim2.fromScale(0,0.92)
	msg.BackgroundTransparency = 1
	msg.TextScaled = true
	msg.Font = Enum.Font.GothamBold
	msg.TextColor3 = Color3.fromRGB(170,255,200)
	msg.TextTransparency = 1
	msg.Text = "script OVERDOORS by chu be te liet"

	TweenService:Create(msg,TweenInfo.new(0.4),{TextTransparency=0}):Play()
	task.wait(3)
	TweenService:Create(msg,TweenInfo.new(0.4),{TextTransparency=1}):Play()
end)

--------------------------------------------------
-- REMOVE VIOLET MUSIC
--------------------------------------------------
for _,v in ipairs(workspace:GetDescendants()) do
	if v:IsA("Sound") and tostring(v.SoundId):find("76760458012018") then
		pcall(function()
			v:Stop()
			v:Destroy()
		end)
	end
end

--------------------------------------------------
-- DARK ATMOSPHERE
--------------------------------------------------
Lighting.Ambient = Color3.new(0,0,0)
Lighting.Brightness = 0.08
Lighting.FogStart = 30
Lighting.FogEnd = 55
Lighting.FogColor = Color3.new(0,0,0)

--------------------------------------------------
-- PLAYER STATS
--------------------------------------------------
task.spawn(function()
	while task.wait(1) do
		pcall(function()
			local c = P.Character
			local h = c and c:FindFirstChildOfClass("Humanoid")
			if h then
				h.WalkSpeed = 20
				h.JumpPower = 38
			end
		end)
	end
end)

--------------------------------------------------
-- LOAD HARDCORE V4
--------------------------------------------------
pcall(function()
	loadstring(game:HttpGet(
		"https://raw.githubusercontent.com/localplayerr/Doors-stuff/refs/heads/main/Hardcore%20v4%20recreate/main%20code"
	))()
end)

--------------------------------------------------
-- SCREECH / HIDE / SPIDER (NO CAPTION)
--------------------------------------------------
pcall(function()
	if RS.Entities and RS.Entities.Screech and RS.Entities.Screech.Top then
		RS.Entities.Screech.Top.Eyes.Color = Color3.fromRGB(255,255,0)
	end

	local G = P.PlayerGui:WaitForChild("MainUI").Initiator.Main_Game
	local M = G.RemoteListener.Modules

	M.Screech.Caught.SoundId = "rbxassetid://7492033495"
	M.Screech.Caught.PlaybackSpeed = 1.6
	M.Screech.Attack.SoundId = "rbxassetid://8080941676"
	M.HideMonster.Scare.SoundId = "rbxassetid://9126213741"
	M.SpiderJumpscare.Scare.SoundId = "rbxassetid://8080941676"
end)

--------------------------------------------------
-- ENTITY SPAWNER HELPER
--------------------------------------------------
local function spawnLoop(delayTime, url, waitRoom)
	task.spawn(function()
		while true do
			task.wait(delayTime)
			if waitRoom then
				pcall(function()
					RS.GameData.LatestRoom.Changed:Wait()
				end)
			end
			pcall(function()
				loadstring(game:HttpGet(url))()
			end)
		end
	end)
end

--------------------------------------------------
-- CUSTOM ENTITIES (FULL LIST)
--------------------------------------------------
local entities = {
	{90,  "https://raw.githubusercontent.com/Junbbinopro/Depth-entity/refs/heads/main/Depth", true},
	{150, "https://raw.githubusercontent.com/Junbbinopro/Guardian-entity/refs/heads/main/Guardian", true},
	{190, "https://raw.githubusercontent.com/Junbbinopro/Wh1t3/refs/heads/main/Entity", true},
	{215, "https://raw.githubusercontent.com/trungdepth-dot/Entity-greance/refs/heads/main/Greance-20", true},
	{250, "https://raw.githubusercontent.com/trungdepth-dot/Entity-surge/refs/heads/main/Surge-20", true},
	{280, "https://raw.githubusercontent.com/trungdepth-dot/Him-entity-doors/refs/heads/main/Him", true},
	{325, "https://pastefy.app/ofutwkjb/raw", true},
	{35,  "https://raw.githubusercontent.com/vct0721/Doors-Stuff/refs/heads/main/Entities/Shocker", false},
	{350, "https://github.com/PABMAXICHAC/doors-monsters-scripts/raw/main/blinkcrux", true},
	{550, "https://raw.githubusercontent.com/trungdepth-dot/Entity-greed/refs/heads/main/Greed-update", true},
	{320, "https://raw.githubusercontent.com/Junbbinopro/Black-smile/refs/heads/main/Black", true},
	{600, "https://raw.githubusercontent.com/Junbbinopro/Munci-entity/refs/heads/main/Munci-20", true},
	{440, "https://raw.githubusercontent.com/Junbbinopro/Blue-face/refs/heads/main/Entity", true},
	{620, "https://raw.githubusercontent.com/Junbbinopro/Hungerd/refs/heads/main/Entity", true},
	{210, "https://raw.githubusercontent.com/Junbbinopro/200-entity/refs/heads/main/Entity", true},
	{290, "https://raw.githubusercontent.com/trungdepth-dot/Entity-bluyer/refs/heads/main/Entity-20", true},
	{230, "https://raw.githubusercontent.com/Junbbinopro/Trauma-entity/refs/heads/main/Trauma", true},
	{420, "https://raw.githubusercontent.com/Junbbinopro/Screamer/refs/heads/main/Entity", false},
}

for _,v in ipairs(entities) do
	spawnLoop(v[1], v[2], v[3])
end

--------------------------------------------------
-- SPRINT + GUIDING LIGHT
--------------------------------------------------

pcall(function()
	loadstring(game:HttpGet(
		"https://raw.githubusercontent.com/Junbbinopro/Guiding-light-candle/refs/heads/main/Candle"
	))()
end)

--------------------------------------------------
-- CRUCIFIX (AUTO GIVE - NO CONFLICT)
--------------------------------------------------
if not getgenv().OVERDOORS_CRUCIFIX then
	getgenv().OVERDOORS_CRUCIFIX = true

	task.spawn(function()
		task.wait(5)
		pcall(function()
			loadstring(game:HttpGet(
				"https://raw.githubusercontent.com/PenguinManiack/Crucifix/main/Crucifix.lua"
			))()
		end)
	end)
end

--------------------------------------------------
-- END
--------------------------------------------------
print("OVERDOORS HARD MODE FULL LOADED | by chu be te liet")
