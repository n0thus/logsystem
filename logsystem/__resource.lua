resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts({
  'config.lua',
  'strings/strings.lua',
  'client/main.lua',
  'client/kills.lua',
  'client/vehicles.lua',
  'client/weapons.lua'
})

server_scripts({
  'config.lua',
  'strings/strings.lua',
  'server/versionCheck.lua',
  'server/main.lua'
})

ui_page('ui/ui.html')

files({
  'ui/ui.html',
  'ui/css/style.css',
  'ui/css/darkmode.css',
  'ui/css/searchBar.css',
  'ui/js/render.js'
})
