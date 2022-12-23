local path = 'resources/sprites/fishes/'
local trash_path = 'resources/sprites/trash/'

-- When get a note, remove from table
fishes = {
	fishes = {
		{
			name = "Truta Arco-Íris",
			desc = "Não tem cor de arco-íris.",
			img = love.graphics.newImage(path..'bicuda.png'),
			amount = 0,
			tho = {
				{
					text = "Nunca entendi o porquê desse nome, ela nem tem cor de arco-íris",
					showed = false
				},

				{
					text = "Bons tempos de quando eu pescava truta com meu pai.",
					showed = false
				}
			}
		},

		{
			name = "Tucunaré",
			desc = "Peixe amarelo.",
			img = love.graphics.newImage(path..'tucunare.png'),
			amount = 0,
			tho = {
				{
					text = "Que peixe bobo.",
					showed = false
				},

				{
					text = "Esse lago é um pouco estranho, não faz sentido essas espécies estarem todas juntas nesse lugar.",
					showed = false
				}
			}
		},

		{
			name = "Tambaqui",
			desc = "Peixe com shader.",
			img = love.graphics.newImage(path..'tambaqui.png'),
			amount = 0,
			tho = {
				{
					text = "Meu pai adorava esse peixe por algum motivo.",
					showed = false
				}
			}
		},

		{
			name = "Pirarucu",
			desc = "PIRARUCU!",
			img = love.graphics.newImage(path..'pirarucu.png'),
			amount = 0,
			tho = {
				{
					text = "Eu sempre achei esse nome engraçado... --Talvez eu seja um pouco infantil--.",
					showed = false
				},

				{
					text  = "Eu acho que alguém deve ter trago todas essas espécies pra cá.",
					showed = false
				}
			}
		},

		{
			name = "Bicuda",
			desc = "Bica bica igual sardinha.",
			img = love.graphics.newImage(path..'bicuda.png'),
			amount = 0,
			tho = {
				{
					text = "Talvez vir tirar férias fazendo o que sei de melhor tenha sido uma boa ideia.",
					showed = false
				},

				{
					text = "Eu esqueci o que eu iria dizer.",
					showed = false
				}
			}
		},

		{
			name = "Tilápia",
			desc = "Tilápia.",
			img = love.graphics.newImage(path..'tilapia.png'),
			amount = 0,
			tho = {
				{
					text = "Tilápia.",
					showed = false
				}
			}
		},

		{
			name = "Bagre",
			desc = "Peixe bola-gato",
			img = love.graphics.newImage(path..'bagre.png'),
			amount = 0,
			tho = {
				{
					text = "Bagre.",
					showed = false
				},

				{
					text = "Eu chamava meu pai de bagre, porque o bigode dele me lembrava o de um bagre. -- Quer dizer... -- Eu chamei.",
					showed = false
				},

				{
					text = "Eu preciso aproveitar minhas férias ao máximo.",
					showed = false
				}

			}
		},
	},

	trash = {
		{
			name = "Bota velha",
			desc = "Uma bota velha",
			img = love.graphics.newImage(trash_path..'old_boot.png'),
			amount = 0,
			tho = {
				{
					text = "Que saco. Talvez na próxima.",
					showed = false
				},

				{
					text = "Eu poderia pelo menos ter outra.",
					showed = false
				},

				{
					text = "Se eu pelo menos tivesse alguma utilidade pra isso...",
					showed = false
				},

				{
					text = "Não lembro desse lago ser tão poluído assim.",
					showed = false
				}
			}
		}
	},

	dialogue = {
		{
			text = { "Pescar é relaxante as vezes.", "Não fica tão relaxante quando o peixe escapa toda vez." }
		},

		{
			text = "Pescar é legal pra poder pensar na vida, eu penso em muitas coisa quando estou pescando."
		},

		{
			text = {
				"As vezes fico pensdo se esses peixes sabem do destino deles.",
				"Eles estão em um lago que toda vez um deles desaparece, será que eles percebem isso e ficam apavorados de serem os próximos?",
				"Ou será que pra eles isso é tão comum que é como morrer normalmente?",
				"Nós sabemos que vamos morrer e nem por isso ficamos apavorados de sermos os próximos--...-- Talvez seja o mesmo pros peixes.",
			}
		},

		{
			text = {
				"Pescar também me lembra de quando eu pescava com meu pai quando mais novo, era legal.",
				"Só nao era tão legal quando chegavamos em casa."
			}
		},

		{
			text = "Pescar me traz muitas memórias e sentimentos diferentes."
		},

		{
			text = { 
				"Eu me sinto... -- Usado --... Usado por aqueles que se aproveitaram de mim e da minha confiança pra só se aproveitarem do que eu tinha para proporcionar.",
				"Mas a vida é sobre isso não é? -- Ser usado --. Eu só estou reclamando porque esse modo de uso foi mais evidente.",
				"A vida é sobre se usar dos outros, se usar das emoções que um namorado pode te dar, se usar dos bons momentos que um amigo pode te oferecer...",
				"se usar das criações de gênios para seu próprio uso.",
				"Como usar o computador, eletricidade ou internet, estamos apenas nos usando das invenções de outras pessoas."
			}

		},

		{
			text = {
				"Talvez só reclamamos de sermos usados quando esse uso fica em evidência, por não recebemos em troca o que achamos que iriamos receber.",
				"Essa relação de uso é uma troca, você se usa do que alguém pode te proporcionar e da em troca algo que essa pessoa queira.",
				"Vocễ usa dos bons momentos que um amigo pode te oferecer pra poder também proporcionar bons momentos.",
				"Você usa das invenções desses gênios e em troca imortaliza seus nomes.",
				"Vocẽ só se sente usado quando não recebe sua parte da troca."
			}
		},


		{
			text = {
				"Eu acho que minha esquizofrênia está piorando.",
				"Não concorda?"
			}
			-- make event --
		},

		{
			text = {
				"Será que Deus poderia ter me ajudado com meu pai? -- Não acho. -- Deus não existe.",
				"Não digo isso por ele não ter me ajudado com meu pai, eu só não consigo acreditar na sua existência."
			}
		},

		{
			text = {
				"A existência de Deus parece algo muito complexo pra ser só \"Bem conta o mau\", \"Deus contra o diabo\".",
				"Deus parece um rei que governa sobre o seu reino, com leis que precisam ser seguidas ou então você é exilado.",
				"Essa comparação com um rei talvez faça sentido, porque foi em uma época de monarquia que as religiões devem ter surgido e a ideia de governar era o cúmulo de poder, então o \"o rei acima dos reis\" seria Deus.",
				"Em praticamente todas as religiões é sempre um rei acima da humanidade."
			}
		},

		{
			text = {
				"Eu acho que se realmente tem alguma entidade que nos governa, sua existência seria complexa demais pra entendermos.",
				"Como se fossemos insetos observando as ações humanas. Talvez essa entidade age sobre nós e nem percebemos por causa da sua complexidade.",
				"Meu pai me lembra de algo assim... Mas ele não foi tão poderoso."
			}
		},

		{
			text = {
				"Embora eu tente não, é impossível não pensar no que aconteceu.",
				"Eu vim pra cá pra justamente não pensar nisso, mas por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê?"
			}
		},

		{
			text = {
				"\"A vida é um pendulo que oscila entre a ansiedade de querer e o tédio de possuir.\""
			}
		},
		{

			text = {
				"Por que as pessoas acreditam em Deus? Pra ir pro céu? Isso não seria uma realação de interesse? Só acredita em Deus pra poder ir pro céu?",
				"Isso não faz de Deus um pouco... Egoista? Só pode ir pro céu quem acredita nele. Eu não quero seguir um deus egoísta.",
			}
		}


	}


}

-- print(fishes['fishes']['pirarucu'])
