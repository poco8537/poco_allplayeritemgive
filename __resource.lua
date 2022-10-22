resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Realw (트리거 이벤트 변조)
shared_script "@evp/main.lua"

client_scripts {
	"@vrp/client/Proxy.lua",
	"@vrp/client/Tunnel.lua",
  	"client.lua"
}
server_scripts {
	"@vrp/lib/utils.lua",
  	"server.lua"
}