local Timer = {}

local timerIsEnabled = false

function Timer.start()
  timerIsEnabled = true
end

function Timer.stop()
  timerIsEnabled = false
  Player.time = 0
end

function Timer.timer(dt)
  if timerIsEnabled == true then
    if Player.time > 0 then
      Player.time = Player.time - dt
    end
  end
end

return Timer
