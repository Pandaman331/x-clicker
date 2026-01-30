local Renderer = {}

function Renderer.draw()
  local startX = (love.graphics.getWidth() - (Settings.gameplay.gridSize * Settings.graphics.cellSize)) / 2
  local startY = (love.graphics.getHeight() - (Settings.gameplay.gridSize * Settings.graphics.cellSize)) / 2

  if Player.time > 0 then
    for i = 1, #Grid.data do
      for j = 1, #Grid.data[i] do
        local drawX = startX + (j - 1) * Settings.graphics.cellSize
        local drawY = startY + (i - 1) * Settings.graphics.cellSize



        local cell = Grid.data[i][j]
        local isPlayer = (i == Player.posY and j == Player.posX)
        local hasEntity = cell.entity

        if isPlayer and hasEntity == 1 then
          love.graphics.print("[x]", drawX, drawY, 0, 2, 2)
        elseif hasEntity == 1 then
          love.graphics.print(" x ", drawX, drawY, 0, 2, 2)
        elseif isPlayer then
          love.graphics.print("[*]", drawX, drawY, 0, 2, 2)
        else
          love.graphics.print(" * ", drawX, drawY, 0, 2, 2)
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
