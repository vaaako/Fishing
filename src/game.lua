game = {}
game.str, game.state = 0, 0
game.button, game.key = 0, 1 -- Button times and Keyboard key times
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
3.5  - Arrow
4    - See fish

]]

-- Aim --
aim = {}
aim.x = love.graphics.getWidth() / 2
aim.y = love.graphics.getHeight() / 2


target = {}
target.x, target.y = randomInRange(TARGET_AREA_X), randomInRange(TARGET_AREA_Y)

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
	game.state, bar.fill, game.str, game.button, game.key = 0, 0, 0, 0, 1
	bar.back = false
	target.x, target.y = randomInRange(TARGET_AREA_X), randomInRange(TARGET_AREA_Y)
end

function game:fishing() -- When game.state needs drawing
	if game.state == 4 then -- Show Fish --
		local fish = game.fished

		local w, h = fish.img:getWidth(), fish.img:getHeight()
		local x, y = WIDTH/2 - w/4, HEIGHT/2 - h/4

		-- love.graphics.draw(image.plank, x, y, 0, 1, 1)
		love.graphics.draw(fish.img, x, y, 0, 200/w, 100/h)
		love.graphics.print(fish.name, x, y+70, 0, 2, 2)
		love.graphics.print(fish.desc, x, y+100, 0, 1.5, 1.5)
	end
end



function game:update(dt)
	local speed = AIM_SPEED * dt

	if game.state == 0 then -- Just move if is in move mode
		if (aim.x <= AIM_SIZE or aim.x >= WIDTH-AIM_SIZE) or (aim.y <= AIM_SIZE or aim.y >= HEIGHT+AIM_SIZE) then -- Screen limit
			return
		end

		if love.keyboard.isDown('up') then
			aim.y = aim.y - AIM_SPEED * speed
		elseif love.keyboard.isDown('down') then
			aim.y = aim.y + AIM_SPEED * speed
		end

		if love.keyboard.isDown('left') then
			aim.x = aim.x - AIM_SPEED * speed
		elseif love.keyboard.isDown('right') then
			aim.x = aim.x + AIM_SPEED * speed
		end

	-- Strength Test --
	elseif game.state == 1 then
		-- Fill bar --
		if bar.back then -- Bar is going back
			bar.fill = bar.fill - 10
			if bar.fill == 0 then bar.back = false end -- Change direction
		else
			bar.fill = bar.fill + 10
			if bar.fill == BAR_WIDTH then bar.back = true end
		end

	-- Waiting fish --
	elseif game.state == 2 then
		local elapsed = love.timer.getTime() - game.time_prev

		if elapsed >= game.var then -- Time to wait fish has passed
			game.time_prev = love.timer.getTime() -- Restart timer
			game.var = randomInRange(5, 15) -- How many times press button until arrows
			game.state = 3
			flapping_fish:play() -- Get fish sound
		end


	-- Catch fish --
	elseif math.floor(game.state) == 3 then -- 3 or 3.5
		local elapsed = love.timer.getTime() - game.time_prev -- Count time passed
		print(elapsed)
		
		-- Time limit (To update)--
		if elapsed >= 20 or target.y < 300 then -- Time out
			game:resetValues()
			game.fished = { name = "LOST!" } -- Change later
			game:showDialogue("Que droga, talvez na próxima")
			return
		end

		-- Z and X and Arrows --
		if game.state == 3 then
			game.fished = { name = "BUTTONS" } -- DEBUG --

			-- Alternate between keys --
			if love.keyboard.isDown('z') and (game.button%2 == 0) then -- If pressed Z and is Even
				local mod = (target.x >= WIDTH/2) and 1 or -1 -- Depending of the position add or remove from X
				target.x, aim.x = target.x + (- AIM_STR * mod), aim.x + (- AIM_STR * mod)
				game.button = game.button + 1

			elseif love.keyboard.isDown('x') and not (game.button%2 == 0) then -- If pressed X and is Odd
				target.y, aim.y = target.y + AIM_STR, aim.y + AIM_STR
				game.button = game.button + 1
			end

		elseif game.state == 3.5 then
			game.fished = { name = "ARROW / KEY: "..game.key } -- DEBUG --

			if love.keyboard.isDown('up') and game.key == 1 then
				game.key = 2
				game.button = game.button + 1
			elseif love.keyboard.isDown('right') and game.key == 2 then
				game.key = 3
				game.button = game.button + 1
			elseif love.keyboard.isDown('down') and game.key == 3 then
				game.key = 4
				game.button = game.button + 1
			elseif love.keyboard.isDown('left') and game.key == 4 then
				game.key = 1
				game.button = game.button + 1
			end

			-- Fish run away --
			local mod = (target.x >= WIDTH/2) and 1 or -1 -- Depending of the position add or remove from X
			target.x, aim.x = target.x + (TARGET_STR * mod), aim.x + (TARGET_STR * mod)
			target.y, aim.y = target.y - TARGET_STR, aim.y - TARGET_STR
		end

		-- Alternate between mini-games --
		if game.button == game.var then
			if game.state == 3 then -- Randomizer changes depending of game mode
				game.state = 3.5
				game.var = randomInRange(5, 12)
			else
				game.state = 3
				game.var = randomInRange(20, 50)
			end
			game.button = 0
		end


		-- Catch fish --
		if target.y >= 500 then -- Reach bridge (I forgot the correct name) --
			-- 40% to catch trash or if str is less then 200
			game.fished = (randomInRange(0, 100) <= 40 or (game.str <= 200)) and fishes['trash'][randomInRange(1, #fishes['trash'])] or fishes['fishes'][randomInRange(1, #fishes['fishes'])]
			game.state = 4 -- Show fish
			game.fished['amount'] = game.fished['amount'] + 1
			rod_pull:play() -- Pull rod
		end
	end
end


function game:draw()
	love.graphics.draw(image.background, 0, 0, 0, RES_W/image.background:getWidth(), RES_H/image.background:getHeight())

	love.graphics.draw(image.rod, 100, 100, 0, 300/image.rod:getWidth(), 400/image.rod:getWidth())

	-- Draw aim
	-- love.graphics.setColor(1, 1, 1)
	-- love.graphics.rectangle('fill', aim.x, aim.y, 10, 10)
	love.graphics.draw(image.aim, aim.x-AIM_SIZE, aim.y-AIM_SIZE, 0, AIM_SIZE/image.aim:getWidth(), AIM_SIZE/image.aim:getHeight())

	-- Bar
	love.graphics.setColor(0, 0, 1)
	love.graphics.rectangle('fill', BAR_X, BAR_Y, bar.fill, BAR_HEIGHT)

	-- Bar outline
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('line', BAR_X, BAR_Y, BAR_WIDTH, BAR_HEIGHT)

	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('line', target.x, target.y, TARGET_SIZE, TARGET_SIZE)
	love.graphics.circle('line', target.x+TARGET_SIZE/2, target.y+TARGET_SIZE/2, TARGET_SIZE)

	game:fishing()
end