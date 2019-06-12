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
require "colision"

function love.load()
	math.randomseed(os.time())

	player = {}
	player.x = 50
	player.y = 300
	player.w = 85
	player.h = 100
	player.direction = "down"

	coins = {}
	
	score = 0

	sounds = {}
	sounds.coin = love.audio.newSource("assets/sounds/coin.ogg", "static")

	fonts = {}
	fonts.large = love.graphics.newFont("assets/fonts/Gamer.ttf", 36)

	images = {}
	images.background = love.graphics.newImage("assets/images/ground.png")
	images.coin = love.graphics.newImage("assets/images/coin.png")
	images.player_down = love.graphics.newImage("assets/images/player/down.png")
	images.player_right = love.graphics.newImage("assets/images/player/right.png")

end

function love.update(dt)
	if love.keyboard.isDown("right") then
		player.x = player.x + 4
		player.direction = "right"
	elseif love.keyboard.isDown("left") then
		player.x = player.x - 4
	elseif love.keyboard.isDown("up") then
		player.y = player.y - 4
	elseif love.keyboard.isDown("down") then
		player.y = player.y + 4
		player.direction = "down"
	end

	for i = #coins, 1, -1 do
		local coin = coins[i]
		if AABB(player.x, player.y, player.w, player.h, coin.x, coin.y, coin.w, coin.h) then
			table.remove(coins, i)
			score = score + 1
			sounds.coin:play()
		end
	end

	if math.random() < 0.01 then
	local coin = {}
	coin.w = 56
	coin.h = 56
	coin.x = math.random(0, 800 - coin.w)
	coin.y = math.random(0, 600 - coin.h)
	table.insert(coins, coin)
	end		
end

function love.draw()
	for x = 0, love.graphics.getWidth(), images.background:getWidth() do
		for y = 0, love.graphics.getHeight(), images.background:getHeight() do
			love.graphics.draw(images.background, x, y)
		end
	end

	local img = images.player_down
	if player.direction == "right" then
		img = images.player_right
	elseif player.direction == "down" then
		img = images.player_down
	end
	love.graphics.draw(img, player.x, player.y)

	for i = 1, #coins do
		local coin = coins[i]
		love.graphics.draw(images.coin, coin.x, coin.y)
	end

	love.graphics.setFont(fonts.large)
	love.graphics.print("SCORE: " .. score, 10, 10)
end
