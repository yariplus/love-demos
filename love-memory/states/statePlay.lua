local statePlay = g.State:new()

function statePlay:update(dt)
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
