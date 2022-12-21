sound = {}
sound.ambient_path = 'resources/sounds/ambient/'
sound.sfx_path = 'resources/sounds/sfx/'

-- stream for music
lake_ambient = love.audio.newSource(sound.ambient_path..'lake_waves.wav', 'stream')
lake_ambient:setVolume(0.5)
lake_ambient:setLooping(true)

rod_throw = love.audio.newSource(sound.sfx_path..'rod_throw.wav', 'static')
bubble = love.audio.newSource(sound.sfx_path..'bubble.wav', 'static')
flapping_fish = love.audio.newSource(sound.sfx_path..'flapping_fish.wav', 'static')
rod_pull = love.audio.newSource(sound.sfx_path..'rod_pull.wav', 'static')
