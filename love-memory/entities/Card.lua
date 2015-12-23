local Entity = require "entities/Entity"

local Card = {super=Entity}

setmetatable(Card, {__index = Entity})

Card.blankQuad = love.graphics.newQuad(0, 0, 64, 64, 640, 640)

function Card:update(dt) end

function Card:flip()
	if self.side == "front" then
		self.sprite.batch:set( self.sprite.id, Card.blankQuad, self.sprite.x, self.sprite.y )
		self.side = "back"
	else
		self.sprite.batch:set( self.sprite.id, self.sprite.quad, self.sprite.x, self.sprite.y )
		self.side = "front"
	end

	if game.flipped then
		game.matching = game.tick
		game.match = function ()
			if game.flipped.sprite.tx == self.sprite.tx and game.flipped.sprite.ty == self.sprite.ty then
			else
				self.sprite.batch:set( self.sprite.id, Card.blankQuad, self.sprite.x, self.sprite.y )
				self.side = "back"
				game.flipped.sprite.batch:set( game.flipped.sprite.id, Card.blankQuad, game.flipped.sprite.x, game.flipped.sprite.y )
				game.flipped.side = "back"
			end
			game.flipped = nil
			game.matching = nil
		end
	else
		game.flipped = self
	end
end

function Card:click(x, y, button)
	if button == "l" then
		self.clickables:click(x, y, button)
	end
end

function Card:new(sprite, x, y)
	local o = {}
	o.sprite = sprite
	setmetatable(o, {__index = self})
	o.sprite:setPos(x, y)
	o.side = "front"
	o:flip()

	o.clickables = Clickables:new()
	o.clickables:addClickableArea(x, y, 64, 64, function ()
		if o.side == "back" and not game.matching then
			o:flip()
		end
	end)

	return o
end

return Card
