game = {}
game.str, game.state = 0, 0
game.kz, game.kx = 0, 0
game.time_prev, game.var = 0, 0

game.fished = "Nothing"
-- game.fished = fishes['fishes'][2]
-- game.state = 4

game.dialogue = 0 -- Index of current dialogue

game.inventory = false
game.fishes_on_inventory = {}

--[[

0    - Idle
0.5  - Dialogue
0.75 - Inventory
1    - Strength test
2    - Wait fish
3    - Buttons press
4    - See fish

]]

target = {}
target.x, target.y = randomInRange(50, WIDTH-50), randomInRange(320, 410)
target.size = 30

bar = {}
bar.fill = 0
bar.back = false


function game:showDialogue(text, title, speed)
	title = title or "Zé Thomas"
	speed = speed or "medium"

	if not text  then -- Go to next index and show default dialogue
		game.dialogue = game.dialogue + 1
		text =  fishes['dialogue'][game.dialogue]['text']
	end

	Talkies.say(title,
		text,
		{
			textSpeed = speed,
			titleColor = { 0.5, 1, 0.5 },
			
			onstart = function()
				game.state = 0.5 -- Dialogue mode --
			end,

			oncomplete = function()
				game.state = 0 -- Back to idle --
			end
		}
	)
end


function game:resetValues()
	game.state, bar.fill, game.str, game.kz, game.kx = 0, 0, 0, 0, 0
	bar.back = false
	target.x, target.y = randomInRange(50, WIDTH-50), randomInRange(320, 410)
end

function game:fishing()
	if game.state == 1 then -- Strength Test --
		-- Fill bar --
		if bar.back then -- Bar is going back
			bar.fill = bar.fill - 10
			if bar.fill == 0 then bar.back = false end -- Change direction
		else
			bar.fill = bar.fill + 10
			if bar.fill == BAR_WIDTH then bar.back = true end
		end
	elseif game.state == 2 then -- Waiting fish --
		local elapsed = love.timer.getTime() - game.time_prev

		if elapsed >= game.var then -- Time to wait fish has passed
			game.time_prev = love.timer.getTime() -- Restart timer
			game.var = randomInRange(20, 50) -- How many times press button
			-- game.var = 2
			game.state = 3
			love.audio.play(flapping_fish) -- Get fish sound
		end


	elseif game.state == 4 then -- Show Fish --
		local fish = game.fished

		local w, h = fish.img:getWidth(), fish.img:getHeight()
		local x, y = WIDTH/2 - w/4, HEIGHT/2 - h/4

		-- love.graphics.draw(image.plank, x, y, 0, 1, 1)
		love.graphics.draw(fish.img, x, y, 0, 200/w, 100/h)
		love.graphics.print(fish.name, x, y+70, 0, 2, 2)
		love.graphics.print(fish.desc, x, y+100, 0, 1.5, 1.5)
		-- love.graphics.print(fish.desc, (x+w/2)-80, (y+y/2)+120, 0, 1.5, 1.5)

		-- game.state == 4.5 -- Thought --
	end
end



function game:update(dt)
	local dirX = 0
	local dirY = 0
	-- local speed = AIM_SPEED * dt

	aim.x = aim:getX()
	aim.y = aim:getY()

	if game.state == 0 then -- Just move if is in move mode
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
	love.graphics.draw(image.background, 0, 0, 0, RES_W/image.background:getWidth(), RES_H/image.background:getHeight())

	-- Draw aim
	-- love.graphics.setColor(1, 1, 1)
	-- love.graphics.rectangle('fill', aim:getX(), aim:getY(), 10, 10)
	love.graphics.draw(image.aim, aim:getX()-aim.size, aim:getY()-aim.size, 0, AIM_SIZE/image.aim:getWidth(), AIM_SIZE/image.aim:getHeight())

	-- Bar
	love.graphics.setColor(0, 0, 1)
	love.graphics.rectangle('fill', BAR_X, BAR_Y, bar.fill, BAR_HEIGHT)

	-- Bar outline
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('line', BAR_X, BAR_Y, BAR_WIDTH, BAR_HEIGHT)

	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('line', target.x, target.y, target.size, target.size)
	love.graphics.circle('line', target.x+target.size/2, target.y+target.size/2, target.size)
	-- love.graphics.rectangle('line', 260, 340, 30, 30)

	game:fishing()
end