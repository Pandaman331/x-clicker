Loader = require("src.core.loader.init")

function love.load()
  Loader.init()
  local sM = Loader.getModule({ "stateManager" })

  sM.switch("gameplay")
  sM.currentState.init()
end

function love.update(dt)
  Loader.update(dt)
end

function love.draw()
  Loader.draw()
end
