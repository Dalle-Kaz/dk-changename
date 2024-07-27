fx_version 'cerulean'
game 'gta5'
author 'dallefar'
lua54 'yes'

shared_scripts { '@ox_lib/init.lua', 'config.lua' }
client_scripts { 'client/main.lua' }
server_scripts { '@oxmysql/lib/MySQL.lua', '@vrp/lib/utils.lua', 'server/main.lua' }