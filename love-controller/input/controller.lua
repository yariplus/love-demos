
local controller = {}
local joystick   = null
local lastbutton = "none"

function controller:update(dt)
    if not joystick then
		local joysticks = love.joystick.getJoysticks()
		joystick = joysticks[1]
		return
	end

    if joystick:isGamepadDown("dpleft") then
        position.x = position.x - speed * dt
    elseif joystick:isGamepadDown("dpright") then
        position.x = position.x + speed * dt
    end

    if joystick:isGamepadDown("dpup") then
        position.y = position.y - speed * dt
    elseif joystick:isGamepadDown("dpdown") then
        position.y = position.y + speed * dt
    end
end

function love.gamepadpressed(joystick, button)
    lastbutton = button
end

function controller:draw()
	love.graphics.circle("fill", position.x, position.y, 50)

	if not joystick then return end

	local buttons = ""
	for a=1,joystick:getButtonCount() do
		local state = "";
		if joystick:isDown(a) then state = "Pressed" else state = "Released" end
		buttons = buttons.."Button "..a..": "..state.."\n"
	end

	local axis = ""
	for a=1,joystick:getAxisCount() do
		axis = axis.."Axis "..a..": "..joystick:getAxis(a).."\n"
	end

	local hats = ""
	for a=1,joystick:getHatCount() do
		hats = hats.."Hat "..a..": "..joystick:getHat(a).."\n"
	end

	love.graphics.print(""
	.."Last gamepad button pressed: "..lastbutton.."\n"
	.."\n"
	.."Buttons: "..joystick:getButtonCount().."\n"
	.."Axis: "..joystick:getAxisCount().."\n"
	.."Hats: "..joystick:getHatCount().."\n"
	.."\n"
	..buttons
	..axis
	..hats
	, 10, 10)
end

return controller
