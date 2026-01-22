Init = require("src/core/init")

function love.load()
  Init.loadRequired()
end

function love.update(dt)
  Timer.timer(dt)
end

function love.keypressed(key)
  KeyManagment.keypressed(key)
end

function love.draw()
  Renderer.draw()
end
