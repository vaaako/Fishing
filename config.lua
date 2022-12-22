-- Libraries --
local wf = require 'libraries/windfield' -- Collision --
world = wf.newWorld(0, 0) -- Create world --
vector = require 'libraries/hump/vector' -- Vector --
Talkies = require 'libraries/talkies' -- Dialogue --



WIDTH = 800
HEIGHT = 640

RES_W = 800
RES_H = 640
-- love.window.setMode(0, 0)
-- WIDTH  = love.graphics.getWidth() - (1366 - WIDTH)  -- Window to fit on different screen sizes
-- HEIGHT = love.graphics.getHeight() - (768 - HEIGHT)

AIM_SPEED = 250
AIM_SIZE = 20

BAR_X = 10
BAR_Y = HEIGHT - 70 -- All positions need to be relative to width and height
BAR_WIDTH = 300
BAR_HEIGHT = 20




-- Functions --
function randomInRange(x, y)
	math.randomseed(os.time())
	return math.random(x, y)
end