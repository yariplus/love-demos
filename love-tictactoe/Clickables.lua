-- A clickable area.
local Clickable = {}

Clickable.x = 0
Clickable.y = 0
Clickable.w = 64
Clickable.h = 64
Clickable.click = function() end

function Clickable:new(o)
	o = o or {}
	setmetatable(o, {__index = self})
	return o
end

-- A collection of clickable areas.
Clickables = {}

function Clickables:click(x, y, button)
	for i = 1, #self.clickables do
		if x > self.clickables[i].x and
			x < self.clickables[i].x + self.clickables[i].w and
			y > self.clickables[i].y and
			y < self.clickables[i].y + self.clickables[i].h then
			self.clickables[i].click()
		end
	end
end

function Clickables:addClickableArea(x, y, w, h, click)
	local clickable = Clickable:new({
		x = x,
		y = y,
		w = w,
		h = h,
		click = click
	})

	table.insert(self.clickables, clickable)

	return clickable
end

function Clickables:new(o)
	o = o or {}
	o.clickables = o.clickables or {}
	setmetatable(o, {__index = self})
	return o
end
