g = {}

g.controller = require "input/controller"

function love.load()
    position = {x = 400, y = 300}
    speed = 300
end

function love.update(dt)
    g.controller:update(dt);
end

function love.draw()
	g.controller:draw(dt);
end
