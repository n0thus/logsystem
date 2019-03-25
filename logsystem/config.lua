config = {
  debug = false,
  language = 'en',
  autoCheckVersion = true,

  LogDisconnect = true,
  LogConnect = true,

  LogChat = true,

  LogKills = true, -- Log when a player kill an other player.
	LogPnjKills = true, -- Log when a player has been killed by a pnj.

	LogEnterPoliceVehicle = true, -- Log when an player enter in a police vehicle.
	LogEnterBlackListedVehicle = true, -- Log when a player enter in a blacklisted vehicle. Blacklisted vehicles are vehicles in te "blacklistedModels" array.
	DeleteWhenEnterBlackListedVehicle = true, -- if it's on "true", when a player enter in one of blacklisted vehicles, it's going to depop.

  LogWhenHaveBlackListedGun = true, -- Log when a player gets a blacklisted gun.
	DeleteBlackListedGun = true, -- if it's on true, when a player gets a blacklisted gun, it's going to be removed.

  admins = {
    "steam:0123456789"
  },

  blacklistedModels = { -- By default, it's all the military vehicles
    GetHashKey("trailersmall2"),
    GetHashKey("apc"),
    GetHashKey("barrage"),
    GetHashKey("chernobog"),
    GetHashKey("halftrack"),
    GetHashKey("rhino"),
    GetHashKey("scarab"),
    GetHashKey("scarab2"),
    GetHashKey("scarab2"),
    GetHashKey("scarab3"),
    GetHashKey("thruster"),
    GetHashKey("khanjali")
  },


  blacklistedGuns = {
  	--Get models id here : https://pastebin.com/0wwDZgkF
  	--0x99B507EA,
  	-- (Example)
  },

  openMenuKey = 56 -- F9
}
