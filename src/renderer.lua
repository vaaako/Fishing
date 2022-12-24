renderer = {}

function renderer:draw()
	love.graphics.scale(WIDTH/RES_W, HEIGHT/RES_H)

	if game.inventory then -- In inventory
		ui:drawInventory()
		return
	end
	
	if events.event ~= 0 then -- If in event
		events:logic()
		return
	end

	-- Draw scenario --
	ui:draw()

	-- Draw aim --
	love.graphics.draw(image.aim, aim.x-AIM_SIZE, aim.y-AIM_SIZE, 0, AIM_SIZE/image.aim:getWidth(), AIM_SIZE/image.aim:getHeight())

	-- Draw bar --
	ui:drawBar()

	-- Target --
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('line', target.x, target.y, TARGET_SIZE, TARGET_SIZE)
	love.graphics.circle('line', target.x+TARGET_SIZE/2, target.y+TARGET_SIZE/2, TARGET_SIZE)


end