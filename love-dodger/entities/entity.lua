local entity = {}

function entity:update(dt) end

function entity:draw()
	love.graphics.rectangle( "fill", self.x, self.y, 10, 10 )
end

function entity:init()
	self.speed = 60 -- Pixels a second

	self.x = 0
	self.y = 0
end

return entity
