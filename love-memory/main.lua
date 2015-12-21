require "game"

g = {}
g.entities = {}

g.State     = require "states/state"
g.statePlay = require "states/statePlay"
g.stateMenu = require "states/stateMenu"

require "load"

function love.update(dt)
	game.tick = game.tick + 1
	g.state:update(dt)
	if game.matching then
		if game.matching + 40 < game.tick then
			game.match()
		end
	end
end

function love.draw()
	love.graphics.clear() g.state:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(assets.SpriteBatches.cards)
	getmetatable(Card).__index.setY(Card, 10)
end

function love.mousepressed(x, y, button)
	for i=1,#game.cards do
		game.cards[i]:click(x, y, button)
	end
end
