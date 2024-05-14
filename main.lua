local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
getgenv().Farm = false
getgenv().PickUp = false
getgenv().ShouldRagdoll = false
--lol
local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Tabs.Main:AddParagraph({
        Title = "Main",
        Content = ""
    })

    local Toggle = Tabs.Main:AddToggle("AutoFarm", {Title = "AutoFarm", Default = false })

    Toggle:OnChanged(function()
    getgenv().Farm = Options.AutoFarm.Value
    repeat
        if getgenv().Farm == true then
local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),TweenInfo.new(7),{CFrame =CFrame.new(-9.4971323, 39.9823875, -1051.51807, 0.985789657, -0.00746125402, -0.16781877, -0.00396866864, 0.997699857, -0.0676704049, 0.167937666, 0.0673748031, 0.983492553)})
tween:Play()
tween.Completed:Wait()
wait(1)
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(0.88348788, 230.699554, 982.310242, -0.999389589, -0.000123913429, 0.0349354483, -0.000140547054, 0.999999881, -0.000473669439, -0.034935385, -0.000478290371, -0.99938947)
game.StarterGui:SetCore("SendNotification",{
    Title = "Waiting..",
    Text = "Waiting Couple Of Seconds..",
    Duration = 3,
})
wait(5)
        end
    until 
    getgenv().Farm == false
    end)

    Options.AutoFarm:SetValue(false)

    local Toggle2 = Tabs.Main:AddToggle("AutoPickCoin", {Title = "Auto Pick Coin", Default = false })

    Toggle:OnChanged(function()
    getgenv().PickUp = Options.AutoPickCoin.Value
    repeat
             wait(0.1)
      pcall(function ()
            firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"),game:GetService("Workspace").CurrentPointCoins.CoinFolder.CoinCollision,0)

        end)
    until 
    getgenv().PickUp == false
    end)

    Options.PickCoin:SetValue(false)

	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Ui",
    Content = "Loaded Done",
    Duration = 5
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
