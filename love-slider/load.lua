function love.load()
	love.window.setMode(500, 500)

	game.cards = {}

	local deck = {
		{x=3,y=1,number=1},
		{x=3,y=1,number=2},
		{x=4,y=1,number=3},
		{x=4,y=1,number=4},
		{x=5,y=1,number=5},
		{x=5,y=1,number=6},
		{x=6,y=1,number=7},
		{x=6,y=1,number=8},
		{x=3,y=2,number=9},
		{x=3,y=2,number=10},
		{x=4,y=2,number=11},
		{x=4,y=2,number=12},
		{x=5,y=2,number=13},
		{x=5,y=2,number=14},
		{x=6,y=2,number=15}
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

	math.randomseed(os.time())

	while table.getn(deck) > 0 do

		local i = math.random(1, table.getn(deck))
		local p = math.random(1, table.getn(positions))
		local sliderTile = SliderTile:new( Sprite:new(deck[i].x, deck[i].y), positions[p].x, positions[p].y, deck[i].number)
		table.insert(game.cards, sliderTile)
		game.positions[positions[p].x][positions[p].y] = sliderTile
		table.remove(deck, i)
		table.remove(positions, p)
	end
	game.blank = {x=positions[1].x,y=positions[1].y}
	game.positions[positions[1].x][positions[1].y] = {number=0}

	love.graphics.setBackgroundColor(50, 30, 10)
	game.changeState(g.statePlay)
end
