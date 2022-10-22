local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())
frontend = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())

backend = {}
Tunnel.bindInterface(GetCurrentResourceName(), backend)

아아 나는 나다잉?