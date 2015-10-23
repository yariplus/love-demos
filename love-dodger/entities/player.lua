local player = {super = g.Entity}

setmetatable(player, {__index = player.super})

function player:update(dt)
	if love.keyboard.isDown('up') then self.y = self.y - self.speed*dt end
	if love.keyboard.isDown('down') then self.y = self.y + self.speed*dt end
	if love.keyboard.isDown('left') then self.x = self.x - self.speed*dt end
	if love.keyboard.isDown('right') then self.x = self.x + self.speed*dt end
end

function player:init()
	self.super.init(self)

	self.speed = 80

	self.x = 115
    self.y = 280
end

function player:draw()
	love.graphics.setColor(0, 255, 0)
	self.super.draw(self)
end

function player:new(o)
	o = o or {}
	setmetatable(o, {__index = self})
	o.init(o)
	return o
end

return player
