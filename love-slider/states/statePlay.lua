local statePlay = g.State:new()

function statePlay:update(dt)
end

function statePlay:draw()
	for i=1,#game.cards do
		game.cards[i]:draw()
	end
	if self.won then
		love.graphics.setColor(255, 255, 255)
		love.graphics.print("YOU ARE WINNER", 190, 25)
	end
end

function statePlay:load()
	self.won = false
end

return statePlay
