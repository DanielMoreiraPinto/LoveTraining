local canvas = love.graphics.newCanvas()
local clear = false

function love.keypressed(key)
	if key == "c" then clear = true end
end

function love.update()
	canvas:renderTo(function()
		if clear then love.graphics.clear() end
		clear = false
		love.graphics.setColor(love.math.random(255), 0, 0)
		love.graphics.line(0, 0, love.math.random(0, love.graphics.getWidth()), love.math.random(0, love.graphics.getHeight()))
	end)
end

function love.draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(canvas)
end

