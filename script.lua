local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Variables de control
local puedoHacerParry = true
local enVentanaDeParry = false

-- 1. Crear el botón en la pantalla del celular
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ParryGui"
screenGui.Parent = playerGui

local parryButton = Instance.new("TextButton")
parryButton.Name = "BotonParry"
parryButton.Size = UDim2.new(0, 100, 0, 100)
parryButton.Position = UDim2.new(0.8, -50, 0.6, -50)
parryButton.Text = "PARRY"
parryButton.TextSize = 20
parryButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
parryButton.TextColor3 = Color3.fromRGB(255, 255, 255)
parryButton.Parent = screenGui

-- 2. Función del Parry
local function activarParry()
    puedoHacerParry = false
    enVentanaDeParry = true
    parryButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
    print("¡Parry activado desde móvil! Ventana de 0.3s abierta.")
    
    task.wait(0.3)
    enVentanaDeParry = false
    parryButton.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    
    task.wait(1.5)
    puedoHacerParry = true
    parryButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
end

-- 3. Detectar cuando tocas el botón en la pantalla
parryButton.MouseButton1Click:Connect(function()
    if puedoHacerParry then
        activarParry()
    end
end)
