game = {}
game.str = 0
game.button, game.key = 0, 1 -- Button times and Keyboard key times
PREV_TIME, game.var = 0, 0

game.fished = "Nothing"
game.inventory = false
game.showedNotes = {}

-- DEBUG
-- game.fished = lake['fishes'][2]
-- GAME_STATE = 4
-- DIALOGUE_INDEX = 17 -- Index of current dialogue

-- Aim --
aim = {}
aim.x = love.graphics.getWidth() / 2
aim.y = love.graphics.getHeight() / 2

-- Target --
target = {}
target.x, target.y = randomInRange(TARGET_AREA_X), randomInRange(TARGET_AREA_Y)

function game:showDialogue(text, fish) --speed, title, sound, color)
	fish = fish or {}

	if not text  then -- Go to next index and show default dialogue
		DIALOGUE_INDEX = DIALOGUE_INDEX + 1
		fish = lake['dialogue'][DIALOGUE_INDEX]
	end

	Talkies.say(fish.title or "Luna", text or fish.text,
		{
			textSpeed = fish.speed or 'medium',
			titleColor = fish.color or { 0.5, 1, 0.5 },
			options = fish.options,
			talkSound=fish.talkSound,

			onstart = function()
				GAME_STATE = 0.5 -- Dialogue mode --
			end,

			oncomplete = function()
				GAME_STATE = 0 -- Back to idle --
			end
		}
	)
end


function game:resetValues()
	GAME_STATE, bar.fill, game.str, game.button, game.key = 0, 0, 0, 0, 1
	bar.back = false
	target.x, target.y = randomInRange(TARGET_AREA_X), randomInRange(TARGET_AREA_Y)
end


-- When GAME_STATE needs drawing --
function game:fishing()
	if GAME_STATE == 4 then -- Show Fish --
		local fish = game.fished

		local w, h = fish.img:getWidth(), fish.img:getHeight()
		local x, y = WIDTH/2 - w/4, HEIGHT/2 - h/4

		-- love.graphics.draw(image.plank, x, y, 0, 1, 1)
		love.graphics.draw(fish.img, x, y, 0, 200/w, 100/h)
		love.graphics.print(fish.name, x, y+70, 0, 2, 2)
		love.graphics.print(fish.desc, x, y+100, 0, 1.5, 1.5)
	end
end

-- Game Logic --
function game:update(dt)
	local speed = AIM_SPEED * dt

	if GAME_STATE == 0 then -- Just move if is in move mode
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
	elseif GAME_STATE == 1 then
		-- Fill bar --
		if bar.back then -- Bar is going back
			bar.fill = bar.fill - BAR_SPEED --* dt
			if bar.fill <= 0 then bar.back = false end -- Change direction
		else
			bar.fill = bar.fill + BAR_SPEED --* dt
			if bar.fill >= BAR_WIDTH then bar.back = true end
		end

	-- Waiting fish --
	elseif GAME_STATE == 2 then
		local elapsed = love.timer.getTime() - PREV_TIME

		if elapsed >= game.var then -- Time to wait fish has passed
			PREV_TIME = love.timer.getTime() -- Restart timer
			game.var = randomInRange(5, 15) -- How many times press button until arrows
			GAME_STATE = 3
			flapping_fish:play() -- Get fish sound
		end


	-- Catch fish --
	elseif math.floor(GAME_STATE) == 3 then -- 3 or 3.5
		local elapsed = love.timer.getTime() - PREV_TIME -- Count time passed
		-- print(elapsed)
		
		-- Time limit (To update)--
		if elapsed >= 20 or target.y < 300 then -- Time out
			game:resetValues()
			game.fished = { name = "LOST!" } -- Change later
			game:showDialogue("Que droga, talvez na próxima")
			return
		end

		-- Z and X and Arrows --
		if GAME_STATE == 3 then
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

		elseif GAME_STATE == 3.5 then
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
			if GAME_STATE == 3 then -- Randomizer changes depending of game mode
				GAME_STATE = 3.5
				game.var = randomInRange(5, 12)
			else
				GAME_STATE = 3
				game.var = randomInRange(20, 50)
			end
			game.button = 0
		end


		-- Catch fish --
		if target.y >= 500 then -- Reach bridge (I forgot the correct name) --
			rod_pull:play() -- Pull rod

			-- 40% to catch trash or if str is less then 200
			game.fished = (randomInRange(0, 100) <= 40 or (game.str <= 200)) and lake['trash'][randomInRange(1, #lake['trash'])] or lake['fishes'][randomInRange(1, #lake['fishes'])]
			GAME_STATE = 4 -- Show fish
			game.fished['amount'] = game.fished['amount'] + 1
		end
	end
end


--[[

0    - Idle
0.5  - Dialogue
0.75 - Inventory (No movement)
1    - Strength test
2    - Wait fish
3    - Buttons press
3.5  - Arrow
4    - See fish

]]