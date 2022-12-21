function love.load()
	require 'config'
	require 'src/sound'
	require 'src/game'
	require 'src/wall'
	require 'src/fishes'

	-- Window Config
	love.window.setTitle( "Pescaria doida" )
	love.window.setMode( WIDTH, HEIGHT,
						{ fullscreen=false, resizable=false, vsync=1, minwidth=600, minheight=472, centered=true } )
	love.graphics.setDefaultFilter("nearest", "nearest") -- Anti alising
	love.graphics.setBackgroundColor(0, 0.5, 0.7) -- Clear Screen

	mx, my = 0, 0
	-- Play ambient --
	love.audio.play(lake_ambient)
end

function love.update(dt)
	game:update(dt)
	world:update(dt)
end

function love.draw()
	love.graphics.scale(WIDTH/RES_W, HEIGHT/RES_H)

	game:draw()
	world:draw()

	love.graphics.setColor(1, 1, 1)
	love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 10, 10)
	love.graphics.print("AX:  "..tostring(aim:getX()), 10, 25)
	love.graphics.print("AY:  "..tostring(aim:getY()), 10, 40)
	love.graphics.print('mx: '..mx .. ' my: '.. my, 10, 55)

	love.graphics.print("FORÇA:  "..tostring(game.str), WIDTH/2, 55, 0, 2, 2)
	love.graphics.print("KZ:     "..tostring(game.kz), WIDTH/2, 85, 0, 2, 2)
	love.graphics.print("KX:     "..tostring(game.kx), WIDTH/2, 115, 0, 2, 2)
	love.graphics.print("LIMIT:  "..tostring(game.var), WIDTH/2, 145, 0, 2, 2)
	love.graphics.print("FISHED: "..tostring(game.fished.name), WIDTH/2, 175, 0, 2, 2)

end



-- Other Functions --
function love.mousemoved( x, y, dx, dy, istouch )
	mx = x
	my = y
end

-- function love.resize(w, h)
-- 	WIDTH, HEIGHT = w, h
-- end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end

	if key == 'return' then
		if game.mode == 1 then -- Alredy started
			game.str = bar.fill
			game.mode = 2 -- Change to wait fish
			
			-- game.var = 5
			game.var = randomInRange(5, 15) -- How many time wait fish
			game.time_prev = love.timer.getTime() -- Start timer

			local instance = rod_throw:play() -- Throw Rod Sound
			instance:setPitch(1.25) -- Speed up

		elseif game.mode == 0 then
			game.mode = 1 -- Start fishing
		elseif game.mode == 4 then -- Back to movement
			game.mode = 0
			game:resetValues()
		end
	end


	-- Catch fish --
	if game.mode == 3 then
		local elapsed = love.timer.getTime() - game.time_prev -- Count time passed
		print(elapsed)
		
		-- Time limit --
		if elapsed >= 5 then
			game:resetValues()
			game.fished = { name = "LOST!" } -- Change later
			return
		end


		-- Alternate between keys --
		if game.kz > game.kx then -- If Z is higher then X, only accept X input
			if key == 'x' then
				game.kx = game.kx + 1
			end
		else -- If X is higher then Z or both is equal
			if key == 'z' then
				game.kz = game.kz + 1
			end
		end


		-- Catch fish --
		if game.kz + game.kx == game.var then
			if randomInRange(0, 100) <= 40 or game.str <= 200 then
				game.fished = fishes['trash'][1]
			else
				game.fished = fishes['fishes'][randomInRange(1, 7)] -- 1-7 (Number of fishes)
			end
			game.mode = 4 -- Show fish
			love.audio.play(rod_pull) -- Pull rod
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
	+ Passar uns dias no interior para ir pescar e fugir dos tormentos
	+ Itens que remetem a memória do personagem
	+ Matou alguém e filosofar sobre a vida e a morte?
		* Alguém que gosta muito de pescar que morreu e está nesse inferno de pescar os pensamentos, lembrando do que fez (Como white bear do black mirror)
		* A morte é fútil as vezes
	+ Pescar ostra com olho dentro
	+ Pescar telefone tocando
	+ Porta retrato de um pai abusivo
	+ "A vida é um pendulo que ocila entre a ansiedade de querer e o tedio de possuir"


--]]

