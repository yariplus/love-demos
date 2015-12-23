game = {}

Resources = {}
assets = {
	SpriteBatches = {
		cards = love.graphics.newSpriteBatch( love.graphics.newImage( "graphics/sprites.png" ), 100 )
	}
}

Clickables = require("Clickables")
Sprite = require("Sprite")
Card = require("entities/Card")

game.changeState = function (state)
	game.state = state
	state:load()
end

game.tick = 0
