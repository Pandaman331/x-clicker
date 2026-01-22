local data = {}

local function generateGrid(gridSize)
  for row = 1, gridSize do
    data[row] = {}

    for col = 1, gridSize do
      data[row][col] = {
        tile = 1,
        wall = 0,
        entity = 0
      }
    end
  end
end

return generateGrid, data
