g = {} -- Globals

g.entities = {}

g.Entity = require "entities/entity"
g.Enemy = require "entities/enemy"
g.Player = require "entities/player"

g.State    = require "states/state"
g.statePlay = require "states/statePlay"
g.stateMenu = require "states/stateMenu"

function love.load()
	love.window.setMode(240, 320)

	math.randomseed(os.time())

    g.stateMenu:load()
end

function love.update(dt)
	g.state:update(dt)
end

function love.draw()
	love.graphics.clear()
	g.state:draw()
end
