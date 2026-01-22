function love.conf(t)
    t.version = "11.5"
    t.identity = "x-clicker"

    t.window.title = "x-clicker alpha 1.1"
    t.window.width = 800
    t.window.height = 600
    t.window.resizable = true
    t.window.vsync = 1

    t.modules.joystick = false
    t.modules.physics = false
end
