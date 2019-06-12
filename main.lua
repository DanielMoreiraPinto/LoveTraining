--[[
Object = require 'libraries/classic'
require 'objects/Test'

function love.load()
	--archer = love.graphics.newImage('assets/images/archer.png')
	test_instance = Test()
end

function love.update(dt)

end

function love.draw()
	--love.graphics.draw(archer, love.math.random(0, 800), love.math.random(0, 800))
end
--]]





function love.draw()
	love.graphics.setBackgroundColor(125, 150, 150)
	love.graphics.setColor(1, 0.5, 0)
	love.graphics.rectangle("fill", 200, 200, 85, 100)
	love.graphics.setColor(0, 0, 1)
	love.graphics.circle("line", 250, 250, 56)
end
