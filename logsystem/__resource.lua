resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

description 'Logs System'

version '0.0.6'

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
