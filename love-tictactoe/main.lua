require "Clickables"

local gridx = 40
local gridy = 15
local gridwall = 10
local gridcell = 100

grid = {}
grid.cells = {} for i = 1, 9 do table.insert(grid.cells, 0) end
grid.areas = Clickables:new()

function testgrid()
	if grid.cells[1] == turn and grid.cells[2] == turn and grid.cells[3] == turn then playing = false end
	if grid.cells[4] == turn and grid.cells[5] == turn and grid.cells[6] == turn then playing = false end
	if grid.cells[7] == turn and grid.cells[8] == turn and grid.cells[9] == turn then playing = false end
	if grid.cells[1] == turn and grid.cells[4] == turn and grid.cells[7] == turn then playing = false end
	if grid.cells[2] == turn and grid.cells[5] == turn and grid.cells[8] == turn then playing = false end
	if grid.cells[3] == turn and grid.cells[6] == turn and grid.cells[9] == turn then playing = false end
	if grid.cells[1] == turn and grid.cells[5] == turn and grid.cells[9] == turn then playing = false end
	if grid.cells[3] == turn and grid.cells[5] == turn and grid.cells[7] == turn then playing = false end
	if grid.cells[1] ~= 0 and grid.cells[2] ~= 0 and grid.cells[3] ~= 0 and grid.cells[4] ~= 0 and grid.cells[5] ~= 0 and grid.cells[6] ~= 0 and grid.cells[7] ~= 0 and grid.cells[8] ~= 0 and grid.cells[9] ~= 0 and playing then
		tie = true playing = false
	end
end

function fill(cell)
	if grid.cells[cell] == 0 then
		grid.cells[cell] = turn
		testgrid()
		if turn == 1 then turn = 2 else turn = 1 end
	end
end

grid.areas:addClickableArea(gridx, gridy, gridcell, gridcell, function() fill(1) end)
grid.areas:addClickableArea(gridx + gridcell + gridwall, gridy, gridcell, gridcell, function() fill(2) end)
grid.areas:addClickableArea(gridx + gridcell*2 + gridwall*2, gridy, gridcell, gridcell, function() fill(3) end)
grid.areas:addClickableArea(gridx, gridy + gridcell + gridwall, gridcell, gridcell, function() fill(4) end)
grid.areas:addClickableArea(gridx + gridcell + gridwall, gridy + gridcell + gridwall, gridcell, gridcell, function() fill(5) end)
grid.areas:addClickableArea(gridx + gridcell*2 + gridwall*2, gridy + gridcell + gridwall, gridcell, gridcell, function() fill(6) end)
grid.areas:addClickableArea(gridx, gridy + gridcell*2 + gridwall*2, gridcell, gridcell, function() fill(7) end)
grid.areas:addClickableArea(gridx + gridcell + gridwall, gridy + gridcell*2 + gridwall*2, gridcell, gridcell, function() fill(8) end)
grid.areas:addClickableArea(gridx + gridcell*2 + gridwall*2, gridy + gridcell*2 + gridwall*2, gridcell, gridcell, function() fill(9) end)

tie = false
turn = 1
playing = true

function love.load()
	love.window.setMode(400, 400)
	love.graphics.setNewFont(24)
end

function love.update(dt) end

function love.draw()
	love.graphics.clear()
	love.graphics.rectangle( "fill", 40 + 100, 15, 10, 300 + 20 )
	love.graphics.rectangle( "fill", 40 + 100 + 10 + 100, 15, 10, 300 + 20 )
	love.graphics.rectangle( "fill", 40, 15 + 100, 300 + 20, 10 )
	love.graphics.rectangle( "fill", 40, 15 + 100 + 10 + 100, 300 + 20, 10 )
	for i=1,#grid.cells do
		if grid.cells[i] == 1 then
			love.graphics.line( grid.areas.clickables[i].x+10, grid.areas.clickables[i].y+10, grid.areas.clickables[i].x+90, grid.areas.clickables[i].y+90 )
			love.graphics.line( grid.areas.clickables[i].x+10, grid.areas.clickables[i].y+90, grid.areas.clickables[i].x+90, grid.areas.clickables[i].y+10 )
		elseif grid.cells[i] == 2 then
			love.graphics.circle( "line", grid.areas.clickables[i].x+50, grid.areas.clickables[i].y+50, 40, 20 )
		end
	end
	if turn == 1 then
		if playing then
			love.graphics.printf("X's turn", 0, 360, 400, "center")
		elseif tie then
			love.graphics.printf("TIE", 0, 360, 400, "center")
		else
			love.graphics.printf("O WINS!!!", 0, 360, 400, "center")
		end
	else
		if playing then
			love.graphics.printf("O's turn", 0, 360, 400, "center")
		elseif tie then
			love.graphics.printf("TIE", 0, 360, 400, "center")
		else
			love.graphics.printf("X WINS!!!", 0, 360, 400, "center")
		end
	end
end

function love.mousepressed(x, y, button)
	if playing then
		grid.areas:click(x, y, button)
	else
		grid.cells = {} for i = 1, 9 do table.insert(grid.cells, 0) end
		playing = true
		tie = false
	end
end
