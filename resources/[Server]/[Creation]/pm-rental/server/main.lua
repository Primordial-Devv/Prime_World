-- Automatic check of ESX version

function InitializeESX()
    local supportedVersion = {
        ["1.1."] = "older",
        ["1.2."] = "older",
        ["1.4."] = "newer",
        ["1.5."] = "newer",
        ["1.6."] = "newer",
        ["1.7."] = "newer",
        ["1.8."] = "newer",
        ["1.9."] = "newer",
        ["1.10"] = "newer",
    }

    if GetResourceState("es_extended") ~= "missing" then
        local esxVersion = GetResourceMetadata("es_extended", "version")
        if esxVersion then
            esxVersion = string.sub(esxVersion, 1, 4)
            local versionESX = supportedVersion[esxVersion] or "unsupported"

            if versionESX == "older" then
                -- ESX 1.2 and older
                ESX = nil
                TriggerEvent(getSharedObjectEvent, function(obj) ESX = obj end)
            elseif versionESX == "newer" then
                -- ESX 1.4 or newer
                FrameworkExport()
            else
                -- ESX version not supported
                print("^1ERROR: ESX version not supported!^7")
                print("^1ERROR: ESX version not supported!^7")
                print("^1ERROR: ESX version not supported!^7")
            end
        else
            print("^1ERROR: An error occurred while retrieving the version of ESX^7")
        end
    else
        print("^1ERROR: ESX is not installed on the server^7")
    end
end

-- Call the function to check the ESX version
InitializeESX()