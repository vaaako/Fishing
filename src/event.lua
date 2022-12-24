events = {}
events.event = 0

-- local timer, elapsed, alpha = 0, 0, 0.0001

-- function fadeOut()
-- 	if elapsed < 20 then
-- 		alpha = 1-( (elapsed-7) / (9-7) )
-- 	else alpha = 0 end

-- 	love.graphics.setColor(0, 0, 0, alpha)
-- 	love.graphics.rectangle('fill', 0, 0, WIDTH, HEIGHT)
-- end

function events:logic()
	if events.event == 1 then
		-- elapsed = love.timer.getTime() - timer

		-- print(elapsed)
		-- if elapsed <= 5 then
		-- 	love.graphics.setColor(0, 0, 0)
		-- 	love.graphics.rectangle('fill', 0, 0, WIDTH, HEIGHT)
		-- 	return
		-- elseif alpha ~= 0 then
		-- 	fadeOut()
		-- 	return
		-- end


		-- BLACK SCREEN FADE OUT --


		-- game:showDialogue("Foi a 5 anos atrás, eu tinha 10. Eu e ele estávamos pescando nesse lago.")
		-- game:showDialogue("Está gostando de pescar Luninha?", { title="Papai", textSpeed='slow', talkSound=blop })
		-- game:showDialogue("Sim! Eu sempre quis pescar!", { textSpeed='slow' })
		-- game:showDialogue("Eu sempre pesquei aqui. É bem relexante", { title="Papai", textSpeed='slow', talkSound=blop })
		-- game:showDialogue("Eu só não gosto de quando o peixe foge.", { textSpeed='slow' })
		-- game:showDialogue("Eu também não, mas não fica assim Luninha, sempre aparece mais um.", { title="Papai", textSpeed='slow', talkSound=blop })

		-- -- 5 SECONDS PAUSE --

		-- game:showDialogue("Vamos brincar de animais?", { title="Papai", textSpeed='slow', talkSound=blop })
		-- game:showDialogue("Vamos!! Eu quero ser uma gatinha --miaau.--", { textSpeed='slow' })
		-- game:showDialogue("Então eu vou ser um leão raawwr. --Mas tem uma coisa--... -- animais não vestem roupas não é? --", { title="Papai", textSpeed='slow', talkSound=blop })

		-- game:showDialogue("Não...", { textSpeed='slow' })
		-- game:showDialogue("Então precsamos tirar as roupas...", { title="Papai", textSpeed='slow', talkSound=blop })

		-- -- CLOTHES SOUND --

		-- game:showDialogue("Luninha...", { title="Papai", textSpeed='slow', talkSound=blop })
		-- game:showDialogue("Sim, papai.", { textSpeed='slow' })
		-- game:showDialogue("Me da um abraço?", { title="Papai", textSpeed='slow', talkSound=blop })
		-- game:showDialogue("Claro!", { textSpeed='slow' })
		-- -- MEANING SOUND --
		-- game:showDialogue("...", { textSpeed='slow' })

		-- events.event = 0
	end
end
