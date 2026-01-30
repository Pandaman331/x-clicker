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
  for y = 1, Map.height do
    for x = 1, Map.width do
      local tileId = Map.layers.floor[y][x]

      if Tiles[tileId] then
        love.graphics.draw(Tiles[tileId], x * 32, y * 32)
      end

      if y == Player.y and x == Player.x then
        love.graphics.draw(Tiles.sprite, x * 32 + 8, y * 32 + 4)
      end
    end
  end
end

return gameplay
