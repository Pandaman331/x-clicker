local Init = {}

function Init.loadRequired()
	love.graphics.setDefaultFilter("nearest", "nearest")
	math.randomseed(os.time())
	math.random()

    -- Wczytujemy moduły do zmiennych globalnych (z wielkiej litery)
    Settings = require("core/settings")
    Grid = require("core/grid")
    Player = require("core/player")
    KeyManagment = require("core/keyManagment")
    Renderer = require("core/renderer")
    Timer = require("core.timer")

    Timer.start()

    Grid.generate(Settings.size)
    Player.init(1, 1, Settings.startTime)

    for i = 1, Settings.initialPoints do
        Grid.spawnPoint(Player, Settings.size)
    end
end

return Init
