local Timer = {}

local timerIsEnabled = false

function Timer.start()
	timerIsEnabled = true
	return
end

function Timer.stop()
	timerIsEnabled = false
	Player.time = 0
	return
end

function Timer.timer(dt)
     if timerIsEnabled == true then
         if Player.time > 0 then
             Player.time = Player.time - dt
         end
     end
end

return Timer
