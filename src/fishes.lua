local path = 'resources/sprites/fishes/'
local trash_path = 'resources/sprites/trash/'

fishes = {
	fishes = {
		[1] = {
			name = "Truta Arco-Íris",
			desc = "Descrição da Truta",
			img = love.graphics.newImage(path..'bicuda.png')
		},

		[2] = {
			name = "Tucunaré",
			desc = "Descrição do Tucunaré",
				img = love.graphics.newImage(path..'tucunare.png')
		},

		[3] = {
			name = "Tambaqui",
			desc = "Descrição do Pirarucu",
			img = love.graphics.newImage(path..'tambaqui.png')
		},

		[4] = {
			name = "Pirarucu",
			desc = "Descrição do Pirarucu",
			img = love.graphics.newImage(path..'pirarucu.png')
		},

		[5] = {
			name = "Bicuda",
			desc = "Descrição da Bicuda",
			img = love.graphics.newImage(path..'bicuda.png')
		},

		[6] = {
			name = "Tilápia",
			desc = "Descrição da Tilápia",
			img = love.graphics.newImage(path..'tilapia.png')
		},

		[7] = {
			name = "Bagre",
			desc = "Descrição da Bagre",
			img = love.graphics.newImage(path..'bagre.png')
		},
	},

	trash = {
		[1] = {
			name = "Bota velha",
			desc = "Uma bota velha",
			img = love.graphics.newImage(trash_path..'old_boot.png')
		}
	},

	notes = {
		[1] = "hello",
		[2] = "world"
	}


}

-- print(fishes['fishes']['pirarucu'])
-- print(fishes['notes'][1])