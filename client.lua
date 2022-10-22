vRP = Proxy.getInterface("vRP")
frontend = {}
Tunnel.bindInterface(GetCurrentResourceName(), frontend)
Proxy.addInterface(GetCurrentResourceName(), frontend)
backend = Tunnel.getInterface(GetCurrentResourceName(), GetCurrentResourceName())
