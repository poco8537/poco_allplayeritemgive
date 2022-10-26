local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", GetCurrentResourceName())

local all_playeritemgive = {function(player,choice)
    local source = player
    vRP.prompt({source, '지급할 아이템 코드를 입력해주세요.', 'ex) poco_rewelcome', function(source, nameitem)
        if nameitem ~= nil or nameitem ~= "" then
            vRP.prompt({source, '지급할 아이템 개수를 입력하세요.', 'ex) 100', function(source, amounitem)
                if amounitem ~= nil or amounitem ~= "" then
                    amounitem = tonumber(amounitem)
                    if amounitem > 1 then
                        vRP.request({player, "모든 유저 아이템 지급","정말로 아이템을 지급하시겠습니까", 30, function(player, ok)
                            if ok then
                                if vRP.getItemName({nameitem}) ~= nameitem then
                                    local users = vRP.getUsers({})
                                    for k,v in pairs(users) do
                                        local target_source = vRP.getUserSource({k})
                                        if target_source ~= nil then
                                            vRP.giveInventoryItem({user_id, nameitem, amounitem})
                                        end
                                    end
                                else
                                    vRPclient.notify(source, {"이 아이템은 없는 아이템 입니다."})
                                end
                            end
                        end})
                    else
                        vRPclient.notify(source, {"아이템이 너무 적습니다."})
                    end
                else
                    vRPclient.notify(source, {"올바른 아이템 개수를 입력하세요."})
                end
            end})
        else
            vRPclient.notify(source, {"올바른 아이템 코드를 입력하세요."})
        end
    end})
end,"모든 플레이어에게 아이템을 지급합니다."}


vRP.registerMenuBuilder({"admin", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		if vRP.hasPermission({user_id, "all.playeritemgive"}) then
		    choices["* 모든 유저 아이템 지급"] = all_playeritemgive
		end
		add(choices)
	end
end})
