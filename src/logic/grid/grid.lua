local Grid = { data = {} }

function Grid.generate(size)
  Grid.data = {}
  for i = 1, size do
    Grid.data[i] = {}
    for j = 1, size do
      Grid.data[i][j] = "*"
    end
  end
end

function Grid.spawnPoint(Player, size)
  local placed = false
  while not placed do
    local rX = math.random(1, size)
    local rY = math.random(1, size)
    if not (rX == Player.posX and rY == Player.posY) and Grid.data[rY][rX] == "*" then
      Grid.data[rY][rX] = "x"
      placed = true
    end
  end
end

return Grid
