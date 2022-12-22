-- Wall's collider
-- local wall = world:newRectangleCollider(10, 10, 120, 300) -- X, Y, Width, Height
-- wall:setType('static') -- Bye cool effect

world:addCollisionClass('Aim')
-- world:addCollisionClass('Target', { enter = {'Aim'} }) -- Make aim pass through target
world:addCollisionClass('Target') -- Make aim pass through target


-- Aim --
aim = world:newRectangleCollider(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 10, 10) -- X, Y, W, H
aim.size = 10
aim.dirX, aim.dirY = 0, 0
aim:setFixedRotation(true)
aim:setCollisionClass('Aim')

-- Target --
-- target = world:newRectangleCollider(260, 340, 30, 30) -- X, Y, W, H
-- target:setFixedRotation(true)
-- target:setCollisionClass('Target')
-- target.contact:setEnabled(false)

-- target:setPreSolve(function(collider_1, collider_2, contact)
-- 	contact:setEnabled(false)
-- end)

-- chain = world:newChainCollider({10, 10, 10, 20, 20, 20}, true)

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