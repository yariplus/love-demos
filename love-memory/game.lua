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

game.tick = 0
