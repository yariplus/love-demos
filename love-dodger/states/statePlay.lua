local statePlay = g.State:new()

function statePlay:update(dt)
	if (math.random(1, 10) == 1) then
		g.entities[#g.entities+1] = g.Enemy:new()
	end

	for i=#g.entities,1,-1 do
	    if g.entities[i].dead then
	        table.remove(g.entities, i)
	    else
	    	g.entities[i]:update(dt)
	    end
	end

	if g.player.dead then
		if g.highscore then
			if g.highscore < g.lastscore then
				g.highscore = g.lastscore
			end
		else
			g.highscore = g.lastscore
		end
		g.stateMenu:load()
	else
		g.lastscore = g.lastscore + dt
	end
end

function statePlay:draw()
	for i=1,#g.entities do
		g.entities[i]:draw()
	end
end

function statePlay:load()
	g.state = self
	g.entities = {}
	g.lastscore = 0
	g.player = g.Player:new()
	table.insert(g.entities, g.player)
end

return statePlay
