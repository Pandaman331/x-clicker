Loader = require("src.core.loader.init")

function love.load()
  Loader.init()
  Loader.getModule({ "test" })
end

function love.update(dt)
  Loader.update(dt)
end

function love.draw()
  Loader.draw()
end
