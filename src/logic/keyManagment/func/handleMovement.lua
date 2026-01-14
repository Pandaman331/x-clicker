local function handleMovement(key)
  if key == Settings.keyBind.moveUp and Player.posY > 1 then
    Player.posY = Player.posY - Settings.gameplay.moveBy
  elseif key == Settings.keyBind.moveDown and Player.posY < Settings.gameplay.gridSize then
    Player.posY = Player.posY + Settings.gameplay.moveBy
  elseif key == Settings.keyBind.moveLeft and Player.posX > 1 then
    Player.posX = Player.posX - Settings.gameplay.moveBy
  elseif key == Settings.keyBind.moveRight and Player.posX < Settings.gameplay.gridSize then
    Player.posX = Player.posX + Settings.gameplay.moveBy
  end
end

return handleMovement
