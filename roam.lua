local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/skkydoesstuff/RobloxMenu/refs/heads/main/SplixCustom.lua"))()
local window = library:new({textsize = 13.5, font = Enum.Font.RobotoMono, name = "ROAM POOP", color = Color3.fromRGB(225, 58, 81)})
local tab = window:page({name = "Combat"})
local generalSection = tab:section({name = "Hitbox Expander", side = "left", size = 250})

local HitboxMultiplier
-- Varibles (put near the top)
local hitboxMultiplierEnabled = false
local rs = game:GetService("RunService")

-- put above the toggle
local function updateHeadHitBoxes()
    if hitboxMultiplierEnabled then
        for i, model in pairs(workspace:GetDescendants()) do
            if model:IsA("Model") then
                if model.Name == "pleaserep0rtmeh" then
                    continue
                end

                local headHitBox = model:FindFirstChild("HeadHitBox")
                if headHitBox and headHitBox:IsA("BasePart") then
                    headHitBox.Size = Vector3.new(1.7400000095367432 * HitboxMultipier , 1.5 * HitboxMultipier, 1.96999990940094 * HitboxMultipier)
                    headHitBox.Transparency = 0
                end
            end
        end
    else
        for i, model in pairs(workspace:GetDescendants()) do
            if model:IsA("Model") then
                local headHitBox = model:FindFirstChild("HeadHitBox")
                if headHitBox and headHitBox:IsA("BasePart") then
                    headHitBox.Size = Vector3.new(1.7400000095367432, 1.5, 1.96999990940094)
                    headHitBox.Transparency = 0
                end
            end
        end
    end
end
generalSection:toggle({
    name = "Hitbox Expander",
    default = false,
    callback = function(value)
    hitboxMultiplierEnabled = value
    end
}) 



generalSection:slider({
    name = "Head Size",
    def = 1,
    min = 0,
    max = 1000,
    callback = function(value)
     HitboxMultiplier = value
    end
})

rs.Heartbeat:Connect(function()
    updateHeadHitBoxes()
end)

generalSection:keybind({
    name = "Toggle Menu Keybind",
    def = nil,
    callback = function(key)
        window.key = key
    end,
})
