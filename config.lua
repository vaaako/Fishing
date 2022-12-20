WIDTH = 960
HEIGHT = 640

AIM_SPEED = 250

BAR_X = 10
BAR_Y = 590
BAR_WIDTH = 300
BAR_HEIGHT = 20




function randomInRange(x, y)
	math.randomseed(os.time())
	return math.random(x, y)
end