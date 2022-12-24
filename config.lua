-- GLOBAL THINGS AND CONST --

-- Libraries --
Talkies = require 'libraries/talkies' -- Dialogue --
require 'libraries/slam' -- Better to play sounds
Timer = require 'libraries/timer'

GAME_STATE = 0
DIALOGUE_INDEX = 1



WIDTH = 800
HEIGHT = 640

RES_W = 800
RES_H = 640
-- love.window.setMode(0, 0)
-- WIDTH  = love.graphics.getWidth() - (1366 - WIDTH)  -- Window to fit on different screen sizes
-- HEIGHT = love.graphics.getHeight() - (768 - HEIGHT)

PREV_TIME = 0

AIM_SPEED = 15
AIM_SIZE = 20
AIM_STR = 3

BAR_X = 10
BAR_Y = HEIGHT - 70 -- All positions need to be relative to width and height
BAR_WIDTH = 300
BAR_HEIGHT = 20
BAR_SPEED = 15--700

TARGET_SIZE = 30
TARGET_AREA_X =  { 50, WIDTH-50 }
TARGET_AREA_Y =  { 320, 410 }
TARGET_STR = 0.05


-- Functions --
function randomInRange(x, y)
	math.randomseed(os.time())

	if type(x) == 'table' and not y then
		x, y = x[1], x[2]
	end
	return math.random(x, y)
end


function circleCollision(x1, y1, r1, x2, y2, r2)
	local d = math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
	return d - (r1 + r2) < 0
end


function hasValue(tab, val)
	for index, value in ipairs(tab) do
		if value[1] == val then
			return true
		end
	end

	return false
end
