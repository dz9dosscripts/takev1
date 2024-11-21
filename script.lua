local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Função para encontrar todas as Tools no jogo
local function getAllTools()
    local tools = {}
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("Tool") then
            table.insert(tools, obj)
        end
    end
    return tools
end

-- Pegar todas as Tools e equipá-las
local tools = getAllTools()
for _, tool in pairs(tools) do
    local clonedTool = tool:Clone()  -- Clonar a Tool para não remover do local original
    clonedTool.Parent = backpack    -- Mover a Tool para a mochila do jogador
    print("Pegou a Tool:", tool.Name)
end

-- Equipar todas as Tools automaticamente
for _, tool in pairs(backpack:GetChildren()) do
    if tool:IsA("Tool") then
        player.Character.Humanoid:EquipTool(tool)
        print("Equipada a Tool:", tool.Name)
    end
end
