Framework = {}

function Framework.ESX()
    return GetResourceState("es_extended") ~= "missing"
end