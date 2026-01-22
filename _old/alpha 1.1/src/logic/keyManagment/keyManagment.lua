local KeyManagment = {}
local handleMovement = require("src/logic/keyManagment/func/handleMovement")
local handleCollection = require("src/logic/KeyManagment/func/handleCollection")

function KeyManagment.keypressed(key)
  if key == Settings.keyBind.restart then
    Init.loadRequired()
    return
  end

  if Player.time <= 0 then return end

  handleMovement(key)


  if key == Settings.keyBind.collect then
    handleCollection()
  end
end

return KeyManagment
