local Player = {
  posX = 1,
  posY = 1,
  points = 0,
  time = 0,
  combo = 0
}

function Player.init(x, y, time)
  Player.posX = x
  Player.posY = y
  Player.points = 0
  Player.time = time
  Player.combo = 0
end

return Player
