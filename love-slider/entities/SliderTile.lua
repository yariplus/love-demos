local Entity = require "entities/Entity"

local SliderTile = {}

setmetatable(SliderTile, {__index = Entity})

SliderTile.blankQuad = love.graphics.newQuad(0, 0, 64, 64, 640, 640)

function SliderTile:update(dt)
end

function SliderTile:draw(dt)
	love.graphics.setColor(50, 0, 0)
	love.graphics.print(self.number, self.sprite.x + 30, self.sprite.y + 30)
end

function SliderTile:flip()
end

function SliderTile:click(x, y, button)
	if button == "l" then
		self.clickables:click(x, y, button)
	end
end

function SliderTile:new(sprite, x, y, number)
	local o = {
		position = {
			x = x,
			y = y
		}
	}
	o.sprite = sprite
	setmetatable(o, {__index = self})

	o.sprite:setPos(x * 96 - 24, y * 96 - 24)
	o.side = "back"
	o.sprite.batch:set( o.sprite.id, SliderTile.blankQuad, o.sprite.x, o.sprite.y )

	o.number = number

	o.clickables = Clickables:new(o)
	o.clickables:addClickableArea(0, 0, 64, 64, function ()
		local bx = game.blank.x
		local by = game.blank.y
		if bx == o.position.x then
			if by > o.position.y then
				local _by = by
				local _oy = o.position.y
				while _by > _oy do
					game.positions[bx][_by] = game.positions[bx][_by - 1]
					game.positions[bx][_by].sprite:setPos(bx * 96 - 24, _by * 96 - 24)
					game.positions[bx][_by].position.y = _by
					game.positions[bx][_by - 1] = {number=0}
					game.blank.x = bx
					game.blank.y = _by - 1
					_by = _by - 1
				end
			else
				local _by = by
				local _oy = o.position.y
				while _by < _oy do
					game.positions[bx][_by] = game.positions[bx][_by + 1]
					game.positions[bx][_by].sprite:setPos(bx * 96 - 24, _by * 96 - 24)
					game.positions[bx][_by].position.y = _by
					game.positions[bx][_by + 1] = {number=0}
					game.blank.x = bx
					game.blank.y = _by + 1
					_by = _by + 1
				end
			end
		end
		if by == o.position.y then
			if bx > o.position.x then
				local _bx = bx
				local _ox = o.position.x
				while _bx > _ox do
					game.positions[_bx][by] = game.positions[_bx - 1][by]
					game.positions[_bx][by].sprite:setPos(_bx * 96 - 24, by * 96 - 24)
					game.positions[_bx][by].position.x = _bx
					game.positions[_bx - 1][by] = {number=0}
					game.blank.x = _bx - 1
					_bx = _bx - 1
				end
			else
				local _bx = bx
				local _ox = o.position.x
				while _bx < _ox do
					game.positions[_bx][by] = game.positions[_bx + 1][by]
					game.positions[_bx][by].sprite:setPos(_bx * 96 - 24, by * 96 - 24)
					game.positions[_bx][by].position.x = _bx
					game.positions[_bx + 1][by] = {number=0}
					game.blank.x = _bx + 1
					_bx = _bx + 1
				end
			end
		end
	end)

	return o
end

return SliderTile
