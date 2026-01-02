local Init = require("core/Init")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    math.randomseed(os.time())
    math.random() -- Przepalenie generatora
    
    Init.loadRequired()
end

function love.update(dt)
    -- Używamy Player (z wielkiej litery), bo tak jest w Init.lua
    if Player.time > 0 then
        Player.time = Player.time - dt
    else
        Player.time = 0
    end
end

function love.keypressed(key)
	if key == "r" then
	    Init.loadRequired()
	    return -- Kończymy funkcję, żeby nie przetwarzać ruchu w tej samej klatce
	end
    -- Blokada sterowania, gdy czas się skończy
    if Player.time <= 0 then return end

    -- Ruch (używamy Settings.size zamiast #grid dla stabilności)
    if key == "w" and Player.posY > 1 then Player.posY = Player.posY - 1
    elseif key == "s" and Player.posY < Settings.size then Player.posY = Player.posY + 1
    elseif key == "a" and Player.posX > 1 then Player.posX = Player.posX - 1
    elseif key == "d" and Player.posX < Settings.size then Player.posX = Player.posX + 1
    end

    -- Akcja spacji
    if key == "space" then
        if Grid.data[Player.posY][Player.posX] == "x" then
            Grid.data[Player.posY][Player.posX] = "*"
            Player.points = Player.points + 1  
            Player.time = Player.time + Settings.pointReward
            Grid.spawnPoint(Player, Settings.size)
        else
            Player.time = Player.time - Settings.missPenalty
        end
    end
end

function love.draw()
    local gridSize = Settings.size * Settings.cellSize
    local startX = (love.graphics.getWidth() - gridSize) / 2
    local startY = (love.graphics.getHeight() - gridSize) / 2

    if Player.time > 0 then
        -- RYSOWANIE SIATKI
        for i = 1, #Grid.data do
            for j = 1, #Grid.data[i] do
                local cell = Grid.data[i][j]
                local display = ""

                if i == Player.posY and j == Player.posX then
                    display = (cell == "x") and "[x]" or "[*]"
                else
                    display = " " .. cell .. " "
                end
                
                love.graphics.print(display, startX + (j-1)*Settings.cellSize, startY + (i-1)*Settings.cellSize, 0, 2, 2)
            end
        end
    else
        -- EKRAN KOŃCOWY
        love.graphics.printf("KONIEC GRY\nWynik: " .. Player.points, 0, love.graphics.getHeight()/2, love.graphics.getWidth()/2, "center", 0, 2, 2)
    end

    -- HUD
    love.graphics.print("Czas: " .. math.ceil(Player.time), 20, 20)
    love.graphics.print("Punkty: " .. Player.points, 20, 40)
end
