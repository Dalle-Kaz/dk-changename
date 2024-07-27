CreateThread(function()
    for k, v in pairs(Config.places) do 
        local point = lib.points.new({ coords = v.coords, distance = 5 })
         
        function point:onEnter()
            local canAccess, textui = lib.callback.await('dalle:identitycheck', false, k)
            if not canAccess then lib.showTextUI(textui) else lib.showTextUI('Tryk [E] for at åbne ' .. v.name) end
        end
         
        function point:onExit() lib.hideTextUI() end
         
        function point:nearby()
            local canAccess, textui = lib.callback.await('dalle:identitycheck', false, k)
            if IsControlJustReleased(0, 38) and canAccess then
                local input = lib.inputDialog('Change Name', { { type = 'input', label = 'First Name', placeholder = 'Peter', required = true, min = 2, max = 30 }, { type = 'input', label = 'Last Name', placeholder = 'Lars', required = true, min = 2, max = 30 } })
                if not input then return end lib.callback.await('dalle:identitychange', false, input, k)
            end
        end

        -- { Create blip } --
		local Blip = AddBlipForCoord(v.coords)
		SetBlipSprite(Blip, v.blip.blipID) 
		SetBlipDisplay(Blip, 2)
		SetBlipScale(Blip, 0.6)
		SetBlipColour(Blip, v.blip.blipColour)
		SetBlipScale(blip,0.6)
		SetBlipAlpha(Blip, 255)
		SetBlipAsShortRange(Blip, true)
		BeginTextCommandSetBlipName("String")
		AddTextComponentString(v.name)
		EndTextCommandSetBlipName(Blip)
    end
end)