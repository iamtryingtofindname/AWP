-- For use in this game: https://www.roblox.com/games/5499911356/Cart-Ride-Around-guywithapoo
-- Will NOT likely work in other cart ride games.
-- Change TIME_TO_DO var underneath this to change how long it will spam everyone's cart for
local TIME_TO_DO = 6
pcall(function()
    shared.e:Disconnect()
    shared.f:Disconnect()
    shared.g:Disconnect()
end)
local plrs = game:GetService("Players")
local carts = workspace.Carts
local function doThing()
    for _,cat in pairs(carts:GetChildren()) do
        for _,cart in pairs(cat:GetChildren()) do
            if cart:IsA("Model") and cart.Name == "Cart" and cart:FindFirstChild("Up") and cart.Up:FindFirstChild("Click") then
                spawn(function()
                    local belongsToExecutor = false
                    for _,v in pairs(cart:GetDescendants()) do
                        if v:IsA("Seat") and v.Occupant and plrs:GetPlayerFromCharacter(v.Occupant.Parent)==plrs.LocalPlayer then
                            --print("found executor")
                            belongsToExecutor = true
                            break
                        end
                    end
                    if not belongsToExecutor then
                        fireclickdetector(cart.Down.Click)
                    end
                end)
            end
        end
    end
end
shared.e = game:GetService("RunService").RenderStepped:Connect(doThing)
shared.f = game:GetService("RunService").Heartbeat:Connect(doThing)
shared.g = game:GetService("RunService").Stepped:Connect(doThing)
task.wait(TIME_TO_DO)
pcall(function()
    shared.e:Disconnect()
    shared.f:Disconnect() shared.g:Disconnect()
end)
