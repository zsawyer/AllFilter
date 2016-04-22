Script.Load("lua/AllFilter/AllFilter.lua")

local allFilterHooked = ModLoader.SetupFileHook( "lua/menu/ServerTabs.lua", "lua/AllFilter/AllFilter_ServerTabsHooks.lua", "post" )

if not allFilterHooked then
    AllFilter.message("Failed to hook '" .. "lua/menu/ServerTabs.lua" .. "'")
end
