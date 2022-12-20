player = {}
player.str = 0
player.mode = 0

player.kz = 0
player.kx = 0

--[[

0 - Before fishing
1 - Strength
2 - Press Z and X

]]

aim = {}
aim.x = love.graphics.getWidth() / 2
aim.y = love.graphics.getHeight() / 2

bar = {}
bar.fill = 0
bar.back = false


function player:resetValues()
	player.mode, bar.fill, player.str, player.kz, player.kx = 0, 0, 0, 0, 0
	back = false
end

function player:fishing()
	if player.mode == 1 then -- Strength
		-- Fill bar --
		if bar.back then -- Bar is going back
			bar.fill = bar.fill - 10
			if bar.fill == 0 then bar.back = false end -- Change direction
		else
			bar.fill = bar.fill + 10
			if bar.fill == BAR_WIDTH then bar.back = true end
		end

	end
end



function player:update(dt)
	speed = AIM_SPEED * dt

	if player.mode == 0 then -- Just move if is in move mode
		if love.keyboard.isDown('up') then
			aim.y = aim.y - speed
		elseif love.keyboard.isDown('down') then
			aim.y = aim.y + speed
		end

		if love.keyboard.isDown('left') then
			aim.x = aim.x - speed
		elseif love.keyboard.isDown('right') then
			aim.x = aim.x + speed
		end
	end
end


function player:draw()
	-- Draw aim
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('fill', aim.x, aim.y, 10, 10)

	-- Bar
	love.graphics.setColor(0, 0, 1)
	love.graphics.rectangle('fill', BAR_X, BAR_Y, bar.fill, BAR_HEIGHT)

	-- Bar outline
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('line', BAR_X, BAR_Y, BAR_WIDTH, BAR_HEIGHT)

	player:fishing()
end