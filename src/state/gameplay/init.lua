local gameplay = {}

function gameplay.init()
  Map = {
    width = 12,
    height = 15,
    layers = {
      floor = {},
      objects = {}
    }
  }

  Player = {
    x = 1,
    y = 1
  }

  for y = 1, Map.height do
    Map.layers.floor[y] = {}
    Map.layers.objects[y] = {}
    for x = 1, Map.width do
      Map.layers.floor[y][x] = "ground"
      Map.layers.objects[y][x] = ""
    end
  end

  Tiles = {
    ground = love.graphics.newImage("assets/tile.png"),
    sprite = love.graphics.newImage("assets/player.png")
  }
end

function gameplay.update(dt)

end

function gameplay.draw()
  local w = 32 -- Szerokość kafelka z Twojej specyfikacji
  local h = 32 -- Wysokość kafelka (kwadrat)

  local offsetX = love.graphics.getWidth() / 2
  local offsetY = 50

  for y = 1, Map.height do
    for x = 1, Map.width do
      -- Implementacja macierzy z obrazka:
      -- screenX = (x * 0.5w) + (y * -0.5w)
      -- screenY = (x * 0.25h) + (y * 0.25h)
      local screenX = (x * 0.5 * w) - (y * 0.5 * w) + offsetX
      local screenY = (x * 0.25 * h) + (y * 0.25 * h) + offsetY

      local tileId = Map.layers.floor[y][x]

      if Tiles[tileId] then
        -- Rysujesz czysty, kwadratowy kafelek 32x32
        love.graphics.draw(Tiles[tileId], screenX, screenY)
      end

      -- Renderowanie gracza
      if y == Player.y and x == Player.x then
        -- Korekta dla sprite'a 24x8, aby stał na środku rombu
        love.graphics.draw(Tiles.sprite, screenX + 8, screenY - 16)
      end
    end
  end
end

return gameplay
