local path = 'resources/sprites/fishes/'
local trash_path = 'resources/sprites/trash/'

-- When get a note, remove from table

lake = {
	fishes = {
		{
			name = "Truta Arco-Íris",
			desc = "Não tem cor de arco-íris.",
			img = love.graphics.newImage(path..'bicuda.png'),
			amount = 0,
			tho = {
				{ text = "Nunca entendi o porquê desse nome, ela nem tem cor de arco-íris" },

				{ text = "Bons tempos de quando eu pescava truta com meu pai." }
			}
		},

		{
			name = "Tucunaré",
			desc = "Peixe amarelo.",
			img = love.graphics.newImage(path..'tucunare.png'),
			amount = 0,
			tho = {
				{ text = "Que peixe bobo." },

				{ text = "Esse lago é um pouco estranho, não faz sentido essas espécies estarem todas juntas nesse lugar." }
			}
		},

		{
			name = "Tambaqui",
			desc = "Peixe com shader.",
			img = love.graphics.newImage(path..'tambaqui.png'),
			amount = 0,
			tho = {
				{ text = "Meu pai adorava esse peixe por algum motivo." }
			}
		},

		{
			name = "Pirarucu",
			desc = "PIRARUCU!",
			img = love.graphics.newImage(path..'pirarucu.png'),
			amount = 0,
			tho = {
				{ text = "Eu sempre achei esse nome engraçado... --Talvez eu seja um pouco infantil--." },

				{ text  = "Eu acho que alguém deve ter trago todas essas espécies pra cá." }
			}
		},

		{
			name = "Bicuda",
			desc = "Bica bica igual sardinha.",
			img = love.graphics.newImage(path..'bicuda.png'),
			amount = 0,
			tho = {
				{ text = "Talvez vir tirar férias fazendo o que sei de melhor tenha sido uma boa ideia." },

				{ text = "Eu esqueci o que eu iria dizer." }
			}
		},

		{
			name = "Tilápia",
			desc = "Tilápia.",
			img = love.graphics.newImage(path..'tilapia.png'),
			amount = 0,
			tho = {
				{ text = "Tilápia." }
			}
		},

		{
			name = "Bagre",
			desc = "Peixe bola-gato",
			img = love.graphics.newImage(path..'bagre.png'),
			amount = 0,
			tho = {
				{ text = "Bagre." },
				{ text = "Eu chamava meu pai de bagre, porque o bigode dele me lembrava o de um bagre. -- Quer dizer... -- Eu chamei." },
				{ text = "Eu preciso aproveitar minhas férias ao máximo." }
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
				{ text = "Que saco. Talvez na próxima." },

				{ text = "Eu poderia pelo menos ter outra." },

				{ text = "Se eu pelo menos tivesse alguma utilidade pra isso..." },

				{ text = "Não lembro desse lago ser tão poluído assim." },

				{ text = "Parando pra pensar essas botas são idênticas as que meu pai usava quando iamos pescar" }
			}
		}
		-- FAZER FACA E FALAR QUE É FAMILIA --
		-- OSTRA COM OLHO DENTRO --
		-- CELULAR TOCANDO, É O PAI --
		-- CORPO/CABEÇA DO PAI DELA -> se tocar de tudo --
	},

	dialogue = {
		{
			text = { "Pescar é relaxante as vezes.", "Não fica tão relaxante quando o peixe escapa toda vez." }
		},

		{
			text = {
				"Pescar é legal pra poder pensar na vida, eu penso em muitas coisa quando estou pescando.",
				"Pescar me traz muitas memórias e sentimentos diferentes."
			}
		},

		{
			text = {
				"Pescar também me lembra de quando eu pescava com meu pai quando criança, era legal.",
				"Só nao era tão legal quando chegavamos em casa."
			}
		},

		{
			text = {
				"As vezes fico pensado se esses peixes sabem do destino deles.",
				"Eles estão em um lago que toda vez um deles desaparece, será que eles percebem isso e ficam apavorados de serem os próximos?",
				"Ou será que pra eles isso é tão comum que é como morrer normalmente?",
				"Nós sabemos que vamos morrer e nem por isso ficamos apavorados de sermos os próximos--...-- Talvez seja o mesmo pros peixes.",
			}
		},

		{
			text = { 
				"Eu me sinto... -- Usada --... Usada por aqueles que se aproveitaram de mim e da minha confiança pra só se aproveitarem do que eu tinha para proporcionar.",
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
				"Você usa dos bons momentos que um amigo pode te oferecer pra poder também proporcionar bons momentos.",
				"Você usa das invenções desses gênios e em troca imortaliza seus nomes.",
				"Você só se sente usado quando não recebe sua parte da troca."
			}
		},


		{
			text = {
				"Eu acho que minha loucura está piorando. --Não concorda?--"
			},

			options = {
				{ "Está sim", function() game:showDialogue("Minha sombra diz que não, não estou louca, meu reflexo no lago diz que sim, que estou louca.") end },
				{ "Não está", function() game:showDialogue("Que bom.") end }
			}
		},

		{
			text = {
				"Será que Deus poderia ter me ajudado com meu pai? -- Não acho. -- Deus não existe.",
				"Não digo isso por ele não ter me ajudado com meu pai, eu só não consigo acreditar na sua existência."
			}
		},

		{ -- 10
			text = {
				"A existência de Deus parece algo muito complexo pra ser só \"Bem contra o mau\", \"Deus contra o diabo\".",
				"Deus parece um rei que governa sobre o seu reino, com leis que precisam ser seguidas ou então você é exilado.",
				"Essa comparação com um rei talvez faça sentido, porque foi em uma época de monarquia que as religiões devem ter surgido e a ideia de governar era o cúmulo de poder, então o \"o rei acima dos reis\" seria Deus.",
				"Em praticamente todas as religiões é sempre um rei acima da humanidade."
			}
		},

		{
			text = {
				"Eu acho que se realmente tem alguma entidade que nos governa, sua existência seria complexa demais pra entendermos.",
				"Como se fossemos insetos observando as ações humanas. Talvez essa entidade age sobre nós e nem percebemos por causa da sua complexidade.",
				"Meu pai me lembra de algo assim."
			}
		},

		{
			text = {
				"Embora eu tente não, é impossível não pensar no que aconteceu.",
				"Eu vim pra cá pra justamente não pensar nisso, mas por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê? Por quê?",
				"\"A vida é um pendulo que oscila entre a ansiedade de querer e o tédio de possuir.\""
			}
		},

		{

			text = {
				"Por que as pessoas acreditam em Deus? Pra ir pro céu? Isso não seria uma realação de interesse? Só acredita em Deus pra poder ir pro céu?",
				"Isso não faz de Deus um pouco... Injusto? Só pode ir pro céu quem acredita nele. Eu não quero seguir um deus injusto.",
				"Então você pode ter sido a melhor pessoa no mundo, mas se não acreditar em Deus ou não concordar com algo proposto a ele você vai pro inferno? Eu acho isso meio injusto.",
				"Você concorda?"
			}

			options = {
				{ "Sim", function() game:showDialogue("Que bom ter alguém pra concordar comigo as vezes.") end },
				{ "Em partes", function() game:showDialogue("Entendo, não da pra concordar com tudo mesmo eu acho.") end },
				{ "Não", function() game:showDialogue("É... talvez eu esteja enlouquecendo.") end }
			}
		},

		{
			text = {
				"Pescar me faz pensar sobre tudo isso, -- ou então --, só estou pensado em tudo isso pra tentar esquecer o que ele fez comigo.",
				"Meu pai sempre foi bem nervoso, talvez ele só tenha me deixado vir pra cá porque nem ele aguentava mais.",
			},

			options = {
				{ "Você está louca", function() game:showDialogue("Estou?") end },
				{ "Continue pescando", function() game:showDialogue("É o que eu estou fazendo.", { textSpeed="slow" }) end }
			}
		},

		{
			text = "Estou com medo de chegar em casa.",
			options = {
				{ "Abrace", function() game:showDialogue("Como você é novo na minha cabeça você não deve saber, mas ele é o motivo de eu não gostar de abraços. Eu não consigo nem pensar em estar abraçada com alguém, me da um aperto na barriga e vontade de vomitar.") end },
				{ "Ignore", function() game:showDialogue("Ele não me ignora.") end },
				{ "Chame alguém", function() game:showDialogue("Se eu sair daqui ele vai perceber e eu não quero saber o que ele faria comigo.") end }
			}
		},

		{
			text = "Faz muito tempo que você está ai?",
			options = {
				{ "Sim", function() game:showDialogue("Não lembro de te ouvir antes, normalmente eu sei quando tem alguém novo morando dentro de mim.") end },
				{ "Não", function() game:showDialogue("Vocês sempre me abandonam depois de um tempo, nunca me fazem companhia. Daqui a pouco você vai sumir como as outras.") end }
			}
		},

		{
			text = "Você acha que ele é sádico?",
			options = {
				{ "Sim", function() game:showDialogue("Eu sabia, eu só precisava da opinião de mais alguém, ele sabe que não estou gostando do que ele faz comigo e ele faz mesmo assim e quando não me comporto ele faz pior e pior e pior e pior e pior e pior e pior e pior e pior e pior e pior e pior.") end },
				{ "Como assim?", function() game:showDialogue("Eu esqueci que você é novo. Ele sabe que não gosto do que ele faz comigo e ele faz mesmo assim, não importa o tanto que eu fale, não importa o tanto que eu grite, não importa o tanto que eu me mexa e tente fugir, não importa o tanto que eu chore, não importa, ele sempre continua e me maltrata pra me ver sofrer e como castigo ele faz o mesmo só que pior.") end }
			}
		},

		{
			text = "Eu acho que minhas férias aqui estão acabando, eu quero morrer. Isso é tão agoniante.",

			options = {
				{ "Como isso tudo começou?", function() events.event = 1 end },
				{ "Você já pensou em outra solução??", function() game:showDialogue("Eu sei o que você quer dizer com isso, eu já pensei sim sobre isso...") end }
			}
		},

	}


}


