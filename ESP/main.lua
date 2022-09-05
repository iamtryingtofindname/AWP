--[[

███████╗░██████╗██████╗░
██╔════╝██╔════╝██╔══██╗
█████╗░░╚█████╗░██████╔╝
██╔══╝░░░╚═══██╗██╔═══╝░
███████╗██████╔╝██║░░░░░
╚══════╝╚═════╝░╚═╝░░░░░

ESP library made by RoadToGlory#9879
Used by AWP script by RoadToGlory#9879

]]--

-- SERVICES
local Players = game:GetService("Players")
local Run = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- GENERAL
local collection = {}
local cache = {}
local characterCache = {}

local plr = Players.LocalPlayer

local ESP = {
    ShowPlayers = false;
    PlayerColor = Color3.new(0,0,1);
    UseTeamColor = true;
    IgnoreSelf = true;
}

function ESP:Add(obj,color)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = obj
    highlight.FillColor = color or Color3.new(1,0,0)
    highlight.Parent = CoreGui
    table.insert(collection,highlight)

    cache[obj] = obj.Destroying:Connect(function()
        highlight:Destroy()
    end)

    return highlight
end

function ESP:DoesExist(obj)
    for _,v in pairs(collection) do
        if v.Adornee == obj then
            return true
        end
    end
    return false
end

function ESP:Remove(obj)
    if cache[obj] then
        cache[obj]:Disconnect()
    end
    for _,v in pairs(collection) do
        if v.Adornee == obj then
            v:Destroy()
        end
    end
end

ESP._update = Run.RenderStepped:Connect(function()
    for _,v in pairs(collection) do
        if v.Adornee == nil then
            v:Destroy()
        end
    end
    if ESP.ShowPlayers then
        for _,v in pairs(Players:GetPlayers()) do
            if not (v==plr and ESP.IgnoreSelf) then
                if characterCache[v]==nil then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = CoreGui
                    characterCache[v] = highlight
                end
                local h = characterCache[v]
                h.Adornee = v.Character
                if ESP.UseTeamColor then
                    local t = v.TeamColor or BrickColor.new("Medium stone grey")
                    h.FillColor = t.Color
                else
                    h.FillColor = ESP.PlayerColor
                end
            end
        end
    else
        for _,v in pairs(characterCache) do
            pcall(function()
                v:Destroy()
            end)
        end
    end
end)

return ESP
