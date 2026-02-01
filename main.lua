local map = {}
local width, height = 30, 30
local player = { x = 0, y = 0 }
local Assets = {}

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")

  -- Twoje pliki assets
  Assets.floor = love.graphics.newImage("assets/tile.png")
  Assets.player = love.graphics.newImage("assets/player.png")
  Assets.crystal = love.graphics.newImage("assets/crystal.png")

  math.randomseed(os.time())
  generateLevel()
end

function generateLevel()
  -- 1. Generowanie bazy (70% dla lepszego zagęszczenia w izometrii)
  for y = 1, height do
    map[y] = {}
    for x = 1, width do
      if x == 1 or x == width or y == 1 or y == height then
        map[y][x] = "#"
      else
        map[y][x] = (math.random() < 0.70) and "." or "#"
      end
    end
  end

  -- 2. Wygładzanie grot (CA)
  for i = 1, 5 do
    local newMap = {}
    for y = 1, height do
      newMap[y] = {}
      for x = 1, width do
        if x == 1 or x == width or y == 1 or y == height then
          newMap[y][x] = "#"
        else
          local neighbors = 0
          for ny = -1, 1 do
            for nx = -1, 1 do
              if not (nx == 0 and ny == 0) and map[y + ny][x + nx] == "." then
                neighbors = neighbors + 1
              end
            end
          end
          newMap[y][x] = (neighbors >= 5) and "." or "#"
        end
      end
    end
    map = newMap
  end

  -- 3. Czyszczenie i sianie kryształów (*)
  cleanupDisconnected()

  for y = 1, height do
    for x = 1, width do
      if map[y][x] == "." and math.random() < 0.025 then
        map[y][x] = "*" -- Postawienie kryształu
      end
    end
  end

  findSpawn()
end

function cleanupDisconnected()
  local visited = {}
  local caves = {}
  for y = 1, height do
    for x = 1, width do
      if map[y][x] == "." and not visited[y .. "_" .. x] then
        local current = {}
        local q = { { x = x, y = y } }
        visited[y .. "_" .. x] = true
        while #q > 0 do
          local p = table.remove(q, 1)
          table.insert(current, p)
          for _, d in ipairs({ { 0, 1 }, { 0, -1 }, { 1, 0 }, { -1, 0 } }) do
            local nx, ny = p.x + d[1], p.y + d[2]
            if map[ny] and (map[ny][nx] == "." or map[ny][nx] == "*") and not visited[ny .. "_" .. nx] then
              visited[ny .. "_" .. nx] = true
              table.insert(q, { x = nx, y = ny })
            end
          end
        end
        table.insert(caves, current)
      end
    end
  end
  if #caves > 1 then
    table.sort(caves, function(a, b) return #a > #b end)
    for i = 2, #caves do
      for _, p in ipairs(caves[i]) do map[p.y][p.x] = "#" end
    end
  end
end

function findSpawn()
  for y = 1, height do
    for x = 1, width do
      if map[y][x] == "." then
        player.x, player.y = x, y
        return
      end
    end
  end
end

function love.draw()
  local w, h = 32, 32
  local offsetX = love.graphics.getWidth() / 2
  local offsetY = 100

  -- Pętla renderowania izometrycznego
  for y = 1, height do
    for x = 1, width do
      local screenX = (x - y) * (w / 2) + offsetX
      local screenY = (x + y) * (h / 4) + offsetY

      local tile = map[y][x]

      -- 1. Zawsze rysuj podłogę pod zasobem i pod graczem
      if tile == "." or tile == "*" then
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(Assets.floor, screenX, screenY)
      end

      -- 2. Rysuj kryształ
      if tile == "*" then
        -- Przesunięcie o (8, 0) lub (4, -4) zależnie od rozmiaru Twojego kryształu
        love.graphics.draw(Assets.crystal, screenX + 8, screenY - 8)
      end

      -- 3. Rysuj gracza
      if x == player.x and y == player.y then
        love.graphics.draw(Assets.player, screenX + 4, screenY - 12)
      end
    end
  end
end

function love.keypressed(key)
  local nx, ny = player.x, player.y
  if key == "w" then
    ny = ny - 1
  elseif key == "s" then
    ny = ny + 1
  elseif key == "a" then
    nx = nx - 1
  elseif key == "d" then
    nx = nx + 1
  elseif key == "space" then
    generateLevel()
  end

  -- Kolizja: można wejść na podłogę i na kryształ
  if map[ny] and (map[ny][nx] == "." or map[ny][nx] == "*") then
    player.x, player.y = nx, ny
  end
end
