local connections = {}
local kills = {}
local vehicles = {}
local weapons = {}
local chat = {}
local isAdmin = false

local firstSpawn = true
AddEventHandler("playerSpawned", function()
  if(firstSpawn) then
    TriggerServerEvent("logs:playerConnected")
    firstSpawn = false
  end
end)



Citizen.CreateThread(function()
  if(config.debug) then
    Citizen.Wait(1000)
    TriggerServerEvent("logs:playerConnected")
  end
  SetNuiFocus(false, false)

  SendNUIMessage({
    setResourceName = true,
    name = GetCurrentResourceName()
  })



  SendNUIMessage({
    setString = true,
    killercoords=getString("killercoords"),
    targetcoords=getString("targetcoords"),
    localisation=getString("localisation")
  })

  while true do
    Citizen.Wait(1)

    if(IsControlJustPressed(1, config.openMenuKey) and (isAdmin or config.debug)) then
      SetNuiFocus(true, true)
      SendNUIMessage({
        show=true,
        connections=connections,
        kills=kills,
        vehicles=vehicles,
        weapons=weapons,
        chat=chat
      })
    end
  end

end)


RegisterNUICallback("closeMenu", function(data,cb)
  SetNuiFocus(false, false)
  cb("ok")
end)



function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end


RegisterNetEvent("logs:setAdmin")
AddEventHandler("logs:setAdmin", function(admin)
  isAdmin = admin
end)

RegisterNetEvent("logs:updateConnections")
AddEventHandler("logs:updateConnections", function(newArray)
  local array = json.decode(newArray)
  table.insert(connections, array)
end)

RegisterNetEvent("logs:updateKills")
AddEventHandler("logs:updateKills", function(newArray)
  local array = json.decode(newArray)
  table.insert(kills, array)
end)
RegisterNetEvent("logs:updateVehicles")
AddEventHandler("logs:updateVehicles", function(newArray)
  local array = json.decode(newArray)
  table.insert(vehicles, array)
end)
RegisterNetEvent("logs:updateWeapons")
AddEventHandler("logs:updateWeapons", function(newArray)
  local array = json.decode(newArray)
  table.insert(weapons, array)
end)
RegisterNetEvent("logs:updateChat")
AddEventHandler("logs:updateChat", function(newArray)
  local array = json.decode(newArray)
  table.insert(chat, array)
end)


RegisterNetEvent("logs:init")
AddEventHandler("logs:init", function(connectionsArray, killsArray, vehiclesArray, weaponsArray, chatArray)
  connections = json.decode(connectionsArray)
  kills       = json.decode(killsArray)
  vehicles    = json.decode(vehiclesArray)
  weapons     = json.decode(weaponsArray)
  chat        = json.decode(chatArray)
end)
