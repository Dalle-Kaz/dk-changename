local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

lib.callback.register('dalle:identitycheck', function(source, index) local user_id = vRP.getUserId({source})
    local configTable = Config.places[index].use

    if configTable.price.usePrice then
        if configTable.price.price >= vRP.getBankMoney({user_id}) then
            return false, 'Du har ikke nok penge i banken'
        end
    end

    if configTable.item.useItem then
        if 0 >= vRP.getInventoryItemAmount({user_id, configTable.item.itemName}) then
            return false, 'Du mangler en ' .. configTable.item.itemName
        end
    end

    return true
end)

lib.callback.register('dalle:identitychange', function(source, data, index)
    local user_id = vRP.getUserId({source})
    local configTable = Config.places[index].use

    if configTable.item.useItem then vRP.tryGetInventoryItem({user_id, configTable.item.itemName, 1, false}) end
    local affectedRows = MySQL.Sync.execute("UPDATE vrp_user_identities SET firstname = ?, name = ?  WHERE user_id = ?", { data[1], data[2], user_id })

    return false, TriggerClientEvent('ox_lib:notify', source, { description = 'Du har ændret dit navn til ' .. data[1] .. ' ' .. data[2], type = "success" }) 
end)