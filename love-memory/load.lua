function love.load()
	love.window.setMode(500, 500)

	game.cards = {}

	local deck = {
		{x=3,y=1},
		{x=3,y=1},
		{x=4,y=1},
		{x=4,y=1},
		{x=5,y=1},
		{x=5,y=1},
		{x=6,y=1},
		{x=6,y=1},
		{x=3,y=2},
		{x=3,y=2},
		{x=4,y=2},
		{x=4,y=2},
		{x=5,y=2},
		{x=5,y=2},
		{x=6,y=2},
		{x=6,y=2}
	}

	local positions = {
		{x=1,y=1},
		{x=2,y=1},
		{x=3,y=1},
		{x=4,y=1},
		{x=1,y=2},
		{x=2,y=2},
		{x=3,y=2},
		{x=4,y=2},
		{x=1,y=3},
		{x=2,y=3},
		{x=3,y=3},
		{x=4,y=3},
		{x=1,y=4},
		{x=2,y=4},
		{x=3,y=4},
		{x=4,y=4}
	}

	local xo = -24
	local yo = -24

	math.randomseed(os.time())

	while table.getn(deck) > 0 do
		local i = math.random(1, table.getn(deck))
		local p = math.random(1, table.getn(positions))
		table.insert(game.cards, Card:new( Sprite:new(deck[i].x, deck[i].y), xo + positions[p].x * 96, yo + positions[p].y * 96 ))
		table.remove(deck, i)
		table.remove(positions, p)
	end

	love.graphics.setBackgroundColor(50, 30, 10)
	game.changeState(g.stateMenu)
end
