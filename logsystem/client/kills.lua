
Citizen.CreateThread(function()
  if(config.LogPnjKills or config.LogKills) then
    local isDead = false

    while true do
      Wait(1)

      local player = PlayerId()

      if NetworkIsPlayerActive(player) then
        local ped = PlayerPedId()

        if IsPedFatallyInjured(ped) and not isDead then
          isDead = true

          local killer, killerweapon = NetworkGetEntityKillerOfPlayer(player)
    			local killerentitytype = GetEntityType(killer)
    			local killertype = -1


    			local killerid = GetPlayerByEntityID(killer)
    			if killer ~= ped and killerid ~= nil and NetworkIsPlayerActive(killerid) then killerid = GetPlayerServerId(killerid)
    			else killerid = -1
    			end

          local killerCoords = {round(GetEntityCoords(killer).x,3), round(GetEntityCoords(killer).y,3), round(GetEntityCoords(killer).z,3)}
          local targetCoords = {round(GetEntityCoords(ped).x,3), round(GetEntityCoords(ped).y,3), round(GetEntityCoords(ped).z,3)}
          if((killerid==-1 and config.LogPnjKills) or (killerid~=-1 and config.LogKills)) then
            TriggerServerEvent("logs:addKill", killerid, GetPlayerServerId(player), killerCoords, targetCoords)
          end
        elseif not IsPedFatallyInjured(ped) then
            isDead = false
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
