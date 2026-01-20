local Renderer = {}

function Renderer.draw()
  local startX = (love.graphics.getWidth() - (Settings.gameplay.gridSize * Settings.graphics.cellSize)) / 2
  local startY = (love.graphics.getHeight() - (Settings.gameplay.gridSize * Settings.graphics.cellSize)) / 2

  if Player.time > 0 then
    for i = 1, #Grid.data do
      for j = 1, #Grid.data[i] do
        if i == Player.posY and j == Player.posX then
          if Grid.data[i][j] == 201 then
            love.graphics.print("[x]", startX + (j - 1) * Settings.graphics.cellSize,
              startY + (i - 1) * Settings.graphics.cellSize, 0, 2, 2)
          else
            love.graphics.print("[*]", startX + (j - 1) * Settings.graphics.cellSize,
              startY + (i - 1) * Settings.graphics.cellSize, 0, 2, 2)
          end
        elseif Grid.data[i][j] == 1 then
          love.graphics.print(" * ", startX + (j - 1) * Settings.graphics.cellSize,
            startY + (i - 1) * Settings.graphics.cellSize, 0, 2, 2)
        else
          love.graphics.print(" x ", startX + (j - 1) * Settings.graphics.cellSize,
            startY + (i - 1) * Settings.graphics.cellSize, 0, 2, 2)
        end
      end
    end
  else
    Timer.stop()
    love.graphics.printf("Game Over\nScore: " .. Player.points, 0, love.graphics.getHeight() / 2,
      love.graphics.getWidth() / 2, "center", 0, 2, 2)
  end

  love.graphics.print("Time: " .. math.ceil(Player.time), 20, 20)
  love.graphics.print("Points: " .. Player.points, 20, 40)
  love.graphics.print("Combo: " .. Player.combo, 20, 60)
end

return Renderer
