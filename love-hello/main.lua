r, g, b = 255;
width, height = love.graphics.getDimensions()
love.graphics.setNewFont(64)

function love.load() end

function love.update(dt) end

function love.draw()
	love.graphics.clear()
	love.graphics.printf("Hello World", 0, height/2-64, width, "center")
end

function love.mousepressed(x, y, button)
	if button == "l" then
		r = love.math.random(50, 255)
		g = love.math.random(50, 255)
		b = love.math.random(50, 255)
		love.graphics.setColor(r, g, b)
	end
end
