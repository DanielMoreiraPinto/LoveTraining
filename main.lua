function love.load()
	archer = love.graphics.newImage('assets/images/archer.png')
end

function love.update(dt)

end

function love.draw()
	love.graphics.draw(archer, love.math.random(0, 800), love.math.random(0, 800))
end

