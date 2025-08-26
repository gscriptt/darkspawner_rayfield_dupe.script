--// Executor Check
local function isKRNL()
    if identifyexecutor then
        local name = identifyexecutor()
        if type(name) == "string" and string.lower(name):find("krnl") then
            return true
        end
    end
    if iskrnlclosure then
        return true
    end
    return false
end

--// If NOT KRNL → Show Warning
if not isKRNL() then
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local PlayerGui = player:WaitForChild("PlayerGui")

    local warningGui = Instance.new("ScreenGui", PlayerGui)
    warningGui.Name = "ExecutorWarning"
    warningGui.IgnoreGuiInset = true
    warningGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Background
    local bg = Instance.new("Frame", warningGui)
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(20,0,0)

    -- Warning Title
    local title = Instance.new("TextLabel", bg)
    title.AnchorPoint = Vector2.new(0.5,0.5)
    title.Position = UDim2.new(0.5,0,0.4,0)
    title.Size = UDim2.new(0,500,0,50)
    title.Text = "⚠️ This Script Only Works on KRNL Executor ⚠️"
    title.Font = Enum.Font.FredokaOne
    title.TextSize = 28
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.BackgroundTransparency = 1

    -- Subtitle
    local subtitle = Instance.new("TextLabel", bg)
    subtitle.AnchorPoint = Vector2.new(0.5,0.5)
    subtitle.Position = UDim2.new(0.5,0,0.5,0)
    subtitle.Size = UDim2.new(0,450,0,40)
    subtitle.Text = "Please download KRNL Executor to use this script."
    subtitle.Font = Enum.Font.FredokaOne
    subtitle.TextSize = 20
    subtitle.TextColor3 = Color3.fromRGB(255,200,200)
    subtitle.BackgroundTransparency = 1

    -- Link Button
    local linkBtn = Instance.new("TextButton", bg)
    linkBtn.AnchorPoint = Vector2.new(0.5,0.5)
    linkBtn.Position = UDim2.new(0.5,0,0.6,0)
    linkBtn.Size = UDim2.new(0,280,0,40)
    linkBtn.Text = "👉 Get KRNL Executor Here 👈"
    linkBtn.Font = Enum.Font.FredokaOne
    linkBtn.TextSize = 20
    linkBtn.TextColor3 = Color3.fromRGB(255,255,255)
    linkBtn.BackgroundColor3 = Color3.fromRGB(100,0,0)
    Instance.new("UICorner", linkBtn).CornerRadius = UDim.new(0,8)

    -- Click → Copy link or open browser
    local krnlLink = "https://krnl.place/" -- (replace with your link if needed)
    linkBtn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(krnlLink)
            linkBtn.Text = "✅ Link copied to clipboard!"
        elseif (syn and syn.request) or request then
            -- Try opening browser
            (syn and syn.request or request)({
                Url = krnlLink,
                Method = "GET"
            })
            linkBtn.Text = "🌐 Opened in browser!"
        else
            linkBtn.Text = "⚠️ Copy manually: "..krnlLink
        end
    end)

    return -- stop here for non-KRNL
end

----------------------------------------------------------------------
--// KRNL Users → Continue Script (Loading + Dupe GUI)
----------------------------------------------------------------------

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local PlayerGui = player:WaitForChild("PlayerGui")

-- LOADING SCREEN
local loadingGui = Instance.new("ScreenGui", PlayerGui)
loadingGui.Name = "LoadingScreen"
loadingGui.IgnoreGuiInset = true
loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local bgFrame = Instance.new("Frame", loadingGui)
bgFrame.Size = UDim2.new(1, 0, 1, 0)
bgFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

local topLabel = Instance.new("TextLabel", bgFrame)
topLabel.AnchorPoint = Vector2.new(0.5, 0)
topLabel.Position = UDim2.new(0.5, 0, 0.2, 0)
topLabel.Text = "Generating Duplicate Pets Script, Please Wait"
topLabel.Font = Enum.Font.FredokaOne
topLabel.TextSize = 26
topLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
topLabel.BackgroundTransparency = 1

local mainLabel = Instance.new("TextLabel", bgFrame)
mainLabel.AnchorPoint = Vector2.new(0.5, 0.5)
mainLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
mainLabel.Text = ""
mainLabel.Font = Enum.Font.FredokaOne
mainLabel.TextSize = 32
mainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
mainLabel.BackgroundTransparency = 1

for i = 60,1,-1 do
	mainLabel.Text = "Loading... " .. i .. "s"
	task.wait(1)
end
loadingGui:Destroy()

-- MAIN PET DUPLICATOR GUI
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
	Instance.new("UICorner", errorLabel)

	task.delay(2.5, function()
		errorLabel:Destroy()
	end)
end

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

task.spawn(function()
	while true do
		updateGUI()
		task.wait(1)
	end
end)
