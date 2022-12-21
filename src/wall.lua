-- Wall's collider
-- local wall = world:newRectangleCollider(10, 10, 120, 300) -- X, Y, Width, Height
-- wall:setType('static') -- Bye cool effect

walls = {
	-- world:newLineCollider(0, 330, 230, 300):setType('static'),
	-- world:newLineCollider(230, 300, 800, 300):setType('static'),
	-- world:newLineCollider(800, 300, 960, 330):setType('static'),

	-- world:newLineCollider(960, 330, 960, 412):setType('static'),
	-- ,
	-- world:newLineCollider(960, 412, 730, 550):setType('static'),
	-- world:newLineCollider(730, 550, 675, 620):setType('static'),

	-- world:newLineCollider(675, 620, 640, 560):setType('static'),
	-- world:newLineCollider(640, 560, 640, 435):setType('static'),
	-- world:newLineCollider(640, 435, 610, 435):setType('static'),



	world:newLineCollider(0, 0, WIDTH, 0):setType('static'),
	world:newLineCollider(WIDTH, 0, WIDTH, HEIGHT):setType('static'),
	world:newLineCollider(WIDTH, HEIGHT, 0, HEIGHT):setType('static'),
	world:newLineCollider(0, HEIGHT, 0, 0):setType('static'),

}