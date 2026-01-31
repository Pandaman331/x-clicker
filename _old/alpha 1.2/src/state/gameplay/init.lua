local gameplay = {}

function gameplay.init()
  Map = {
    width = 12,
    height = 8,
    layers = {
      floor = {},
      objects = {}
    }
  }

  Player = {
    x = 12,
    y = 8
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
  local offsetX = love.graphics.getWidth() / 2
  local offsetY = 50
  for y = 1, Map.height do
    for x = 1, Map.width do
      local screenX = (x * 16) - (y * 16) + offsetX
      local screenY = (x * 8) + (y * 8) + offsetY

      local tileId = Map.layers.floor[y][x]

      if Tiles[tileId] then
        love.graphics.draw(Tiles[tileId], screenX, screenY)
      end

      if y == Player.y and x == Player.x then
        love.graphics.draw(Tiles.sprite, screenX + 8, screenY - 16)
      end
    end
  end
end

function love.keypressed(key)
  local dx, dy = 0, 0

  if key == "w" then
    dy = -1
  elseif key == "s" then
    dy = 1
  elseif key == "a" then
    dx = -1
  elseif key == "d" then
    dx = 1
  end

  local targetX = Player.x + dx
  local targetY = Player.y + dy

  if targetX >= 1 and targetX <= Map.width and targetY >= 1 and targetY <= Map.height then
    Player.x = targetX
    Player.y = targetY
  end
end

return gameplay
