--██████╗░███████╗██████╗░██╗░░░██╗░██████╗░  ███╗░░░███╗░█████╗░██████╗░███████╗
--██╔══██╗██╔════╝██╔══██╗██║░░░██║██╔════╝░  ████╗░████║██╔══██╗██╔══██╗██╔════╝
--██║░░██║█████╗░░██████╦╝██║░░░██║██║░░██╗░  ██╔████╔██║██║░░██║██║░░██║█████╗░░
--██║░░██║██╔══╝░░██╔══██╗██║░░░██║██║░░╚██╗  ██║╚██╔╝██║██║░░██║██║░░██║██╔══╝░░
--██████╔╝███████╗██████╦╝╚██████╔╝╚██████╔╝  ██║░╚═╝░██║╚█████╔╝██████╔╝███████╗
--╚═════╝░╚══════╝╚═════╝░░╚═════╝░░╚═════╝░  ╚═╝░░░░░╚═╝░╚════╝░╚═════╝░╚══════╝


-- Activate or Desactivate the Debug Mode

-- DebugMode = true

--- @param Uncomment "First" line if you are using newer version of ESX and if you put "new" at line 19
--- @param Uncomment "Second" line if you are using QBCore and if you put "QbCore" at line 12
function FrameworkExport()
    ESX = exports['es_extended']:getSharedObject()
    -- QBCore = exports['qb-core']:GetCoreObject()
end

--░█▀▀▀ ░█▀▀▀█ ▀▄░▄▀
--░█▀▀▀ ─▀▀▀▄▄ ─░█──
--░█▄▄▄ ░█▄▄▄█ ▄▀░▀▄


getSharedObjectEvent = 'esx:getSharedObject' -- Modify your ESX-based framework event here.
playerLoadedEvent = 'esx:playerLoaded'       -- Modify your ESX-based framework event here.
setJobEvent = 'esx:setJob'                   -- Modify your ESX-based framework event here.