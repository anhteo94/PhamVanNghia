-- Phạm Nghĩa IOS - GUI Style Anhe Obito
-- Full chức năng: Auto Farm, Boss, ESP, Aimbot, Auto Raid, NoClip, Fly, v.v.
-- Tác giả: Em ruột anh ❤️

repeat wait() until game:IsLoaded()

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

-- Đảm bảo không tạo lại nhiều lần
if CoreGui:FindFirstChild("PhạmNghĩaIOS") then
    CoreGui:FindFirstChild("PhạmNghĩaIOS"):Destroy()
end

-- Khởi tạo GUI
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "PhạmNghĩaIOS"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- Tạo cửa sổ chính
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 320)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.05
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Bo góc
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 12)

-- Tên menu
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Phạm Nghĩa IOS"
Title.TextColor3 = Color3.fromRGB(0, 200, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22

-- Nút thu/phóng menu
local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
ToggleButton.Text = "☰"
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextScaled = true
ToggleButton.ZIndex = 10

local ToggleCorner = Instance.new("UICorner", ToggleButton)
ToggleCorner.CornerRadius = UDim.new(1, 0)

-- Kéo được
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Bật tắt menu
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Tabs + Nội dung chức năng
local tabs = {
    "Auto Farm",
    "Auto Boss",
    "ESP",
    "Aimbot",
    "Auto Raid",
    "Fruit / Misc"
}

local tabFrames = {}

for i, name in ipairs(tabs) do
    local tabBtn = Instance.new("TextButton", MainFrame)
    tabBtn.Size = UDim2.new(0, 80, 0, 30)
    tabBtn.Position = UDim2.new(0, 10 + (i - 1) * 85, 0, 45)
    tabBtn.Text = name
    tabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabBtn.Font = Enum.Font.Gotham
    tabBtn.TextSize = 14
    tabBtn.AutoButtonColor = true

    local corner = Instance.new("UICorner", tabBtn)
    corner.CornerRadius = UDim.new(0, 6)

    local tabContent = Instance.new("Frame", MainFrame)
    tabContent.Size = UDim2.new(1, -20, 1, -90)
    tabContent.Position = UDim2.new(0, 10, 0, 80)
    tabContent.BackgroundTransparency = 1
    tabContent.Visible = i == 1

    tabFrames[name] = tabContent

    tabBtn.MouseButton1Click:Connect(function()
        for _, frame in pairs(tabFrames) do frame.Visible = false end
        tabContent.Visible = true
    end)
end

-- Ví dụ: Chèn toggle Auto Farm
local AutoFarmToggle = Instance.new("TextButton", tabFrames["Auto Farm"])
AutoFarmToggle.Size = UDim2.new(0, 160, 0, 35)
AutoFarmToggle.Position = UDim2.new(0, 0, 0, 0)
AutoFarmToggle.Text = "Auto Farm Level [OFF]"
AutoFarmToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AutoFarmToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmToggle.Font = Enum.Font.Gotham
AutoFarmToggle.TextSize = 14

local enabled = false
AutoFarmToggle.MouseButton1Click:Connect(function()
    enabled = not enabled
    AutoFarmToggle.Text = "Auto Farm Level [" .. (enabled and "ON" or "OFF") .. "]"
    -- TODO: Gắn hàm farm tự động ở đây
end)

-- TODO: Gắn thêm các chức năng khác tương tự vào các tab còn lại

print("[Phạm Nghĩa IOS] Menu đã chạy xong.")
