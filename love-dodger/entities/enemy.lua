local enemy = {super = g.Entity}

setmetatable(enemy, {__index = enemy.super})

function enemy:update(dt)
	self.y = self.y + dt * self.speed -- Move down
	if self.y > 320 then
		self.dead = true
	else
		if	self.x < g.player.x + 10 and
			self.x + 10 > g.player.x and
			self.y < g.player.y + 10 and
			self.y + 10 > g.player.y then
			g.player.dead = true
		end
	end
end

function enemy:init()
	self.super.init(self)

	self.speed = 120

	self.x = math.random(10, 230)
    self.y = 0 - math.random(20, 640)
end

function enemy:draw()
	love.graphics.setColor(255, 0, 0)

	self.super.draw(self)
end

function enemy:new(o)
	o = o or {}
	setmetatable(o, {__index = self})
	o.init(o)
	return o
end

return enemy
