local KeyManagment = {}

KeyManagment.combo = 0

function KeyManagment.keypressed(key)
  if key == Settings.keyBind.restart then
    Init.loadRequired()
    return
  end

  if Player.time <= 0 then return end

  if key == Settings.keyBind.moveUp and Player.posY > 1 then
    Player.posY = Player.posY - 1
  elseif key == Settings.keyBind.moveDown and Player.posY < Settings.gameplay.gridSize then
    Player.posY = Player.posY + 1
  elseif key == Settings.keyBind.moveLeft and Player.posX > 1 then
    Player.posX = Player.posX - 1
  elseif key == Settings.keyBind.moveRight and Player.posX < Settings.gameplay.gridSize then
    Player.posX = Player.posX + 1
  end


  if key == Settings.keyBind.collect then
    if Grid.data[Player.posY][Player.posX] == "x" then
      Grid.data[Player.posY][Player.posX] = "*"
      Grid.spawnPoint(Player, Settings.gameplay.gridSize)

      if KeyManagment.combo < 9 then
        Player.points = Player.points + Settings.gameplay.pointReward
        Player.time = Player.time + Settings.gameplay.timeReward
      else
        Player.points = Player.points + Settings.gameplay.comboPointReward
        Player.time = Player.time + Settings.gameplay.comboTimeReward
        KeyManagment.combo = -1
      end
      KeyManagment.combo = KeyManagment.combo + 1
    else
      Player.time = Player.time - Settings.gameplay.penaltyTime
      KeyManagment.combo = 0
    end
  end
end

return KeyManagment
