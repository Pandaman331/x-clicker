function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	math.randomseed(os.time())
	
	local size = 5
	pointsAmount = 3

	grid = {}

	player = {}
	player.posX = 1
	player.posY = 1
	player.points = 0

	for i = 1, size do
		grid[i] = {}
		for j =1, size do 
			grid[i][j] = "*"
		end
	end

	 placed = 0

	while placed < pointsAmount do
	        local randomX = math.random(1, size)
	        local randomY = math.random(1, size)
	
	        if not (randomX == player.posX and randomY == player.posY) and grid[randomY][randomX] ~= "x" then
	            grid[randomY][randomX] = "x"
	            placed = placed + 1
	        end
	 end
end

function love.update(dt)
	function love.keypressed(key)
	    if key == "w" and player.posY > 1 then
	        player.posY = player.posY - 1
	    elseif key == "s" and player.posY < #grid then
	        player.posY = player.posY + 1
	    elseif key == "a" and player.posX > 1 then
	        player.posX = player.posX - 1
	    elseif key == "d" and player.posX < #grid[1] then
	        player.posX = player.posX + 1
	    end
	
	   if key == "space" then
	        if grid[player.posY][player.posX] == "x" then
	            grid[player.posY][player.posX] = "*" -- Usunięcie zebranego punktu
	            player.points = player.points + 1    -- Dodanie do licznika
	            
	            spawnPoint() -- KLUCZ: Natychmiastowe losowanie nowego punktu
	        end
	    end
	end
end

function love.draw()
	local cellSize = 30 -- Odstęp między znakami
	    local gridSize = #grid * cellSize -- Całkowita szerokość/wysokość siatki w pikselach
	    
	    -- Obliczamy punkt startowy (lewy górny róg siatki), by całość była wycentrowana
	    local startX = (love.graphics.getWidth() - gridSize) / 2
	    local startY = (love.graphics.getHeight() - gridSize) / 2
	
	    for i = 1, #grid do
	        for j = 1, #grid[i] do
	            local cell = grid[i][j]
	            local display = ""
	
	            -- Logika wyświetlania (tak jak ustaliliśmy wcześniej)
	            if i == player.posY and j == player.posX then
	                display = (cell == "x") and "[x]" or "[*]"
	            else
	                display = " " .. cell .. " "
	            end
	
	            -- Rysujemy z uwzględnieniem startX i startY
	            love.graphics.print(display, startX + (j - 1) * cellSize, startY + (i - 1) * cellSize, 0, 2, 2)
	        end
	    end
	
	    -- HUD (punkty) rysujemy niezależnie od centrowania siatki
	    love.graphics.print("Punkty: " .. player.points, 10, 10)
end

function spawnPoint()
    local size = #grid -- zakładając, że mapa jest kwadratem
    local placed = false
    
    while not placed do
        local rX = math.random(1, size)
        local rY = math.random(1, size)

        -- Sprawdzamy, czy miejsce jest wolne (nie ma gracza i nie ma już x)
        if not (rX == player.posX and rY == player.posY) and grid[rY][rX] == "*" then
            grid[rY][rX] = "x"
            placed = true
        end
    end
end
