-- Entity abstract
local Entity = {}

function Entity:update() end

function Entity:draw() end

function Entity:setX(x)
	self.x = x
end

function Entity:setY(y)
	self.y = y
end

return Entity
