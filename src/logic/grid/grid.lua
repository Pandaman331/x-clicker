local Grid = { data = {} }

function Grid.generate(size)
  Grid.data = {}
  for i = 1, size do
    Grid.data[i] = {}
    for j = 1, size do
      Grid.data[i][j] = 1
    end
  end
end

function Grid.spawnPoint(Player, size)
  local placed = false
  while not placed do
    local randomX = math.random(1, size)
    local randomY = math.random(1, size)
    if not (randomX == Player.posX and randomY == Player.posY) and Grid.data[randomY][randomX] == 1 then
      Grid.data[randomY][randomX] = 201
      placed = true
    end
  end
end

return Grid
