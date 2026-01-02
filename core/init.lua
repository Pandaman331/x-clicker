local Init = {}

function Init.loadRequired()
    -- Wczytujemy moduły do zmiennych globalnych (z wielkiej litery)
    Settings = require("core/Settings")
    Grid = require("core/Grid")
    Player = require("core/Player")

    Grid.generate(Settings.size)
    Player.init(1, 1, Settings.startTime)

    for i = 1, Settings.initialPoints do
        Grid.spawnPoint(Player, Settings.size)
    end
end

return Init
