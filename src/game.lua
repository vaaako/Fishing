game = {}
game.str, game.mode = 0, 0
game.kz, game.kx = 0, 0
game.time_prev, game.var = 0, 0
game.fished = "Nothing"
game.background = love.graphics.newImage('resources/background/lake2.png')
--[[

0 - Before fishing
1 - Strength
2 - Wait fish
3 - Press Z and X
4 - See fish

]]

-- Aim --
aim = world:newRectangleCollider(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 10, 10) -- X, Y, W, H
aim.dirX, aim.dirY = 0, 0


--
-- aim:setCollisionClass('Aim')
aim:setObject(aim)
aim:setFixedRotation(true)


bar = {}
bar.fill = 0
bar.back = false



function game:resetValues()
	game.mode, bar.fill, game.str, game.kz, game.kx = 0, 0, 0, 0, 0
	bar.back = false
end

function game:fishing()
	if game.mode == 1 then -- Strength Test --
		-- Fill bar --
		if bar.back then -- Bar is going back
			bar.fill = bar.fill - 10
			if bar.fill == 0 then bar.back = false end -- Change direction
		else
			bar.fill = bar.fill + 10
			if bar.fill == BAR_WIDTH then bar.back = true end
		end
	elseif game.mode == 2 then -- Waiting fish --
		local elapsed = love.timer.getTime() - game.time_prev

		if elapsed >= game.var then -- Time to wait fish has passed
			game.time_prev = love.timer.getTime() -- Restart timer
			game.var = randomInRange(20, 50) -- How many times press button
			game.mode = 3
			love.audio.play(flapping_fish) -- Get fish sound
		end


	elseif game.mode == 4 then -- Show Fish --
		local fish = game.fished
		love.graphics.draw(fish.img, WIDTH/2.5, HEIGHT/2, 0, 2, 2)
	end
end



function game:update(dt)
	local dirX = 0
	local dirY = 0
	-- local speed = AIM_SPEED * dt

	aim.x = aim:getX()
	aim.y = aim:getY()

	if game.mode == 0 then -- Just move if is in move mode
		if love.keyboard.isDown('up') then
			dirY = -1
			aim.dirY = -1
		elseif love.keyboard.isDown('down') then
			dirY = 1
			aim.dirY = 1
		end

		if love.keyboard.isDown('left') then
			dirX = -1
			aim.dirX = -1
		elseif love.keyboard.isDown('right') then
			dirX = 1
			aim.dirX = 1
		end

		-- We can't use just game.dirX and game.dirY, because we need to store this values to user later
		-- And this values need to reset, that's why we have dirX and dirY

		-- Get vector (direction) normalize (Not change speed in diagonal) and multiple to speed
		local vec = vector(dirX, dirY):normalized() * AIM_SPEED -- Ex.: vector(1, 0) becomes vector(300, 0)  because mutiples by speed

		aim:setLinearVelocity(vec.x, vec.y) -- X, Y
	end

end


function game:draw()
	love.graphics.draw(game.background, 0, 0, 0, RES_W/game.background:getWidth(), RES_H/game.background:getHeight())

	-- Draw aim
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('fill', aim:getX(), aim:getY(), 10, 10)

	-- Bar
	love.graphics.setColor(0, 0, 1)
	love.graphics.rectangle('fill', BAR_X, BAR_Y, bar.fill, BAR_HEIGHT)

	-- Bar outline
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('line', BAR_X, BAR_Y, BAR_WIDTH, BAR_HEIGHT)

	game:fishing()
end