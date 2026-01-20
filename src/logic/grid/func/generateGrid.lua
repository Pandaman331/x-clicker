local data = {}

local function generateGrid(gridSize)
  for row = 1, gridSize do
    data[row] = {}

    for col = 1, gridSize do
      data[row][col] = 1
    end
  end
end

return generateGrid, data
