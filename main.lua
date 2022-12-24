--[[ 

started on: 19/12/2022 (4 days)
by: vako

Dev log:
22/12/2022
	- I have done more then a thought I would in only 3 days. I will work on effects, polishment when the game is "done"
	- I'm tired to work on this today, I'm fulled, I don't know how to write in english anymore, sorryyyyyy

23/12/2022
	- I'm fine today, I sleep well, yesterday I had a bad sleep time, that's why I was so tired, but I'm fine now
	- I don't know what I will code today, probally the rod, button and arrows animations, I hate to have code that stuffs :(

]]

function love.load()
	require 'config'
	require 'src/sound'
	require 'src/image'
	require 'src/ui'

	require 'src/fishes'
	require 'src/game'
	require 'src/event'
	require 'src/renderer'
	

	-- Window Config --
	love.window.setTitle( "Pescaria doida" )
	love.window.setMode( WIDTH, HEIGHT,
						{ fullscreen=false, resizable=true, vsync=1, minwidth=600, minheight=472, centered=true } )
	love.graphics.setDefaultFilter("nearest", "nearest") -- Anti alising
	love.graphics.setBackgroundColor(0, 0.5, 0.7) -- Clear Screen

	-- Talkie --
	Talkies.font = love.graphics.newFont("resources/fonts/Pixel UniCode.ttf", 32)
	fontimage = love.graphics.newImageFont("resources/fonts/imagefont.png",
		" abcdefghijklmnopqrstuvwxyz" ..
		"ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
		"123456789.,!?-+/():;%&`'*#=[]\"")


	-- DEBUG --
	mx, my = 0, 0
end

function love.update(dt)
	game:update(dt)
	Talkies.update(dt) -- Dialogue --
	Timer.update(dt)
end

function love.draw()	
	renderer:draw()
	game:fishing()

	Talkies.draw() -- Dialogue --
	love.graphics.setFont(fontimage) --- This way Taliker.font will not overwrite other texts 


	-- DEBUG --
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 10, 10)
	-- love.graphics.print("AX:  "..tostring(aim.x), 10, 25)
	-- love.graphics.print("AY:  "..tostring(aim.y), 10, 40)
	-- love.graphics.print('mx: '..mx .. ' my: '.. my, 10, 55)

	-- love.graphics.print("FORÇA:  "..tostring(game.str), WIDTH/2, 55, 0, 2, 2)
	love.graphics.print("LIMIT:  "..tostring(game.var), WIDTH/2, 145, 0, 2, 2)
	-- love.graphics.print("FISHED: "..tostring(game.fished.name), WIDTH/2, 175, 0, 2, 2)
end

-- Other Functions --
function love.mousemoved( x, y, dx, dy, istouch )
	mx = x
	my = y
end

function love.resize(w, h)
	WIDTH = w
	HEIGHT = h
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end

	if key == 'm' then -- Inventory --
		if not game.inventory then
			game.inventory = GAME_STATE -- Store state
			GAME_STATE = 0.75
		else
			GAME_STATE = game.inventory -- Back to normal
			game.inventory = false
		end
	end

	if GAME_STATE == 0.5 then
		if key == "up" then
			Talkies.prevOption()
		elseif key == "down" then
  			Talkies.nextOption()
  		end
  	end

	if key == 'return' then
		if GAME_STATE == 0 then -- Prepare to fishing minigame --
			if not circleCollision(target.x+TARGET_SIZE/2, target.y+TARGET_SIZE/2, TARGET_SIZE, aim.x, aim.y, AIM_SIZE) then -- Check collision with aim
				print('not colliding')
				return
			end
			GAME_STATE = 1

		elseif GAME_STATE == 0.5 then -- Showing dialogue --
			Talkies.onAction() -- Next message --

		elseif GAME_STATE == 1 then -- Start fishing --
			-- Sounds --
			rod_pull:stop() -- Stop rod pull in case player was too fast
			rod_throw:play() -- Throw Rod Sound --
			Timer.after(4, function() bubble:play() end)

			game.str = bar.fill
			GAME_STATE = 2 -- Change to wait fish
			
			-- game.var = 1 -- DEBUG
			game.var = randomInRange(5, 15) -- How many time wait fish
			PREV_TIME = love.timer.getTime() -- Start timer

		elseif GAME_STATE == 4 then -- Back to idle mode --
			game:resetValues()

			local noteIndex = randomInRange(1, #game.fished['tho'])
			local tho = game.fished['tho'][noteIndex] -- Get random thought

			if hasValue(tho, noteIndex) or (randomInRange(0, 100) <= 120) then -- Was showed or 20%
				game:showDialogue() -- History dialogue
			else -- Was not showed (Fished dialogue)
				table.insert(game.showedNotes, noteIndex) -- To not show anymore
				game:showDialogue(tho.text)
			end
		end
	end

end


--[[

- Keep aspect on resizing
	+ 800x640
	+ On Reszing keep aspect with black offset

- História
	X Passar uns dias no interior para ir pescar e fugir dos tormentos
	+ Itens que remetem a memória do personagem
	+ Pescar ostra com olho dentro
	+ Pescar telefone tocando
	X "A vida é um pendulo que ocila entre a ansiedade de querer e o tedio de possuir"
	+ The plot is: She killed her father and she is in hell, because god is unfair

- Fix show dialogue

- Animations
	- Rod animation on throw and pull
	- Target
	- Lake
	- Sky
	- Buttons

--]]

