local KeyManagment = {}

function KeyManagment.keypressed(key)
	if key == "r" then
		Init.loadRequired()
		return
	end

	if Player.time <= 0 then return end

	if key == "w" and Player.posY > 1 then Player.posY = Player.posY -1
	elseif key == "s" and Player.posY < Settings.size then Player.posY = Player.posY + 1
	elseif key == "a" and Player.posX > 1 then Player.posX = Player.posX -1
	elseif key == "d" and Player.posX < Settings.size then Player.posX = Player.posX + 1
	end

	if key == "space" then
		if Grid.data[Player.posY][Player.posX] == "x" then
			Grid.data[Player.posY][Player.posX] = "*"
			Player.points = Player.points + 1
			Player.time = Player.time + Settings.pointReward
			Grid.spawnPoint(Player, Settings.size)
		else
			Player.time = Player.time - Settings.missPenalty
		end	
	end
end

return KeyManagment
