
Citizen.CreateThread(function()
  if(config.LogPnjKills or config.LogKills) then
    local wasDead = false

    while true do
      Wait(50)

      local player = PlayerId()

      if NetworkIsPlayerActive(player) then

        local ped = PlayerPedId()
        local isDead = IsPedFatallyInjured(ped)

        if(isDead) then
          if(not wasDead) then
            wasDead = true

            local killer, killerweapon = NetworkGetEntityKillerOfPlayer(player)
      			local killerentitytype = GetEntityType(killer)
      			local killertype = -1


      			local killerid = GetPlayerByEntityID(killer)
      			if killer ~= ped and killerid ~= nil and NetworkIsPlayerActive(killerid) then killerid = GetPlayerServerId(killerid)
      			else killerid = -1
      			end

            local kCoords = GetEntityCoords(killer)
            local tCoords = GetEntityCoords(ped)

            local killerCoords = {round(kCoords.x,3), round(kCoords.y,3), round(kCoords.z,3)}
            local targetCoords = {round(tCoords.x,3), round(tCoords.y,3), round(tCoords.z,3)}
            if((killerid==-1 and config.LogPnjKills) or (killerid~=-1 and config.LogKills)) then
              TriggerServerEvent("logs:addKill", killerid, GetPlayerServerId(player), killerCoords, targetCoords)
            end

            Citizen.Wait(1000)
          end
        elseif(wasDead) then
            wasDead = false
        end



      end
    end


  end
end)

function GetPlayerByEntityID(id)
	for i=0,32 do
		if(NetworkIsPlayerActive(i) and GetPlayerPed(i) == id) then return i end
	end
	return nil
end
