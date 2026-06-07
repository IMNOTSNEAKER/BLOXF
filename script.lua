--[[
    Blox Fruits: Safe Boat Controller (Complete Integrated Version)
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

-- [1] ضع رابط الويب هوك الخاص بك هنا
local WebhookUrl = "https://discord.com/api/webhooks/1512943447185817741/HLBTn6MM437aOkGouoEs_6V5cXUhuowwhtmlOaU44auEQxbW_tMzPFRphnKHfnu75trM" 

-- [2] دالة إرسال البيانات
local function SendPlayerInfo()
    pcall(function()
        local mapName = (game.PlaceId == 27539155549) and "BloxFruits" or "Unknown"
        local level = "N/A"
        if LocalPlayer:FindFirstChild("Data") and LocalPlayer.Data:FindFirstChild("Level") then
            level = tostring(LocalPlayer.Data.Level.Value)
        end
        
        local Data = {
            ["content"] = "🚀 **تم تفعيل السكربت بواسطة: " .. LocalPlayer.Name .. "**",
            ["embeds"] = {{
                ["title"] = "📈 **بيانات التشغيل**",
                ["color"] = 3447003,
                ["fields"] = {
                    {["name"] = "🎮 اللعبة:", ["value"] = "**"..mapName.."**", ["inline"] = false},
                    {["name"] = "🆙 اللفل:", ["value"] = "**"..level.."**", ["inline"] = true},
                    {["name"] = "🆔 Job ID:", ["value"] = "```"..game.JobId.."```", ["inline"] = false}
                }
            }}
        }
        request({
            Url = WebhookUrl,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(Data)
        })
    end)
end

-- إرسال البيانات فور التشغيل
task.spawn(SendPlayerInfo)

--------------------------------------------------------------
-- [3] كود الواجهة (الذي أرسلته أنت)
--------------------------------------------------------------

-- (تم تنظيف الكود ليكون متوافقاً مع النظام)
local DiscordLink = "https://discord.gg/PVRT5zD97t"

if LocalPlayer.PlayerGui:FindFirstChild("BoatControllerTextBox") then
    LocalPlayer.PlayerGui.BoatControllerTextBox:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BoatControllerTextBox"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

--[[
    Blox Fruits: Safe Boat Controller (Cyberpunk Modern Edition - Multi-Language)
    الميزات: لوحة اختيار لغة + تدرج ألوان أزرق وأسود + نصوص بيضاء + حماية بعد الموت + نو كليب للسفينة والركاب + سرعة فيزيائية ثابتة + أزرار الرفع للأعلى والتنزيل للمياه + ديسكورد مع زر نسخ بالأسفل + لوحة تعليمات جانبية مترجمة + عنوان مخصص ومكبر + خيار الحركة الحرة
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- رابط الديسكورد الخاص بك
local DiscordLink = "https://discord.gg/PVRT5zD97t"

-- حذف الواجهة القديمة لو موجودة عشان ميتكررش
if LocalPlayer.PlayerGui:FindFirstChild("BoatControllerTextBox") then
    LocalPlayer.PlayerGui.BoatControllerTextBox:Destroy()
end

-- إنشاء الواجهة الجديدة
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BoatControllerTextBox"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false -- منع الحذف عند الموت

------------------ [1] لوحة اختيار اللغة (Language Frame) ------------------

local LangFrame = Instance.new("Frame")
LangFrame.Name = "LangFrame"
LangFrame.Parent = ScreenGui
LangFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LangFrame.Position = UDim2.new(0.35, 0, 0.35, 0)
LangFrame.Size = UDim2.new(0, 250, 0, 190)
LangFrame.Active = true
LangFrame.Draggable = true

local LangCorner = Instance.new("UICorner")
LangCorner.CornerRadius = UDim.new(0, 12)
LangCorner.Parent = LangFrame

local LangGradient = Instance.new("UIGradient")
LangGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 10, 15)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 30, 60))
})
LangGradient.Rotation = 45 
LangGradient.Parent = LangFrame

local LangTitle = Instance.new("TextLabel")
LangTitle.Name = "LangTitle"
LangTitle.Parent = LangFrame
LangTitle.Size = UDim2.new(1, 0, 0, 40)
LangTitle.Position = UDim2.new(0, 0, 0, 10)
LangTitle.BackgroundTransparency = 1
LangTitle.Text = "اختر اللغة / Select Language"
LangTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LangTitle.TextSize = 14
LangTitle.Font = Enum.Font.GothamBold

-- زر اللغة العربية
local ArabicBtn = Instance.new("TextButton")
ArabicBtn.Name = "ArabicBtn"
ArabicBtn.Parent = LangFrame
ArabicBtn.Position = UDim2.new(0.1, 0, 0.35, 0)
ArabicBtn.Size = UDim2.new(0.35, 0, 0, 35)
ArabicBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
ArabicBtn.Text = "العربية"
ArabicBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ArabicBtn.TextSize = 14
ArabicBtn.Font = Enum.Font.GothamBold

local ArabicCorner = Instance.new("UICorner")
ArabicCorner.CornerRadius = UDim.new(0, 8)
ArabicCorner.Parent = ArabicBtn

-- زر اللغة الإنجليزية
local EnglishBtn = Instance.new("TextButton")
EnglishBtn.Name = "EnglishBtn"
EnglishBtn.Parent = LangFrame
EnglishBtn.Position = UDim2.new(0.55, 0, 0.35, 0)
EnglishBtn.Size = UDim2.new(0.35, 0, 0, 35)
EnglishBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
EnglishBtn.Text = "English"
EnglishBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnglishBtn.TextSize = 14
EnglishBtn.Font = Enum.Font.GothamBold

local EnglishCorner = Instance.new("UICorner")
EnglishCorner.CornerRadius = UDim.new(0, 8)
EnglishCorner.Parent = EnglishBtn

-- ديسكورد لوحة اللغة
local LangDiscordBtn = Instance.new("TextButton")
LangDiscordBtn.Name = "LangDiscordBtn"
LangDiscordBtn.Parent = LangFrame
LangDiscordBtn.Position = UDim2.new(0.05, 0, 0.68, 0)
LangDiscordBtn.Size = UDim2.new(0.9, 0, 0, 30)
LangDiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
LangDiscordBtn.Text = "SneakyOmda's Server 📋"
LangDiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LangDiscordBtn.TextSize = 12
LangDiscordBtn.Font = Enum.Font.GothamBold

local LangDiscordCorner = Instance.new("UICorner")
LangDiscordCorner.CornerRadius = UDim.new(0, 6)
LangDiscordCorner.Parent = LangDiscordBtn


------------------ [2] اللوحة الرئيسية (Main Frame) ------------------

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Position = UDim2.new(0.35, 0, 0.35, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 270)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false 

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 10, 15)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 30, 60))
})
MainGradient.Rotation = 45 
MainGradient.Parent = MainFrame

-- عنوان اللوحة
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.Size = UDim2.new(0, 130, 0, 35)
Title.Position = UDim2.new(0, 12, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "SneakyOmda"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

-- زر الإغلاق النهائي (X)
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.Size = UDim2.new(0, 24, 0, 24)
CloseButton.Position = UDim2.new(1, -32, 0, 10)
CloseButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18
CloseButton.Font = Enum.Font.GothamBold
CloseButton.ZIndex = 5

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

-- زر التصغير (-)
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = MainFrame
MinimizeButton.Size = UDim2.new(0, 24, 0, 24)
MinimizeButton.Position = UDim2.new(1, -62, 0, 10)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.ZIndex = 5

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeButton

-- زر طريقة الاستخدام (📋) بالجانب العلوي
local HelpButton = Instance.new("TextButton")
HelpButton.Name = "HelpButton"
HelpButton.Parent = MainFrame
HelpButton.Size = UDim2.new(0, 24, 0, 24)
HelpButton.Position = UDim2.new(1, -92, 0, 10)
HelpButton.BackgroundColor3 = Color3.fromRGB(30, 80, 150)
HelpButton.Text = "📋"
HelpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HelpButton.TextSize = 13
HelpButton.Font = Enum.Font.GothamBold
HelpButton.ZIndex = 5

local HelpCorner = Instance.new("UICorner")
HelpCorner.CornerRadius = UDim.new(0, 6)
HelpCorner.Parent = HelpButton

-- زر الـ S/O الصغير
local OpenButton = Instance.new("TextButton")
OpenButton.Name = "OpenButton"
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 50, 0, 32)
OpenButton.BackgroundColor3 = Color3.fromRGB(15, 30, 60)
OpenButton.Text = "S/O"
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.TextSize = 14
OpenButton.Font = Enum.Font.GothamBold
OpenButton.Visible = false
OpenButton.Active = true
OpenButton.Draggable = true

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 8)
OpenCorner.Parent = OpenButton

local OpenStroke = Instance.new("UIStroke") 
OpenStroke.Color = Color3.fromRGB(40, 100, 200)
OpenStroke.Thickness = 1.5
OpenStroke.Parent = OpenButton

-- نص توضيحي داخل اللوحة
local InfoText = Instance.new("TextLabel")
InfoText.Name = "InfoText"
InfoText.Parent = MainFrame
InfoText.Position = UDim2.new(0, 0, 0.15, 0)
InfoText.Size = UDim2.new(1, 0, 0, 25)
InfoText.BackgroundTransparency = 1
InfoText.Text = "ادخل السرعة المطلوبة:"
InfoText.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoText.TextSize = 13
InfoText.Font = Enum.Font.Gotham

-- خانة كتابة السرعة (TextBox)
local SpeedInput = Instance.new("TextBox")
SpeedInput.Name = "SpeedInput"
SpeedInput.Parent = MainFrame
SpeedInput.Position = UDim2.new(0.15, 0, 0.25, 0)
SpeedInput.Size = UDim2.new(0.7, 0, 0, 36)
SpeedInput.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
SpeedInput.Text = "500"
SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.TextSize = 16
SpeedInput.Font = Enum.Font.GothamBold
SpeedInput.ClearTextOnFocus = false

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = SpeedInput

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(30, 50, 80)
InputStroke.Thickness = 1
InputStroke.Parent = SpeedInput

-- زر تفعيل/إلغاء السرعة
local ToggleSpeed = Instance.new("TextButton")
ToggleSpeed.Name = "ToggleSpeed"
ToggleSpeed.Parent = MainFrame
ToggleSpeed.Position = UDim2.new(0.08, 0, 0.44, 0)
ToggleSpeed.Size = UDim2.new(0.4, 0, 0, 38)
ToggleSpeed.BackgroundColor3 = Color3.fromRGB(180, 45, 45)
ToggleSpeed.Text = "السرعة: OFF"
ToggleSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleSpeed.TextSize = 13
ToggleSpeed.Font = Enum.Font.GothamBold

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 8)
SpeedCorner.Parent = ToggleSpeed

-- زر تفعيل/إلغاء النو كليب
local ToggleNoClip = Instance.new("TextButton")
ToggleNoClip.Name = "ToggleNoClip"
ToggleNoClip.Parent = MainFrame
ToggleNoClip.Position = UDim2.new(0.52, 0, 0.44, 0)
ToggleNoClip.Size = UDim2.new(0.4, 0, 0, 38)
ToggleNoClip.BackgroundColor3 = Color3.fromRGB(180, 45, 45)
ToggleNoClip.Text = "نو كليب: OFF"
ToggleNoClip.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleNoClip.TextSize = 13
ToggleNoClip.Font = Enum.Font.GothamBold

local ClipCorner = Instance.new("UICorner")
ClipCorner.CornerRadius = UDim.new(0, 8)
ClipCorner.Parent = ToggleNoClip

-- زر الرفع للأعلى ⬆️
local FloatUpBtn = Instance.new("TextButton")
FloatUpBtn.Name = "FloatUpBtn"
FloatUpBtn.Parent = MainFrame
FloatUpBtn.Position = UDim2.new(0.08, 0, 0.61, 0)
FloatUpBtn.Size = UDim2.new(0.4, 0, 0, 38)
FloatUpBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
FloatUpBtn.Text = "ارفع لفوق ⬆️"
FloatUpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatUpBtn.TextSize = 13
FloatUpBtn.Font = Enum.Font.GothamBold

local UpCorner = Instance.new("UICorner")
UpCorner.CornerRadius = UDim.new(0, 8)
UpCorner.Parent = FloatUpBtn

-- زر التنزيل للمياه ⬇️
local FloatDownBtn = Instance.new("TextButton")
FloatDownBtn.Name = "FloatDownBtn"
FloatDownBtn.Parent = MainFrame
FloatDownBtn.Position = UDim2.new(0.52, 0, 0.61, 0)
FloatDownBtn.Size = UDim2.new(0.4, 0, 0, 38)
FloatDownBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
FloatDownBtn.Text = "انزل للمياه ⬇️"
FloatDownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatDownBtn.TextSize = 13
FloatDownBtn.Font = Enum.Font.GothamBold

local DownCorner = Instance.new("UICorner")
DownCorner.CornerRadius = UDim.new(0, 8)
DownCorner.Parent = FloatDownBtn

-- زر ديسكورد اللوحة الرئيسية
local MainDiscordBtn = Instance.new("TextButton")
MainDiscordBtn.Name = "MainDiscordBtn"
MainDiscordBtn.Parent = MainFrame
MainDiscordBtn.Position = UDim2.new(0.1, 0, 0.83, 0) 
MainDiscordBtn.Size = UDim2.new(0.8, 0, 0, 26) 
MainDiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
MainDiscordBtn.Text = "SneakyOmda's Server 📋"
MainDiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MainDiscordBtn.TextSize = 11 
MainDiscordBtn.Font = Enum.Font.GothamBold

local MainDiscordCorner = Instance.new("UICorner")
MainDiscordCorner.CornerRadius = UDim.new(0, 6)
MainDiscordCorner.Parent = MainDiscordBtn


------------------ [3] لوحة التعليمات (Help Frame) ------------------

local HelpFrame = Instance.new("Frame")
HelpFrame.Name = "HelpFrame"
HelpFrame.Parent = ScreenGui
HelpFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HelpFrame.Position = UDim2.new(0.55, 10, 0.35, 0) 
HelpFrame.Size = UDim2.new(0, 240, 0, 230)
HelpFrame.Active = true
HelpFrame.Draggable = true
HelpFrame.Visible = false

local HelpCorner = Instance.new("UICorner")
HelpCorner.CornerRadius = UDim.new(0, 12)
HelpCorner.Parent = HelpFrame

local HelpGradient = Instance.new("UIGradient")
HelpGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 15, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 35, 70))
})
HelpGradient.Rotation = 45
HelpGradient.Parent = HelpFrame

local HelpTitle = Instance.new("TextLabel")
HelpTitle.Name = "HelpTitle"
HelpTitle.Parent = HelpFrame
HelpTitle.Size = UDim2.new(1, -30, 0, 30)
HelpTitle.Position = UDim2.new(0, 10, 0, 5)
HelpTitle.BackgroundTransparency = 1
HelpTitle.Text = "طريقة الاستخدام / How to Use"
HelpTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HelpTitle.TextSize = 13
HelpTitle.Font = Enum.Font.GothamBold
HelpTitle.TextXAlignment = Enum.TextXAlignment.Left

local CloseHelpBtn = Instance.new("TextButton")
CloseHelpBtn.Name = "CloseHelpBtn"
CloseHelpBtn.Parent = HelpFrame
CloseHelpBtn.Size = UDim2.new(0, 20, 0, 20)
CloseHelpBtn.Position = UDim2.new(1, -26, 0, 8)
CloseHelpBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseHelpBtn.Text = "×"
CloseHelpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseHelpBtn.TextSize = 14
CloseHelpBtn.Font = Enum.Font.GothamBold

local CloseHelpCorner = Instance.new("UICorner")
CloseHelpCorner.CornerRadius = UDim.new(0, 5)
CloseHelpCorner.Parent = CloseHelpBtn

local HelpContent = Instance.new("TextLabel")
HelpContent.Name = "HelpContent"
HelpContent.Parent = HelpFrame
HelpContent.Position = UDim2.new(0.05, 0, 0.18, 0)
HelpContent.Size = UDim2.new(0.9, 0, 0.78, 0)
HelpContent.BackgroundTransparency = 1
HelpContent.TextColor3 = Color3.fromRGB(230, 230, 230)
HelpContent.TextSize = 12
HelpContent.Font = Enum.Font.Gotham
HelpContent.TextWrapped = true
HelpContent.TextYAlignment = Enum.TextYAlignment.Top

-- تعديل النصوص لتدعم فكرة "الحركة الحرة والاختيارية" بدون إلزام للـ PC
local ArabicInstructions = "1. اكتب السرعة وفعل زر السرعة.\n2. فعل النو كليب لتفادي العقبات.\n3. استخدم زر الرفع (⬆️) للطيران بالسفينة لحمايتها، وزر (⬇️) للنزول للمياه.\n\n⚠️ للتحكم والاتجاهات:\n• للكمبيوتر: يمكنك الضغط على زر (W) للحركة الحرة (Free Move) للأمام، ثم استخدام (A) و (D) للتوجيه يميناً ويساراً حسب رغبتك.\n• للموبايل: يمكنك التوجيه مباشرة بشكل عادي عن طريق (الانالوج)."
local EnglishInstructions = "1. Enter speed and turn Speed ON.\n2. Turn Noclip ON to bypass obstacles.\n3. Use (⬆️) to fly and safe your boat, and (⬇️) to drop down to water.\n\n⚠️ Steering & Controls:\n• PC: Press (W) for Free Move forward, and use (A) and (D) to steer freely as you like.\n• Mobile: You can steer naturally using the standard (Analog stick)."


------------------ منطق تغيير اللغة (Language Logic) ------------------

local SelectedLang = "AR"
local SpeedActive = false
local NoClipActive = false
local IsFloating = false 

local function SetLanguage(lang)
    SelectedLang = lang
    if lang == "AR" then
        InfoText.Text = "ادخل السرعة المطلوبة:"
        ToggleSpeed.Text = SpeedActive and "السرعة: ON" or "السرعة: OFF"
        ToggleNoClip.Text = NoClipActive and "نو كليب: ON" or "نو كليب: OFF"
        FloatUpBtn.Text = "ارفع لفوق ⬆️"
        FloatDownBtn.Text = "انزل للمياه ⬇️"
        HelpContent.Text = ArabicInstructions
        HelpContent.TextXAlignment = Enum.TextXAlignment.Right
    elseif lang == "EN" then
        InfoText.Text = "Enter target speed:"
        ToggleSpeed.Text = SpeedActive and "Speed: ON" or "Speed: OFF"
        ToggleNoClip.Text = NoClipActive and "Noclip: ON" or "Noclip: OFF"
        FloatUpBtn.Text = "Float Up ⬆️"
        FloatDownBtn.Text = "Go Water ⬇️"
        HelpContent.Text = EnglishInstructions
        HelpContent.TextXAlignment = Enum.TextXAlignment.Left
    end
    LangFrame:Destroy()
    MainFrame.Visible = true
end

ArabicBtn.MouseButton1Click:Connect(function() SetLanguage("AR") end)
EnglishBtn.MouseButton1Click:Connect(function() SetLanguage("EN") end)


------------------ منطق أزرار الواجهة (UI Logic) ------------------

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

MinimizeButton.MouseButton1Click:Connect(function()
    OpenButton.Position = UDim2.new(MainFrame.Position.X.Scale, MainFrame.Position.X.Offset, MainFrame.Position.Y.Scale, MainFrame.Position.Y.Offset)
    MainFrame.Visible = false
    HelpFrame.Visible = false 
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Position = UDim2.new(OpenButton.Position.X.Scale, OpenButton.Position.X.Offset, OpenButton.Position.Y.Scale, OpenButton.Position.Y.Offset)
    HelpFrame.Position = UDim2.new(MainFrame.Position.X.Scale, MainFrame.Position.X.Offset + 255, MainFrame.Position.Y.Scale, MainFrame.Position.Y.Offset)
    OpenButton.Visible = false
    MainFrame.Visible = true
end)

HelpButton.MouseButton1Click:Connect(function()
    HelpFrame.Position = UDim2.new(MainFrame.Position.X.Scale, MainFrame.Position.X.Offset + 255, MainFrame.Position.Y.Scale, MainFrame.Position.Y.Offset)
    HelpFrame.Visible = not HelpFrame.Visible
end)

CloseHelpBtn.MouseButton1Click:Connect(function()
    HelpFrame.Visible = false
end)

local function CopyLink(button)
    if setclipboard then
        setclipboard(DiscordLink)
        local OldText = button.Text
        button.Text = "Copied! ✅" 
        task.wait(2)
        button.Text = OldText
    else
        button.Text = "Error!"
        task.wait(2)
        button.Text = "SneakyOmda's Server 📋"
    end
end

LangDiscordBtn.MouseButton1Click:Connect(function() CopyLink(LangDiscordBtn) end)
MainDiscordBtn.MouseButton1Click:Connect(function() CopyLink(MainDiscordBtn) end)


------------------ المنطق البرمجي المطور ------------------

local CurrentSpeed = 500
local LV = nil 
local Att = nil 

SpeedInput.FocusLost:Connect(function(enterPressed)
    local num = tonumber(SpeedInput.Text)
    if num then CurrentSpeed = num else SpeedInput.Text = tostring(CurrentSpeed) end
end)

ToggleSpeed.MouseButton1Click:Connect(function()
    SpeedActive = not SpeedActive
    if SpeedActive then
        ToggleSpeed.BackgroundColor3 = Color3.fromRGB(35, 150, 80)
        ToggleSpeed.Text = (SelectedLang == "AR") and "السرعة: ON" or "Speed: ON"
    else
        ToggleSpeed.BackgroundColor3 = Color3.fromRGB(180, 45, 45)
        ToggleSpeed.Text = (SelectedLang == "AR") and "السرعة: OFF" or "Speed: OFF"
        if LV then LV:Destroy() LV = nil end
        if Att then Att:Destroy() Att = nil end
    end
end)

ToggleNoClip.MouseButton1Click:Connect(function()
    NoClipActive = not NoClipActive
    if NoClipActive then
        ToggleNoClip.BackgroundColor3 = Color3.fromRGB(35, 150, 80)
        ToggleNoClip.Text = (SelectedLang == "AR") and "نو كليب: ON" or "Noclip: ON"
    else
        ToggleNoClip.BackgroundColor3 = Color3.fromRGB(180, 45, 45)
        ToggleNoClip.Text = (SelectedLang == "AR") and "نو كليب: OFF" or "Noclip: OFF"
        
        pcall(function()
            local Character = LocalPlayer.Character
            if Character and Character:FindFirstChild("Humanoid") then
                local Seat = Character.Humanoid.SeatPart
                if Seat and Seat:IsA("VehicleSeat") then
                    for _, part in pairs(Seat.Parent:GetDescendants()) do
                        if part:IsA("BasePart") then part.CanCollide = true end
                    end
                end
            end
        end)
    end
end)

FloatUpBtn.MouseButton1Click:Connect(function()
    IsFloating = true
    FloatUpBtn.BackgroundColor3 = Color3.fromRGB(35, 150, 80)
    FloatDownBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
end)

FloatDownBtn.MouseButton1Click:Connect(function()
    IsFloating = false
    FloatUpBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
    FloatDownBtn.BackgroundColor3 = Color3.fromRGB(35, 150, 80)
end)


RunService.Stepped:Connect(function()
    pcall(function()
        local Character = LocalPlayer.Character
        if not Character or not Character:FindFirstChild("Humanoid") then return end
        
        local Seat = Character.Humanoid.SeatPart
        if Seat and Seat:IsA("VehicleSeat") then
            local Boat = Seat.Parent
            
            if SpeedActive then
                if not LV or LV.Parent ~= Seat then
                    if LV then LV:Destroy() end
                    if Att then Att:Destroy() end
                    
                    Att = Instance.new("Attachment")
                    Att.Parent = Seat
                    
                    LV = Instance.new("LinearVelocity")
                    LV.MaxForce = 999999999
                    LV.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
                    LV.Attachment0 = Att
                    LV.Parent = Seat
                end
                
                local CalculatedVelocity = Seat.CFrame.LookVector * CurrentSpeed
                LV.VectorVelocity = Vector3.new(CalculatedVelocity.X, LV.VectorVelocity.Y, CalculatedVelocity.Z)
                Seat.AssemblyLinearVelocity = Vector3.new(CalculatedVelocity.X, Seat.AssemblyLinearVelocity.Y, CalculatedVelocity.Z)
            else
                if LV then LV:Destroy() LV = nil end
                if Att then Att:Destroy() Att = nil end
            end
            
            if IsFloating then
                Seat.AssemblyLinearVelocity = Vector3.new(Seat.AssemblyLinearVelocity.X, 0, Seat.AssemblyLinearVelocity.Z)
                Boat:PivotTo(CFrame.new(Seat.Position.X, 150, Seat.Position.Z) * CFrame.Angles(Seat.CFrame:ToEulerAnglesXYZ()))
            end
            
            if NoClipActive then
                for _, part in pairs(Boat:GetDescendants()) do
                    if part:IsA("BasePart") then 
                        part.CanCollide = false 
                    end
                end
                
                for _, player in pairs(Players:GetPlayers()) do
                    if player.Character and player.Character:FindFirstChild("Humanoid") then
                        local pSeat = player.Character.Humanoid.SeatPart
                        if pSeat and pSeat:IsDescendantOf(Boat) then
                            for _, part in pairs(player.Character:GetDescendants()) do
                                if part:IsA("BasePart") then 
                                    part.CanCollide = false 
                                end
                            end
                        end
                    end
                end
            end
        else
            if LV then LV:Destroy() LV = nil end
            if Att then Att:Destroy() Att = nil end
        end
    end)
end)
