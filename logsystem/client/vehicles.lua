Citizen.CreateThread(function()
  if(config.LogEnterPoliceVehicle or config.LogEnterBlackListedVehicle) then
    local policelogged = false
    local blackListedLogged = false

    while true do
      Citizen.Wait(1)
      if(config.LogEnterPoliceVehicle) then
        if(IsPedInAnyPoliceVehicle(GetPlayerPed(-1))) then
    			if(policelogged == false) then
            local coords = {round(GetEntityCoords(PlayerPedId()).x,3), round(GetEntityCoords(PlayerPedId()).y,3), round(GetEntityCoords(PlayerPedId()).z,3)}
    				TriggerServerEvent("logs:addVehicle",GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), 0))), coords)
    				policelogged = true
    			end
    		else
    			policelogged = false
    		end
      end


      if(config.LogEnterBlackListedVehicle) then
    		if(IsPedInAnyVehicle(PlayerPedId(), 0)) then
    			for _,i in pairs(config.blacklistedModels) do
    				if(GetEntityModel(GetVehiclePedIsIn(PlayerPedId()), 0) == i) then
    					if(blackListedLogged == false) then
                local coords = {round(GetEntityCoords(PlayerPedId()).x,3), round(GetEntityCoords(PlayerPedId()).y,3), round(GetEntityCoords(PlayerPedId()).z,3)}
    						TriggerServerEvent("logs:addVehicle", GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), 0))), coords)

    						if(config.DeleteWhenEnterBlackListedVehicle) then
    							local veh = GetVehiclePedIsIn(PlayerPedId(), 0)

    							SetVehicleUndriveable(veh,  true)
    							SetPedGetOutUpsideDownVehicle(PlayerPedId(), true)
    							SetEntityAsMissionEntity(veh, true, true)
        					Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
        				end
        				blackListedLogged = true
        			end
    				end
    			end
    		else
    			if(blackListedLogged) then
    				blackListedLogged = false
    			end
    		end
      end
    end
  end
end)
