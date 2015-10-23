local stateMenu = g.State:new()

function stateMenu:update(dt)
	if love.keyboard.isDown('return') then g.statePlay:load() end
end

function stateMenu:draw()
	if (g.lastscore) then
		love.graphics.setColor(255, 200, 200)
		love.graphics.print("GAME OVER", 80, 30)
		love.graphics.setColor(255, 240, 240)
		love.graphics.print("You lasted", 80, 55)
		love.graphics.print(string.format("%.4f", g.lastscore), 93, 70)
		love.graphics.print("Seconds!", 85, 85)
		love.graphics.setColor(230, 255, 230)
		if g.highscore then
			if g.highscore == g.lastscore then
				if g.highscore then love.graphics.print("NEW Highscore: " .. string.format("%.4f", g.highscore), 50, 110) end
			else
				if g.highscore then love.graphics.print("Highscore: " .. string.format("%.4f", g.highscore), 65, 110) end
			end
		end
	end

	love.graphics.setColor(200, 255, 200)
	love.graphics.print("Press ENTER to start.", 55, 140)
end

return stateMenu
