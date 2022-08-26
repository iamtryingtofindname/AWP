while wait() do
    pcall(function()
for _,v in pairs(workspace["Glass Bridge"]:GetDescendants()) do
    if v:FindFirstChild("TouchInterest") then
        v.Color = Color3.new(1,0,0)
    end
end
end)
end
