fx_version('cerulean')
games({ 'gta5' })
description 'Simple report system for FiveM server'

server_scripts{
  'sv_*.lua'
}

shared_script {
  '@ox_lib/init.lua'
}


lua54 'yes'
