local Renderer = {}

function Renderer.draw()
  startX = (love.graphics.getWidth() - (Settings.gameplay.gridSize * Settings.graphics.cellSize)) / 2
  startY = (love.graphics.getHeight() - (Settings.gameplay.gridSize * Settings.graphics.cellSize)) / 2

  if Player.time > 0 then
    for i = 1, #Grid.data do
      for j = 1, #Grid.data[i] do
        local cell = Grid.data[i][j]
        local display = ""

        if i == Player.posY and j == Player.posX then
          display = (cell == "x") and "[x]" or "[*]"
        else
          display = " " .. cell .. " "
        end
        love.graphics.print(display, startX + (j - 1) * Settings.graphics.cellSize,
          startY + (i - 1) * Settings.graphics.cellSize, 0, 2, 2)
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
