local ambient_path = 'resources/sounds/ambient/'
local sfx_path = 'resources/sounds/sfx/'

-- stream for music
lake_ambient = love.audio.newSource(ambient_path..'lake_waves.wav', 'stream')
lake_ambient:setVolume(0.5)
lake_ambient:setLooping(true)

rod_throw = love.audio.newSource(sfx_path..'rod_throw.wav', 'static')
bubble = love.audio.newSource(sfx_path..'bubble.wav', 'static')
flapping_fish = love.audio.newSource(sfx_path..'flapping_fish.wav', 'static')
rod_pull = love.audio.newSource(sfx_path..'rod_pull.wav', 'static')


-- Dialogue --
-- Audio from bfxr (https://www.bfxr.net/)
Talkies.talkSound = love.audio.newSource(sfx_path.."dialogue/typeSound.wav", "static")
Talkies.optionOnSelectSound = love.audio.newSource(sfx_path.."dialogue/optionSelect.wav", "static")
Talkies.optionSwitchSound = love.audio.newSource(sfx_path.."dialogue/optionSwitch.wav", "static")
blop = love.audio.newSource(sfx_path.."dialogue/talk.wav", "static")

-- baseline:addTags('background', 'music') -- a source can have multiple tags

-- Play ambient --
lake_ambient:play()


-- Add Tags --
lake_ambient:addTags('background')

rod_throw:addTags('sfx')
bubble:addTags('sfx')
flapping_fish:addTags('sfx')
rod_pull:addTags('sfx')

Talkies.talkSound:addTags('dialogue')
Talkies.optionOnSelectSound:addTags('dialogue')
Talkies.optionSwitchSound:addTags('dialogue')

-- Set Volume --
love.audio.tags.dialogue.setVolume(0.2)
-- love.audio.tags.dialogue.setVolume(0)
-- love.audio.tags.background.setVolume(0) -- mute all background sounds
-- love.audio.tags.sfx.setVolume(0) -- mute all background sounds