-- real script make by Executioner(2 years ago)
local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()
local MainUI = UILibrary.Load("Tsunami Game")
local Player = MainUI.AddPage("Player",false)
local AutoFarm = MainUI.AddPage("AutoFarm",false)
local Teleport = MainUI.AddPage("Teleport",false)
getgenv().Farm = false
getgenv().W = 16
getgenv().J = 50
getgenv().PickUp = false
getgenv().ShouldRagdoll = false


local cor = coroutine.create(function ()
    while true do
        wait(0.2)
        pcall(function ()
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("ForceField"):Destroy()
        end)
    end
end)
Player.AddSlider("WalkSpeed", {Min = 16, Max = 300, Def = 16},function(v)
    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = v
    wait(0.1)
end)
Player.AddSlider("JumpPower", {Min = 50, Max = 250, Def = 50},function(v)
    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = v
    wait(0.1)
end)
Player.AddToggle("Anti Ragdoll",false,function(v)
    getgenv().ShouldRagdoll = v
    local ragdoll = game.Players.LocalPlayer.Character:FindFirstChild("RagdollToggled")
    repeat
        wait(0.2)
        if ragdoll then
            ragdoll:FireServer(false)
        end
    until 
    getgenv().ShouldRagdoll == false
end)


AutoFarm.AddToggle("AutoFarm",false,function (v)
    getgenv().Farm = v
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
wait(20)
        end
    until 
    getgenv().Farm == false
end)

AutoFarm.AddToggle("Auto PickUp Coins",false,function (v)
    getgenv().PickUp = v
    repeat
             wait(0.02)
      pcall(function ()
            firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"),game:GetService("Workspace").CurrentPointCoins.CoinFolder.CoinCollision,0)

        end)
    until 
    getgenv().PickUp == false
end)
