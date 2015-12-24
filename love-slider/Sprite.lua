local Sprite = {}

Sprite.batch = assets.SpriteBatches.cards

Sprite.quad = love.graphics.newQuad( 0, 0, 64, 64, Sprite.batch:getImage():getWidth(), Sprite.batch:getImage():getHeight() )

Sprite.tx = 1
Sprite.ty = 1
Sprite.x = 0
Sprite.y = 0
Sprite.r = 0
Sprite.sx = 1
Sprite.sy = 1
Sprite.ox = 0
Sprite.oy = 0
Sprite.kx = 0
Sprite.ky = 0

function Sprite:draw()
end

function Sprite:setPos(x, y)
	self.x = x
	self.y = y
	self.batch:set(self.id, SliderTile.blankQuad, x, y)
end

function Sprite:new(tx, ty)
	local o = {}
	o.tx = tx
	o.ty = ty
	setmetatable(o, {__index = self})
	o.quad = love.graphics.newQuad( (o.tx-1)*64, (o.ty-1)*64, 64, 64, Sprite.batch:getImage():getWidth(), Sprite.batch:getImage():getHeight() )
	o.id = o.batch:add( o.quad, o.x, o.y )
	return o
end

return Sprite
