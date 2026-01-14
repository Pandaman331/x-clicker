local Init = {}

function Init.loadRequired()
  love.graphics.setDefaultFilter("nearest", "nearest")
  math.randomseed(os.time())
  math.random()

  Settings = {
    keyBind = require("config/default/keyBind"),
    gameplay = require("config/default/gameplay"),
    graphics = require("config/default/graphics")
  }
  Grid = require("src/logic/grid/grid")
  Player = require("src/objects/player")
  KeyManagment = require("src/logic/keyManagment")
  Renderer = require("src/ui/renderer")
  Timer = require("src/logic/timer")

  KeyManagment.combo = 0
  Timer.start()

  Grid.generate(Settings.gameplay.gridSize)
  Player.init(1, 1, Settings.gameplay.initialTime)

  for i = 1, Settings.gameplay.initialPoints do
    Grid.spawnPoint(Player, Settings.gameplay.gridSize)
  end
end

return Init
