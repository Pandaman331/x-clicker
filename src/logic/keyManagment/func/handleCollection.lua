local function handleCollection()
  if Grid.data[Player.posY][Player.posX] == "x" then
    Grid.data[Player.posY][Player.posX] = "*"
    Grid.spawnPoint(Player, Settings.gameplay.gridSize)

    if Player.combo < 9 then
      Player.points = Player.points + Settings.gameplay.pointReward
      Player.time = Player.time + Settings.gameplay.timeReward
    else
      Player.points = Player.points + Settings.gameplay.comboPointReward
      Player.time = Player.time + Settings.gameplay.comboTimeReward
      Player.combo = -1
    end
    Player.combo = Player.combo + 1
  else
    Player.time = Player.time - Settings.gameplay.penaltyTime
    Player.combo = 0
  end
end

return handleCollection
