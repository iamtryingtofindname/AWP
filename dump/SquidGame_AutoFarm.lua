--[[

Run the following to disable:
run _G.autofarm = false

For use in this game:
https://www.roblox.com/games/7952502098/Impossible-Glass-Bridge-Obby-Squid-Game

Also I know this script is badly coded, it is meant to be quick

]]--
local start = os.clock()
_G.autofarm = false
wait()
wait()
_G.autofarm = true
pcall(function() workspace["__AWP"]:Destroy() end)
repeat wait() until pcall(function() return game.Players.LocalPlayer.Character.PrimaryPart.CFrame and game.Players.LocalPlayer.Character.Head end)
game:GetService("Chat"):Chat(game.Players.LocalPlayer.Character.Head,"AWP Squid Game Autofarm loaded in "..(((math.round(os.clock()-start)*100)/100)+0.1).." seconds!")
wait(3)
local c = game.Players.LocalPlayer.Character.PrimaryPart.CFrame
local e = Instance.new("Part")
e.Name = "__AWP"
e.Anchored = true
e.CanCollide = false
e.Size = Vector3.new(1,1,1)
e.CFrame = c
e.Transparency = 1
e.Parent = workspace
local last = nil
spawn(function()
while _G.autofarm do
    wait()
    local s,r = pcall(function()
        firetouchinterest(game.Players.LocalPlayer.Character.PrimaryPart,workspace["Glass Bridge"].Finish["Money Pig"]:FindFirstChild("TouchInterest",true).Parent,0)
        wait()
        firetouchinterest(game.Players.LocalPlayer.Character.PrimaryPart,workspace["Glass Bridge"].Finish["Money Pig"]:FindFirstChild("TouchInterest",true).Parent,1)
    end)
end
end)
while _G.autofarm do
    local s,r = pcall(function()
        local test = game.Players.LocalPlayer.Character.PrimaryPart.CFrame
        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
        workspace.CurrentCamera.CameraSubject = e
        last = workspace.CurrentCamera.CFrame
        game.Players.LocalPlayer.Character:PivotTo(e.CFrame)
    end)
    if not s then
        --pcall(function() workspace.CurrentCamera.CFrame = last end)
    end
    game:GetService("RunService").Stepped:Wait()
end
wait()
pcall(function() workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid end)
workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
