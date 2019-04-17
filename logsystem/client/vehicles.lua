Citizen.CreateThread(function()
  if(config.LogEnterPoliceVehicle or config.LogEnterBlackListedVehicle) then
    local policelogged = false
    local blackListedLogged = false

    local lastCheckedVehicle = -1

    while true do
      Citizen.Wait(50)


      local playerPed = PlayerPedId()
      local isInVehicle = IsPedInAnyVehicle(playerPed, 0)

      if(isInVehicle) then
        local currentVehicle = GetVehiclePedIsIn(playerPed, 0)
        if(currentVehicle ~= lastCheckedVehicle) then
          lastCheckedVehicle = currentVehicle

          if(config.LogEnterPoliceVehicle) then

            local isInPoliceVehicle = IsPedInAnyPoliceVehicle(playerPed)

            if(isInPoliceVehicle) then
        			if(policelogged == false) then
                local currentCoords = GetEntityCoords(playerPed)
                local coords = {round(currentCoords.x,3), round(currentCoords.y,3), round(currentCoords.z,3)}


                local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(currentVehicle))
        				TriggerServerEvent("logs:addVehicle",vehicleName, coords)
        				policelogged = true
        			end
        		elseif(policelogged) then
        			policelogged = false
        		end
          end


          if(config.LogEnterBlackListedVehicle) then
            local vehicleModel = GetEntityModel(currentVehicle, 0)
            local vehicleName = GetDisplayNameFromVehicleModel(vehicleModel)
        		for _,i in pairs(config.blacklistedModels) do
        			if(vehicleModel == i) then
        				if(blackListedLogged == false) then
                  local currentCoords = GetEntityCoords(playerPed)
                  local coords = {round(currentCoords.x,3), round(GcurrentCoords.y,3), round(currentCoords.z,3)}


        					TriggerServerEvent("logs:addVehicle", vehicleName, coords)

        					if(config.DeleteWhenEnterBlackListedVehicle) then
        						SetVehicleUndriveable(currentVehicle,  true)
        						SetPedGetOutUpsideDownVehicle(playerPed, true)
        						SetEntityAsMissionEntity(currentVehicle, true, true)
            				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(currentVehicle))
            			end
            			blackListedLogged = true
            		end
        			end
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
end)
