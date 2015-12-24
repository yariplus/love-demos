require "game"

g = {}
g.entities = {}

g.State     = require "states/state"
g.statePlay = require "states/statePlay"
g.stateMenu = require "states/stateMenu"

require "load"

function love.update(dt)
	game.tick = game.tick + 1
	game.state:update(dt)
	if game.matching then
		if game.matching + 40 < game.tick then
			game.match()
		end
	end
end

function love.draw()
	love.graphics.clear()
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(assets.SpriteBatches.cards)
	game.state:draw()
end

function love.mousepressed(x, y, button)
	for i=1,#game.cards do
		game.cards[i]:click(x, y, button)
	end
	if game.positions[1][1].number == 1 and
		game.positions[2][1].number == 2 and
		game.positions[3][1].number == 3 and
		game.positions[4][1].number == 4 and
		game.positions[1][2].number == 5 and
		game.positions[2][2].number == 6 and
		game.positions[3][2].number == 7 and
		game.positions[4][2].number == 8 and
		game.positions[1][3].number == 9 and
		game.positions[2][3].number == 10 and
		game.positions[3][3].number == 11 and
		game.positions[4][3].number == 12 and
		game.positions[1][4].number == 13 and
		game.positions[2][4].number == 14 and
		game.positions[3][4].number == 15 then
		state.won = true
	end
end
