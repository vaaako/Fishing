--[[ 

started on: 20/12/2022 (5 days)
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
	require 'src/fishes'
	require 'src/game'

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
end

function love.draw()
	love.graphics.scale(WIDTH/RES_W, HEIGHT/RES_H)

	if game.inventory then -- In inventory
		love.graphics.setColor(1, 1, 1)
		love.graphics.print("Pexes", WIDTH/2 - 50, 50, 0, 2, 2)

		for i = 1, #fishes['fishes'] do
			local fish = fishes['fishes'][i]
			love.graphics.draw(fish.img, 10, 50 + i*70, 0, 70/fish.img:getWidth(), 70/fish.img:getHeight())
			love.graphics.print(("%s: %d"):format(fish['name'], fish['amount']), 100, 75 + i*70, 0, 1.5, 1.5)
		end
		-- love.graphics.print("- Lambari: 10", 10, 130, 0, 1.5, 1.5)

		return
	end


	game:draw()
	Talkies.draw() -- Dialogue --
	love.graphics.setFont(fontimage) --- This way Taliker.font will not overwrite other texts 


	love.graphics.setColor(1, 1, 1)
	love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 10, 10)
	love.graphics.print("AX:  "..tostring(aim.x), 10, 25)
	love.graphics.print("AY:  "..tostring(aim.y), 10, 40)
	love.graphics.print('mx: '..mx .. ' my: '.. my, 10, 55)

	-- love.graphics.print("FORÇA:  "..tostring(game.str), WIDTH/2, 55, 0, 2, 2)
	-- love.graphics.print("KZ:     "..tostring(game.kz), WIDTH/2, 85, 0, 2, 2)
	-- love.graphics.print("KX:     "..tostring(game.kx), WIDTH/2, 115, 0, 2, 2)
	love.graphics.print("LIMIT:  "..tostring(game.var), WIDTH/2, 145, 0, 2, 2)
	love.graphics.print("FISHED: "..tostring(game.fished.name), WIDTH/2, 175, 0, 2, 2)
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

-- 550, 400

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end

	if key == 'm' then -- Inventory --
		if not game.inventory then
			game.inventory = game.state -- Store state
			game.state = 0.75
		else
			game.state = game.inventory -- Back to normal
			game.inventory = false
		end
	end


	if key == 'return' then
		if game.state == 0 then -- Prepare to fishing minigame --
			if not circleCollision(target.x+TARGET_SIZE/2, target.y+TARGET_SIZE/2, TARGET_SIZE, aim.x, aim.y, AIM_SIZE) then -- Check collision with aim
				print('not colliding')
				return
			end
			game.state = 1

		elseif game.state == 0.5 then -- Showing dialogue --
			Talkies.onAction() -- Next message --

		elseif game.state == 1 then -- Start fishing --
			game.str = bar.fill
			game.state = 2 -- Change to wait fish
			-- game.var = 1
			game.var = randomInRange(5, 15) -- How many time wait fish
			game.time_prev = love.timer.getTime() -- Start timer

			rod_pull:stop()
			rod_throw:play() -- Throw Rod Sound --
			-- instance:setPitch(1.25) -- Speed up

			print("FORÇA:  "..tostring(game.str))

		elseif game.state == 4 then -- Back to idle mode --
			game:resetValues()

			local tho = game.fished['tho'][randomInRange(1, #game.fished['tho'])] -- Get random thought
			if not tho.showed then -- Was not showed
				tho.showed = true -- To not show anymore
				game:showDialogue(tho.text)
			else
				game:showDialogue()
			end
		end
	end

end


--[[

- Peixes diferentes dependendo do local da mira
	+ Dividir o mapa em 4, dependendo da posição por programação saber onde a mira está

- Chances diferente de pegar os peixes
	+ Se eu quiser mesmo fazer isso eu posso colocar uma chance de captura em cada peixe e se o número de 0-100 não estiver nesse range, o peiexe não é capturado
		* Ex.: Peixe A é 10 e eu tirei 90, 90>10, então capturo (10 = 90% de chance de captura, porque 100-10 = 90)
	+ Isso pode ser unido com força necessária para capturar cada peixe

X Sistema de diálogo
	+ Caixa preta como sprite
	+ Dependendo da largura do texto, colocar em outra "página"
	+ Texto pixelado
	+ Mostrar texto lentamente igual no room

X Chance de 40% do peixe fugir ou de pegar lixo
	- Bota

- Limit fish area
- Keep aspect on resizing
	+ 800x640
	+ On Reszing keep aspect with black offset

- Limit camera?
	+ On move, move camera

- História
	X Passar uns dias no interior para ir pescar e fugir dos tormentos
	+ Itens que remetem a memória do personagem
	+ Matou alguém e filosofar sobre a vida e a morte?
		* Alguém que gosta muito de pescar que morreu e está nesse inferno de pescar os pensamentos, lembrando do que fez (Como white bear do black mirror)
		* A morte é fútil as vezes
	+ Pescar ostra com olho dentro
	+ Pescar telefone tocando
	+ Porta retrato de um pai abusivo
	X "A vida é um pendulo que ocila entre a ansiedade de querer e o tedio de possuir"


--]]

