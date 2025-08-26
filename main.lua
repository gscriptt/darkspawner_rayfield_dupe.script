--[[  
    🔒 KRNL-Only Script  
    ✅ KRNL = Shows loading + dupe GUI  
    ❌ Delta / Others = Shows warning and blocks  
    Made by GScriptt
]]--

-- Executor check
local function blockExecutor(reason)
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local PlayerGui = player:WaitForChild("PlayerGui")

    local warnGui = Instance.new("ScreenGui", PlayerGui)
    warnGui.Name = "ExecutorWarning"
    warnGui.IgnoreGuiInset = true
    warnGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local frame = Instance.new("Frame", warnGui)
    frame.Size = UDim2.new(0, 420, 0, 130)
    frame.Position = UDim2.new(0.5, -210, 0.5, -65)
    frame.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

    local text = Instance.new("TextLabel", frame)
    text.Size = UDim2.new(1, -20, 1, -20)
    text.Position = UDim2.new(0, 10, 0, 10)
    text.BackgroundTransparency = 1
    text.TextWrapped = true
    text.Text = "⚠️ Script Blocked ⚠️\n\n" .. reason .. "\n\nPlease use **KRNL Executor**."
    text.Font = Enum.Font.FredokaOne
    text.TextSize = 18
    text.TextColor3 = Color3.fromRGB(255, 200, 200)

    return true
end

local executorName = (identifyexecutor and identifyexecutor()) or "Unknown"

-- ✅ Only continue if it's KRNL
if not is_krnl_closure or executorName:lower() ~= "krnl" then
    return blockExecutor("Non-KRNL executor detected: " .. tostring(executorName))
end


--[[ 
    LOADING SCREEN (KRNL ONLY) 
]]--
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "LoadingScreen"
loadingGui.Parent = PlayerGui
loadingGui.IgnoreGuiInset = true
loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local bgFrame = Instance.new("Frame", loadingGui)
bgFrame.Size = UDim2.new(1, 0, 1, 0)
bgFrame.Position = UDim2.new(0, 0, 0, 0)
bgFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

local mainLabel = Instance.new("TextLabel", bgFrame)
mainLabel.AnchorPoint = Vector2.new(0.5, 0.5)
mainLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
mainLabel.Text = ""
mainLabel.Font = Enum.Font.FredokaOne
mainLabel.TextSize = 32
mainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
mainLabel.BackgroundTransparency = 1

local topLabel = Instance.new("TextLabel", bgFrame)
topLabel.AnchorPoint = Vector2.new(0.5, 0)
topLabel.Position = UDim2.new(0.5, 0, 0.2, 0)
topLabel.Text = "Generating Duplicate Pets Script, Please Wait"
topLabel.Font = Enum.Font.FredokaOne
topLabel.TextSize = 26
topLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
topLabel.BackgroundTransparency = 1

-- Countdown
for i = 60, 1, -1 do
	mainLabel.Text = "Loading... " .. i .. "s"
	task.wait(1)
end
loadingGui:Destroy()


--[[ 
    MAIN PET CLONER GUI (KRNL ONLY) 
]]--

local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.Name = "KuniPetDuplicator"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 160)
frame.Position = UDim2.new(0.5, -150, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Active = true
frame.Draggable = true
frame.Name = "PetDuplicateFrame"
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", frame)
title.Text = "Pet Cloner v2"
title.Font = Enum.Font.FredokaOne
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 5)

local closeButton = Instance.new("TextButton", frame)
closeButton.Text = "X"
closeButton.Font = Enum.Font.FredokaOne
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
closeButton.Size = UDim2.new(0, 28, 0, 28)
closeButton.Position = UDim2.new(1, -34, 0, 6)
Instance.new("UICorner", closeButton)

closeButton.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

local petInfo = Instance.new("TextLabel", frame)
petInfo.Text = "Equipped Pet: [None]"
petInfo.Font = Enum.Font.FredokaOne
petInfo.TextSize = 16
petInfo.TextColor3 = Color3.fromRGB(200, 200, 160)
petInfo.BackgroundTransparency = 1
petInfo.Position = UDim2.new(0, 12, 0, 40)
petInfo.Size = UDim2.new(1, -24, 0, 24)
petInfo.TextXAlignment = Enum.TextXAlignment.Left

local dupeButton = Instance.new("TextButton", frame)
dupeButton.Text = "Duplicate Pet"
dupeButton.Font = Enum.Font.FredokaOne
dupeButton.TextSize = 16
dupeButton.TextColor3 = Color3.fromRGB(40, 40, 40)
dupeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dupeButton.Size = UDim2.new(0, 220, 0, 36)
dupeButton.Position = UDim2.new(0.5, -110, 0, 76)
Instance.new("UICorner", dupeButton)

local footer = Instance.new("TextLabel", frame)
footer.Text = "Made by GScriptt"
footer.Font = Enum.Font.FredokaOne
footer.TextSize = 13
footer.TextColor3 = Color3.fromRGB(150, 150, 150)
footer.BackgroundTransparency = 1
footer.Size = UDim2.new(1, 0, 0, 20)
footer.Position = UDim2.new(0, 0, 1, -20)

-- Functions
local character = player.Character or player.CharacterAdded:Wait()

local function getEquippedPetTool()
	character = player.Character or player.CharacterAdded:Wait()
	for _, tool in pairs(character:GetChildren()) do
		if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
			return tool
		end
	end
	return nil
end

local function updateGUI()
	local pet = getEquippedPetTool()
	if pet then
		petInfo.Text = "Equipped Pet: " .. pet.Name
	else
		petInfo.Text = "Equipped Pet: [None]"
	end
end

local function showErrorMessage(text)
	local errorLabel = Instance.new("TextLabel", screenGui)
	errorLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	errorLabel.Position = UDim2.new(0.5, 0, 0.45, 0)
	errorLabel.Size = UDim2.new(0, 250, 0, 40)
	errorLabel.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
	errorLabel.Text = text
	errorLabel.Font = Enum.Font.FredokaOne
	errorLabel.TextSize = 16
	errorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	errorLabel.ZIndex = 30
	Instance.new("UICorner", errorLabel)

	task.delay(2.5, function()
		errorLabel:Destroy()
	end)
end

-- Dupe logic
dupeButton.MouseButton1Click:Connect(function()
	local equipped = getEquippedPetTool()
	if not equipped then
		showErrorMessage("No Equipped Pet Detected")
		return
	end

	dupeButton.Active = false
	for i = 10, 1, -1 do
		local dots = string.rep(".", (i % 3) + 1)
		dupeButton.Text = "Processing" .. dots .. " (" .. i .. ")"
		task.wait(1)
	end

	local clone = equipped:Clone()
	clone.Name = equipped.Name
	clone.Parent = player.Backpack
	dupeButton.Text = "Pet Duplicated!"

	task.wait(1.5)
	dupeButton.Text = "Duplicate Pet"
	dupeButton.Active = true
end)

-- Keep pet name updated
task.spawn(function()
	while true do
		updateGUI()
		task.wait(1)
	end
end)
