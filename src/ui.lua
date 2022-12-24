ui = {}
bar = {}
bar.fill = 0
bar.back = false

function ui:drawInventory()
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("Pexes", WIDTH/2 - 50, 50, 0, 2, 2)

	for i = 1, #lake['fishes'] do
		local fish = lake['fishes'][i]
		love.graphics.draw(fish.img, 10, 50 + i*70, 0, 70/fish.img:getWidth(), 70/fish.img:getHeight())
		love.graphics.print(("%s: %d"):format(fish['name'], fish['amount']), 100, 75 + i*70, 0, 1.5, 1.5)
	end
	
end

function ui:drawBar()
	-- Bar
	love.graphics.setColor(0, 0, 1)
	love.graphics.rectangle('fill', BAR_X, BAR_Y, bar.fill, BAR_HEIGHT)

	-- Bar outline
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('line', BAR_X, BAR_Y, BAR_WIDTH, BAR_HEIGHT)

end

function ui:draw()
	love.graphics.draw(image.background, 0, 0, 0, RES_W/image.background:getWidth(), RES_H/image.background:getHeight())
	-- love.graphics.draw(image.rod, 100, 100, 0, 300/image.rod:getWidth(), 400/image.rod:getWidth())
end