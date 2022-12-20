function love.load()
	require 'config'
	require 'src/player'
	require 'src/fishes'

	-- Window Config
	love.window.setTitle( "Pescaria doida" )
	love.window.setMode( WIDTH, HEIGHT,
						{ fullscreen=false, resizable=true, vsync=1, minwidth=640, minheight=400, centered=true } )
	love.graphics.setDefaultFilter("nearest", "nearest") -- Anti alising
	love.graphics.setBackgroundColor(0, 0.5, 0.7) -- Clear Screen
end

function love.update(dt)
	player:update(dt)
end

function love.draw()
	player:draw()

	love.graphics.setColor(1, 1, 1)
	love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 10, 10)
	love.graphics.print("AX:  "..tostring(aim.x), 10, 25)
	love.graphics.print("AY:  "..tostring(aim.y), 10, 40)

	love.graphics.print("FORÇA:  "..tostring(player.str), WIDTH/2, 55, 0, 2, 2)
	love.graphics.print("KZ:     "..tostring(player.kz), WIDTH/2, 85, 0, 2, 2)
	love.graphics.print("KX:     "..tostring(player.kx), WIDTH/2, 115, 0, 2, 2)
	love.graphics.print("LIMIT:  "..tostring(limit), WIDTH/2, 145, 0, 2, 2)
	love.graphics.print("FISHED: "..tostring(fished), WIDTH/2, 175, 0, 2, 2)
end



function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end

	if key == 'return' then
		if player.mode == 1 then -- Alredy started
			player.str = bar.fill
			player.mode = 2 -- Change to buttons mode
			
			limit = randomInRange(20, 50) -- Choose limit to catch fish
			time_prev = love.timer.getTime() -- Start timer

		elseif player.mode == 0 then
			player.mode = 1 -- Start fishing
		end
	end


	if player.mode == 2 then
		local time_now = love.timer.getTime()
		local passed_seconds = time_now - time_prev -- Count time passed

		print(passed_seconds)
		
		-- Time limit --
		if passed_seconds >= 5 then
			player:resetValues()
			fished = "LOST!"
			return
		end


		-- Alternate between keys --
		if player.kz > player.kx then -- If Z is higher then X, only accept X input
			if key == 'x' then
				player.kx = player.kx + 1
			end
		else -- If X is higher then Z or both is equal
			if key == 'z' then
				player.kz = player.kz + 1
			end
		end


		-- Catch fish --
		if player.kz + player.kx == limit then
			player:resetValues()

			if randomInRange(0, 100) <= 40 or player.str <= 200 then
				fished = fishes['trash'][1]['name']
			else
				fished = fishes['fishes'][randomInRange(1, 7)]['name'] -- 1-7 (Number of fishes)
			end

		end
	end


end


--[[
- Peixes diferentes dependendo do local da mira
	- Dividir o mapa em 4, dependendo da posição por programação saber onde a mira está

- Chances diferente de pegar os peixes
	- Se eu quiser mesmo fazer isso eu posso colocar uma chance de captura em cada peixe e se o número de 0-100 não estiver nesse range, o peiexe não é capturado
		- Ex.: Peixe A é 10 e eu tirei 90, 90>10, então capturo (10 = 90% de chance de captura, porque 100-10 = 90)
	- Isso pode ser unido com força necessária para capturar cada peixe

- Sistema de diálogo
	- Caixa preta como sprite
	- Dependendo da largura do texto, colocar em outra "página"
	- Texto pixelado
	- Mostrar texto lentamente igual no room

- Chance de 40% do peixe fugir ou de pegar lixo
	- Bota

--]]

