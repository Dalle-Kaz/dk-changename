local canUse = false

CreateThread(function()
    for k, v in pairs(Config.places) do 
        local point = lib.points.new({ coords = v.coords, distance = 5 })
         
        function point:onEnter()
            local canAccess, textui = lib.callback.await('dalle:identitycheck', false, k)
            if not canAccess then lib.showTextUI(textui) canUse = false else lib.showTextUI('Tryk [E] for at åbne ' .. v.name) canUse = true end
        end
         
        function point:onExit() lib.hideTextUI() end
         
        function point:nearby()
            DrawMarker(2, self.coords.x, self.coords.y, self.coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 200, 20, 20, 50, false, true, 2, false, nil, nil, false)
            if canUse and self.currentDistance < 2 then
                local canAccess, textui = lib.callback.await('dalle:identitycheck', false, k)
                if IsControlJustReleased(0, 38) then
                    if canAccess then
                        local input = lib.inputDialog('Change Name', { { type = 'input', label = 'First Name', placeholder = 'Peter', required = true, min = 2, max = 30 }, { type = 'input', label = 'Last Name', placeholder = 'Lars', required = true, min = 2, max = 30 } })
                        if not input then return end lib.callback.await('dalle:identitychange', false, input, k)
                    end
                end
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