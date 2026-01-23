local gameplay = {}

function gameplay.init()
  Map = {
    width = 12,
    height = 15,
    data = {}
  }

  for y = 1, Map.height do
    Map.data[y] = {}
    for x = 1, Map.width do
      Map.data[y][x] = "*"
    end
  end
end

function gameplay.update(dt)

end

function gameplay.draw()
  for y = 1, Map.height do
    for x = 1, Map.width do
      love.graphics.print(Map.data[y][x], x * 20, y * 20, 0, 2, 2)
    end
  end
end

return gameplay
