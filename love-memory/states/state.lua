local state = {}

function state:update() end

function state:draw() end

function state:load()
	g.state = self
end

function state:new(o)
	o = o or {}
	setmetatable(o, {__index = self})
	return o
end

return state
